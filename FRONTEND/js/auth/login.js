const API_BASE = 'http://localhost:8000';




//Login Handler

const loginForm = document.getElementById('login-form');

if (loginForm) {
  loginForm.addEventListener('submit', async (e) => {
    e.preventDefault();

    const username = document.getElementById('login-username').value.trim();
    const password = document.getElementById('login-password').value.trim();
    const messageEl = document.getElementById('login-message');

    try {
      const response = await fetch(`${API_BASE}/auth/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password })
      });

      const data = await response.json();

      if (response.ok) {
        // Store tokens
        localStorage.setItem('access_token', data.access_token);
        localStorage.setItem('refresh_token', data.refresh_token);

        // Show success message
        messageEl.style.color = 'green';
        messageEl.textContent = 'Login successful! Checking role...';

        // Fetch user info to determine role
        const meRes = await fetch(`${API_BASE}/auth/me`, {
          headers: {
            'Authorization': `Bearer ${data.access_token}`
          }
        });

        const meData = await meRes.json();

        if (meRes.ok) {
          const role = meData.role;

          setTimeout(() => {
            if (role === 'admin') {
              console.log(role)
              window.location.href = '/frontend/html/admin_dashboard/admin_dashboard.html';
            } else if (role === 'creator') {
              window.location.href = '/frontend/html/home/homepage.html';
            } else {
              window.location.href = '/frontend/html/home/homepage.html';
            }
          }, 1000);

        } else {
          messageEl.style.color = 'red';
          messageEl.textContent = 'Login succeeded but failed to fetch user info.';
        }

      } else {
        messageEl.style.color = 'red';
        messageEl.textContent = data.detail || 'Login failed.';
      }

    } catch (err) {
      messageEl.style.color = 'red';
      messageEl.textContent = 'Error connecting to server.';
    }
  });
}

