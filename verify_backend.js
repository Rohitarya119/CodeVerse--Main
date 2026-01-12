const fs = require('fs');

async function main() {
  try {
    // 1. Login
    console.log('Logging in...');
    let response = await fetch('http://localhost:8081/api/auth/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ username: 'api_user_2', password: 'password' }) // Re-using user from previous attempt
    });
    
    // If login fails, try registering first
    if (!response.ok) {
        console.log('Login failed, registering...');
        await fetch('http://localhost:8081/api/auth/register', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ 
                username: 'api_user_2', 
                email: 'api_user_2@example.com', 
                password: 'password', 
                fullName: 'API User Two',
                skillLevel: 'Beginner'
            })
        });
        // Try login again
        response = await fetch('http://localhost:8081/api/auth/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username: 'api_user_2', password: 'password' })
        });
    }

    const loginData = await response.json();
    const token = loginData.token;
    if (!token) throw new Error('No token received');
    console.log('Logged in.');

    // 2. Get Initial Stats
    console.log('Fetching initial stats...');
    response = await fetch('http://localhost:8081/api/users/me/stats', {
      headers: { Authorization: `Bearer ${token}` }
    });
    const stats1 = await response.json();
    console.log('Initial solved:', stats1.totalSolved);

    // 3. Submit Solution
    console.log('Submitting solution for Problem 1...');
    // Assuming Problem 1 exists (Two Sum or similar). Using python code.
    const code = `class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = {}
        for i, num in enumerate(nums):
            complement = target - num
            if complement in seen:
                return [seen[complement], i]
            seen[num] = i
        return []`;
    
    response = await fetch('http://localhost:8081/api/problems/3/submit', {
        method: 'POST',
        headers: { 
            'Content-Type': 'application/json',
            Authorization: `Bearer ${token}` 
        },
        body: JSON.stringify({ code: code, language: "python" })
    });
    const submitResult = await response.json();
    console.log('Submission Result Full:', JSON.stringify(submitResult, null, 2));
    console.log('Submission Result:', submitResult.passed ? 'PASSED' : 'FAILED');

    // 4. Get Updated Stats
    console.log('Fetching updated stats...');
    response = await fetch('http://localhost:8081/api/users/me/stats', {
      headers: { Authorization: `Bearer ${token}` }
    });
    const stats2 = await response.json();
    console.log('Updated solved:', stats2.totalSolved);

    if (stats2.totalSolved > stats1.totalSolved) {
        console.log('SUCCESS: Stats incremented!');
    } else {
        console.error('FAILURE: Stats did not increment.');
        process.exit(1);
    }

  } catch (err) {
    console.error(err);
    process.exit(1);
  }
}

main();
