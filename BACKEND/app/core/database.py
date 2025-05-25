"""
This file sets up:
- SQLAlchemy engine + session (for ORM models)
- FastAPI DB dependency (get_db)
"""

import os
from dotenv import load_dotenv # type: ignore
from sqlalchemy import create_engine # type: ignore
from sqlalchemy.orm import sessionmaker, declarative_base # type: ignore
from urllib.parse import quote_plus


# Load environment variables
load_dotenv()

# ORM base for model declarations
Base = declarative_base()

connection_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=ABDALLAH\\SQLEXPRESS;"
    "DATABASE=NotaWise;"
    "UID=db_notawise_admin;"
    "PWD=RoqZak226@"
)

params = quote_plus(connection_str)
SQLALCHEMY_DATABASE_URL = f"mssql+pyodbc:///?odbc_connect={params}"

engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)

# FastAPI dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()






