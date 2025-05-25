const API = 'http://localhost:8000';
const token = localStorage.getItem('access_token');
const urlParams = new URLSearchParams(window.location.search);
const orgId = urlParams.get("org_id");

let allProducts = [];

window.onload = async () => {
  if (!orgId) {
    document.getElementById('product-list').innerHTML = '<p>No organization selected.</p>';
    return;
  }

  await loadOrgName(orgId);
  await loadProducts(orgId);
  setupFilterListeners();
  setupSidebarToggle();
  setupPriceLabelSync();
};

// Load organization name
async function loadOrgName(orgId) {
  try {
    const res = await fetch(`${API}/organizations/all`);
    const orgs = await res.json();
    const match = orgs.find(o => o.id == orgId);
    if (match) {
      document.title = `Products - ${match.name}`;
      document.getElementById('page-title').textContent = `Products for ${match.name}`;
    }
  } catch {
    document.title = 'Products';
    document.getElementById('page-title').textContent = 'Products';
  }
}

// Load products for organization
async function loadProducts(orgId) {
  try {
    const res = await fetch(`${API}/products/org/${orgId}`, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    });

    const data = await res.json();

    if (res.ok) {
      allProducts = data;
      populateCategoryOptions(data);
      displayProducts(data);
    } else {
      document.getElementById('product-list').innerHTML = '<p>Failed to load products.</p>';
    }

  } catch {
    document.getElementById('product-list').innerHTML = '<p>Server error.</p>';
  }
}

// Populate category dropdown
function populateCategoryOptions(products) {
  const categorySelect = document.getElementById('filter-category');
  const categories = [...new Set(products.map(p => p.category))];

  categories.forEach(cat => {
    const option = document.createElement('option');
    option.value = cat;
    option.textContent = cat;
    categorySelect.appendChild(option);
  });
}

// Render products
function displayProducts(products) {
  const container = document.getElementById('product-list');
  container.innerHTML = '';

  if (products.length === 0) {
    container.innerHTML = '<p>No products available for this organization.</p>';
    return;
  }

  products.forEach(prod => {
    const box = document.createElement('div');
    box.classList.add('product-card');

    box.innerHTML = `
      <div class="product-image">
        <img src="${prod.image_link}" alt="${prod.title}" />
      </div>

      <div class="product-details">
        <h4>${prod.title}</h4>
        <p class="description-box">${prod.description}</p>
        <p><strong>Category:</strong> ${prod.category || '—'}</p>
        <p><strong>Price:</strong> $${prod.price}</p>
        <p><strong>Created by : </strong> ${prod.creator_username}
      </div>

      <div class="product-actions">
        ${prod.file_link ? `
          <a href="${prod.file_link}" target="_blank" class="download-btn">📄 View File</a>
        ` : `<span></span>`}
        <button class="add-to-cart-btn" onclick="addToCart(${prod.id})">Add to Cart</button>
      </div>
    `;

    container.appendChild(box);
  });
}

// Show modal with message
function showModal(message) {
  const modal = document.getElementById('modal');
  const modalMsg = document.getElementById('modal-message');
  modalMsg.textContent = message;
  modal.classList.remove('hidden');
}

// Close modal
document.getElementById('modal-continue').addEventListener('click', () => {
  document.getElementById('modal').classList.add('hidden');
});

// Go to cart
document.getElementById('modal-cart').addEventListener('click', () => {
  window.location.href = "/frontend/html/orders/orders.html";
});

// Add to cart
async function addToCart(productId) {
  try {
    const res = await fetch(`${API}/orders/add`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      },
      body: JSON.stringify({ product_id: productId, quantity: 1 })
    });

    const data = await res.json();
    if (res.ok) {
      showModal("Item added to cart!");
    } else {
      showModal(data.detail || "Failed to add to cart.");
    }

  } catch {
    showModal("Server error while adding to cart.");
  }
} 


// Toggle sidebar
function setupSidebarToggle() {
  const toggleBtn = document.getElementById('menu-toggle');
  const sidebar = document.getElementById('filter-sidebar');

  toggleBtn.addEventListener('click', () => {
    sidebar.classList.toggle('hidden');
  });
}

// Sync price slider values to label text
function setupPriceLabelSync() {
  const minSlider = document.getElementById('filter-price-min');
  const maxSlider = document.getElementById('filter-price-max');
  const minLabel = document.getElementById('min-price-label');
  const maxLabel = document.getElementById('max-price-label');

  const updateLabels = () => {
    minLabel.textContent = minSlider.value;
    maxLabel.textContent = maxSlider.value;
  };

  minSlider.addEventListener('input', updateLabels);
  maxSlider.addEventListener('input', updateLabels);

  updateLabels();
}

// Apply filter listeners
function setupFilterListeners() {
  const nameInput = document.getElementById('filter-name');
  const categorySelect = document.getElementById('filter-category');
  const minPrice = document.getElementById('filter-price-min');
  const maxPrice = document.getElementById('filter-price-max');
  const applyBtn = document.getElementById('apply-filters');
  const resetBtn = document.getElementById('reset-filters');

  applyBtn.addEventListener('click', applyFilters);

  resetBtn.addEventListener('click', () => {
    nameInput.value = '';
    categorySelect.value = '';
    minPrice.value = 0;
    maxPrice.value = 500;
    applyFilters();
    setupPriceLabelSync(); // Resync labels
  });
}

// Filter logic
function applyFilters() {
  const nameQuery = document.getElementById('filter-name').value.toLowerCase();
  const category = document.getElementById('filter-category').value;
  const minPrice = parseFloat(document.getElementById('filter-price-min').value) || 0;
  const maxPrice = parseFloat(document.getElementById('filter-price-max').value) || Infinity;

  const filtered = allProducts.filter(p => {
    const matchesName = p.title.toLowerCase().includes(nameQuery);
    const matchesCategory = !category || p.category === category;
    const matchesPrice = p.price >= minPrice && p.price <= maxPrice;
    return matchesName && matchesCategory && matchesPrice;
  });

  displayProducts(filtered);
}
