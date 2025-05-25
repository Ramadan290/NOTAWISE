"""
This file contains all the CRUD operations for product control 

 - Creating a new product (creator)
 - Viewing a Product (student & creator)
 - Updating an exsiting product (creator)
 - Deleting a exisiting product (owned creator) 

"""

from fastapi import Depends, HTTPException , status
from sqlalchemy.orm import Session  # type: ignore
from app.models.product_model import Product 
from app.schemas.product_schema import ProductCreate, ProductUpdate , ProductOut
from app.core.database import get_db 
from app.controllers.auth_controller import get_current_user , require_role
from typing import List


 
# Upload Product
def upload_product(
    product_data: ProductCreate,
    db: Session = Depends(get_db),
    user = Depends(get_current_user)
):
    # 1 - Verify user role
    require_role("creator")

    # 2 - Create a product and pair it with creator_username
    new_product = Product(**product_data.dict(), creator_username=user["username"])
    
    db.add(new_product)
    db.commit()
    db.refresh(new_product)

    return new_product


# View All Products
def view_products(db: Session) -> List[ProductOut]:
    # Fetch all products
    products = db.query(Product).all()

    # Return serialized product data using Pydantic ProductOut schema
    return [ProductOut.from_orm(product) for product in products]


# Update Product
def update_product(
    product_id: int,
    update_data: ProductUpdate,
    db: Session = Depends(get_db),
    user = Depends(get_current_user)
):
    # 1 - Validate that user and product usernames match
    product = db.query(Product).filter(Product.id == product_id).first()

    if not product:
        raise HTTPException(status_code=404, detail="Product doesn't exist")
    
    # 2 - Ensure only the creator (by username) can update the product
    if product.creator_username != user["username"]:  # Compare username now
        raise HTTPException(status_code=403, detail="Unauthorized access")

    # 3 - Update product info
    for field, value in update_data.dict(exclude_unset=True).items():
        setattr(product, field, value)

    # 4 - Commit changes to the database
    db.commit()
    db.refresh(product)

    # 5 - Return the updated product in ProductOut format
    print(user)
    return ProductOut.from_orm(product)







# Delete Product (Exclusive to product owner)
def delete_product(
    product_id: str,  # Product ID should be an integer
    db: Session = Depends(get_db),
    user = Depends(get_current_user)
):
    # 1 - Validate that the product exists
    product = db.query(Product).filter(Product.id == product_id).first()

    if not product:
        print(product_id)
        raise HTTPException(status_code=404, detail="Product not found")
    
    # 2 - Ensure that only the creator (by username) can delete the product
    if product.creator_username != user["username"]:  # Compare with username
        raise HTTPException(status_code=403, detail="Not authorized to delete this product")
    
    # 3 - Delete the product
    db.delete(product)

    # 4 - Commit the changes to the database
    db.commit()

    # 5 - Return the deleted product details using ProductOut schema
    return ProductOut.from_orm(product)  # Returning the deleted product details




    