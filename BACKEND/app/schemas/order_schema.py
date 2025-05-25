"""
Schema are responsible for what goes in and out of the API and the validation required from database 
This is linked to the Models 

so Models are the shape of the database , Schemas are the input and output validation from and into the database and the API

Including here : (For Orders )

 - OrderCreate → for placing an order.

 - OrderOut → for displaying an order record.

 - orm_mode = True tells FastAPI to read data from the SQLAlchemy model directly.

"""


from pydantic import BaseModel

class OrderCreate(BaseModel):
    product_id : int
    quantity : int = 1

class OrderOut(BaseModel):
    id:int
    user_id : int
    product_id : int
    quantity : int
    total_price : int 
    status : str

class OrderItem(BaseModel):
    order_id : int
    product_id: int
    quantity: int

    class Config:
        from_attributes = True