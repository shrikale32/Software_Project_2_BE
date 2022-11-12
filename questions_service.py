import traceback
from database.db_manager import DBManager
from database.models.question_models import *
from sqlalchemy.orm import Session
from sqlalchemy import select

class QuestionsService():
    """Service that allows access to all questionnaire related functionality
    """
    
    def __init__(self, db : DBManager = None):
        self._db = db if db is not None else DBManager()
        
    def getQuestion(self, questionId : int, session : Session):
        q = session.query(Question).get(questionId)
        return q        

    def addQuestion(self, question : Question, session : Session):
        
        # Auto increment - Resulting Id
        session.add(question)
        
        # Refresh object with db state
        session.flush()
        session.refresh(question)
        
        session.commit()
        
        return question.QuestionId
        

    def updateQuestion(self, question : Question, session : Session):
        session.add(question)
        session.commit()
        
    def deleteQuestion(self, question : Question, session: Session):
        session.delete(question)
        session.commit()
        
    def listQuestions(self, category = None, isDeleted = False):
        
        list = []
        try:
            
            with self._db.getSession() as session: 
                
                response = session.query(Question)
                
                if category is not None and str(category) != '':
                    response = response.filter(Question.QuestionCategoryId == category)
                
                if isDeleted is not None and str(isDeleted) != '':
                    response = response.filter(Question.IsDeleted == isDeleted)
                        
                list = response.order_by(Question.QuestionId).all()    
                
        except Exception as e:
            print(e)
            traceback.print_exc()
        return list
    