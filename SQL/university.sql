CREATE DATABASE UNIVERSITY
CREATE TABLE Department(
Department_Code INT PRIMARY KEY,
Department_Name VARCHAR(20) NOT NULL UNIQUE  ,
Office_Number INT ,
Office_Phone INT ,
College VARCHAR(50)
)
------STUDENT--------
CREATE TABLE Student (
Student_ID  INT PRIMARY KEY ,
SSN INT NOT NULL UNIQUE ,
Student_Name VARCHAR(20) NOT NULL ,
Sex VARCHAR(20) CHECK (Sex IN('Male','Female')),
Study_Year INT,
Birth_DATE DATE,
City VARCHAR(20),
State VARCHAR(20),
ZIP_Code VARCHAR(20),
Current_Add VARCHAR(50),
current_Phone VARCHAR(20) ,
Permanent_Add VARCHAR(50),
Permanent_Phone VARCHAR(20),
Department_Code INT,
FOREIGN KEY(Department_Code) REFERENCES Department(Department_Code)
)
------COURSE-------
CREATE TABLE Course(
Course_Number INT PRIMARY KEY ,
Course_Name VARCHAR(20),
Description VARCHAR(50),
Semester VARCHAR(20),
Department_Code INT,
FOREIGN KEY(Department_Code) REFERENCES Department(Department_Code)
)
-----INSTRUCTOR-----
CREATE TABLE Instructor(
Instructor_ID INT PRIMARY KEY ,
Instructor_Name VARCHAR(20) NOT NULL,
Salary INT ,
Department_Code INT,
FOREIGN KEY(Department_Code) REFERENCES Department(Department_Code)
)
-------SECTION-----
CREATE TABLE Section(
Section_Number  INT ,
Course_Number INT,
Semester VARCHAR(20) ,
YEAR INT,
PRIMARY KEY(Section_Number ,Course_Number ,Semester,YEAR ),
Instructor_ID INT,
FOREIGN KEY(Instructor_ID) REFERENCES Instructor(Instructor_ID),
FOREIGN KEY(Course_Number) REFERENCES Course(Course_Number)
)
------Registration----
CREATE TABLE Registration(
Student_ID  INT,
Course_Number INT,
Section_Number  INT,
Semester VARCHAR(20) ,
YEAR INT,
PRIMARY KEY(Student_ID,Section_Number ,Course_Number ,Semester,YEAR ),
FOREIGN KEY(Student_ID) REFERENCES Student(Student_ID),
FOREIGN KEY(Section_Number ,Course_Number ,Semester,YEAR) REFERENCES Section(Section_Number ,Course_Number ,Semester,YEAR)
)
-----ALTER-----
ALTER TABLE Department
ALTER COLUMN Department_Name VARCHAR(50)
------
ALTER TABLE Course
ALTER COLUMN Course_Name VARCHAR(50)
--------------------------------------------------------
----INSERT------
INSERT INTO Department
(Department_Code, Department_Name, Office_Number, Office_Phone, College)
VALUES
(101, 'Computer Science', 101, 2012345678, 'Computing'),
(102, 'Information Systems', 102, 2012345679, 'Computing'),
(103, 'Information Technology', 103, 2012345680, 'Computing'),
(104, 'Statistics', 104, 2012345681, 'Science'),
(105, 'Mathematics', 105, 2012345682, 'Science'),
(106, 'Physics', 106, 2012345683, 'Science'),
(107, 'Chemistry', 107, 2012345684, 'Science'),
(108, 'Biology', 108, 2012345685, 'Science'),
(109, 'Accounting', 109, 2012345686, 'Commerce'),
(110, 'Finance', 110, 2012345687, 'Commerce'),
(111, 'Marketing', 111, 2012345688, 'Commerce'),
(112, 'Economics', 112, 2012345689, 'Commerce'),
(113, 'Mechanical Engineering', 113, 2012345690, 'Engineering'),
(114, 'Civil Engineering', 114, 2012345691, 'Engineering'),
(115, 'Electrical Engineering', 115, 2012345692, 'Engineering'),
(116, 'Architecture', 116, 2012345693, 'Engineering'),
(117, 'Pharmacy', 117, 2012345694, 'Medicine'),
(118, 'Medicine', 118, 2012345695, 'Medicine'),
(119, 'Nursing', 119, 2012345696, 'Medicine'),
(120, 'Dentistry', 120, 2012345697, 'Medicine');
SELECT*
FROM Department

----------------------------------------------
INSERT INTO Student
(Student_ID, SSN, Student_Name, Sex, Study_Year, Birth_DATE,
 City, State, ZIP_Code, Current_Add, current_Phone,
 Permanent_Add, Permanent_Phone, Department_Code)
