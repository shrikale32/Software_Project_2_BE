from common import *

def addContent(contentData):
    print('inside add_content')
    conn = create_connection('database\wellbeing.db')

    sql = ''' INSERT INTO Content(ContentCategoryId,ContentTypeId,UserId,Title,UrlLink,IsDemoSample,IsRemoved)
              VALUES(?,?,?,?,?,?,?) '''
    
    try:
        cur = conn.cursor()
        
        cur.execute(sql, [contentData['ContentCategoryId'], contentData['ContentTypeId'], contentData['UserId'],
        contentData['Title'], contentData['UrlLink'], contentData['IsDemoSample'], contentData['IsRemoved']])
        
        conn.commit()
        print('Cursor id: ', cur.lastrowid)
        return cur.lastrowid

    except Error as e:
        print(e)
