import json
from os import path
from database.db_manager import DBManager
from database.models.content_models import Content

db = DBManager()

results = db.session.query(Content).all()

for c in results:
    print(c,'\n')