# app/main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from Dockerized FastAPI!"}

@app.get("/ping")
def ping():
    return {"ping": "pong"}
