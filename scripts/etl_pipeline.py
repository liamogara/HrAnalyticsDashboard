import sqlite3
import pandas as pd

conn = sqlite3.connect("../data/hr_database.db")

query = """
SELECT *
FROM employees
WHERE TerminationDate IS NULL
"""

df = pd.read_sql(query, conn)

df.to_csv("active_employees.csv", index=False)