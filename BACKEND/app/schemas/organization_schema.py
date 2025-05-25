"""
Schema are responsible for what goes in and out of the API and the validation required from database 
This is linked to the Models 

so Models are the shape of the database , Schemas are the input and output validation from and into the database and the API

Including here : (For Organization inventory)

 - Adding an Organization

 - Removing an Organization

 - orm_mode = True ,  tells FastAPI to read data from the SQLAlchemy model directly as the schema handles translation

"""


from pydantic import BaseModel

class OrganizationBase(BaseModel):
    name: str
    image_url: str  # URL or relative path to image
 

class OrganizationOut(OrganizationBase):
    id: int

    class Config:
        from_attributes = True