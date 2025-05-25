const API = 'http://localhost:8000';
let allOrganizations = [];

window.onload = async function () {
  try {
    const res = await fetch(`${API}/organizations/all`);
    const orgs = await res.json();

    if (res.ok) {
      allOrganizations = orgs;
      displayOrganizations(orgs);
    } else {
      document.getElementById('organization-list').innerHTML = '<p>Failed to load organizations.</p>';
    }
  } catch (error) {
    console.error('Fetch error:', error);
    document.getElementById('organization-list').innerHTML = '<p>Server error.</p>';
  }
};

function displayOrganizations(orgs) {
  const container = document.getElementById('organization-list');
  container.innerHTML = '';

  orgs.forEach(org => {
    const div = document.createElement('div');
    div.classList.add('org-card'); // matches your CSS

    div.innerHTML = `
      <img src="${org.image_url}" alt="${org.name}" />
      <span>${org.name}</span>
    `;

    div.onclick = () => {
      window.location.href = `/frontend/html/products/products.html/?org_id=${org.id}`;
    };

    container.appendChild(div);
  });
}

// Attach search after DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.getElementById('search-input');

  if (searchInput) {
    searchInput.addEventListener('input', function (e) {
      const query = e.target.value.toLowerCase();

      const filtered = allOrganizations.filter(org =>
        org.name.toLowerCase().includes(query)
      );

      displayOrganizations(filtered);
    });
  }
});


document.addEventListener('DOMContentLoaded', () => {
  const creatorLink = document.getElementById('creator-dashboard-link');

  if (creatorLink) {
    creatorLink.addEventListener('click', async (e) => {
      e.preventDefault();

      const token = localStorage.getItem('access_token');

      if (!token) {
        showCreatorModal(); // not logged in
        return;
      }

      try {
        const res = await fetch(`${API}/auth/me`, {
          headers: { 'Authorization': `Bearer ${token}` }
        });

        if (!res.ok) {
          showCreatorModal();
          return;
        }

        const user = await res.json();

        console.log(user.role)
        if (user.role === 'creator') {
          window.location.href = '/frontend/html/creator_dashboard/creator_dashboard.html';
        } else if (user.role === 'pending_creator') {
          showPendingModal();
        } else {
          showCreatorModal();
        }
      } catch (error) {
        console.error('Error checking user role:', error);
        showCreatorModal();
      }
    });
  }

  // Modal behavior
  document.getElementById('creator-signup').onclick = () => {
    window.location.href = '/frontend/html/auth/signup.html'; 
  };

  document.getElementById('creator-cancel').onclick = () => {
    document.getElementById('creator-modal').classList.add('hidden');
  };
});

function showCreatorModal() {
  document.getElementById('creator-modal').classList.remove('hidden');
}


function showPendingModal() {
  document.getElementById('pending-modal').classList.remove('hidden');
}

document.getElementById('pending-ok').onclick = () => {
  document.getElementById('pending-modal').classList.add('hidden');
};

  