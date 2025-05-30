# NotaWise 📚

**NotaWise** is a specialized academic e-commerce platform that allows students to buy, sell, and manage educational materials like notes, study guides, and assignments. The platform supports both **student** and **content creator** perspectives, offering a seamless and intuitive interface to handle browsing, cart management, order processing, and content uploads.

---

## 🔍 Features

- 📖 Browse and search academic content by category
- 🛒 Shopping cart with item editing and removal
- 🧾 Secure checkout and order history
- ✍️ Creator dashboard to upload and manage products
- 👤 Role-based access for students and content creators
- ⚙️ Structured backend logic using FastAPI and relational DB
- 🎨 Clean frontend interface (React-ready structure)

---

## 🛠 Tech Stack

| Layer         | Technology         |
|---------------|--------------------|
| Backend       | **FastAPI**        |
| Database      | **PostgreSQL** (via SQLAlchemy) |
| Frontend      | **HTML/CSS/JS** (can be extended with React) |
| Auth & Roles  | JWT Authentication |
| ORM           | SQLAlchemy         |
| API Handling  | RESTful API        |

---

## 🔄 Project Structure

📁 backend/
├── app/
│ ├── controllers/ # Route handlers
│ ├── models/ # SQLAlchemy models
│ ├── schemas/ # Pydantic schemas
│ ├── database.py # DB setup
│ └── main.py # FastAPI app entry point
📁 frontend/
└── templates/ # HTML pages and static assets



---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Ramadan290/NOTAWISE.git
cd NOTAWISE


cd backend
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt


DATABASE_URL=mysql://username:password@localhost/notawise_db
SECRET_KEY=your_jwt_secret_key


uvicorn app.main:app --reload
