"""
Models are responsible for the database shape , and how we are gonna store data 

Including here : (For Products)

 - An order belongs to a user and product (with foreign keys). 

 - quantity can be 1 by default.

 - status tracks the delivery state (Pending , shipped , delivered , cancelled)
 
 - Total Price for the products that belongs to a specific user , this is the summision of the orders

"""

from sqlalchemy import Column , Integer , ForeignKey , String , Float , DateTime # type: ignore
from sqlalchemy.orm import relationship # type: ignore
from app.core.database import Base
from datetime import datetime


class Order(Base):
    __tablename__ = "orders"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    total_price = Column(Float, default=0)
    status = Column(String(50), default="pending")
    order_date = Column(DateTime, default=datetime.utcnow)

    user = relationship("User", back_populates="orders")
    items = relationship("OrderItem", back_populates="order", cascade="all, delete")



class OrderItem(Base):
    __tablename__ = "order_items"

    order_id = Column(Integer, ForeignKey("orders.id"), primary_key=True)
    product_id = Column(Integer, ForeignKey("products.id"), primary_key=True)
    quantity = Column(Integer, default=1)

    order = relationship("Order", back_populates="items")
    product = relationship("Product", back_populates="order_items")