VALUES
(1, 30010001, 'Ahmed Ali', 'Male', 1, '2005-01-15',
 'Cairo', 'Cairo', '11511', 'Nasr City', '01010000001',
 'Nasr City', '01010000001', 101),

(2, 30010002, 'Mona Hassan', 'Female', 2, '2004-03-20',
 'Giza', 'Giza', '12511', 'Dokki', '01010000002',
 'Faisal', '01010000012', 102),

(3, 30010003, 'Omar Mohamed', 'Male', 3, '2003-07-10',
 'Cairo', 'Cairo', '11765', 'Heliopolis', '01010000003',
 'Heliopolis', '01010000013', 101),

(4, 30010004, 'Sara Ahmed', 'Female', 1, '2005-11-05',
 'Giza', 'Giza', '12611', 'Haram', '01010000004',
 'Haram', '01010000014', 103),

(5, 30010005, 'Youssef Samir', 'Male', 4, '2002-09-12',
 'Cairo', 'Cairo', '11835', 'Maadi', '01010000005',
 'Maadi', '01010000015', 104),

(6, 30010006, 'Nour Khaled', 'Female', 2, '2004-02-18',
 'Giza', 'Giza', '12521', 'Agouza', '01010000006',
 'Agouza', '01010000016', 105),

(7, 30010007, 'Karim Adel', 'Male', 3, '2003-05-22',
 'Cairo', 'Cairo', '11728', 'Shorouk', '01010000007',
 'Shorouk', '01010000017', 101),

(8, 30010008, 'Laila Tarek', 'Female', 4, '2002-12-30',
 'Cairo', 'Cairo', '11311', 'Nasr City', '01010000008',
 'Nasr City', '01010000018', 106),

(9, 30010009, 'Mahmoud Adel', 'Male', 1, '2005-04-14',
 'Giza', 'Giza', '12612', 'Faisal', '01010000009',
 'Faisal', '01010000019', 107),

(10, 30010010, 'Hana Mostafa', 'Female', 2, '2004-08-25',
 'Cairo', 'Cairo', '11562', 'New Cairo', '01010000010',
 'New Cairo', '01010000020', 102),

(11, 30010011, 'Ali Hany', 'Male', 3, '2003-10-17',
 'Cairo', 'Cairo', '11865', 'Maadi', '01010000011',
 'Maadi', '01010000021', 103),

(12, 30010012, 'Salma Wael', 'Female', 4, '2002-06-09',
 'Giza', 'Giza', '12531', 'Dokki', '01010000022',
 'Dokki', '01010000032', 104),

(13, 30010013, 'Mostafa Ashraf', 'Male', 1, '2005-01-28',
 'Cairo', 'Cairo', '11711', 'Heliopolis', '01010000023',
 'Heliopolis', '01010000033', 105),

(14, 30010014, 'Mai Ibrahim', 'Female', 2, '2004-05-19',
 'Giza', 'Giza', '12621', 'Haram', '01010000024',
 'Haram', '01010000034', 106),

(15, 30010015, 'Khaled Nabil', 'Male', 3, '2003-03-11',
 'Cairo', 'Cairo', '11571', 'Nasr City', '01010000025',
 'Nasr City', '01010000035', 107),

(16, 30010016, 'Dina Sameh', 'Female', 4, '2002-07-07',
 'Cairo', 'Cairo', '11821', 'Maadi', '01010000026',
 'Maadi', '01010000036', 108),

(17, 30010017, 'Hassan Ehab', 'Male', 1, '2005-09-23',
 'Giza', 'Giza', '12541', 'Agouza', '01010000027',
 'Agouza', '01010000037', 109),

(18, 30010018, 'Reem Hossam', 'Female', 2, '2004-11-13',
 'Cairo', 'Cairo', '11731', 'New Cairo', '01010000028',
 'New Cairo', '01010000038', 110),

(19, 30010019, 'Adam Sherif', 'Male', 3, '2003-12-01',
 'Giza', 'Giza', '12631', 'Dokki', '01010000029',
 'Dokki', '01010000039', 101),

(20, 30010020, 'Jana Amr', 'Female', 4, '2002-02-26',
 'Cairo', 'Cairo', '11581', 'Heliopolis', '01010000030',
 'Heliopolis', '01010000040', 102);
 SELECT * 
 FROM Student
 -----------------------------------
 INSERT INTO Instructor
