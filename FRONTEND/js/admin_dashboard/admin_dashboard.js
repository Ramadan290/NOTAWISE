const API = 'http://localhost:8000';
const token = localStorage.getItem('access_token');
let currentUser = null;
let allUsers = [];

// Get current user
async function getCurrentUser() {
  const res = await fetch(`${API}/auth/me`, {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  currentUser = await res.json();
}

// Load users from backend
async function loadUsers() {
  const res = await fetch(`${API}/auth/users/all`, {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  allUsers = await res.json();
  populateOrgFilter(allUsers);
  filterUsers(); // Apply current filters on load
}

// Display users
function displayUsers(users) {
  const container = document.getElementById('user-list');
  container.innerHTML = '';
  users.forEach(user => {
    const card = document.createElement('div');
    card.style.border = "1px solid #ccc";
    card.style.padding = "10px";
    card.style.marginBottom = "10px";

    const roleToggleBtn = user.role === 'creator'
      ? `<button onclick="updateRole(${user.id}, 'student')">Revoke Creator</button>`
      : `<button onclick="updateRole(${user.id}, 'creator')">Grant Creator</button>`;

    const deleteBtn = currentUser.username !== user.username
      ? `<button onclick="deleteUser(${user.id})">Delete</button>`
      : `<button disabled title="You cannot delete yourself">Delete</button>`;

    card.innerHTML = `
      <p><strong>ID:</strong> ${user.id}</p>
      <p><strong>Username:</strong> ${user.username}</p>
      <p><strong>Email:</strong> ${user.email}</p>
      <p><strong>Role:</strong> ${user.role}</p>
      <p><strong>Organization:</strong> ${user.organization_name ?? 'N/A'}</p>
      ${roleToggleBtn}
      ${deleteBtn}
    `;

    container.appendChild(card);

    console.log(user)
  });
}

// Populate organization filter dropdown using organization name
function populateOrgFilter(users) {
  const orgFilter = document.getElementById('orgFilter');

  const orgNames = [...new Set(users.map(u => u.organization_name).filter(name => name !== null))];

  orgFilter.innerHTML = `<option value="">All Organizations</option>`;
  orgNames.forEach(name => {
    orgFilter.innerHTML += `<option value="${name}">${name}</option>`;
  });
}

// Apply all filters: search, role, organization
function filterUsers() {
  const search = document.getElementById('search').value.toLowerCase();
  const role = document.getElementById('roleFilter').value;
  const orgId = document.getElementById('orgFilter').value;

  const filtered = allUsers.filter(u =>
    u.username.toLowerCase().includes(search) &&
    (role === '' || u.role === role) &&
    (orgId === '' || (u.organization_name && u.organization_name.toString() === orgId))
  );

  displayUsers(filtered);
}

// Update user role (admin action)
function updateRole(userId, role) {
  if (role === 'creator') {
    showPrompt('Enter Organization ID for this creator:', async function(orgId) {
      if (!orgId) {
        showModal('Organization ID is required');
        return;
      }
      await sendRoleUpdate(userId, role, orgId);
    });
  } else {
    sendRoleUpdate(userId, role, null);
  }
}

async function sendRoleUpdate(userId, role, orgId) {
  const res = await fetch(`${API}/auth/admin/set-role/${userId}`, {
    method: 'PUT',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ role, organization_id: orgId })
  });

  if (res.ok) {
    showModal(`Role updated to ${role}`);
    loadUsers();
  } else {
    showModal('Failed to update role');
  }
}

// Delete a user (admin action)
function deleteUser(userId) {
  showConfirm('Are you sure you want to delete this user?', async function(confirmed) {
    if (!confirmed) return;

    const res = await fetch(`${API}/auth/admin/delete-user/${userId}`, {
      method: 'DELETE',
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });

    if (res.ok) {
      showModal('User deleted successfully');
      loadUsers();
    } else {
      showModal('Failed to delete user');
    }
  });
}

// === Sinple Modal ===
function showModal(message) {
  const modal = document.getElementById('simple-modal');
  document.getElementById('simple-message').innerText = message;
  modal.classList.remove('hidden');

  document.getElementById('simple-ok').onclick = () => {
    modal.classList.add('hidden');
  };
}

// === Confirm Modal ===
function showConfirm(message, callback) {
  const modal = document.getElementById('confirm-modal');
  document.getElementById('confirm-message').innerText = message;
  modal.classList.remove('hidden');

  const okBtn = document.getElementById('confirm-ok');
  const cancelBtn = document.getElementById('confirm-cancel');

  const cleanUp = () => modal.classList.add('hidden');

  okBtn.onclick = () => {
    cleanUp();
    callback(true);
  };

  cancelBtn.onclick = () => {
    cleanUp();
    callback(false);
  };
}

// === Prompt Modal ===
function showPrompt(message, callback) {
  const modal = document.getElementById('prompt-modal');
  const input = document.getElementById('prompt-input');
  document.getElementById('prompt-message').innerText = message;
  input.value = '';
  modal.classList.remove('hidden');

  const okBtn = document.getElementById('prompt-ok');
  const cancelBtn = document.getElementById('prompt-cancel');

  const cleanUp = () => modal.classList.add('hidden');

  okBtn.onclick = () => {
    cleanUp();
    callback(input.value.trim());
  };

  cancelBtn.onclick = () => {
    cleanUp();
    callback(null);
  };
}

// Initialize
window.onload = async () => {
  await getCurrentUser();
  await loadUsers();
};
