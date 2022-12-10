
drop table User;
drop table AccessRequest;
drop table Role;
drop table UserStatus;


create table AccessRequest(
    AccessRequestId INTEGER NOT NULL PRIMARY KEY,
    UserId INTEGER REFERENCES User,
    RequestDate DATE,
    IsApproved TINYINT        
);

create table Role(
    RoleId INTEGER NOT NULL PRIMARY KEY,
    RoleName VARCHAR(255),
    IsAdmin TINYINT,
    IsCreator TINYINT
);

create table UserStatus(
    StatusId INTEGER NOT NULL PRIMARY KEY,
    Label VARCHAR(50)
);

create table User (
    UserId INTEGER NOT NULL PRIMARY KEY,
    RoleId INTEGER REFERENCES Role,
    StatusId INTEGER REFERENCES UserStatus,
    Email VARCHAR(255) UNIQUE,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    RegisterDate DATE,
    IsDeleted TINYINT
);


drop table Questionnaire;
drop table Answer;
drop table Question;
drop table QuestionCategory;
drop table QuestionChoice;


create table QuestionCategory(
    QuestionCategoryId INTEGER NOT NULL PRIMARY KEY,
    Name VARCHAR(50)
);

create table Question(
    QuestionId INTEGER NOT NULL PRIMARY KEY,
    QuestionCategoryId REFERENCES QuestionCategory,
    Statement TEXT,
    IsDeleted TINYINY
);

create table QuestionChoice(
    QuestionChoiceId INTEGER NOT NULL PRIMARY KEY,
    QuestionId INTEGER REFERENCES Question,
    Label VARCHAR(50),
    OrderNumber INTEGER,
    IsDeleted TINYINT
);

create table Questionnaire(
    QuestionnaireId INTEGER NOT NULL PRIMARY KEY,
    UserId INTEGER REFERENCES User,
    StartDate DATE,
    EndDate DATE,
    TotalNumQs INTEGER,
    NumQsAnswered INTEGER
);

create table Answer(
    AnswerId INTEGER NOT NULL PRIMARY KEY,
    QuestionnaireId INTEGER REFERENCES Questionnaire,
    QuestionId INTEGER REFERENCES Question,
    QuestionChoiceId INTEGER REFERENCES QuestionChoice
);


drop table Recommendation;
drop table AnalysisProfile;
drop table AnalysisClassContent;
drop table Content;
drop table ContentType;
drop table ContentCategory;
drop table AnalysisClass;


create table ContentCategory(
    ContentCategoryId INTEGER NOT NULL PRIMARY KEY,
    Label VARCHAR(50),
    IsMeditation TINYINT,
    IsFocus TINYINT
);

create table ContentType(
    ContentTypeId INTEGER NOT NULL PRIMARY KEY,
    Label VARCHAR(50)
);

create table AnalysisClass(
    AnalysisClassId INTEGER NOT NULL PRIMARY KEY,
    ClassName VARCHAR(50),
    ClassDescription TEXT
);

create table AnalysisProfile(
    AnalysisProfileId INTEGER NOT NULL PRIMARY KEY,
    UserId VARCHAR(32) REFERENCES User,
    QuestionnaireId INTEGER REFERENCES Questionnaire,
    AnalysisClassId INTEGER REFERENCES AnalysisClass,
    ResultExplanation TEXT
);

create table Content(
    ContentId INTEGER NOT NULL PRIMARY KEY,
    ContentCategoryId INTEGER REFERENCES ContentCategory,
    ContentTypeId INTEGER REFERENCES ContentType,
    UserId VARCHAR(32) REFERENCES User,
    Title VARCHAR(255),
    Body TEXT,
    UrlLink VARCHAR(255),
    IsDemoSample TINYINT,
    IsRemoved TINYINT
);

-- Many to many relationship AnalysisClass - Content
create table AnalysisClassContent(
    AnalysisClassId INTEGER NOT NULL REFERENCES AnalysisClass,
    ContentId INTEGER NOT NULL REFERENCES Content,
    PRIMARY KEY(AnalysisClassId, ContentId)
);

create table Recommendation(
    RecommendationId INTEGER NOT NULL PRIMARY KEY,
    AnalysisProfileId INTEGER,
    ContentId INTEGER REFERENCES Content,
    UpVotes INTEGER,
    DownVotes INTEGER
);
