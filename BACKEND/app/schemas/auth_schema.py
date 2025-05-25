"""
Schema are responsible for what goes in and out of the API and the validation required from database 
This is linked to the Models 

so Models are the shape of the database , Schemas are the input and output validation from and into the database and the API

Including here : (For Login/Registration)

 - UserCreate → for user registration.

 - UserLogin → for logging in.

 - UserOut → for returning user info (without password!).

 - orm_mode = True tells FastAPI to read data from the SQLAlchemy model directly.

"""


from pydantic import BaseModel , EmailStr 
from typing import Optional , Union

class UserCreate(BaseModel):
    username:str
    email:EmailStr
    password : str
    role: str = "student"  # default role



class UserLogin(BaseModel):
    username:str
    password : str

class RoleUpdateRequest(BaseModel):
    role: str
    organization_id: Optional[int] = None  

class UserOut(BaseModel):
    id : int 
    username : str
    email : EmailStr
    role: str  
    organization_id: Optional[Union[int, None]] = None  # Accepts int or None
    organization_name: Optional[str] = None  # This will be added manually in the route

    class Config : 
        from_attributes = True