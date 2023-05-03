"""
    Main
"""

from fastapi import FastAPI
from pydantic import BaseModel

from app.settings import settings

app = FastAPI()


class Status(BaseModel):
    """
        Status class
    """
    status: str = 'ok'


@app.get(settings.main_url or '')
async def root():
    """
    Status endpoint
    :return: Status
    """
    return Status()
