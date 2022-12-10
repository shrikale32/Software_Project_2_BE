import datetime
from os import path
import traceback
from database.common import *
from database.db_manager import DBManager
from database.models.user_models import *
from sqlalchemy.orm import Session
from sqlalchemy import select

class UserService():
    """Service that allows access to all user related functionality
    """
    
    def __init__(self, db : DBManager = None):
        self._db = db if db is not None else DBManager()
    
    
    def addNewUser(userData):
        print('inside addNewUser')
        conn = create_connection(path.join('database','wellbeing.db'))

        sql = "INSERT INTO User (RoleId, StatusId, Email, FirstName, LastName, RegisterDate, IsDeleted) VALUES(?,?,?,?,?,?,?)"
        
        try:
            cur = conn.cursor()
            print('Date: ', )
            cur.execute(sql, [userData['RoleId'], userData['StatusId'], str.lower(userData['Email']),
            userData['FirstName'], userData['LastName'], datetime.date.today().strftime("%Y-%m-%d"), 0])
            
            conn.commit()
            print('Cursor id: ', cur.lastrowid)
            return cur.lastrowid

        except Error as e:
            print(e)

    def getUser(self, userId : int, session : Session):
        u = session.query(User).get(userId)
        return u
    
    def getUserByEmail(self, userEmail : String, session : Session):
        u = session.query(User).filter(User.Email == userEmail).first()
        return u
            
    def updateUser(self, user : User, session : Session):
        session.add(user)
        session.commit()
        
    def deleteUser(self, user : User, session: Session):
        user.IsDeleted = True
        session.add(user)
        session.commit()

    
        
    def listUsers(self, email = None, roleId = None, statusId = None, isDeleted = False):
        
        list = []
        try:
            
            with self._db.getSession() as session: 
                
                response = session.query(User)
                
                if email is not None and str(email) != '':
                    response = response.filter(User.Email.like(f"%{str.lower(email)}%"))
                    
                if roleId is not None and str(email) != '':
                    response = response.filter(User.RoleId == roleId)
                    
                if statusId is not None and str(email) != '':
                    response = response.filter(User.StatusId == statusId)
                
                if isDeleted is not None and str(isDeleted) != '':
                    response = response.filter(User.IsDeleted == isDeleted)
                        
                list = response.order_by(User.RegisterDate).all()    
                
        except Exception as e:
            print(e)
            traceback.print_exc()
        return list