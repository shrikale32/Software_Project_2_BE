import json
from os import path
from database.db_manager import DBManager
from database.models.content_models import Content

db = DBManager()

# Test filtering content
results = db.session.query(Content).all()
for c in results:
    print(c,'\n')
    
    
# Test question methods
