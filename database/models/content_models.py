import json
from sqlalchemy import Column, Integer, String, ForeignKey, Table, Boolean
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class ContentCategory(Base):
    __tablename__ = "ContentCategory"
    ContentCategoryId = Column(Integer, primary_key=True)
    Label = Column(String)
    IsMeditation = Column(Boolean)
    IsFocus = Column(Boolean)
    
    def __str__(self):
        o = {}
        o['ContentCategoryId'] = self.ContentCategoryId
        o['Label'] = self.Label
        o['IsMeditation'] = self.IsMeditation
        o['IsFocus'] = self.IsFocus
        return json.dumps(o)

class ContentType(Base):
    __tablename__ = "ContentType"
    ContentTypeId = Column(Integer, primary_key=True)
    Label = Column(String)
    
    def __str__(self):
        o = {}
        o['ContentTypeId'] = self.ContentTypeId
        o['Label'] = self.Label
        return json.dumps(o)
    
class Content(Base):
    __tablename__ = "Content"
    ContentId = Column(Integer, primary_key=True)
    ContentCategoryId = Column(Integer, ForeignKey("ContentCategory.ContentCategoryId"))
    ContentTypeId = Column(Integer, ForeignKey("ContentType.ContentTypeId"))
    UserId = Column(String)
    Title = Column(String)
    Body = Column(String)
    UrlLink = Column(String)
    IsDemoSample = Column(Boolean)
    IsRemoved = Column(Boolean)
    
    def __str__(self):
        o = {}
        o['ContentId'] = self.ContentId
        o['ContentCategoryId'] = self.ContentCategoryId
        o['ContentTypeId'] = self.ContentTypeId
        o['UserId'] = self.UserId
        o['Title'] = self.Title
        o['Body'] = self.Body
        o['UrlLink'] = self.UrlLink
        o['IsDemoSample'] = self.IsDemoSample
        o['IsRemoved'] = self.IsRemoved
        return json.dumps(o)
        