import json
from sqlalchemy import Column, ForeignKey, Identity
from sqlalchemy import Integer, String, Boolean, Date
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class UserStatus(Base):
    __tablename__ = "UserStatus"
    StatusId = Column(Integer, primary_key=True)
    Label = Column(String)
    
    def toObjDict(self):
        o = {}
        o['StatusId'] = self.StatusId
        o['Label'] = self.Label
        return o
    
  
class Role(Base):
    __tablename__ = "Role"
    RoleId = Column(Integer, primary_key=True)
    RoleName = Column(String)
    IsAdmin = Column(Boolean)
    IsCreator = Column(Boolean)
    
    def toObjDict(self):
        o = {}
        o['RoleId'] = self.RoleId
        o['RoleName'] = self.RoleName
        o['IsAdmin'] = self.IsAdmin
        o['IsCreator'] = self.IsCreator
        return o


class User(Base):
    __tablename__ = "User"
    UserId = Column(Integer, primary_key=True)
    RoleId = Column(Integer, ForeignKey("Role.RoleId"))
    StatusId = Column(Integer, ForeignKey("UserStatus.StatusId"))
    Email = Column(String)
    FirstName = Column(String)
    LastName = Column(String)
    RegisterDate = Column(Date)
    IsDeleted = Column(Boolean)

    def toObjDict(self):
        o = {}
        o['UserId'] = self.UserId
        o['RoleId'] = self.RoleId
        o['StatusId'] = self.StatusId
        o['Email'] = self.Email
        o['FirstName'] = self.FirstName
        o['LastName'] = self.LastName
        o['RegisterDate'] = self.RegisterDate.strftime("%Y-%m-%d")
        o['IsDeleted'] = self.IsDeleted
        return o