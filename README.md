🚀 How to Run NOTAWISE
Clone the repository

git clone https://github.com/Ramadan290/NOTAWISE.git
cd NOTAWISE
Create a virtual environment

python -m venv venv
source venv/bin/activate  # On Windows use: venv\Scripts\activate
Install dependencies

pip install -r requirements.txt
Set up the database

Run the FastAPI backend

uvicorn main:app --reload
Access the API

