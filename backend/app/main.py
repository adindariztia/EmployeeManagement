from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI, HTTPException
from model import User, Employee, EmployeeUpdate, EmployeeRead, Department
from service import engine, create_db_and_tables
from sqlmodel import Session

app = FastAPI()

#Middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], #change back to http://localhost:3000
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

#App startup
@app.on_event("startup")
def on_startup():
    create_db_and_tables()

