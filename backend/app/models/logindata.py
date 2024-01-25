from sqlmodel import Field, SQLModel
from datetime import datetime
from typing import Optional
from pydantic import BaseModel


class LoginData(BaseModel):
    username: str
    password: str