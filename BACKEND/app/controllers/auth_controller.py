'''

This file contains the business logic for authorization
 - Registration 
 - Login
 - Hashing passwords
 - Check if user already exists
 - Validates login info (username , password)

'''

from sqlalchemy.orm import Session # type: ignore
from app.models.user_model import User
from app.schemas.auth_schema import UserCreate , UserLogin , UserOut
from fastapi import HTTPException , Depends
from passlib.context import CryptContext
from jose import jwt, JWTError # type: ignore
from datetime import datetime , timedelta
from fastapi.security import OAuth2PasswordBearer
from app.core.database import get_db



# Password hashin context 
pwd_context = CryptContext(schemes = ["bcrypt"] , deprecated="auto")

# Secret key
SECRET_KEY = ""
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/login")  # Adjust as needed



# ------- Signup ----------------
def signup(user_data: UserCreate, db: Session):

    # 1 - Check if user already exists
    existing_user = db.query(User).filter(
        (User.username == user_data.username) | (User.email == user_data.email)
    ).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="User already exists")

    # 2 - Hash password
    hashed_password = pwd_context.hash(user_data.password)

    # 3 - Determine user role
    requested_role = user_data.role.lower()
    if requested_role == "creator":
        if user_data.email.endswith(".edu"):
            final_role = "pending_creator"  # Awaiting manual approval
        else:
            raise HTTPException(status_code=403, detail="College email required to register as creator.")
    else:
        final_role = "student"  # Default or fallback role

    # 4 - Create New User
    new_user = User(
        username=user_data.username,
        email=user_data.email,
        hashed_password=hashed_password,
        role=final_role
    )

    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    return {
        "message": f"User created successfully as '{final_role}'. Welcome!"
    }

# ------- Login ----------------
def login(user_data : UserLogin  ,db: Session ):
    # 1 - Find User
    user = db.query(User).filter(User.username == user_data.username).first()
    if not user : 
        raise HTTPException(status_code=404 , detail="User doesnt seem to exist")
    
    # 2 - Check Password
    if not pwd_context.verify(user_data.password , user.hashed_password):
        raise HTTPException(status_code=401 , detail="Incorrect password")
    
    # 3 - Generate 2 tokens (current , refresh)
    access_payload = {
        "sub": user.username,
        "role": user.role,  
        "exp": datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    }

    refresh_payload = {
        "sub": user.username,
        "exp": datetime.utcnow() + timedelta(days=7)  # Refresh token lasts longer
    }

    access_token = jwt.encode(access_payload, SECRET_KEY, algorithm=ALGORITHM)
    refresh_token = jwt.encode(refresh_payload, SECRET_KEY, algorithm=ALGORITHM)

    # 4 - return both tokens
    return {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token_type": "bearer"
    }


# ---- Token Refresh ---------- 

def refresh_token(refresh_token:str):
    try:
        payload = jwt.decode(refresh_token , SECRET_KEY , algorithm = [ALGORITHM])
        username = payload.get("sub")

        if username is None :
            raise HTTPException(status_code=401 , detail = "Invalid  refresh token")
        
        # Creating a new access token
        new_token_data = {
            "sub" : username,
            "exp":datetime.utcnow()+timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
        }

        access_token = jwt.encode(new_token_data , SECRET_KEY , algortihm = ALGORITHM)
        return {"access_token" : access_token , "token_type" : "bearer"}
    
    except jwt.ExpiredSignatureError:
        raise HTTPException(status_code=401,detail="Refresh token expired")
    except jwt.JWTError:
        raise HTTPException(status_code=401 , detail = "Invalid refresh token")
    
    
# We made this mistake with THEMIS but we are solving it now experience comes into play now
# rememebr that access tokens have a limit due to the JWT encoding time to ensure security
# adding a refresh token function enables the user to keep using the website as long as he wants without having to login again manually 
# This is crucial for usability so good thing i am not repeating the hell i had with THEMIS
    



############################################# Admin Section ######################################################
# ---- Creator Approval ---------- 

def approve_creator(user_id: str, db: Session):

    # 1 - validate user identity if it matches a pending creator request 
    user = db.query(User).filter(User.username == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found.")
    if user.role != "pending_creator":
        raise HTTPException(status_code=400, detail="User did not request creator role.")
    
    # 2 - update user role to creator
    user.role = "creator"
    
    # 3 - commit changes to database
    db.commit()
    return {"message": f"User {user.username} has been approved as a creator."}


# ---- Check Current user role ---------- 

def get_current_user(token: str = Depends(oauth2_scheme)):

    # 1 -  validate token matching role (creator or student)
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username = payload.get("sub")
        role = payload.get("role")
        user_id = payload.get("id")

        if username is None or role is None:
            raise HTTPException(status_code=401, detail="Invalid token")
        
    # 2 - return user role and username
        return {"username": username, "role": role}
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid or expired token")



# This acts as a dependency i am just too lazy to create a dependency file tbh so yeah it works thats whats important
def require_role(required_role: str):
    def role_dependency(
        current_user: dict = Depends(get_current_user),
        db: Session = Depends(get_db)
    ):
        if current_user["role"] != required_role:
            raise HTTPException(status_code=403, detail="Insufficient role privileges")

        db_user = db.query(User).filter_by(username=current_user["username"]).first()
        if not db_user:
            raise HTTPException(status_code=404, detail="User not found")

        return db_user  # Return full user object
    return role_dependency




