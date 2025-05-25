const API_BASE = 'http://localhost:8000';

// Signup Handler
document.getElementById('signup-form').addEventListener('submit', async (e) => {
  e.preventDefault();

  const username = document.getElementById('username').value.trim();
  const email = document.getElementById('email').value.trim();
  const password = document.getElementById('password').value.trim();
  const confirmPassword = document.getElementById('confirm-password').value.trim();
  const role = document.getElementById('role').value;
  const messageEl = document.getElementById('signup-message');

  // Clear message box
  messageEl.textContent = '';
  messageEl.className = '';

  // Password match check
  if (password !== confirmPassword) {
    messageEl.className = 'error-message';
    messageEl.textContent = 'Passwords do not match.';
    return;
  }

  try {
    const response = await fetch(`${API_BASE}/auth/signup`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ username, email, password, role })
    });

    const data = await response.json();

    if (response.ok) {
      messageEl.className = 'success-message';
      messageEl.textContent = 'Signup successful! Redirecting to login...';
      document.getElementById('signup-form').reset();

      setTimeout(() => {
        window.location.href = '/frontend/html/auth/login.html';
      }, 2000);
    } else {
      messageEl.className = 'error-message';
      messageEl.textContent = data.detail || 'Signup failed. Try again.';
    }

  } catch (error) {
    messageEl.className = 'error-message';
    messageEl.textContent = 'Error connecting to server.';
    console.error('Signup error:', error);
  }
});
