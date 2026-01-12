require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');
const axios = require('axios');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors({
    origin: ['http://localhost:5173', 'http://localhost:8081']
}));
app.use(express.json());

// Ensure temp directory exists
const TEMP_DIR = path.join(__dirname, 'temp');
if (!fs.existsSync(TEMP_DIR)) {
    fs.mkdirSync(TEMP_DIR);
}

// --- Local Execution Helper ---
const executeLocally = (code, language, stdin) => {
    return new Promise(async (resolve, reject) => {
        const runId = Date.now() + Math.random().toString(36).substring(7);
        const workDir = path.join(TEMP_DIR, runId);

        try {
            fs.mkdirSync(workDir);
            let command, args;

            if (language === 'javascript') {
                const filePath = path.join(workDir, 'script.js');
                fs.writeFileSync(filePath, code);
                command = 'node';
                args = [filePath];
            } else if (language === 'python') {
                const filePath = path.join(workDir, 'script.py');
                fs.writeFileSync(filePath, code);
                // Try python3 first, then python
                command = 'python3';
                args = [filePath];
            } else if (language === 'java') {
                const filePath = path.join(workDir, 'Main.java');
                fs.writeFileSync(filePath, code);
                // Compile first
                await new Promise((res, rej) => {
                    const compile = spawn('javac', [filePath]);
                    compile.on('close', (code) => code === 0 ? res() : rej(new Error('Compilation failed')));
                });
                command = 'java';
                args = ['-cp', workDir, 'Main'];
            } else if (language === 'cpp') {
                const filePath = path.join(workDir, 'solution.cpp');
                const outPath = path.join(workDir, 'solution.exe');
                fs.writeFileSync(filePath, code);
                // Compile
                await new Promise((res, rej) => {
                    const compile = spawn('g++', [filePath, '-o', outPath]);
                    compile.on('close', (code) => code === 0 ? res() : rej(new Error('Compilation failed')));
                });
                command = outPath;
                args = [];
            } else {
                return reject(new Error(`Local execution not supported for ${language}`));
            }

            const process = spawn(command, args);
            let stdout = '';
            let stderr = '';
            let killed = false;

            const timer = setTimeout(() => {
                killed = true;
                process.kill();
                reject(new Error('Time Limit Exceeded'));
            }, 15000);

            if (stdin) {
                process.stdin.write(stdin);
                process.stdin.end();
            }

            process.stdout.on('data', (data) => stdout += data.toString());
            process.stderr.on('data', (data) => stderr += data.toString());

            process.on('close', (code) => {
                clearTimeout(timer);
                if (!killed) {
                    console.log('Execution finished. Stdout:', stdout, 'Stderr:', stderr);
                    resolve({ stdout, stderr, code });
                }
                cleanup();
            });

            process.on('error', (err) => {
                clearTimeout(timer);
                // If python3 fails, try python
                if (language === 'python' && command === 'python3' && err.code === 'ENOENT') {
                    // This is a simplified retry, in a real app we'd structure this better
                    reject(new Error("Python3 not found. Please install Python."));
                } else {
                    reject(err);
                }
                cleanup();
            });

        } catch (err) {
            reject(err);
            cleanup();
        }

        function cleanup() {
            try {
                if (fs.existsSync(workDir)) {
                    fs.rmSync(workDir, { recursive: true, force: true });
                }
            } catch (e) { }
        }
    });
};

// --- Judge0 Execution Helper ---
const executeWithJudge0 = async (code, language, stdin) => {
    const languageMap = {
        'javascript': 63,
        'python': 71,
        'java': 62,
        'cpp': 54
    };

    const languageId = languageMap[language.toLowerCase()];
    if (!languageId) throw new Error(`Unsupported language: ${language}`);

    const response = await axios.post(`https://${process.env.JUDGE0_API_HOST}/submissions`, {
        source_code: code,
        language_id: languageId,
        stdin: stdin || ''
    }, {
        headers: {
            'content-type': 'application/json',
            'X-RapidAPI-Key': process.env.JUDGE0_API_KEY,
            'X-RapidAPI-Host': process.env.JUDGE0_API_HOST
        },
        params: { base64_encoded: 'false', wait: 'true' }
    });

    return {
        stdout: response.data.stdout || '',
        stderr: response.data.stderr || response.data.compile_output || '',
        code: response.data.status.id === 3 ? 0 : 1 // 3 is Accepted
    };
};

// Health check
app.get('/health', (req, res) => {
    res.json({
        status: 'ok',
        mode: process.env.USE_JUDGE0 === 'true' ? 'Hybrid (Judge0 + Local)' : 'Local Only'
    });
});

// Main Execute Endpoint
app.post('/execute', async (req, res) => {
    console.log('Received execution request:', req.body);
    const { code, language, stdin } = req.body;

    // 1. Try Judge0 if enabled
    if (process.env.USE_JUDGE0 === 'true') {
        try {
            console.log(`Attempting Judge0 execution for ${language}...`);
            const result = await executeWithJudge0(code, language, stdin);
            console.log('Judge0 result:', result);
            return res.json({
                output: result.stdout,
                error: result.stderr,
                status: result.code === 0 ? 'Success' : 'Error',
                engine: 'Judge0'
            });
        } catch (error) {
            console.error('Judge0 failed:', error.message);
            console.log('Falling back to local execution...');
            // Fall through to local execution instead of returning error
        }
    }

    // 2. Local Execution (Judge0 disabled or failed)
    try {
        console.log(`Executing locally for ${language}...`);
        const result = await executeLocally(code, language, stdin);
        res.json({
            output: result.stdout,
            error: result.stderr,
            status: result.code === 0 ? 'Success' : 'Error',
            engine: process.env.USE_JUDGE0 === 'true' ? 'Local (Fallback)' : 'Local'
        });
    } catch (error) {
        console.error('Execution error:', error.message);
        res.json({
            output: '',
            error: error.message,
            status: 'Error'
        });
    }
});

// Start server
app.listen(PORT, () => {
    console.log(`✅ Code Execution Server running on port ${PORT}`);
    console.log(`   - Mode: ${process.env.USE_JUDGE0 === 'true' ? 'Hybrid (Judge0 + Local)' : 'Local Only'}`);
    console.log(`   - Supported: JavaScript, Python, Java, C++`);
});
