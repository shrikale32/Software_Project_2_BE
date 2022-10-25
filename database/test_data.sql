delete from Content;
delete from ContentCategory;
delete from ContentType;

delete from User;
delete from Role;
delete from UserStatus;

-- ROLE
insert into Role(RoleId,RoleName,IsAdmin,IsCreator) values (1, 'Admin', true, false);
insert into Role(RoleId,RoleName,IsAdmin,IsCreator) values (2, 'Content Creator', false, true);
insert into Role(RoleId,RoleName,IsAdmin,IsCreator) values (3, 'Registered User', false, false);

-- USER STATUS
insert into UserStatus (StatusId,Label) values (1, 'Active');
insert into UserStatus (StatusId,Label) values (2, 'Inactive');
insert into UserStatus (StatusId,Label) values (3, 'AccessRequested');
insert into UserStatus (StatusId,Label) values (4, 'Preregistered');

-- USERS
insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('1', 2, 1,
                     'spate960@my.centennialcollege.ca','Spandan','Patel',
                     '2022-10-01',
                     false
                 );
                 
insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('2', 2, 1,
                     'skale5@my.centennialcollege.ca','Shrikant','Kale',
                     '2022-10-01',
                     false
                 );
                 
insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('3', 2, 1,
                     'nromerol@my.centennialcollege.ca','Nestor','Romero',
                     '2022-10-02',
                     false
                 );
             
insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('4', 2, 1,
                     'djohar@my.centennialcollege.ca','Divyanshu','Johar',
                     '2022-10-02',
                     false
                 );
                 
insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('5', 2, 1,
                     'dshah163@my.centennialcollege.ca','Devanshi','Shah',
                     '2022-10-03',
                     false
                 );

insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('6', 3, 1,
                     'scoelho5@my.centennialcollege.ca','Shawn','Coelho',
                     '2022-10-03',
                     false
                 );

insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('7', 3, 1,
                     'sbindal1@my.centennialcollege.ca','Samridhi','Bindal',
                     '2022-10-04',
                     false
                 );

insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('8', 3, 1,
                     'jjohanmo@my.centennialcollege.ca','Jefil','John Mohan',
                     '2022-10-04',
                     false
                 );

insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('9', 3, 1,
                     'hdharma1@my.centennialcollege.ca','Hitesh','Dharmadhikari',
                     '2022-10-05',
                     false
                 );                                       

insert into User (UserId,RoleId,StatusId,Email,FirstName,LastName,RegisterDate,IsDeleted)
                 values ('10', 1, 1,
                     'admin@my.centennialcollege.ca','System','Administrator',
                     '2022-10-10',
                     false
                 );
                 
-- CONTENT CATEGORY
insert into ContentCategory (ContentCategoryId, Label, IsMeditation, IsFocus) values (1, 'Mindfulness', true, false);
insert into ContentCategory (ContentCategoryId, Label, IsMeditation, IsFocus) values (2, 'Focused Meditation', true, false);
insert into ContentCategory (ContentCategoryId, Label, IsMeditation, IsFocus) values (3, 'Visualization Meditation', true, false);

insert into ContentCategory (ContentCategoryId, Label, IsMeditation, IsFocus) values (4, 'Inner Focus', false, true);
insert into ContentCategory (ContentCategoryId, Label, IsMeditation, IsFocus) values (5, 'Outer Focus', false, true);

-- CONTENT TYPE
insert into ContentType (ContentTypeId, Label) values (1, 'Video');
insert into ContentType (ContentTypeId, Label) values (2, 'Audio');
insert into ContentType (ContentTypeId, Label) values (3, 'Blog');

-- CONTENT
insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (1, 1, 1, '10', 
'What is mindfulness', 
'Mindfulness expert Dr. Jon Kabat-Zinn defines "What is mindfulness?" and discusses the hard work and rewards of practicing mindfulness', 
'https://www.youtube.com/watch?v=HmEo6RI4Wvs', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (2, 2, 1, '10', 
'How to Enhance Your Focus | Sadhguru', 
'Sadhguru differentiates between focus and attention, and how the key to success is to heighten attention and make the mind like a mirror that sees everything as it is', 
'https://www.youtube.com/watch?v=uLCsX_aVZRg', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (3, 3, 1, '10', 
'Guided visualization to calm your mind', 
'In this short meditation session, Sal introduces a simple visualization technique to help you separate yourself from your thoughts and quiet them', 
'https://www.youtube.com/watch?v=ZEYuSRHgmCg', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (4, 4, 1, '10', 
'The art of focus – a crucial ability | Christina Bengtsson | TEDxGöteborg', 
'How do you bring out the best in yourself? According to Christina Bengtsson – Swedish world champion in precision shooting – the answer lies in the word “focus”', 
'https://www.youtube.com/watch?v=xF80HzqvAoA', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (5, 5, 1, '10', 
'How to Get Your Brain to Focus | Chris Bailey | TEDxManchester', 
'The latest research is clear: the state of our attention determines the state of our lives. So how do we harness our attention to focus deeper, get distracted less, and even become more creative?', 
'https://www.youtube.com/watch?v=Hu4Yvq-g7_Y', false, false );

-- QUESTION CATEGORY
insert into QuestionCategory (QuestionCategoryId, Name) values (1, 'Demographics');
insert into QuestionCategory (QuestionCategoryId, Name) values (2, 'Focus Levels');
insert into QuestionCategory (QuestionCategoryId, Name) values (3, 'Stress Levels');

-- QUESTION + CHOICE
insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (1, 1, 'What is your age range?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (11, 1, '18-25', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (12, 1, '26-30', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (13, 1, '31-35', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (14, 1, '>35', 4, false);

insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (2, 2, 'How much time can you study without breaks? (minutes)', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (21, 2, '<10', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (22, 2, '10-30', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (23, 2, '31-60', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (24, 2, '>60', 4, false);

insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (3, 3, 'How often do you feel stressed?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (31, 3, 'Always', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (32, 3, 'Often', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (33, 3, 'Occasionally', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (34, 3, 'Never', 4, false);