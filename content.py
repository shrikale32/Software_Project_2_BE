import json
from common import *
from database.db_manager import DBManager
from database.models.content_models import Content

# method for storing new content in database
def addContent(contentData):
    print('inside addContent')
    conn = create_connection('database\wellbeing.db')

    sql = ''' INSERT INTO Content(ContentCategoryId,ContentTypeId,UserId,Title,Body,UrlLink,IsDemoSample,IsRemoved)
              VALUES(?,?,?,?,?,?,?,?) '''
    
    try:
        cur = conn.cursor()
        
        cur.execute(sql, [contentData['ContentCategoryId'], contentData['ContentTypeId'], contentData['UserId'],
        contentData['Title'], contentData['Body'], contentData['UrlLink'], contentData['IsDemoSample'], 0])
        
        conn.commit()
        print('Cursor id: ', cur.lastrowid)
        return cur.lastrowid

    except Error as e:
        print(e)

# method for updating existing content in database
def updateContent(contentData):
    print('inside updateContent')
    conn = create_connection('database\wellbeing.db')

    sql = "UPDATE Content SET ContentCategoryId = {},ContentTypeId = {}, UserId = {}, Title= \'{}\', Body= \'{}\', UrlLink = \'{}\', IsDemoSample = {}, IsRemoved = 0 WHERE ContentId = {}".format(contentData['ContentCategoryId'], contentData['ContentTypeId'], contentData['UserId'],
        contentData['Title'], contentData['Body'], contentData['UrlLink'], contentData['IsDemoSample'], contentData['ContentId'])
    
    print(sql)
    try:
        cur = conn.cursor()
        
        cur.execute(sql)

        conn.commit()

        return cur.lastrowid

    except Error as e:
        print(e)

# method for removing the existing content from UI (set IsRemoved=1 in content table)
def deleteContent(contentId):
    conn = create_connection('database\wellbeing.db')

    sql = 'UPDATE Content SET IsRemoved=1 WHERE ContentId=' + contentId
    
    try:
        cur = conn.cursor()
        
        cur.execute(sql)

        conn.commit()

        return cur.lastrowid

    except Error as e:
        print(e)
        
        
def listAllContent():
    results = ''
    try:
        db = DBManager()
        response = db.session.query(Content).all()
        results = [str(c) for c in response]
    except Error as e:
        print(e)
    return results

def filterContent(category = None, type = None, user = None):
    results = ''
    try:
        db = DBManager()
        response = db.session.query(Content)
        
        if category is not None and str(category) != '':
            response = response.filter(Content.ContentCategoryId == category)
        
        if type is not None and str(type) != '':
            response = response.filter(Content.ContentTypeId == type)
            
        if user is not None and str(user) != '':
            response = response.filter(Content.UserId == user)
                
        response = response.all()    
        results = [str(c) for c in response]
    except Error as e:
        print(e)
    return results