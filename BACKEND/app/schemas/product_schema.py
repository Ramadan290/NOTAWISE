"""
Schemas are responsible for:
- Input/output validation between the API and the database.
- Defining the expected fields and their types when sending or receiving data.

Models define the shape of the database.
Schemas define how data flows in/out of the API.

Included here:
 - ProductCreate → for creating a product (description and category optional).
 - ProductUpdate → for updating a product partially.
 - ProductOut → for returning product info in responses.
 - from_attributes = True tells FastAPI to read from SQLAlchemy objects.
"""

from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class ProductCreate(BaseModel):
    title: str
    description: Optional[str] = None
    category: Optional[str] = None
    price: float
    file_link: Optional[str] = None     # Google Drive / Dropbox / OneDrive etc.
    image_link: Optional[str] = None    # Link to public image or thumbnail

class ProductUpdate(BaseModel):
    title: Optional[str] = None
    description: Optional[str] = None
    category: Optional[str] = None
    price: Optional[float] = None

class ProductOut(BaseModel):
    id: int
    title: str
    description: Optional[str] = None
    category: Optional[str] = None
    price: float
    creator_username: Optional[str] = None
    file_link: Optional[str] = None         
    image_link: Optional[str] = None     
    created_at: datetime
    
    
    class Config:
        from_attributes = True
