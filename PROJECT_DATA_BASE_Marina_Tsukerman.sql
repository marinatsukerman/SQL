USE master
GO
IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME = 'Ulpan')
    DROP DATABASE Ulpan
GO
CREATE DATABASE Ulpan;
GO
-----------------------------------Work with Data Base Ulpan----------
USE Ulpan;
GO
-------------------------------------Create table Languages-----------------

CREATE TABLE Languages
(NativeLanguage_ID INT IDENTITY(1, 1) PRIMARY KEY, 
 language_name VARCHAR(30) CONSTRAINT lang_name_unq UNIQUE
);
GO

-------------------------------------Create table Hebrew_Levels--------------

CREATE TABLE Hebrew_Levels
(level_ID INT IDENTITY(1, 1) PRIMARY KEY, 
 name_level VARCHAR(10) CONSTRAINT heb_namelv_unq UNIQUE
);
GO

---------------------------------------Create table Teachers-------------------

CREATE TABLE Teachers
(Teacher_ID   INT IDENTITY(1, 1) PRIMARY KEY, 
 first_name   VARCHAR(30) NOT NULL, 
 last_name    VARCHAR(30) NOT NULL, 
 phone_number VARCHAR(20) CONSTRAINT teache_phon_unq UNIQUE, 
 email        VARCHAR(40) CONSTRAINT teach_em_check CHECK(Email LIKE '%@%.%')
                          CONSTRAINT teach_unq UNIQUE, 
 birthdate    DATE, 
 [address]      VARCHAR(300)
);
GO
---------------------------------------Create table groups---------------------

CREATE TABLE Groups
(Group_ID   VARCHAR(10)
 PRIMARY KEY, 
 teacher_ID INT FOREIGN KEY REFERENCES Teachers(Teacher_ID), 
 Level_ID   INT FOREIGN KEY REFERENCES Hebrew_levels(level_ID), 
 startdate  DATE, 
 finishdate DATE, 
 classroom  SMALLINT
);
GO
-------------------------------------Create table discount--------------------

CREATE TABLE Discount
(discount_type INT IDENTITY(1, 1) PRIMARY KEY, 
 discount      REAL CONSTRAINT disc_level CHECK(discount BETWEEN 0 AND 0.5)
                    DEFAULT(0), 
 discount_name VARCHAR(30) NOT NULL
);
GO
-------------------------------------Create table Students--------------------

CREATE TABLE Students
(Student_ID       VARCHAR(15) CONSTRAINT stud_pk PRIMARY KEY, 
 First_name       VARCHAR(30) NOT NULL, 
 Last_name        VARCHAR(30) NOT NULL, 
 BirthDate        DATE, 
 NativeLanguage_I INT FOREIGN KEY REFERENCES Languages(NativeLanguage_ID),
 [address]        VARCHAR(300), 
 phone_number     VARCHAR(20) CONSTRAINT stud_phon_unq UNIQUE, 
 Discount_type    INT FOREIGN KEY REFERENCES Discount(discount_type), 
 email            VARCHAR(40) CONSTRAINT stud_@_check CHECK(Email LIKE '%@%.%')
                              CONSTRAINT stud_unq UNIQUE
);
GO

------------------------------------Create table Orders--------------------
CREATE TABLE Orders
(Order_ID   INT IDENTITY(1, 1) PRIMARY KEY, 
 Student_ID VARCHAR(15) FOREIGN KEY REFERENCES Students(Student_ID), 
 Order_date DATE NOT NULL
                 DEFAULT(GETDATE())
);
GO
-------------------------------------Create table Order_Details------------------------
CREATE TABLE Order_details
(Order_ID      INT FOREIGN KEY REFERENCES Orders(Order_ID), 
 Price         MONEY NOT NULL, 
 discount_type INT FOREIGN KEY REFERENCES Discount(discount_type), 
 Group_ID      VARCHAR(10) FOREIGN KEY REFERENCES Groups(Group_ID), 
 CONSTRAINT od_ordId_grID__pk PRIMARY KEY(Order_ID, Group_ID)
);
GO

