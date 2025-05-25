
"""
This file is responsible for handling all orders operations 

 - create_order() → creates an order in pending state with items.
 - view_orders() → shows user’s or all orders based on role.
 - checkout_order() → changes status to confirmed, updates timestamp.
 - delete_order() (optional) → only if status='pending' and user owns it.

"""


from fastapi import HTTPException , Depends
from sqlalchemy.orm import Session  # type: ignore
from app.models.order_model import Order , OrderItem
from app.models.product_model import Product
from app.models.user_model import User
from app.schemas.order_schema import OrderCreate , OrderOut
from app.core.database import get_db
from datetime import datetime 
from typing import List


# Creating Cart
def get_or_create_cart(db:Session , user_id : str) :
    # 1 - create a cart
    cart = db.query(Order).filter_by(user_id=user_id , status = "pending").first()
    # 2 - validate cart items 
    if not cart:
        cart = Order(user_id=user_id , status = "pending" , order_date=datetime.utcnow(),total_price=0)
        db.add(cart)
        # 3 - commit changes to database
        db.commit()
        db.refresh(cart)
    return cart



# adding items to Cart
def add_to_cart(user:User , order_data : OrderCreate , db:Session):
    #1 - object cart 
    user_model = db.query(User).filter_by(username=user["username"]).first()
    if not user_model:
        raise HTTPException(status_code=404, detail="User not found")

    cart = get_or_create_cart(db, user_model.id)

    # 2 - Check if product exists (i implemented a stock field but then i though this is a notes app how tf are we gonna run out of downloadable digital notes so i will jsut check for the existence in case of deletion you never know when this might come in handy )
    product = db.query(Product).filter(Product.id == order_data.product_id).first()
    if not product:
        raise HTTPException(status_code = 404  , detail = "Product not found")
    
    # 3 - Check if product is already in cart (in order to limit copying lets imagine the notes are non editable just imagine with me i am tryin to implement some logic here)
    item = db.query(OrderItem).filter_by(order_id = cart.id , product_id = product.id).first()
    if item : 
        item.quantity += order_data.quantity
    else:
        item = OrderItem(order_id = cart.id , product_id = product.id , quantity = order_data.quantity)
        db.add(item)
    
    # 4 - commit changes to database
    db.commit()
    db.refresh(cart)
    print(product.price)
    return{"message" : "Product added to cart ", "order_id":cart.id}


def checkout_order(user: dict, db: Session):
    # 1 - Get real User model from username
    user_model = db.query(User).filter_by(username=user["username"]).first()
    if not user_model:
        raise HTTPException(status_code=404, detail="User not found")

    # 2 - Get pending order
    cart = db.query(Order).filter_by(user_id=user_model.id, status="pending").first()
    if not cart:
        raise HTTPException(status_code=404, detail="No pending cart found")

    # 3 - Get order items
    items = db.query(OrderItem).filter_by(order_id=cart.id).all()
    if not items:
        raise HTTPException(status_code=400, detail="Cart is empty")

    # 4 - Calculate total price
    total = 0
    for item in items:
        product = db.query(Product).filter_by(id=item.product_id).first()
        total += product.price * item.quantity

    # 5 -  Update order
    cart.total_price = total
    cart.status = "confirmed"
    cart.order_date = datetime.utcnow()

    db.commit()
    db.refresh(cart)

    return {"message": "Checkout successful", "total_price": total}

# View orders(admin exclusive)
def view_orders(user: dict, db: Session):
    # 1 - get full user model (for querying their orders)
    user_model = db.query(User).filter_by(username=user["username"]).first()
    if not user_model:
        raise HTTPException(status_code=404, detail="User not found")

    # 2 - check role from the token dictionary
    if user["role"] == "admin":
        return db.query(Order).all()
    else:
        return db.query(Order).filter(Order.user_id == user_model.id).all()
    