(Instructor_ID, Instructor_Name, Salary, Department_Code)
VALUES
(1, 'Ahmed Hassan', 18000, 101),
(2, 'Mona Ali', 16500, 101),
(3, 'Omar Khaled', 22000, 102),
(4, 'Sara Mohamed', 19000, 102),
(5, 'Hany Adel', 25000, 103),
(6, 'Nour Samir', 17500, 103),
(7, 'Khaled Mostafa', 21000, 104),
(8, 'Dina Ahmed', 18500, 104),
(9, 'Tarek Hassan', 27000, 105),
(10, 'Mai Khaled', 19500, 105),
(11, 'Youssef Adel', 23000, 106),
(12, 'Laila Samir', 17000, 106),
(13, 'Mahmoud Hany', 28000, 107),
(14, 'Reem Tarek', 20000, 107),
(15, 'Karim Nabil', 24000, 108),
(16, 'Salma Wael', 19000, 108),
(17, 'Mostafa Ashraf', 26000, 109),
(18, 'Hana Ibrahim', 18000, 110),
(19, 'Ali Sherif', 30000, 101),
(20, 'Jana Amr', 17500, 102);
SELECT *
FROM Instructor
----------------------------------------
INSERT INTO Course
(Course_Number, Course_Name, Description, Semester, Department_Code)
VALUES
(1001, 'Database Systems', 'Database fundamentals', 'Fall', 101),
(1002, 'Data Structures', 'Data structures concepts', 'Fall', 101),
(1003, 'SQL Programming', 'SQL and queries', 'Spring', 101),
(1004, 'Web Development', 'Web development basics', 'Spring', 101),

(1005, 'System Analysis', 'Systems analysis concepts', 'Fall', 102),
(1006, 'Business Intelligence', 'BI fundamentals', 'Fall', 102),
(1007, 'Information Security', 'Security fundamentals', 'Spring', 102),

(1008, 'Statistics', 'Statistical methods', 'Fall', 104),
(1009, 'Probability', 'Probability concepts', 'Spring', 104),

(1010, 'Calculus', 'Calculus fundamentals', 'Fall', 105),
(1011, 'Linear Algebra', 'Linear algebra basics', 'Spring', 105),

(1012, 'Physics I', 'Basic physics', 'Fall', 106),
(1013, 'Physics II', 'Advanced physics', 'Spring', 106),

(1014, 'Chemistry I', 'Basic chemistry', 'Fall', 107),
(1015, 'Chemistry II', 'Advanced chemistry', 'Spring', 107),

(1016, 'Biology', 'Biology fundamentals', 'Fall', 108),
(1017, 'Accounting', 'Accounting fundamentals', 'Fall', 109),
(1018, 'Finance', 'Finance fundamentals', 'Spring', 110),
(1019, 'Mechanics', 'Mechanical engineering basics', 'Fall', 113),
(1020, 'Marketing', 'Marketing fundamentals', 'Spring', 111);
SELECT *
FROM Course
-------------------------------
INSERT INTO Section
(Section_Number, Course_Number, Semester, YEAR, Instructor_ID)
VALUES
(1, 1001, 'Fall', 2026, 1),
(2, 1001, 'Fall', 2026, 2),
(1, 1002, 'Fall', 2026, 1),
(1, 1003, 'Spring', 2027, 2),
(1, 1004, 'Spring', 2027, 19),

(1, 1005, 'Fall', 2026, 3),
(2, 1005, 'Fall', 2026, 4),
(1, 1006, 'Fall', 2026, 3),
(1, 1007, 'Spring', 2027, 4),

(1, 1008, 'Fall', 2026, 7),
(2, 1008, 'Fall', 2026, 8),
(1, 1009, 'Spring', 2027, 7),

(1, 1010, 'Fall', 2026, 9),
(1, 1011, 'Spring', 2027, 10),
(1, 1012, 'Fall', 2026, 11),
(1, 1013, 'Spring', 2027, 12),
(1, 1014, 'Fall', 2026, 13),
(1, 1015, 'Spring', 2027, 14),
(1, 1016, 'Fall', 2026, 15),
(1, 1017, 'Fall', 2026, 17);
SELECT *
FROM Section
----------------------------------
INSERT INTO Registration
(Student_ID, Course_Number, Section_Number, Semester, YEAR)
VALUES
(1, 1001, 1, 'Fall', 2026),
(1, 1002, 1, 'Fall', 2026),
(1, 1003, 1, 'Spring', 2027),
(1, 1004, 1, 'Spring', 2027),

(2, 1001, 2, 'Fall', 2026),
(2, 1005, 1, 'Fall', 2026),
(2, 1006, 1, 'Fall', 2026),

