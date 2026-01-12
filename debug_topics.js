const axios = require('axios');

async function checkTopics() {
    try {
        const response = await axios.get('http://localhost:8081/api/problems');
        const problem = response.data.find(p => p.title === 'Middle of the Linked List');
        if (problem) {
            console.log('Title:', problem.title);
            console.log('Topics:', JSON.stringify(problem.topics, null, 2));
        } else {
            console.log('Problem not found');
        }
    } catch (error) {
        console.error('Error:', error.message);
    }
}

checkTopics();
