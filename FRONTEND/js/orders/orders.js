const API = 'http://localhost:8000';
const token = localStorage.getItem('access_token');

let cartItems = [];

window.onload = async function () {
  try {
    const res = await fetch(`${API}/orders/viewall`, {
      headers: { 'Authorization': `Bearer ${token}` }
    });

    const orders = await res.json();

    if (res.ok) {
      const cart = orders.find(order => order.status === "pending");

      if (cart) {
        const itemsRes = await fetch(`${API}/orders/items/${cart.id}`, {
          headers: { 'Authorization': `Bearer ${token}` }
        });

        cartItems = await itemsRes.json();

        if (Array.isArray(cartItems) && cartItems.length > 0) {
          displayCart();
        } else {
          document.getElementById('cart-items').innerHTML = '<p>Your cart is empty.</p>';
          document.getElementById('checkout-btn').style.display = 'none';
        }

      } else {
        document.getElementById('cart-items').innerHTML = '<p>No active cart found.</p>';
        document.getElementById('checkout-btn').style.display = 'none';
      }

    } else {
      document.getElementById('cart-items').innerHTML = '<p>Failed to load cart.</p>';
    }

  } catch (err) {
    console.error("Fetch error:", err);
    document.getElementById('cart-items').innerHTML = '<p>Server error.</p>';
  }
};

function displayCart() {
  const list = document.getElementById('cart-items');
  list.innerHTML = '';
  let calculatedTotal = 0;

  cartItems.forEach((item, index) => {
    const subtotal = item.price * item.quantity;
    calculatedTotal += subtotal;

    const div = document.createElement('div');
    div.classList.add('cart-item');

    div.innerHTML = `
      <div class="cart-item-details">
        <h4>${item.title}</h4>
        <div class="quantity-controls">
          <button class="quantity-btn" onclick="updateQuantity(${index}, -1)">−</button>
          <span class="quantity-display">${item.quantity}</span>
          <button class="quantity-btn" onclick="updateQuantity(${index}, 1)">+</button>
        </div>
        <p class="price">Price: $${item.price.toFixed(2)}</p>
      </div>
      <div class="cart-actions">
        <button class="remove-btn" onclick="removeItem(${index})">❌ Remove</button>
      </div>
    `;

    list.appendChild(div);
  });

  document.getElementById('cart-summary').innerHTML =
    `<span class="total-price">Total: $${calculatedTotal.toFixed(2)}</span>`;
}

function updateQuantity(index, delta) {
  if (!cartItems[index]) return;

  cartItems[index].quantity += delta;

  if (cartItems[index].quantity <= 0) {
    cartItems.splice(index, 1);
  }

  displayCart();
}

function removeItem(index) {
  cartItems.splice(index, 1);
  displayCart();
}

document.getElementById('checkout-btn').addEventListener('click', async () => {
  const message = document.getElementById('cart-message');

  try {
    const res = await fetch(`${API}/orders/checkout`, {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${token}` }
    });

    const data = await res.json();

    if (res.ok) {
      message.style.color = 'green';
      message.textContent = 'Checkout successful!';
      setTimeout(() => location.reload(), 1500);
    } else {
      message.style.color = 'red';
      message.textContent = data.detail || 'Checkout failed.';
    }

  } catch {
    message.style.color = 'red';
    message.textContent = 'Server error during checkout.';
  }
});