(3, 1001, 1, 'Fall', 2026),
(3, 1002, 1, 'Fall', 2026),
(3, 1005, 1, 'Fall', 2026),
(3, 1008, 1, 'Fall', 2026),

(4, 1007, 1, 'Spring', 2027),
(4, 1009, 1, 'Spring', 2027),

(5, 1010, 1, 'Fall', 2026),
(5, 1011, 1, 'Spring', 2027),
(5, 1012, 1, 'Fall', 2026),

(6, 1013, 1, 'Spring', 2027),
(6, 1014, 1, 'Fall', 2026),

(7, 1015, 1, 'Spring', 2027),
(7, 1016, 1, 'Fall', 2026);
SELECT *
FROM Registration
--------------------------------------------
--1:Perform a report that displays the number of instructor in eachdepartment --

SELECT COUNT(I.Instructor_ID) AS[the number of instructor] ,D.Department_Name
FROM Department D INNER JOIN Instructor I
ON D.Department_Code=I.Department_Code
GROUP BY D.Department_Name

--2:Perform a report that display the department name that offer maximumnumber of courses --
SELECT *
FROM(
SELECT D.Department_Name, COUNT(C.Course_Number)AS N
FROM Department D INNER JOIN Course C
ON D.Department_Code=C.Department_Code 
GROUP BY D.Department_Name
) AS X
WHERE N =(SELECT MAX(N)FROM(
SELECT D.Department_Name, COUNT(C.Course_Number)AS N
FROM Department D INNER JOIN Course C
ON D.Department_Code=C.Department_Code 
GROUP BY D.Department_Name )AS Y)
--3:Perform a report that displays the name of each instructor with the nameof courses he teaches --
SELECT I.Instructor_Name ,C.Course_Name
FROM Instructor I INNER JOIN Section S
ON I.Instructor_ID=S.Instructor_ID
INNER JOIN Course C
ON C.Course_Number=S.Course_Number
--4: Perform a report that display the number of students in each department --
SELECT COUNT (S.Student_ID) ,D.Department_Name
FROM Student S INNER JOIN Department D
ON S.Department_Code =D.Department_Code
GROUP BY D.Department_Name
--5:Perform a report that display the name of department that pay total maximum salary to his instructors --

SELECT TOP 1 D.Department_Name, SUM (I.Salary)AS[maximum salary]
FROM Instructor I INNER JOIN Department D
ON I.Department_Code =D.Department_Code
GROUP BY D.Department_Name
ORDER BY [maximum salary] DESC

--6:Perform a report that display the name that have maximum number ofstudents --
SELECT *
FROM(
SELECT COUNT (S.Student_ID) AS NUM ,D.Department_Name
FROM Student S INNER JOIN Department D
ON S.Department_Code =D.Department_Code
GROUP BY D.Department_Name
)AS Z
WHERE NUM =(SELECT MAX (NUM) FROM (SELECT COUNT (S.Student_ID) AS NUM ,D.Department_Name
FROM Student S INNER JOIN Department D
ON S.Department_Code =D.Department_Code
GROUP BY D.Department_Name
)AS D)
--7:Perform a report that display the name of instructor that take salarygreater than the average salary of his department --

