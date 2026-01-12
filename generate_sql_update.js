const fs = require('fs');
const path = require('path');

const directoryPath = __dirname;
const outputFile = path.join(directoryPath, 'update_problems.sql');

let sqlContent = '';

// Function to escape single quotes for SQL
const escapeSql = (str) => {
    if (typeof str !== 'string') return str;
    return str.replace(/'/g, "''");
};

// Function to convert object to JSON string and escape for SQL
const toJsonSql = (obj) => {
    return "'" + JSON.stringify(obj).replace(/'/g, "''") + "'";
};

// Read all files in directory
fs.readdir(directoryPath, (err, files) => {
    if (err) {
        return console.log('Unable to scan directory: ' + err);
    }

    const questionFiles = files.filter(file => file.startsWith('questions_part') && file.endsWith('.js'));

    questionFiles.forEach(file => {
        try {
            const filePath = path.join(directoryPath, file);
            const questions = require(filePath);

            questions.forEach(q => {
                if (q.title) {
                    const titleV = escapeSql(q.title);

                    // Prepare JSONB values
                    // Note: Postgres uses 'jsonb' type. We pass a string literal which Postgres casts automatically or we explicit cast.
                    // For safety, we use explicit cast: '...'::jsonb

                    const examplesJson = q.examples ? toJsonSql(q.examples) + '::jsonb' : 'NULL';
                    const constraintsJson = q.constraints ? toJsonSql(q.constraints) + '::jsonb' : 'NULL';
                    const hintsJson = q.hints ? toJsonSql(q.hints) + '::jsonb' : 'NULL';

                    const approachVal = q.approach ? `'${escapeSql(q.approach)}'` : 'NULL';
                    const solutionVal = q.solution ? `'${escapeSql(q.solution)}'` : 'NULL';

                    // Update statement
                    // We update based on title as we might not have IDs reliable across envs, 
                    // but title is usually unique in this dataset.
                    const updateSql = `UPDATE problems SET 
                        examples = ${examplesJson}, 
                        constraints = ${constraintsJson}, 
                        hints = ${hintsJson},
                        approach = ${approachVal},
                        solution = ${solutionVal}
                        WHERE title = '${titleV}';\n`;

                    sqlContent += updateSql;
                }
            });
            console.log(`Processed ${file}`);
        } catch (e) {
            console.error(`Error processing ${file}:`, e.message);
        }
    });

    fs.writeFile(outputFile, sqlContent, (err) => {
        if (err) throw err;
        console.log('SQL file generated successfully: ' + outputFile);
    });
});
