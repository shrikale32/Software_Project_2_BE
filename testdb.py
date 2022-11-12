import json
from os import path
from database.db_manager import DBManager
from database.models.content_models import Content
from database.models.question_models import Question
from questions_service import QuestionsService

db = DBManager()

# Test filtering content

# with db.getSession() as session: 
#     results = session.query(Content).all()
#     for c in results:
#         print(c,'\n')
    
    
# Test question methods
service = QuestionsService()
with db.getSession() as session: 
    qs = service.listQuestions()
    for q in qs: 
        print('-'*100, q, '\n')
        
        # q.IsDeleted = False
        # service.updateQuestion(q, session)
        
        # if q.QuestionId > 3:
        #     service.deleteQuestion(q,session)

    qtest = Question()
    qtest.QuestionCategoryId = 2
    qtest.Statement = 'How are you liking COMP313?'
    qtest.IsDeleted = False
    id = service.addQuestion(qtest, session)
    print(id)