SELECT   D.Department_Name ,I.Instructor_Name,I.Salary
FROM Instructor I INNER JOIN Department D
ON I.Department_Code =D.Department_Code
WHERE I.Salary >(SELECT AVG(I1.Salary)FROM  Instructor I1
WHERE  I1.Department_Code = I.Department_Code)
--8:Perform a report that display department office telephone that hisinstructor earn maximum salary --
SELECT D.Office_Phone
FROM Instructor I INNER JOIN Department D
ON I.Department_Code =D.Department_Code
WHERE I.Salary=(SELECT MAX(I.Salary)AS[maximum salary] FROM Instructor I )
--9:Perform a report that display the name of student who is participant in number of courses that greater than 3 courses --
SELECT S.Student_Name ,COUNT( C.Course_Number)AS[number of courses]
FROM Student S INNER JOIN Registration R
ON S.Student_ID =R.Student_ID
INNER JOIN Course C 
ON C.Course_Number =R.Course_Number
GROUP BY S.Student_Name
HAVING COUNT(C.Course_Number) >3
--10:Perform a report that displays the number of instructor in each course --
SELECT C.Course_Name , COUNT(DISTINCT I.Instructor_ID) AS [number of instructor]
FROM Instructor I INNER JOIN Section S
ON S.Instructor_ID = I.Instructor_ID
INNER JOIN Course C
ON C.Course_Number =S.Course_Number
GROUP BY C.Course_Name
----------------------------------------------------
---->PROCEDURE(1)<--------
GO
CREATE PROCEDURE P1 AS
BEGIN
SELECT COUNT(I.Instructor_ID) AS[the number of instructor] ,D.Department_Name
FROM Department D INNER JOIN Instructor I
ON D.Department_Code=I.Department_Code
GROUP BY D.Department_Name
END
---->PROCEDURE(2)<--------
GO
CREATE PROCEDURE P2 AS
BEGIN
SELECT *
FROM(
SELECT D.Department_Name, COUNT(C.Course_Number)AS N
FROM Department D INNER JOIN Course C
ON D.Department_Code=C.Department_Code 
GROUP BY D.Department_Name
) AS X
WHERE N =(SELECT MAX(N)FROM(
SELECT D.Department_Name, COUNT(C.Course_Number)AS N
FROM Department D INNER JOIN Course C
ON D.Department_Code=C.Department_Code 
GROUP BY D.Department_Name )AS Y)
END
---->PROCEDURE(3)<--------
GO 
CREATE PROCEDURE P3 AS
BEGIN
SELECT I.Instructor_Name ,C.Course_Name
FROM Instructor I INNER JOIN Section S
ON I.Instructor_ID=S.Instructor_ID
INNER JOIN Course C
ON C.Course_Number=S.Course_Number
END
---->PROCEDURE(4)<--------
GO
CREATE PROCEDURE P4 AS
BEGIN
SELECT COUNT (S.Student_ID) ,D.Department_Name
FROM Student S INNER JOIN Department D
ON S.Department_Code =D.Department_Code
GROUP BY D.Department_Name
END 
---->PROCEDURE(5)<--------
GO
CREATE PROCEDURE P5 AS
BEGIN
SELECT TOP 1 D.Department_Name, SUM (I.Salary)AS[maximum salary]
FROM Instructor I INNER JOIN Department D
ON I.Department_Code =D.Department_Code
GROUP BY D.Department_Name
ORDER BY [maximum salary] DESC
END
---->PROCEDURE(6)<--------
GO
CREATE PROCEDURE P6 AS
BEGIN
SELECT *
FROM(
SELECT COUNT (S.Student_ID) AS NUM ,D.Department_Name
FROM Student S INNER JOIN Department D
ON S.Department_Code =D.Department_Code
GROUP BY D.Department_Name
)AS Z
WHERE NUM =(SELECT MAX (NUM) FROM (SELECT COUNT (S.Student_ID) AS NUM ,D.Department_Name
FROM Student S INNER JOIN Department D
ON S.Department_Code =D.Department_Code
GROUP BY D.Department_Name
)AS D)
END
---->PROCEDURE(7)<--------
GO
CREATE PROCEDURE P7 AS
BEGIN
SELECT   D.Department_Name ,I.Instructor_Name,I.Salary
FROM Instructor I INNER JOIN Department D
ON I.Department_Code =D.Department_Code
WHERE I.Salary >(SELECT AVG(I1.Salary)FROM  Instructor I1
WHERE  I1.Department_Code = I.Department_Code)
END
---->PROCEDURE(8)<--------
GO
CREATE PROCEDURE P8 AS
BEGIN
SELECT D.Office_Phone
FROM Instructor I INNER JOIN Department D
ON I.Department_Code =D.Department_Code
WHERE I.Salary=(SELECT MAX(I.Salary)AS[maximum salary] FROM Instructor I )
END
---->PROCEDURE(9)<--------
GO
CREATE PROCEDURE P9 AS
BEGIN
SELECT S.Student_Name ,COUNT( C.Course_Number)AS[number of courses]
FROM Student S INNER JOIN Registration R
ON S.Student_ID =R.Student_ID
INNER JOIN Course C 
ON C.Course_Number =R.Course_Number
GROUP BY S.Student_Name
HAVING COUNT(C.Course_Number) >3
END
---->PROCEDURE(10)<--------
GO
CREATE PROCEDURE P10 AS
BEGIN
SELECT C.Course_Name , COUNT(DISTINCT I.Instructor_ID) AS [number of instructor]
FROM Instructor I INNER JOIN Section S
ON S.Instructor_ID = I.Instructor_ID
INNER JOIN Course C
ON C.Course_Number =S.Course_Number
GROUP BY C.Course_Name
END
----------------------------------------------
-->EXEC P1 , P2 , P3 , P4 , P5 , P6 ,P7 ,P8 , P9 , P10 <---
EXEC P1
EXEC P2
EXEC P3
EXEC P4
EXEC P5
EXEC P6
EXEC P7
EXEC P8
EXEC P9
EXEC P10

