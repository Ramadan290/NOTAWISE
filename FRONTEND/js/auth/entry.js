document.getElementById('signup-btn').addEventListener('click', () => {
  const selected = document.querySelector('input[name="role"]:checked');

  if (!selected) {
    showModal();
    return;
  }

  const role = selected.value;

  if (role === 'creator') {
    window.location.href = '/frontend/html/auth/signup_creator.html';
  } else {
    window.location.href = '/frontend/html/auth/signup.html';
  }
});

// Modal logic
function showModal() {
  document.getElementById('role-modal').classList.remove('hidden');
}

document.getElementById('close-modal').addEventListener('click', () => {
  document.getElementById('role-modal').classList.add('hidden');
});
