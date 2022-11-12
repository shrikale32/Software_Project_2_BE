import json
from sqlalchemy import Column, ForeignKey, Identity
from sqlalchemy import Integer, String, Boolean, Date
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class QuestionCategory(Base):
    __tablename__ = "QuestionCategory"
    QuestionCategoryId = Column(Integer, primary_key=True)
    Name = Column(String)
    
    def toObjDict(self):
        o = {}
        o['QuestionCategoryId'] = self.QuestionCategoryId
        o['Name'] = self.Name
        return o
    
class Question(Base):
    __tablename__ = "Question"
    QuestionId = Column( Integer, Identity(always=True, start=1, increment=1), primary_key=True) 
    QuestionCategoryId = Column(Integer, ForeignKey("QuestionCategory.QuestionCategoryId"))
    Statement = Column(String)
    IsDeleted = Column(Boolean)
    
    QuestionCategory = relationship("QuestionCategory", backref=backref("Question"), lazy="subquery")
    QuestionChoices = relationship("QuestionChoice", backref=backref("Question"), lazy="subquery")
    
    def toObjDict(self, loadRelationships = True):
        o = {}
        o['QuestionId'] = self.QuestionId
        o['QuestionCategoryId'] = self.QuestionCategoryId
        o['Statement'] = self.Statement
        o['IsDeleted'] = self.IsDeleted
        
        # Load relationships
        if loadRelationships : 
            if self.QuestionCategory is not None:
                o['QuestionCategory'] = self.QuestionCategory.toObjDict()
            
            if self.QuestionChoices is not None:
                o['QuestionChoices'] = [c.toObjDict() for c in self.QuestionChoices]
        
        return o
    
class QuestionChoice(Base):
    __tablename__ = "QuestionChoice"
    QuestionChoiceId = Column(Integer, primary_key=True)
    QuestionId = Column(Integer, ForeignKey("Question.QuestionId"))
    Label = Column(String)
    OrderNumber = Column(Integer)
    IsDeleted = Column(Boolean)
    
    def toObjDict(self):
        o = {}
        o['QuestionChoiceId'] = self.QuestionChoiceId
        o['QuestionId'] = self.QuestionId
        o['Label'] = self.Label
        o['OrderNumber'] = self.OrderNumber
        o['IsDeleted'] = self.IsDeleted
        return o

class Questionnaire(Base):
    __tablename__ = "Questionnaire"
    QuestionnaireId = Column(Integer, primary_key=True)
    UserId = Column(String)
    StartDate = Column(Date)
    EndDate = Column(Date)
    TotalNumQs = Column(Integer)
    NumQsAnswered = Column(Integer)
    
    def toObjDict(self):
        o = {}
        o['QuestionnaireId'] = self.QuestionnaireId
        o['UserId'] = self.UserId
        o['StartDate'] = self.StartDate
        o['EndDate'] = self.EndDate
        o['TotalNumQs'] = self.TotalNumQs
        o['NumQsAnswered'] = self.NumQsAnswered
        return o