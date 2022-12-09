import json
from flask import Flask, request, jsonify
from flask_cors import CORS
from user_service import *
from content_service import *
from database.models.question_models import Question, QuestionChoice
from questions_service import QuestionsService
import pandas as pd
import pickle
import requests

app = Flask(__name__)

CORS(app)

db = DBManager()
qService = QuestionsService(db)
uService = UserService(db)

@app.route('/', methods=['GET', 'POST'])
def home():
    return "Flask Backend is running successfully!"

###############################################################################################
#   CONTENT
###############################################################################################

@app.route('/CreateContent', methods=['POST'])
def createContent():
    contentData = request.get_json(force=True)
    contentId = addContent(contentData)
    return str(contentId)

@app.route('/UpdateContent', methods=['POST'])
def editContent():
    contentData = request.get_json(force=True)
    contentId = updateContent(contentData)
    return str(contentId)

@app.route('/<string:contentId>/DeleteContent', methods=['GET'])
def removeContent(contentId):
    print(contentId)
    response = deleteContent(contentId)
    return str(response)

## Methods for querying content with filter
@app.route('/Content', methods=['GET'])
def getContent():
    '''
        Method for requesting content
        Possible entries for URL parameters:
        - category (Id - int)
        - type (Id - int)
        - user (Id - string)
        - isDemo (Boolean)
    '''
    if len(request.args) > 0:

        c = request.args['category'] if 'category' in request.args else None
        t = request.args['type'] if 'type' in request.args else None
        u = request.args['user'] if 'user' in request.args else None

        if 'isDemo' in request.args:
            d = request.args['isDemo'].lower() in ['true', 'yes', '1']
        else:
            d = None

        response = filterContent(c, t, u, d)

    else:
        response = filterContent()
    
    response = [c.toObjDict() for c in response]
    return json.dumps(response,indent=4)

###############################################################################################
#   QUESTIONS
###############################################################################################

def _questionFromJSON(jsonData):
    q = Question()
    q.QuestionId = jsonData['QuestionId'] if 'QuestionId' in jsonData.keys() else None             
    q.QuestionCategoryId = jsonData['QuestionCategoryId']
    q.Statement = jsonData['Statement']
    q.IsDeleted = jsonData['IsDeleted']
    
    if 'QuestionChoices' in jsonData.keys():
        choices = jsonData['QuestionChoices']
        q.QuestionChoices = []
        for c in choices:
            qc = QuestionChoice()
            qc.QuestionId = q.QuestionId
            qc.QuestionChoiceId = c['QuestionChoiceId'] if 'QuestionChoiceId' in c.keys() else None
            qc.Label = c['Label']
            qc.OrderNumber = c['OrderNumber']
            qc.IsDeleted = c['IsDeleted']
            q.QuestionChoices.append(qc)
    
    return q

@app.route('/CreateQuestion', methods=['POST'])
def createQuestion():
    question = _questionFromJSON(request.get_json(force=True))
    questionId = qService.addQuestion(question, db.getSession())
    return str(questionId)

@app.route('/UpdateQuestion', methods=['POST'])
def updateQuestion():
    newQuestion = _questionFromJSON(request.get_json(force=True))
    questionId = qService.updateQuestion(newQuestion, db.getSession())
    return str(questionId)

@app.route('/DeleteQuestion/<int:questionId>/', methods=['POST'])
def deleteQuestion(questionId):
    s = db.getSession()
    q = qService.getQuestion(questionId, s)
    if q is None:
        return 'False'
    
    qService.deleteQuestion(q, s)
    return 'True'
    
## Methods for querying questions with filter
@app.route('/Questions', methods=['GET'])
def getQuestions():
    '''
        Method for requesting the list of questions
        Possible entries for URL parameters:
        - category (Id - int)
        - isDeleted (Boolean)
    '''
    if len(request.args) > 0:
        
        c = request.args['category'] if 'category' in request.args else None
        
        if 'isDeleted' in request.args:
            d = request.args['isDeleted'].lower() in ['true', 'yes', '1']
        else:
            d = None
        
        
        list = qService.listQuestions(c, d)
        
    else:
        list = qService.listQuestions()
        
    list = [q.toObjDict() for q in list]    
    return json.dumps(list, indent=4)

###############################################################################################
#   USERS
###############################################################################################

# Method for adding a new user by Admin
@app.route('/AddNewUser', methods=['POST'])
def addUserByAdmin():
    userData = request.get_json(force=True)
    print(userData)
    userId = UserService.addNewUser(userData)
    return str(userId)

def _userFromJSON(jsonData):
    u = User()
    u.UserId = jsonData['UserId'] if 'UserId' in jsonData.keys() else None             
    u.Email = jsonData['Email']
    u.FirstName = jsonData['FirstName']
    u.LastName = jsonData['LastName']
    u.RegisterDate = jsonData['RegisterDate']
    u.StatusId = jsonData['StatusId']
    u.RoleId = jsonData['RoleId']
    u.IsDeleted = jsonData['IsDeleted']
    
    return u

@app.route('/UpdateUser', methods=['POST'])
def updateUser():
    upUser = _userFromJSON(request.get_json(force=True))
    userId = uService.updateUser(upUser, db.getSession())
    return str(userId)

@app.route('/DeleteUser/<int:userId>/', methods=['POST'])
def deleteUser(userId):
    s = db.getSession()
    u = uService.getUser(userId, s)
    if u is None:
        return 'False'
    
    uService.deleteUser(u, s)
    return 'True'

## Methods for querying questions with filter
@app.route('/Users', methods=['GET'])
def getUsers():
    '''
        Method for requesting the list of users
        Possible entries for URL parameters:
        - email (String)
        - roleId (Id - int)
        - statusId (Id - int)
        - isDeleted (Boolean)
    '''
    if len(request.args) > 0:
        
        e = request.args['email'] if 'email' in request.args else None
        r = request.args['roleId'] if 'roleId' in request.args else None
        s = request.args['statusId'] if 'statusId' in request.args else None
        
        if 'isDeleted' in request.args:
            d = request.args['isDeleted'].lower() in ['true', 'yes', '1']
        else:
            d = None
        
        list = uService.listUsers(e, r, s, d)
        
    else:
        list = uService.listUsers()
        
    list = [u.toObjDict() for u in list]    
    return json.dumps(list, indent=4)

###############################################################################################
#   RECOMMENDATIONS
###############################################################################################

## Methods for querying content with filter
@app.route('/Recommendations', methods=['POST'])
def get_recommendations():
    data = request.get_json(force=True)
    df = pd.DataFrame.from_dict(data, orient='index')
    print(df)
    df = df.T
    print(df)
    xgb_loaded_model = pickle.load(open("model/xgb.pkl", "rb"))
    pred = xgb_loaded_model.predict(df)
    
    pred = pred[0] + 1
    

    url = 'http://localhost:5000/Content?category='+str(pred)
    
    content = requests.get(url)
    c = content.json()
    
    return jsonify(c)


if __name__ == '__main__':
    app.run(debug=True)