-------------------------------------------INSERT LANGUAGES-----------------
INSERT INTO Languages(language_name)
VALUES('Aymara');
INSERT INTO Languages(language_name)
VALUES('Indonesian');
INSERT INTO Languages(language_name)
VALUES('Fijian');
INSERT INTO Languages(language_name)
VALUES('Swati');
INSERT INTO Languages(language_name)
VALUES('Dhivehi');
INSERT INTO Languages(language_name)
VALUES('Burmese');
INSERT INTO Languages(language_name)
VALUES('Azeri');
INSERT INTO Languages(language_name)
VALUES('Telugu');
INSERT INTO Languages(language_name)
VALUES('Tswana');
INSERT INTO Languages(language_name)
VALUES('Moldovan');

GO
--Insert Hebrew_Levels------
INSERT INTO Hebrew_Levels(name_level)
VALUES
('Alef'), 
 ('Beit'), 
 ('Guimel'), 
 ('Dalet'), 
 ('Hey'), 
 ('Vav');

GO
 -------------------------------------------INSERT TEACHERS-------------------------
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Ephrem', 
 'Oganesian', 
 '9735444751', 
 'eoganesian0@facebook.com', 
 '2002-03-05 16:02:05', 
 '0 Scott Parkway'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Ive', 
 'Montgomery', 
 '8262025936', 
 'imontgomery1@pinterest.com', 
 '1971-05-09 07:05:01', 
 '758 Fieldstone Center'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Roman', 
 'Attwoull', 
 '1031605167', 
 'rattwoull2@europa.eu', 
 '1981-01-05 11:45:04', 
 '3 Declaration Terrace'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Daven', 
 'Lawlance', 
 '1962784149', 
 'dlawlance3@shutterfly.com', 
 '1923-11-19 02:35:30', 
 '1 Monica Parkway'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Emmett', 
 'Lionel', 
 '2285188826', 
 'elionel4@biglobe.ne.jp', 
 '1970-02-08 23:52:46', 
 '1 Red Cloud Junction'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Robinet', 
 'Willett', 
 '7713568847', 
 'rwillett5@nasa.gov', 
 '1997-12-28 00:25:23', 
 '4817 Pine View Drive'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Derron', 
 'Daviot', 
 '7338809333', 
 'ddaviot6@liveinternet.ru', 
 '1924-11-17 10:35:41', 
 '62 Bultman Drive'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Nigel', 
 'Greydon', 
 '9995886771', 
 'ngreydon7@abc.net.au', 
 '1966-04-19 00:13:39', 
 '55 Pennsylvania Way'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Portie', 
 'MacDougal', 
 '2892288948', 
 'pmacdougal8@dailymail.co.uk', 
 '1956-06-23 03:56:15', 
 '58 Autumn Leaf Drive'
);
INSERT INTO Teachers
(first_name, 
 last_name, 
 phone_number, 
 email, 
 birthdate, 
 [address]
)
VALUES
('Davidson', 
 'Joiris', 
 '3399717490', 
 'djoiris9@artisteer.com', 
 '1984-06-06 18:27:18', 
 '831 Randy Trail'
);
GO
------------------------------------------------INSERT GROUPS--------------------

INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(1, 
 1, 
 1, 
 '2020-05-03 17:08:04', 
 '2020-01-17 02:57:52', 
 11
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(2, 
 2, 
 1, 
 '2020-09-15 02:20:54', 
 '2020-10-08 14:47:46', 
 23
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(3, 
 3, 
 2, 
 '2020-04-17 21:50:23', 
 '2020-11-12 20:52:46', 
 34
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(4, 
 4, 
 2, 
 '2020-09-14 05:48:02', 
 '2020-05-29 01:05:52', 
 43
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(5, 
 5, 
 3, 
 '2020-09-22 14:59:31', 
 '2020-02-13 17:01:49', 
 54
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(6, 
 6, 
 3, 
 '2020-07-31 02:25:37', 
 '2020-11-10 17:01:01', 
 65
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(7, 
 7, 
 4, 
 '2020-02-16 17:14:37', 
 '2020-11-18 22:24:27', 
 74
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(8, 
 8, 
 3, 
 '2020-11-14 15:43:08', 
 '2020-02-10 19:15:20', 
 82
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(9, 
 9, 
 5, 
 '2020-08-18 19:04:19', 
 '2019-12-16 09:19:19', 
 93
);
INSERT INTO Groups
(Group_ID, 
 teacher_ID, 
 Level_ID, 
 startdate, 
 finishdate, 
 classroom
)
VALUES
(10, 
 10, 
 6, 
 '2020-03-10 16:37:51', 
 '2020-04-06 02:52:34', 
 10
);

----------------------------------------INSERT DISCOUNT------------------------------
INSERT INTO Discount
(discount, 
 discount_name
)
VALUES
(0, 
 'Public'
),
(0.5, 
 'New Immigrant'
),
(0.25, 
 'Premium'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('374288219', 
 'Carie', 
 'Libbie', 
 '2020-09-21 04:25:43', 
 1, 
 '04 Victoria Parkway', 
 '3723841122', 
 1, 
 'clibbie0@bloglines.com'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('676339591', 
 'Townsend', 
 'Rhodef', 
 '2020-05-27 22:25:31', 
 2, 
 '75 Columbus Street', 
 '9726217078', 
 2, 
 'trhodef1@washingtonpost.com'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('491720949', 
 'Prinz', 
 'Boichat', 
 '2020-03-12 02:38:19', 
 3, 
 '1303 Towne Alley', 
 '9213473948', 
 2, 
 'pboichat2@accuweather.com'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('353884417', 
 'Moise', 
 'Allflatt', 
 '2020-09-27 02:46:33', 
 3, 
 '27281 Michigan Way', 
 '5163167687', 
 2, 
 'mallflatt3@paypal.com'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('503879254', 
 'Morissa', 
 'Brave', 
 '2020-03-23 11:34:12', 
 4, 
 '1 Northridge Parkway', 
 '9909904521', 
 2, 
 'mbrave4@ibm.com'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('561003945', 
 'Rikki', 
 'Beach', 
 '2020-02-29 16:17:51', 
 4, 
 '06196 Cherokee Plaza', 
 '8878097987', 
 1, 
 'rbeach5@wordpress.org'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('357526353', 
 'Scottie', 
 'Hyslop', 
 '2020-02-29 00:01:42', 
 6, 
 '87 Jenifer Park', 
 '2122635117', 
 3, 
 'shyslop6@51.la'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('300964903', 
 'Aimee', 
 'Trigwell', 
 '2020-05-27 00:23:35', 
 8, 
 '41 Sutteridge Junction', 
 '7821227241', 
 1, 
 'atrigwell7@spotify.com'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('510017793', 
 'Pam', 
 'Andrez', 
 '2020-08-15 08:29:32', 
 9, 
 '14915 Lindbergh Center', 
 '9436709192', 
 2, 
 'pandrez8@cdbaby.com'
);
INSERT INTO Students
(Student_ID, 
 First_name, 
 Last_name, 
 BirthDate, 
 NativeLanguage_I, 
 [address], 
 phone_number, 
 Discount_type, 
 email
)
VALUES
('357397118', 
 'Connie', 
 'Gainsburgh', 
 '2020-04-09 23:39:59', 
 10, 
 '27093 Scoville Circle', 
 '9952037943', 
 2, 
 'cgainsburgh9@opensource.org'
);

---------------------------------------------INSERT ORDERS---------------------------
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('374288219', 
 '2020-07-08 07:47:09'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('676339591', 
 '2020-11-22 17:07:23'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('491720949', 
 '2020-02-20 13:23:26'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('353884417', 
 '2019-12-07 07:08:23'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('503879254', 
 '2020-01-22 17:44:37'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('561003945', 
 '2020-05-17 08:46:03'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('357526353', 
 '2020-09-11 03:48:36'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('300964903', 
 '2020-09-28 23:01:12'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('510017793', 
 '2019-12-22 06:40:45'
);
INSERT INTO Orders
(Student_ID, 
 Order_date
)
VALUES
('357397118', 
 '2020-11-02 03:41:38'
);

---------------------------------------------INSERT ORDER_DETAILS---------------------------------

INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(1, 
 '7500.00', 
 1, 
 1
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(2, 
 '7500.00', 
 2, 
 1
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(3, 
 '7500.00', 
 2, 
 1
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(4, 
 '7500.00', 
 2, 
 2
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(5, 
 '7500.00', 
 2, 
 2
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(6, 
 '7500.00', 
 1, 
 2
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(7, 
 '7500.00', 
 3, 
 3
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(8, 
 '7500.00', 
 1, 
 3
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(9, 
 '7500.00', 
 2, 
 3
);
INSERT INTO Order_details
(Order_ID, 
 Price, 
 discount_type, 
 Group_ID
)
VALUES
(10, 
 '7500.00', 
 2, 
 4
);
