from sqlmodel import Field, SQLModel
from datetime import datetime
from typing import Optional
from pydantic import BaseModel

class User(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    username: str
    password: str
    email: str

class Department(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    name: str
    description: str

class Employee(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    name: str
    department_id: int = Field(foreign_key="department.id")
    birthdate: datetime
    address: str
    active: Optional[bool] = Field(default=True)

class EmployeeRead(Employee):
    id: int

class EmployeeUpdate(SQLModel):
    name: Optional[str] = None
    department_id: Optional[int] = None
    birthdate: Optional[datetime] = None
    address: Optional[str] = None
    active: Optional[bool] = None

class LoginData(BaseModel):
    username: str
    password: str