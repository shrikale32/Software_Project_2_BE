delete from QuestionChoice;
delete from Question;
delete from QuestionCategory;

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

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (6, 1, 1, '10', 
'How mindfulness changes the emotional life of our brains | Richard J. Davidson | TEDxSanFrancisco', 
'Mindfulness is crucial for emotional well-being. Explore how mindfulness can change the emotional life of our brains.', 
'https://www.youtube.com/watch?v=7CBfCW67xT8', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (7, 1, 1, '10', 
'How mindfulness changes the emotional life of our brains | Richard J. Davidson | TEDxSanFrancisco', 
'Mindfulness is crucial for emotional well-being. Explore how mindfulness can change the emotional life of our brains.', 
'https://www.youtube.com/watch?v=7CBfCW67xT8', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (8, 1, 1, '10', 
'Self-Transformation Through Mindfulness | Dr. David Vago | TEDxNashville', 
'How is the Self represented in the brain and how is it sculpted through our everyday moment-to-moment perceptions, emotions, and thoughts? Cognitive Neuroscientist, David Vago demonstrates that a systematic form of mental training involving meditation and mindful awareness has the potential to transform our self and our mental habits in a positive way.', 
'https://www.youtube.com/watch?v=1nP5oedmzkM', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (9, 1, 1, '10', 
'30 seconds to mindfulness | Phil Boissiere | TEDxNaperville', 
'Can you go from feeling stressed to calm in under 30 seconds? Phil Boissiere shares his simple technique to bring mindfulness to your busy life, any time, anywhere', 
'https://www.youtube.com/watch?v=ad7HqXEc2Sc', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (10, 2, 1, '10', 
'Mindfulness Guided Meditation for Focus', 
'10 minute guided meditation for increasing your focus.  Sometimes focusing for 30 seconds at the time can feel like a challenge, but using mindful awareness of one topic at a time can help you flex that focus muscle more comfortably.', 
'https://www.youtube.com/watch?v=MtmrmEp40C8', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (11, 2, 1, '10', 
'10 Minute Guided Meditation for Focused Attention and Concentration (No Music, Voice Only)', 
'Looking to improve your focus for work or school? Try this simple mindfulness practice that will help you increase your focused attention and concentration.', 
'https://www.youtube.com/watch?v=vBO8QEjANjs', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (12, 2, 1, '10', 
'Guided Mindfulness Meditation on Presence and Focus - 5 Minutes', 
'Use this short and quick 5 minute guided mindfulness meditation to help you overcome social anxiety and find presence and focus with the people you interact with each day. Learn the healing power of guided meditation!', 
'https://www.youtube.com/watch?v=g95eloerZmw', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (13, 3, 1, '10', 
'DEEP RELAXATION: Guided 10 Minute Visualisation Meditation', 
'In this Meditation you can enjoy supreme deep relaxation and serenity. Effortlessly achieve immense calmness through the gentle guiding voice and the exquisite music of Christopher Lloyd Clarke ', 
'https://www.youtube.com/watch?v=GZiXPBGxKSE', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (14, 3, 1, '10', 
'How To Manifest Anything! Visualize What You Want (POWERFUL GUIDED MEDITATION!)', 
'How To Manifest Anything! Visualize What You Want and Make It Your Reality! POWERFUL GUIDED MEDITATION!', 
'https://www.youtube.com/watch?v=FTuqv2fYbGc', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (15, 3, 1, '10', 
'Guided visualization to calm your mind', 
'In this short meditation session, Sal introduces a simple visualization technique to help you separate yourself from your thoughts and quiet them. ', 
'https://www.youtube.com/watch?v=ZEYuSRHgmCg', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (16, 4, 1, '10', 
'The art of focus – a crucial ability | Christina Bengtsson | TEDxGöteborg', 
'How do you bring out the best in yourself? According to Christina Bengtsson - Swedish world champion in precision shooting – the answer lies in the word focus.', 
'https://www.youtube.com/watch?v=xF80HzqvAoA', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (17, 4, 1, '10', 
'Unwavering Focus | Dandapani | TEDxReno', 
'We become good at what we practice and most of us are experts at practicing distraction. We live in a society that trains us to multi-task and jump from one thing to another in an uncontrolled way. The great panacea for a world plagued by distraction is learning and practicing the art of concentration. Living as a Hindu monk for 10 years Dandapani was trained in understanding the mind. There he learned and practiced the fine art of bringing concentration into everyday life.  In this talk, Dandapani will share spiritual tools to learn to create unwavering focus in our lives and the boundless benefits that result from it.', 
'https://www.youtube.com/watch?v=4O2JK_94g3Y', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (18, 4, 1, '10', 
'What Makes Some Brains More Focused Than Others? | Marvin Chun | TEDxKFAS', 
'Faced with overwhelming amounts of information and an increasing need to multitask, how can our brains focus on important tasks and avoid distractions? Cognitive neuroscience researcher Dr. Marvin Myungwoo Chun discusses why some people more attentive than others, allowing them to perform better at school, sports, and in the workplace. He also reveals the difference in our brains that explain superior performance, and gives tips on how to enhance our focus.', 
'https://www.youtube.com/watch?v=aoRHq0TQnZM', false, false );


insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (19, 5, 1, '10', 
'From Inner to Outer Focus Meditation │ Mansi Mahajan', 
'Learn a candle gazing meditation, known as Trataka, to activate focus and promote natural stress relief. Mansi Mahajan guides this ancient and powerful practice where you’ll journey from the outer world to your inner world.', 
'https://www.youtube.com/watch?v=zkp-5i-AKBQ', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (20, 5, 1, '10', 
'The Power of Focus | Sean Brawley | TEDxFergusonLibrary', 
'Sean uses a tennis ball as a metaphor to show us how to apply the power of focus to our work and life.  Sean Brawley has dedicated the past 25 years to helping clients unlock their potential and elevate their performance in sports and business.', 
'https://www.youtube.com/watch?v=-QkHv7pKHBc', false, false );

insert into Content (ContentId, ContentCategoryId, ContentTypeId, UserId, Title, Body, UrlLink, IsDemoSample, IsRemoved) 
values (21, 5, 1, '10', 
'How to Regain Focus in the Age of Social Media? | Ashkhen Petrosyan | TEDxMoskovyanStSalon', 
'The most important resources we lack in the age of social media are time and focus.', 
'https://www.youtube.com/watch?v=5PQOxrqQG5w', false, false );



-- QUESTION CATEGORY
insert into QuestionCategory (QuestionCategoryId, Name) values (1, 'Demographics');
insert into QuestionCategory (QuestionCategoryId, Name) values (2, 'Focus Levels');
insert into QuestionCategory (QuestionCategoryId, Name) values (3, 'Stress Levels');

-- QUESTION + CHOICE
insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (1, 3, 'How confident are you of being able to control your emotions in stressful situations?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (11, 1, 'I never let my emotions run away me.', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (12, 1, 'I seldom let my emotions run away with me', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (13, 1, 'I sometimes let my emotions run away with me', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (14, 1, 'I often let my emotions run away with me', 4, false);


-- QUESTION + CHOICE
insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (2, 3, 'In the last month, how often have you been upset because of something that happened unexpectedly?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (21, 2, 'never', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (22, 2, 'almost never', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (23, 2, 'sometimes', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (24, 2, 'often', 4, false);

-- QUESTION + CHOICE
insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (3, 3, 'When highly stressed, how capable are you of changing your thinking to calm down?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (31, 3, 'very capable', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (32, 3, 'capable', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (33, 3, 'incapable', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (34, 3, 'very incapable', 4, false);

-- QUESTION + CHOICE
insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (4, 3, 'To what extent are you aware of practical, healthy ways of relaxing?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (41, 4, 'to a very great extent', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (42, 4, 'to some extent', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (43, 4, 'to little extent', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (44, 4, 'to very little extent', 4, false);

-- QUESTION + CHOICE
insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (5, 2, 'How often do you have difficulty focusing on work?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (51, 5, 'never', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (52, 5, 'almost never', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (53, 5, 'sometimes', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (54, 5, 'often', 4, false);


-- QUESTION + CHOICE
insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (6, 2, 'When distracted, to what extent are you able to bring yourself to focus again quickly?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (61, 6, 'to a very great extent', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (62, 6, 'to some extent', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (63, 6, 'to little extent', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (64, 6, 'to very little extent', 4, false);


-- QUESTION + CHOICE
insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (7, 1, 'What is your age range?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (71, 7, '18-25', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (72, 7, '26-30', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (73, 7, '31-35', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (74, 7, '>35', 4, false);

insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (8, 2, 'How much time can you study without breaks? (minutes)', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (81, 8, '<10', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (82, 8, '10-30', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (83, 8, '31-60', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (84, 8, '>60', 4, false);

insert into Question (QuestionId, QuestionCategoryId, Statement, IsDeleted) values (9, 3, 'How often do you feel stressed?', false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (91, 9, 'Always', 1, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (92, 9, 'Often', 2, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (93, 9, 'Occasionally', 3, false);
insert into QuestionChoice (QuestionChoiceId, QuestionId, Label, OrderNumber, IsDeleted) values (94, 9, 'Never', 4, false);