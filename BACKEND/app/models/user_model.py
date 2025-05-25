"""
Models are responsible for the database shape , and how we are gonna store data 

Including here : (For User)

 - username and email must be unique.

 - We store hashed_password using SHA-2 512 bit (not plain text password).

 - is_active allows disabling accounts if not needed anymore

"""


from sqlalchemy import Column , Integer , String , ForeignKey # type: ignore
from app.core.database import Base
from sqlalchemy.orm import relationship # type: ignore


class User(Base):
    __tablename__ = "users"

    id = Column(Integer , primary_key = True , index = True)
    username = Column(String(50),unique=True , nullable = False)
    email = Column (String(100), unique =True , nullable = False)
    hashed_password = Column(String(100), unique=True,nullable =False)
    is_active = Column(Integer , default=1) # 1 = active , 0 = not active , i am not sure if this will work or if i should pass boolean or binary validation but be sure to come back here if u see a creatiion problem check the db
    role = Column(String(20), default="student", nullable=False)
    orders = relationship("Order", back_populates="user")
    
    organization_id = Column(Integer, ForeignKey("organizations.id"))
    organization = relationship("Organization", back_populates="users")

