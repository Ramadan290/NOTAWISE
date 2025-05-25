"""
This is where our API endpoints for Organizations reside.

Including:
 - Displaying all organizations
 - Creating a new organization (admin only)
 - Deleting an organization (admin only)
"""

from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session # type: ignore
from app.schemas.organization_schema import OrganizationBase, OrganizationOut
from app.controllers.organization_controller import create_organization, delete_organization
from app.controllers.auth_controller import get_current_user, require_role, User
from app.core.database import get_db
from app.models.organization_model import Organization

router = APIRouter(
    prefix="/organizations" , tags=["Organizations"]
)

# View all organizations
@router.get("/all", response_model=list[OrganizationOut])
def get_organizations(
    db: Session = Depends(get_db)
):
    return db.query(Organization).all()

# Add new organization (admin only)
@router.post("/add", response_model=OrganizationOut)
def add_organization(
    org: OrganizationBase,
    db: Session = Depends(get_db),
    current_user: User = Depends(require_role("admin"))
):
    return create_organization(org, db)

# Delete organization (admin only)
@router.delete("/delete/{org_id}", response_model=dict)
def remove_organization(
    org_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(require_role("admin"))
):
    return delete_organization(org_id, db)
