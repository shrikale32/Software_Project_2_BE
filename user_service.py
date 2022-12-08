import datetime
from os import path
from database.common import *

def addNewUser(userData):
    print('inside addNewUser')
    conn = create_connection(path.join('database','wellbeing.db'))

    sql = "INSERT INTO User (UserId, RoleId, StatusId, Email, FirstName, LastName, RegisterDate, IsDeleted) VALUES(?,?,?,?,?,?,?,?)"
    
    try:
        cur = conn.cursor()
        print('Date: ', )
        cur.execute(sql, [userData['UserId'], userData['RoleId'], userData['StatusId'], userData['Email'],
        userData['FirstName'], userData['LastName'], datetime.date.today().strftime("%Y-%m-%d"), 0])
        
        conn.commit()
        print('Cursor id: ', cur.lastrowid)
        return cur.lastrowid

    except Error as e:
        print(e)