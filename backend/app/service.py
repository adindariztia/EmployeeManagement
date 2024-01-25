from sqlmodel import SQLModel, create_engine
import model

DATABASE_URL = 'postgresql://udin:udin@localhost/EmployeeManagement'

engine = create_engine(DATABASE_URL)

def create_db_and_tables():
    SQLModel.metadata.create_all(engine)