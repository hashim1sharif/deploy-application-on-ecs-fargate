from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

from app.api.endpoints import blogs
from app.db import engine, metadata, database

app = FastAPI(title="FastAPI PostgreSQL CRUD App")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.on_event("startup")
async def startup():
    try:
        metadata.create_all(engine)
        await database.connect()
    except Exception as e:
        print(f"Startup error: {e}")


@app.on_event("shutdown")
async def shutdown():
    try:
        await database.disconnect()
    except Exception:
        pass


@app.get("/")
def read_root():
    return {"message": "This is Python FastAPI blog application"}


@app.get("/health")
def health():
    return {"status": "ok"}


app.include_router(blogs.router, prefix="/api/blogs", tags=["blogs"])