from fastapi.encoders import jsonable_encoder
from fastapi import FastAPI, HTTPException
from models.user import User
from models.employee import Employee, EmployeeUpdate, EmployeeRead
from models.department import Department
from models.logindata import LoginData
from database import engine
from sqlmodel import Session
import jwt
from decouple import config

async def get_all_employees():
    with Session(engine) as session:
        employees = session.query(Employee).filter(Employee.active == True).all()

        return employees

async def get_employee_by_id(employee_id: int):
    with Session(engine) as session:
        employee = session.query(Employee).filter(Employee.active == True and Employee.id == employee_id).first()

        if not employee:
            raise HTTPException(status_code=404, detail="Employee not found")
        
        return employee

async def add_employee(employee: Employee):
    with Session(engine) as session:
        session.add(employee)
        session.commit()
        session.refresh(employee)
        return employee

async def update_employee(employee_id: int, employee: EmployeeUpdate):
    with Session(engine) as session:
        employee_db = session.query(Employee).filter(Employee.active == True and Employee.id == employee_id).first()
        if not employee_db:
            raise HTTPException(status_code=404, detail="Employee not found")
        employee_data = employee.model_dump(exclude_unset=True)
        for key, value in employee_data.items():
            setattr(employee_db, key, value)
        session.add(employee_db)
        session.commit()
        session.refresh(employee_db)
        return employee_db

async def delete_employee(employee_id: int):
    with Session(engine) as session:
        employee = session.query(Employee).filter(Employee.id == employee_id and Employee.active == True).first()
        if not employee:
            raise HTTPException(status_code=404, detail="Employee not found")
        session.delete(employee)
        session.commit()
        return employee

async def get_all_departments():
    with Session(engine) as session:
        departments = session.query(Department).all()

        return departments

async def user_login(login_data: LoginData):
    data = jsonable_encoder(login_data)

    username = data["username"]
    password = data["password"]

    with Session(engine) as session:
        user = session.query(User).filter(User.username == username and User.password == password).first()

        if user:
            encoded_jwt = jwt.encode(data, config('SECERT_KEY'), algorithm=config('ALGORITHM'))
            return { "token": encoded_jwt}
        return HTTPException(status_code=403, detail="username or password is incorrect")