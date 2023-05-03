"""
    Settings
"""

from pathlib import Path

from dotenv import load_dotenv
from pydantic import BaseSettings


ENV_PATH = Path(__file__).parent.parent / '.env'
load_dotenv(dotenv_path=ENV_PATH)
load_dotenv()


class Settings(BaseSettings):
    """
        Settings class
    """
    main_url: str


settings = Settings()
