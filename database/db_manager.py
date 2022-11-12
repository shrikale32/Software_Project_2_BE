from os import path
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

class DBManager():
    
    #Internal Session Object
    _session = None
    
    def __init__(self):
        
        # Connect to the database using SQLAlchemy
        if self._session is None:
            engine = create_engine(f"sqlite:///{path.join('database', 'wellbeing.db')}")
            Session = sessionmaker()
            Session.configure(bind=engine)
            self._session = Session()
    
    def getSession(self):
        return self._session