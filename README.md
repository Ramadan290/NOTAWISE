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


## Preview :
![image](https://github.com/user-attachments/assets/a046f689-99ea-4237-bb5e-ab5cf2ddc5aa)
![image](https://github.com/user-attachments/assets/1d91c046-be4c-4bdc-a84a-cc61c89f1eef)
![image](https://github.com/user-attachments/assets/e3ac0ee6-985f-4f98-8769-14d0cc312f02)
![image](https://github.com/user-attachments/assets/573ddeda-13cf-46eb-8f07-3dae42b08b4a)
![image](https://github.com/user-attachments/assets/bc9d5fa3-7aa2-480f-9b9a-71e98208c7d2)
![image](https://github.com/user-attachments/assets/02f2a1d0-b38c-42ad-85a9-ae6e924950fe)
![image](https://github.com/user-attachments/assets/246017ae-2ba7-414d-ae4c-13aea1493134)
![image](https://github.com/user-attachments/assets/8d24fb07-be25-4963-bc5f-062c16cc9d10)
![image](https://github.com/user-attachments/assets/5671cac4-5dad-4d90-b7f8-de945f7ad6ac)
![image](https://github.com/user-attachments/assets/75f9432b-427d-4ab9-91bb-e94ceeed54e0)


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
SECRET_KEY=your_jwt_secret_keyy


uvicorn app.main:app --reload
