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

@app.route('/', methods=['GET', 'POST'])
def home():
    return "Flask Backend is running successfully!"

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
    contentId = qService.addQuestion(question, db.getSession())
    return str(contentId)

@app.route('/UpdateQuestion', methods=['POST'])
def updateQuestion():
    newQuestion = _questionFromJSON(request.get_json(force=True))
    contentId = qService.updateQuestion(newQuestion, db.getSession())
    return str(contentId)

@app.route('/DeleteQuestion/<int:questionId>/', methods=['POST'])
def deleteQuestion(questionId):
    s = db.getSession()
    q = qService.getQuestion(questionId, s)
    if q is None:
        return 'False'
    
    qService.deleteQuestion(q, s)
    return 'True'
    
## Methods for querying content with filter
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
        
        
        list = qService.listQuestions(c, d)
        
    else:
        list = qService.listQuestions()
        
    list = [q.toObjDict() for q in list]    
    return json.dumps(list, indent=4)

# Method for adding a new user by Admin
@app.route('/AddNewUser', methods=['POST'])
def addUserByAdmin():
    userData = request.get_json(force=True)
    print(userData)
    userId = addNewUser(userData)
    return str(userId)


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