'''

This file contains the business logic for authorization
 - Adding an Organization (Admin Only)
 - Deleting an Organization (Admin Only)

'''


from sqlalchemy.orm import Session # type: ignore
from app.models.organization_model import Organization
from app.schemas.organization_schema import OrganizationBase # type: ignore
from fastapi import HTTPException

def create_organization(org_data: OrganizationBase, db: Session):
    exists = db.query(Organization).filter_by(name=org_data.name).first()
    if exists:
        raise HTTPException(status_code=400, detail="Organization already exists.")

    org = Organization(name=org_data.name, image_url=org_data.image_url)
    db.add(org)
    db.commit()
    db.refresh(org)
    return org

def delete_organization(org_id: int, db: Session):
    org = db.query(Organization).filter_by(id=org_id).first()
    if not org:
        raise HTTPException(status_code=404, detail="Organization not found.")

    db.delete(org)
    db.commit()
    return {"message": "Organization deleted successfully"}