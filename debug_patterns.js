const axios = require('axios');

async function checkPatterns() {
    try {
        console.log("Fetching from http://localhost:8081/api/problems/patterns...");
        const response = await axios.get('http://localhost:8081/api/problems/patterns');
        console.log("Response Keys:", Object.keys(response.data));
        console.log("Fast & Slow Pointers Count:", response.data['Fast & Slow Pointers']);
        
        console.log("\nFetching all problems sample...");
        const problemsResp = await axios.get('http://localhost:8081/api/problems');
        const sample = problemsResp.data.find(p => p.title === 'Middle of the Linked List');
        if(sample) {
            console.log("Sample Problem Topics:", sample.topics);
        }
    } catch (error) {
        console.error('Error:', error.message);
        if (error.response) console.error('Status:', error.response.status);
    }
}

checkPatterns();
