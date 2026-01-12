const fs = require('fs');

async function main() {
  try {
    const response = await fetch('http://localhost:8081/api/auth/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ username: 'api_user_2', password: 'password' })
    });
    const data = await response.json();
    if (data.accessToken) {
      console.log('Token captured');
      fs.writeFileSync('token.txt', data.accessToken);
    } else {
      console.error('Login failed', data);
      process.exit(1);
    }
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
}

main();
