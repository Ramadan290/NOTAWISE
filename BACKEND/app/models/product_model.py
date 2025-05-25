"""
Models are responsible for the database shape , and how we are gonna store data 

Including here : (For Products)

 - name and price are mandatory.    

 - description is optional.

 - stock starts at 0 by default.

"""


from sqlalchemy import Column , Integer , String , Float , ForeignKey , DateTime# type: ignore
from datetime import datetime
from app.core.database import Base
from sqlalchemy.orm import relationship # type: ignore

class Product(Base):
    __tablename__ = "products"

    id = Column(Integer , primary_key=True , index=True)
    title = Column(String(100) , nullable=False)
    description = Column(String(255)) # Come back here idk if this will be enough and maybe user could enter a number that would ruin everything come back here later
    category = Column(String(255))
    price = Column(Float , nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow) 
    creator_username = Column(String, ForeignKey("users.username"), nullable=False)
    file_link = Column(String, nullable=True)
    image_link = Column(String, nullable=True)


    # This pairs Order_Items
    order_items = relationship(
        "OrderItem",
        back_populates="product",
        cascade="all, delete",
    )

    # This pairs Organizations
    organization_id = Column(Integer, ForeignKey("organizations.id"), nullable=False)
    organization = relationship("Organization", backref="products")


