"""
This is where our API endpoints reside we call them to fetch , verify and send data from and out of database

Including here :
 - Creating a Product
 - Updating a Product
 - Deleting a Product
 - Viewing a Product

"""


from fastapi import APIRouter , Depends , HTTPException
from sqlalchemy.orm import Session # type: ignore
from app.schemas.product_schema import ProductCreate , ProductUpdate , ProductOut 
from app.controllers import product_controller
from app.controllers.product_controller import Product
from app.controllers.auth_controller import get_current_user , require_role, User
from app.core.database import get_db


router = APIRouter(
    prefix="/products",
    tags = ["Products"]
)


@router.post("/create", response_model=ProductOut)
def upload_product(
    product: ProductCreate,
    db: Session = Depends(get_db),
    current_user = Depends(require_role("creator"))
):
    new_product = Product(
        **product.dict(),
        creator_username=current_user.username,
        organization_id=current_user.organization_id
    )
    db.add(new_product)
    db.commit()
    db.refresh(new_product)
    return new_product


# View all Products
@router.get("/all" , response_model=list)
def view_products(
    db : Session = Depends(get_db)
):
    return product_controller.view_products(db)


# Updating a Product
@router.put("/update/{product_id}" , response_model=ProductOut)
def update_product(
    product_id:int,
    update_data : ProductUpdate,
    db: Session = Depends(get_db),
    current_user = Depends(get_current_user)
):
    return product_controller.update_product(product_id,update_data , db , current_user)


# Delete Product (Exclusive to product owner)
@router.delete("/delete/{product_id}", response_model=dict)
def delete_product(
    product_id: int,  # Ensure the ID is an integer
    db: Session = Depends(get_db),
    user=Depends(get_current_user)
):
    # 1 - Validate that the product exists
    product = db.query(Product).filter(Product.id == product_id).first()

    if not product:
        raise HTTPException(status_code=404, detail="Product not found")
    
    # 2 - Ensure that only the creator (by username) can delete the product
    if product.creator_username != user["username"]:  # Compare with username
        raise HTTPException(status_code=403, detail="Not authorized to delete this product")
    
    # 3 - Delete  product
    db.delete(product)

    # 4 - Commit  changes to the database
    db.commit()

    # 5 - Return success message with product title and ID
    return {
        "message": f"Product with the id : {product.id}  and name ({product.title}) was successfully deleted"
    }


####################################################################################################################

# This is a special endpoint i may or may not use it let me explain so if i get back here i could remeber :

# Ok so i thought about loading all data then filtering using js hence i created the endpoint /all , however
# I thought about it and realized that it is stupid to load all the data then after loading it we filter 
# This operation will take a long time so thats why i am creating a filtered endpoint 
# I may or may not use this idk it depends on the size of products in the database 
# but anyways i will remin=d myself to get back here later when i start on the frontend , its good to have options

@router.get("/org/{org_id}", response_model=list[ProductOut])
def get_products_by_organization(
    org_id: int,
    db: Session = Depends(get_db)
):
    products = db.query(Product).filter(Product.organization_id == org_id).all()
    return products
