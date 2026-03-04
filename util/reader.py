import markdown
from bs4 import BeautifulSoup
from pathlib import Path

def read_file(path_str: str) -> str:
    path = Path(path_str).expanduser()

    if not path.exists():
        raise FileNotFoundError(f"{path} does not exist")

    return path.read_text()

