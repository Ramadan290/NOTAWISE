const API = 'http://localhost:8000';
const token = localStorage.getItem('access_token');
let currentUser = null;

// === Get Current User ===
async function getCurrentUser() {
  const res = await fetch(`${API}/auth/me`, {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  currentUser = await res.json();
}

// === Load Creator's Products ===
async function loadProducts() {
  const res = await fetch(`${API}/products/all`);
  const products = await res.json();

  const selectedDate = document.getElementById('dateFilter').value;
  const sortOrder = document.getElementById('sortOrder').value;
  const container = document.getElementById('product-list');
  container.innerHTML = '';

  const myProducts = products
    .filter(p => p.creator_username === currentUser.username)
    .filter(p => {
      if (!selectedDate) return true;
      const productDate = new Date(p.created_at).toISOString().split('T')[0];
      return productDate === selectedDate;
    });

  if (sortOrder === 'asc') {
    myProducts.sort((a, b) => new Date(a.created_at) - new Date(b.created_at));
  } else if (sortOrder === 'desc') {
    myProducts.sort((a, b) => new Date(b.created_at) - new Date(a.created_at));
  }

  if (myProducts.length === 0) {
    container.innerHTML = '<p>No products found for the selected date.</p>';
    document.getElementById('product-count').innerText = '';
    return;
  }

  document.getElementById('product-count').innerText = `${myProducts.length} product(s) found`;

  myProducts.forEach(p => {
    const card = document.createElement('div');
    card.className = 'creator-product-card';

    const escaped = str => (str || '').replace(/`/g, "\\`");

    const imageHTML = p.image_link
      ? `<img src="${p.image_link}" alt="Product Image" style="max-width: 100%; border-radius: 8px; margin-bottom: 10px;" />`
      : '';

    const fileButtonHTML = p.file_link
      ? `<a href="${p.file_link}" target="_blank"><button class="download-btn">📄 View File</button></a>`
      : '';

    card.innerHTML = `
      ${imageHTML}
      <h4>${p.title}</h4>
      <div class="description-box">${p.description}</div>
      <p><strong>Category:</strong> ${p.category}</p>
      <p><strong>Price:</strong> $${p.price}</p>
      <p><strong>Date:</strong> ${new Date(p.created_at).toLocaleDateString()}</p>
      ${fileButtonHTML}

      <div class="card-actions">
        <button class="edit-btn" onclick='editProduct(
          ${p.id},
          \`${escaped(p.title)}\`,
          \`${escaped(p.description)}\`,
          \`${escaped(p.category)}\`,
          ${p.price},
          \`${escaped(p.file_link)}\`,
          \`${escaped(p.image_link)}\`
        )'>✏️ Edit</button>

        <button class="delete-btn" onclick="deleteProduct(${p.id})">🗑️ Delete</button>
      </div>
    `;

    container.appendChild(card);
  });
}

// === Form Submission: Create or Edit ===
document.getElementById('product-form').addEventListener('submit', async (e) => {
  e.preventDefault();

  const productId = document.getElementById('product-id').value;
  const isEdit = productId !== '';

  const productData = {
    title: document.getElementById('title').value.trim(),
    description: document.getElementById('description').value.trim(),
    price: parseFloat(document.getElementById('price').value),
    category: document.getElementById('category').value.trim()
  };

  const fileLink = document.getElementById('file_link').value.trim();
  const imageLink = document.getElementById('image_link').value.trim();
  if (fileLink) productData.file_link = fileLink;
  if (imageLink) productData.image_link = imageLink;

  const endpoint = isEdit
    ? `${API}/products/update/${productId}`
    : `${API}/products/create`;
  const method = isEdit ? 'PUT' : 'POST';

  const res = await fetch(endpoint, {
    method,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify(productData)
  });

  if (res.ok) {
    showInfoModal(isEdit ? "Product updated!" : "Product created!");
    resetForm();
    await loadProducts();
  } else {
    showInfoModal("Error submitting product");
  }
});

// === Reset Form Fields ===
function resetForm() {
  document.getElementById('product-form').reset();
  document.getElementById('product-id').value = '';
}

// === Populate Form for Editing ===
function editProduct(id, title, description, category, price, file_link, image_link) {
  document.getElementById('product-id').value = id;
  document.getElementById('title').value = title;
  document.getElementById('description').value = description;
  document.getElementById('category').value = category;
  document.getElementById('price').value = price;
  document.getElementById('file_link').value = file_link;
  document.getElementById('image_link').value = image_link;
}

// === Handle Delete with Confirmation Modal ===
async function deleteProduct(id) {
  const confirmDelete = await showConfirmModal("Are you sure you want to delete this product?");
  if (!confirmDelete) return;

  const res = await fetch(`${API}/products/delete/${id}`, {
    method: 'DELETE',
    headers: { 'Authorization': `Bearer ${token}` }
  });

  if (res.ok) {
    showInfoModal("Product deleted");
    await loadProducts();
  } else {
    showInfoModal("Error deleting product");
  }
}

// === Info Modal (OK only) ===
function showInfoModal(message) {
  document.getElementById('info-modal-message').textContent = message;
  document.getElementById('info-modal').classList.remove('hidden');
}

// Close info modal
document.getElementById('info-modal-ok').addEventListener('click', () => {
  document.getElementById('info-modal').classList.add('hidden');
});

// === Confirm Modal (Confirm / Cancel) ===
function showConfirmModal(message) {
  return new Promise((resolve) => {
    document.getElementById('confirm-modal-message').textContent = message;
    document.getElementById('confirm-modal').classList.remove('hidden');

    const confirmBtn = document.getElementById('confirm-modal-confirm');
    const cancelBtn = document.getElementById('confirm-modal-cancel');

    const cleanup = () => {
      document.getElementById('confirm-modal').classList.add('hidden');
      confirmBtn.removeEventListener('click', onConfirm);
      cancelBtn.removeEventListener('click', onCancel);
    };

    const onConfirm = () => {
      cleanup();
      resolve(true);
    };

    const onCancel = () => {
      cleanup();
      resolve(false);
    };

    confirmBtn.addEventListener('click', onConfirm);
    cancelBtn.addEventListener('click', onCancel);
  });
}

// === Init Dashboard ===
window.onload = async () => {
  await getCurrentUser();
  await loadProducts();
};
