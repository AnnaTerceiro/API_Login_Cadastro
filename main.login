from sqlalchemy import create_engine
import pandas as pd
from fastapi import FastAPI

app = FastAPI()

db_connection_str = 'mysql+pymysql://root:''@localhost:3306/testweb'
db_connection = create_engine(db_connection_str)
df = pd.read_sql('SELECT * FROM testphp', con=db_connection)

@app.get("/")
def root():
    return "Acesso"


@app.get("/login")
def read_login(username: str, password: str):
    query1 = f"SELECT * FROM testweb.testphp where username= '{username}'"
    df1 = pd.read_sql(query1, db_connection)
    return {'username': df1['username'].iloc[0]}
    query2 = f"SELECT * FROM testweb.testphp where password='{password}'"
    df2 = pd.read_sql(query2, db_connection)
    return {'password': df2['password'].iloc[0]}
    return f"read usuario item with username {username} and senha with password {password}"
