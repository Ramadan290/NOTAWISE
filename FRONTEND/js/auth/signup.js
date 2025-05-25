const API_BASE = 'http://localhost:8000';



  //Signup Handler

  document.getElementById('signup-form').addEventListener('submit', async (e) => {
    e.preventDefault();

    const username = document.getElementById('username').value.trim();
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();
    const messageEl = document.getElementById('signup-message');
    try {
      const response = await fetch(`${API_BASE}/auth/signup`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, email, password })
      });

      const data = await response.json();
      if (response.ok) {
        messageEl.className = 'success-message'; // styled green box
        messageEl.textContent = 'Signup successful! You can now log in.';
        document.getElementById('signup-form').reset();

        setTimeout(() => {
          window.location.href = '/frontend/html/auth/login.html';
        }, 2000);
      }

       else {
        messageEl.style.color = 'red';
        messageEl.textContent = data.detail || 'Signup failed. Try again.';
      }

    } catch (error) {
      messageEl.style.color = 'red';
      messageEl.textContent = 'Error connecting to server.';
      console.error('Signup error:', error);
    }
  });
