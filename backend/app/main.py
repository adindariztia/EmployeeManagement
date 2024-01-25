from fastapi.middleware.cors import CORSMiddleware
from fastapi.encoders import jsonable_encoder
from fastapi import FastAPI, HTTPException
from models.user import User
from models.employee import Employee, EmployeeUpdate, EmployeeRead
from models.department import Department
from models.logindata import LoginData
from database import engine, create_db_and_tables
from sqlmodel import Session
import service as _service
import jwt
from decouple import config

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

@app.get("/api/employees")
async def get_all_employees():
    return await _service.get_all_employees()

@app.get("/api/employees/{employee_id}")
async def get_employee_by_id(employee_id: int):
    return await _service.get_employee_by_id(employee_id)

@app.post("/api/employees")
async def add_employee(employee: Employee):
    return await _service.add_employee(employee)

@app.patch("/api/employees/{employee_id}", response_model = EmployeeRead)
async def update_employee(employee_id: int, employee: EmployeeUpdate):
    return await _service.update_employee(employee_id, employee)

@app.delete("/api/employees/{employee_id}", response_model = EmployeeRead)
async def delete_employee(employee_id: int):
    return await _service.delete_employee(employee_id)

@app.get("/api/departments")
async def get_all_departments():
    return await _service.get_all_departments()

@app.post("/api/login")
async def user_login(login_data: LoginData):
    return await _service.user_login(login_data)
