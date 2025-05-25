const API_BASE = 'http://localhost:8000';

function getAccessToken() {
  return localStorage.getItem('access_token');
}

async function apiRequest(endpoint, method = 'GET', body = null, auth = false) {
  const headers = { 'Content-Type': 'application/json' };
  if (auth) headers['Authorization'] = `Bearer ${getAccessToken()}`;

  const response = await fetch(`${API_BASE}${endpoint}`, {
    method,
    headers,
    body: body ? JSON.stringify(body) : null
  });

  return response.json();
}