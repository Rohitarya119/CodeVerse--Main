const fs = require('fs');

// Import all question parts
const part1 = require('./questions_part1');
const part2 = require('./questions_part2');
const part3 = require('./questions_part3');
const part4 = require('./questions_part4');
const part5 = require('./questions_part5');
const part6 = require('./questions_part6');
const part7 = require('./questions_part7');
const part8 = require('./questions_part8');
const part9 = require('./questions_part9');
const part10 = require('./questions_part10');
const part11 = require('./questions_part11');
const part12 = require('./questions_part12');
const part13 = require('./questions_part13');
const part14 = require('./questions_part14');
const part15 = require('./questions_part15');
const part16 = require('./questions_part16');
const part17 = require('./questions_part17');
const part18 = require('./questions_part18');
const part19 = require('./questions_part19');
const part20 = require('./questions_part20');
const part21 = require('./questions_part21');
const part22 = require('./questions_part22');
const part23 = require('./questions_part23');
const part24 = require('./questions_part24');
const part25 = require('./questions_part25');
const part26 = require('./questions_part26');
const part27 = require('./questions_part27');
const part28 = require('./questions_part28');
const part29 = require('./questions_part29');
const part30 = require('./questions_part30');

const part31 = require('./questions_part31');
const part32 = require('./questions_part32');
const part33 = require('./questions_part33');
const part34 = require('./questions_part34');
const part35 = require('./questions_part35');

const part36 = require('./questions_part36');
const part37 = require('./questions_part37');
const part38 = require('./questions_part38');
const part39 = require('./questions_part39');
const part40 = require('./questions_part40');
const part41 = require('./questions_part41');
const part42 = require('./questions_part42');
const part43 = require('./questions_part43');
const part44 = require('./questions_part44');
const part45 = require('./questions_part45');
const part46 = require('./questions_part46');
const part47 = require('./questions_part47');
const part48 = require('./questions_part48');
const part49 = require('./questions_part49');
const part50 = require('./questions_part50');
const part51 = require('./questions_part51');
const part52 = require('./questions_part52');
const part53 = require('./questions_part53');
const part54 = require('./questions_part54');
const part55 = require('./questions_part55');
const part56 = require('./questions_part56');
const part57 = require('./questions_part57');
const part58 = require('./questions_part58');
const part59 = require('./questions_part59');
const part60 = require('./questions_part60');
const part61 = require('./questions_part61');
const part62 = require('./questions_part62');

const allQuestions = [...part1, ...part2, ...part3, ...part4, ...part5, ...part6, ...part7, ...part8, ...part9, ...part10, ...part11, ...part12, ...part13, ...part14, ...part15, ...part16, ...part17, ...part18, ...part19, ...part20, ...part21, ...part22, ...part23, ...part24, ...part25, ...part26, ...part27, ...part28, ...part29, ...part30, ...part31, ...part32, ...part33, ...part34, ...part35, ...part36, ...part37, ...part38, ...part39, ...part40, ...part41, ...part42, ...part43, ...part44, ...part45, ...part46, ...part47, ...part48, ...part49, ...part50, ...part51, ...part52, ...part53, ...part54, ...part55, ...part56, ...part57, ...part58, ...part59, ...part60, ...part61, ...part62];

let sql_content = `
-- Clean up existing data to allow clean re-insertion
-- First delete test cases for the problems we are about to insert (to match by title if IDs shift)
`;

// Generate titles list for Delete
const titles = allQuestions.map(q => `'${q.title.replace(/'/g, "''")}'`).join(', ');

sql_content += `
DO $$
DECLARE
    r RECORD;
BEGIN
    -- Delete test cases for problems with these titles
    FOR r IN SELECT id FROM problems WHERE title IN (${titles}) LOOP
        DELETE FROM test_cases WHERE problem_id = r.id;
    END LOOP;

    -- Delete the problems themselves
    DELETE FROM problems WHERE title IN (${titles});
END $$;
`;

sql_content += `\n\n`;

allQuestions.forEach(question => {
    const title = question.title.replace(/'/g, "''");
    const description = question.description.replace(/'/g, "''");
    const difficulty = question.difficulty;
    const topics = JSON.stringify(question.topics).replace(/'/g, "''");
    const constraints = JSON.stringify(question.constraints).replace(/'/g, "''");
    const hints = JSON.stringify(question.hints || []).replace(/'/g, "''"); // Ensure hints are included
    const boilerplate_code = JSON.stringify(question.boilerplate_code).replace(/'/g, "''");
    const function_name = question.function_name;
    const examples = JSON.stringify(question.examples).replace(/'/g, "''");
    
    // Construct the DO block for atomic insertion of problem + test cases
    sql_content += `
DO $$
DECLARE
    p_id INTEGER;
BEGIN
    INSERT INTO problems (title, description, difficulty, topics, constraints, hints, boilerplate_code, function_name, examples)
    VALUES (
        '${title}',
        '${description}',
        '${difficulty}',
        '${topics}'::jsonb,
        '${constraints}'::jsonb,
        '${hints}'::jsonb,
        '${boilerplate_code}'::jsonb,
        '${function_name}',
        '${examples}'::jsonb
    ) RETURNING id INTO p_id;

`;

    // Insert test cases linked to p_id
    if (question.testCases && question.testCases.length > 0) {
        question.testCases.forEach(tc => {
            const input = tc.input.replace(/'/g, "''");
            const expectedOutput = tc.expectedOutput.replace(/'/g, "''");
            sql_content += `    INSERT INTO test_cases (problem_id, input, expected_output) VALUES (p_id, '${input}', '${expectedOutput}');\n`;
        });
    }

    sql_content += `END $$;\n\n`;
});

fs.writeFileSync('insert_final_all.sql', sql_content);
console.log('SQL file generated successfully with 8 parts.');
