"""
This is where our API endpoints reside we call them to fetch , verify and send data from and out of database

Including here :
 - Login Endpoint  
 - register Endpoint
 - get all users (admin only)
 - delete user (admin only)
 - Granting or Revoking user Role

"""

from fastapi import APIRouter , Depends , HTTPException
from sqlalchemy.orm import Session  # type: ignore
from app.schemas.auth_schema import UserCreate , UserLogin , UserOut , RoleUpdateRequest
from app.models.user_model import User
from app.controllers.auth_controller import signup , login , approve_creator , require_role , get_current_user
from app.core.database import get_db
from fastapi import Body
from typing import List



router = APIRouter(prefix="/auth" , tags=["Authentication"])

@router.post("/signup")
def register_user(user_data : UserCreate , db : Session = Depends(get_db)):
    return signup(user_data,db)

@router.post("/login")
def login_user(user_data: UserLogin, db: Session = Depends(get_db)):
    return login(user_data, db) 

@router.post("/refresh")
def refresh(refresh_token: str = Body(...)):
    return refresh_token(refresh_token)

@router.patch("/admin/approve-creator/{user_id}")
def approve_creator_route(user_id: str, db: Session = Depends(get_db), admin=Depends(require_role("admin"))):
    return approve_creator(user_id, db)

@router.get("/creator/dashboard")
def creator_dashboard(current_user = Depends(require_role("creator"))):
    return {"message": f"Welcome creator {current_user.username}"}

@router.get("/me")
def get_me(current_user: dict = Depends(get_current_user)):
    return {
        "username": current_user["username"],
        "role": current_user["role"]
    }



# Get All Users (Admin Only)
@router.get("/users/all", response_model=List[UserOut])
def get_all_users(db: Session = Depends(get_db), admin: dict = Depends(require_role("admin"))):
    users = db.query(User).all()

    result = []
    for user in users:
        result.append({
            "id": user.id,
            "username": user.username,
            "email": user.email,
            "role": user.role,
            "organization_name": user.organization.name if user.organization else None
        })
    return result


# Deleting User
@router.delete("/admin/delete-user/{user_id}", response_model=dict)
def delete_user(
    user_id: int,
    db: Session = Depends(get_db),
    admin: dict = Depends(require_role("admin"))
):
    user = db.query(User).filter(User.id == user_id).first()

    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    # Prevent self-deletion {i deleted admin by mistake and sat for like 30 minutes wondering why my token is not working bruh ...}
    if user.username == admin.username:
        raise HTTPException(status_code=403, detail="You cannot delete your own account.")

    db.delete(user)
    db.commit()
    return {"message": f"User '{user.username}' deleted successfully."}



# Granting or Revoking user role
@router.put("/admin/set-role/{user_id}", response_model=UserOut)
def set_user_role(
    user_id: int,
    data: RoleUpdateRequest,
    db: Session = Depends(get_db),
    admin: dict = Depends(require_role("admin"))
):
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    if data.role not in ["student", "creator", "admin"]:
        raise HTTPException(status_code=400, detail="Invalid role specified")

    user.role = data.role

    # org ID only if becoming a creator
    if data.role == "creator":
        if not data.organization_id:
            raise HTTPException(status_code=400, detail="Organization ID is required for creators")
        user.organization_id = data.organization_id
    else:
        user.organization_id = None  # optional: clear org ID if role is downgraded

    db.commit()
    db.refresh(user)
    return user