"""
Models are responsible for the database shape , and how we are gonna store data 

Including here : (For Organizations)

 - id.    

 - name.

 - Address / Location {May implement later but leave it for now as single organizatinso could have multiple locations and this will require editing a lot and this is not the goal rn so i will leave it}

"""


from sqlalchemy import Column, Integer, String  # type: ignore
from sqlalchemy.orm import relationship # type: ignore
from app.core.database import Base

class Organization(Base):
    __tablename__ = "organizations"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), unique=True, nullable=False)
    image_url = Column(String(255), nullable=True)  

    users = relationship("User", back_populates="organization")
