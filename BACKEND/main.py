'''
This file is responsible for 
 - Initilizing FASTAPI
 - Allowing CORS for frontend connection
 - Connecting DB at startup

'''


# Importing Necessary FASTAPI Libraries
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes.base_routes import router as base_router
from app.routes import auth_routes , product_routes , order_routes , organization_routes
from app.core.database import Base , engine
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
import os



# Those Import do not directly manipulate data in the app they use the models in order to edit columns or add or delete in
# db instead of doing it manually yhis is not the best waay but it is useful
from app.models import user_model, product_model, order_model , organization_model

# Create DB tables
Base.metadata.create_all(bind=engine)

# This is our start point of the Website
app = FastAPI()


# CORS Middleware (This is just a mechanism used to integrate applications)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # will specify the frontend nav later when implemented 
    allow_credentials = True, 
    allow_methods = ["*"],
    allow_headers = ["*"],
)

app.include_router(base_router)
app.include_router(auth_routes.router)
app.include_router(product_routes.router)
app.include_router(order_routes.router)
app.include_router(organization_routes.router)


# This is for the Frontend
frontend_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'FRONTEND'))

app.mount("/frontend", StaticFiles(directory=frontend_path), name="frontend")


@app.on_event("startup")
def on_startup():
    from app.core.database import Base, engine
    Base.metadata.create_all(bind=engine)

# Shutdown event for Database 
@app.on_event("shutdown")
def shutdown_event():
    pass

# Serving Frontend Files   
@app.get("/")
def serve_index():
    return FileResponse(os.path.join(frontend_path, "html/auth/login.html"))