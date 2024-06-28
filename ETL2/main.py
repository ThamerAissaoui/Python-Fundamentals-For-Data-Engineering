import requests
import pandas as pd
from sqlalchemy import create_engine


def extract() -> dict:
    API_URL = "http://universities.hipolabs.com/search?country=United+States"
    data = requests.get(API_URL).json()
    return data


def transform(data: dict) -> pd.DataFrame:
    df = pd.DataFrame(data)
    print(f"Total Number of universities from API: {len(data)}")
    df = df[df["name"].str.contains("California")]
    print(f"Total Number of universities in California: {len(df)}")
    return df[["country", "name"]]


def load(df: pd.DataFrame) -> None:
    disk_engine = create_engine("sqlite:///my_little_store.db")
    df.to_sql('cal_uni', disk_engine, if_exists='replace')


data = extract()
df = transform(data)
load(df)
print(df)
