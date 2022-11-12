from os import path
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

class DBManager():
    
    _engine = None
    
    def __init__(self):
        
        # Connect to the database using SQLAlchemy
        if self._engine is None:
            self._engine = create_engine(f"sqlite:///{path.join('database', 'wellbeing.db')}")
            
    
    def getSession(self):
        Session = sessionmaker(self._engine)
        # session.configure(bind=self._engine)
        return Session()