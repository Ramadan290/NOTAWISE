"""
This is where our API endpoints reside we call them to fetch , verify and send data from and out of database

Including here :
 - create order 
 - checkout
 - view all orders

"""


from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session # type: ignore
from app.controllers import order_controller
from app.schemas.order_schema import OrderCreate
from app.models.order_model import OrderItem
from app.models.product_model import Product
from app.core.database import get_db
from app.controllers.auth_controller import get_current_user 
from app.models.user_model import User

router = APIRouter(
    prefix="/orders",
    tags=["Orders"]
)

# Add product to cart (create or update pending order)
@router.post("/add")
def add_to_cart(order_data: OrderCreate, db: Session = Depends(get_db), user: User = Depends(get_current_user)):
    return order_controller.add_to_cart(user, order_data, db)

# Checkout: finalize pending cart
@router.post("/checkout")
def checkout_order(db: Session = Depends(get_db), user: User = Depends(get_current_user)):
    return order_controller.checkout_order(user, db)

# View all orders (admin only)
@router.get("/viewall")
def view_orders(db: Session = Depends(get_db), user: User = Depends(get_current_user)):
    return order_controller.view_orders(user, db)


@router.get("/items/{order_id}")
def get_order_items(order_id: int, db: Session = Depends(get_db)):
    items = (
        db.query(OrderItem, Product)
        .join(Product, OrderItem.product_id == Product.id)
        .filter(OrderItem.order_id == order_id)
        .all()
    )

    return [
        {
            "product_id": p.id,
            "title": p.title,
            "price": p.price,
            "quantity": i.quantity
        }
        for i, p in items
    ]