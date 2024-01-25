from sqlmodel import SQLModel, create_engine
import models.user
import models.employee
import models.department
import models.logindata
from decouple import config

engine = create_engine(config('DATABASE_URL'))

def create_db_and_tables():
    SQLModel.metadata.create_all(engine)