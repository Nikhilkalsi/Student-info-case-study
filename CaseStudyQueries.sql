# Q1) Display list of all the existing databases in the server.
SHOW databases;

# Q2) Create a new database named “ipm”
CREATE DATABASE ipm;

# Q3) Drop the existing database named “ipm”
DROP DATABASE ipm;

# Q4) Create a database name “ipm” if “ipm” does not exist as database in the server.
CREATE database if not exists ipm;

# Q5) Remove/ delete the database “ipm” if it already exists in the server.
drop database if exists ipm;

# Q6) Create a database “ipm”.
CREATE database if not exists ipm;

# Q7) Check whether the database “ipm” you created now, is available in the database server or not.
show databases;

# Q8) Assuming database “ipm” is available, set “ipm” as the default database for further application.
use ipm;

SELECT DATABASE();

# Q10) What are the tables available in the current database “ipm” that is in use
show tables;

CREATE TABLE IF NOT EXISTS student (
    sid CHAR(3) NOT NULL,
    sname VARCHAR(10) NOT NULL,
    sex CHAR(3),
    major CHAR(3),
    GPA DECIMAL(3 , 2 ),
    PRIMARY KEY (sid)
);
    
INSERT INTO student VALUES
('987','POIRIER','F','MGT',3.2),
('763','PARKER','F','FIN',2.7),
('218','RICHARDS','M','ACC',2.4),
('359','PELNICK','F','FIN',3.6),
('862','FAGIN','M','MGT',2.2),
('748','MEGLIN','M','MGT',2.8),
('506','LEE','M','FIN',2.7),
('581','GAMBREL','F','MKT',3.8),
('372','QUICK','F','MGT',3.5),
('126','ANDERSON','M','ACC',3.7);

# DELETE FROM STUDENT;

# Q12) Create a table “faculty” (in the database “ipm”) with the structure/dictionary given above and insert 8 records given in the table created.
CREATE TABLE IF NOT EXISTS faculty (
	FID CHAR(3) NOT NULL,
    FNAME CHAR(10) NOT NULL,
    EXT CHAR(3),
    DEPT CHAR(3),
    RANK1 CHAR(4),
    SALARY INT,
    PRIMARY KEY (FID));
    
INSERT INTO FACULTY VALUES
('036','BARGES','325','MGT','ASSO',35000),
('117','JARDIN','212','FIN','FULL',33000),
('098','KENEDY','176','ACC','ASSO',30000),
('075','SAMPLE','171','MKT','ASST',25000),
('138','WARD','125','MGT','INST',20000),
('219','PETERS','220','FIN','FULL',45000),
('151','DARDEN','250','ACC','ASSO',37000),
('113','PIERCE','205','MGT','INST',22000);

# DELETE FROM FACULTY;
# Q13) Create a table “course” (in the database “ipm”) with the structure/dictionary given above and insert 8 records given in the table created.
CREATE TABLE IF NOT EXISTS COURSE (
	CRSNBR CHAR(6) NOT NULL,
    CNAME CHAR(25) NOT NULL,
    CREDIT INT(1),
    MAXENRL INT,
    FID CHAR(3)
);

INSERT INTO COURSE VALUES
('MGT630','INTRODUCTION TO MGMT',4,30,'138'),
('FIN601','MANAGERIAL FINANCE',4,25,'117'),
('MKT610','MARKETING FOR MANAGERS',3,35,'075'),
('MKT661','TAXATION',3,30,'098'),
('FIN602','INVESTMENT SKILLS',3,25,'219'),
('ACC601','BASIC ACCOUNTING',4,25,'098');

# Q14) Create a table “regn” (in the database “ipm”) with the structure/dictionary given above and insert 18 records given in the table created.
CREATE TABLE IF NOT EXISTS REGN (
	CRSNBR CHAR(6) NOT NULL,
    SID CHAR(3) NOT NULL,
    GRADE CHAR(1),
    PRIMARY KEY (CRSNBR,SID)
    );
    
ALTER TABLE STUDENT 
ADD CHECK (SEX IN ('M','F'));

ALTER TABLE STUDENT
ADD CHECK (MAJOR IN ('ACC', 'FIN', 'MGT', 'MKT'));

ALTER TABLE FACULTY
ADD CHECK (DEPT IN ('ACC', 'FIN', 'MGT', 'MKT'));

ALTER TABLE FACULTY
ADD CHECK (RANK1 IN ('INST', 'ASST', 'ASSO', 'FULL'));	

INSERT INTO STUDENT VALUES ('999','KARTIK','M','MKK',4.0,'999');
SHOW CREATE TABLE STUDENT;
    
INSERT INTO REGN VALUES 
('MGT630','987','A'),
('FIN602','987','B'),
('MKT610','987','A'),
('FIN601','763','B'),
('FIN602','763','B'),
('ACC610','763','B'),
('ACC610','218','A'),
('ACC661','218','A'),
('MGT630','218','C'),
('MGT630','359','F'),
('MGT681','359','B'),
('MKT610','359','A'),
('MKT610','862','A'),
('MKT670','862','A'),
('ACC610','862','B'),
('MGT630','748','C'),
('MGT681','748','B'),
('FIN601','748','A');

-- DROP TABLE REGN; 
# Q15) Retrieve a list of all students.
SELECT SNAME FROM STUDENT;

# Q16) Display student names, majors, and grade point averages.
SELECT SNAME, MAJOR, GPA FROM STUDENT;

# Q17) List all data stored in student table.
SELECT * FROM STUDENT;

# Q18) What are the different majors offered at the university? List.
SELECT MAJOR FROM STUDENT;

# Q19) Display all different major (but no duplicates) at the university.
SELECT DISTINCT MAJOR FROM STUDENT;

# Q20) Display all (but no duplicates) major, sname (combinations) of student table.
SELECT DISTINCT SNAME, MAJOR FROM STUDENT;

# Q21) Display a list of all accounting majors.
SELECT SNAME FROM STUDENT WHERE MAJOR = 'ACC';

# Q22) Display a list of all students with a GPA above 3.25.
SELECT SNAME FROM STUDENT WHERE GPA > 3.25;

# Q23) Display a list of female students with a GPA above 3.25.
SELECT SNAME FROM STUDENT WHERE GPA > 3.25 AND SEX = 'F';

# Q24) Display information (all attributes) for those students majoring in finance or any student having a GPA above 3.2.
SELECT * FROM STUDENT WHERE MAJOR = 'FIN' OR GPA > 3.2;

# Q25) Display student names either is an accounting major with a GPA above 3.5 or the student is a finance major.
SELECT SNAME FROM STUDENT WHERE (MAJOR = 'ACC' AND GPA > 3.5) OR MAJOR = 'FIN';

#Q26) Retrieve the names, majors, and GPA of all students who have a GPA above 3.5 and who are majoring in either accounting or finance.
SELECT SNAME, MAJOR, GPA FROM STUDENT WHERE GPA > 3.5 AND MAJOR IN ('ACC','FIN');

#Q27) List all students except those majoring in marketing (MKT) and management ( MGT).
SELECT SNAME FROM STUDENT WHERE MAJOR NOT IN ('MKT', 'MGT');

# Q28) Find all students whose GPA is greater than equal to 2.4 and less than equal to 3.5.
SELECT SNAME FROM STUDENT WHERE GPA >=2.4 AND GPA <=3.5;

# Q29) Find all students whose GPA is greater than equal to 2.4 and less than equal to 3.5 without using any “AND” operator.
SELECT SNAME FROM STUDENT WHERE GPA BETWEEN 2.4 AND 3.5;

# Q30) List the names of all the students who do not have a GPA in the range of 2.4 to 3.5.
SELECT SNAME FROM STUDENT WHERE GPA NOT BETWEEN 2.4 AND 3.5;

# Q31) List all students majoring in either accounting, management or marketing without using logical OR command.
SELECT SNAME FROM STUDENT WHERE MAJOR = 'ACC' OR MAJOR = 'MGT' OR MAJOR = 'MKT';

# Q32) List all students majoring in either accounting, management or marketing. -- SAME AS Q31??
SELECT SNAME FROM STUDENT WHERE MAJOR IN ('ACC','MGT','MKT');

# Q33) List all students who are not majoring in either accounting or management
SELECT SNAME FROM STUDENT WHERE MAJOR NOT IN ('ACC','MGT');

# Q34) Retrieve the names of all the students whose last name begins with “P”.
SELECT SNAME FROM STUDENT WHERE SNAME LIKE 'P%';

# Q35) List the name of any student whose major is unknown.
SELECT SNAME FROM STUDENT WHERE MAJOR IS NULL;

# Q36) Retrieve a list of students in alphabetical order.
SELECT SNAME FROM STUDENT ORDER BY SNAME;

# Q37) Retrieve a list of all students with a GPA above 3.0 ; placing the student with the highest grade point average first.
SELECT SNAME FROM STUDENT WHERE GPA > 3.0 ORDER BY GPA DESC;

# Q38) Retrieve a list of students arranged by major and, within major, arranged by the highest grade point average first.
SELECT SNAME, MAJOR, GPA FROM STUDENT ORDER BY MAJOR, GPA DESC;

# Q39) List the names, GPA and majors of all students on the list (GPA of 3.25 or above). Arrange the output so that the student with the highest GPA appears first.
SELECT SNAME, MAJOR, GPA FROM STUDENT WHERE GPA >= 3.25 ORDER BY GPA DESC;

# Q40) Next year every faculty member will receive a 5% salary increase. List the names of each faculty member, his/her current salary, and next years salary.
SELECT FNAME, SALARY CURRENT_SALARY, SALARY * 1.05 NEXT_YEAR_SALARY FROM FACULTY;

# Q41) List the names of all faculty members earning a monthly salary above 3000.
SELECT FNAME FROM FACULTY WHERE SALARY > 3000;

# Q42) What is the average salary paid in each dept?
SELECT DEPT, AVG(SALARY) AVG_SALARY FROM FACULTY GROUP BY DEPT;

# Q43) Determine the average salary paid to the accounting faculty.
SELECT AVG(SALARY) AVG_SALARY FROM FACULTY WHERE DEPT = 'ACC';

# Q44) What is the total salary paid by rank in each dept? Also, within dept, by rank.
SELECT RANK1, SUM(SALARY) TOTAL_SALARY FROM FACULTY GROUP BY RANK1;
SELECT DEPT, RANK1, SUM(SALARY) TOTAL_SALARY FROM FACULTY GROUP BY DEPT, RANK1;

# Q45) What is the total salary paid to the faculty?
SELECT SUM(SALARY) TOTAL_SALARY FROM FACULTY;

# Q46) Which departments have an average salary above 25000? Order the results by average salary, with highest average salary appearing first.
SELECT DEPT, AVG(SALARY) AVG_SALARY FROM FACULTY GROUP BY DEPT
HAVING AVG_SALARY > 25000
ORDER BY AVG_SALARY DESC;
 
# Q47) List the courses, faculty members teaching the courses.
SELECT C.CNAME, C.FID, F.FNAME NAME FROM COURSE C
LEFT JOIN FACULTY F ON F.FID = C.FID;

# Q48) In which course is FAGIN enrolled? (Assume that you can’t remember FAGIN’s student ID).
 WITH S AS (SELECT * FROM STUDENT)
 , C AS (SELECT * FROM COURSE)
 , R AS (SELECT * FROM REGN)
 SELECT R.CRSNBR, C.CNAME FROM R
 INNER JOIN C ON R.CRSNBR = C.CRSNBR
 INNER JOIN S ON S.SID = R.SID 
 WHERE S.SNAME = 'FAGIN';

#Q49) Provide a class roster of students enrolled in FIN601. The report should include the course no, course name, and student name.
 WITH S AS (SELECT * FROM STUDENT)
 , C AS (SELECT * FROM COURSE)
 , R AS (SELECT * FROM REGN)
 SELECT R.CRSNBR, C.CNAME, S.SNAME FROM R
 LEFT JOIN S ON S.SID = R.SID
 LEFT JOIN C ON C.CRSNBR = R.CRSNBR
 WHERE R.CRSNBR = 'FIN601';

# Q50) Provide a class roster of students enrolled in FIN601. The report should include the course no, course name, and student name (Any way other than the way you answer Q.49)
 SELECT R.CRSNBR, C.CNAME, S.SNAME FROM REGN R
 INNER JOIN STUDENT S ON S.SID = R.SID
 INNER JOIN COURSE C ON C.CRSNBR = R.CRSNBR
 WHERE R.CRSNBR IN ('FIN601');
 
 # Q51) List the names of all students enrolled in ‘FIN601’.
  WITH S AS (SELECT * FROM STUDENT)
 , C AS (SELECT * FROM COURSE)
 , R AS (SELECT * FROM REGN)
 SELECT S.SNAME FROM R
 LEFT JOIN S ON S.SID = R.SID
 LEFT JOIN C ON C.CRSNBR = R.CRSNBR -- this join is not required.
 WHERE R.CRSNBR = 'FIN601';
 
 # Q52) List the names of any student enrolled in INTRODUCTION TO MGMT who received an ‘F’ in the course.
   WITH S AS (SELECT * FROM STUDENT)
 , C AS (SELECT * FROM COURSE)
 , R AS (SELECT * FROM REGN)
 SELECT S.SNAME FROM R
 LEFT JOIN S ON S.SID = R.SID
 LEFT JOIN C ON C.CRSNBR = R.CRSNBR
 WHERE R.GRADE = 'F'
 AND C.CNAME = 'INTRODUCTION TO MGMT';
 
 # Q53) List the names of the faculty members in the same department as PETERS. Assume that you do not know PETER’s department.
 SELECT FNAME FROM FACULTY
 WHERE DEPT = (SELECT DEPT FROM FACULTY WHERE FNAME = 'PETERS');
 
#Q54) Retrieve the name, major, and GPA of any student whose GPA is above the average for his or her major.
WITH MAJOR_AVG AS (SELECT MAJOR, AVG(GPA) A_GPA FROM STUDENT GROUP BY MAJOR)
SELECT S.SNAME, S.MAJOR, S.GPA FROM STUDENT S
INNER JOIN MAJOR_AVG MA ON MA.MAJOR = S.MAJOR
 WHERE S.GPA > MA.A_GPA;
 
SELECT S.SNAME, S.MAJOR, S.GPA FROM STUDENT S
INNER JOIN (SELECT MAJOR, AVG(GPA) A_GPA FROM STUDENT GROUP BY MAJOR) MA ON MA.MAJOR = S.MAJOR
 WHERE S.GPA > MA.A_GPA;
 
#Q55) Retrieve the average GPA from student where major=“MGT’.
SELECT MAJOR, AVG(GPA) A_GPA FROM STUDENT WHERE MAJOR = 'MGT' GROUP BY MAJOR;

#Q56) Retrieve a list of students taking courses. Assume that some students in the STUDENT table are not enrolled in any courses this term.
   WITH S AS (SELECT * FROM STUDENT)
 , R AS (SELECT * FROM REGN)
 SELECT DISTINCT S.SNAME FROM S
 INNER JOIN R ON R.SID = S.SID;

#Q57) List the faculty members who are not involved in teaching any courses this term.
   WITH F AS (SELECT * FROM FACULTY)
 , C AS (SELECT * FROM COURSE)
 SELECT DISTINCT F.FNAME FROM F
 LEFT JOIN C ON C.FID = F.FID
 WHERE C.CNAME IS NULL;
 
#Q58) List all management majors and any students taking courses in management (i.e. both majors and not majoring).
 WITH S AS (SELECT * FROM STUDENT)
 , C AS (SELECT * FROM COURSE)
 , R AS (SELECT * FROM REGN)
 SELECT S.SNAME, S.MAJOR, R.CRSNBR, C.CNAME  FROM R
 LEFT JOIN S ON S.SID = R.SID
 LEFT JOIN C ON C.CRSNBR = R.CRSNBR
 WHERE S.MAJOR = 'MGT'
 OR C.CNAME = 'INTRODUCTION TO MGMT';
 
  WITH S AS (SELECT * FROM STUDENT)
 , C AS (SELECT * FROM COURSE)
 , R AS (SELECT * FROM REGN)
 SELECT S.SNAME, S.MAJOR, R.CRSNBR, C.CNAME  FROM R
 LEFT JOIN S ON S.SID = R.SID
 LEFT JOIN C ON C.CRSNBR = R.CRSNBR
 WHERE S.MAJOR = 'MGT'
 OR R.CRSNBR LIKE 'MGT%';
 
#Q59) Add a record into student table with the following values only:
#SID: 110; SNAME: JONES, SEX: M
INSERT INTO STUDENT (SID, SNAME, SEX) VALUES ('110','JONES','M');

#Q60) Create a new table stu_stat with the following 
#dictionary: SID Character (3) NOT NULL, SNAME Character (10), SEX Character(1), MAJOR Character (3), and GPA DECIMAL(3,2). 
#Then, copy the data in student table to the stu_stat table.
CREATE TABLE STU_STAT (
SID CHAR(3) NOT NULL,
SNAME CHAR(10),
SEX CHAR(1),
MAJOR CHAR(3),
GPA DECIMAL(3,2));

INSERT INTO STU_STAT
SELECT * FROM STUDENT;

CREATE TABLE STUDENT1 LIKE STUDENT;
INSERT INTO STUDENT1 SELECT * FROM STUDENT;
SELECT * FROM STUDENT1;
DESCRIBE STUDENT1;

#Q61) A student whose ID is 763 or 748 and course number is ‘FIN601’ are dropped/ removed.
# CREATING A COPY OF REGN
CREATE TABLE REGN1 LIKE REGN;
INSERT INTO REGN1 SELECT * FROM REGN;
SELECT * FROM REGN1;

CREATE TABLE REGN2 LIKE REGN;
INSERT INTO REGN2 SELECT * FROM REGN;
SELECT * FROM REGN2;

DELETE S1, R FROM STU_STAT S1
LEFT JOIN REGN1 R ON R.SID = S1.SID
WHERE S1.SID IN ('763', '748') AND R.CRSNBR = 'FIN601';

DELETE S1 FROM STUDENT1 S1
LEFT JOIN REGN2 R ON R.SID = S1.SID
WHERE S1.SID IN ('763', '748') AND R.CRSNBR = 'FIN601';

-- VALIDATION
SELECT * FROM REGN1 WHERE CRSNBR = 'FIN601' AND SID IN ('763', '748');
SELECT * FROM REGN2 WHERE CRSNBR = 'FIN601' AND SID IN ('763', '748');
SELECT * FROM REGN WHERE CRSNBR = 'FIN601' AND SID IN ('763', '748'); 
SELECT * FROM STU_STAT WHERE SID IN ('763', '748');
SELECT * FROM STUDENT WHERE SID IN ('763', '748');
SELECT * FROM STUDENT1 WHERE SID IN ('763', '748');

#Q62) A student whose ID number is 748 leaves the University. First delete the course in which student 748 is enrolled.
CREATE TABLE REGN3 LIKE REGN;
INSERT INTO REGN3 SELECT * FROM REGN;
SELECT * FROM REGN3;

DELETE FROM REGN3
WHERE SID = 748;

#Q63) Drop/remove the records from student when sex=“F” and GPA is above 3.0.
CREATE TABLE STUDENT3 LIKE STUDENT;
INSERT INTO STUDENT3 SELECT * FROM STUDENT;
SELECT * FROM STUDENT3 ORDER BY SEX, GPA;

DELETE FROM STUDENT3
WHERE SEX = 'F' AND GPA > 3.0;

#Q64) Remove all courses from the REGN table.
CREATE TABLE REGN4 LIKE REGN;
INSERT INTO REGN4 SELECT * FROM REGN;
SELECT * FROM REGN4;
DELETE FROM REGN4;

#Q65) Change the grade to F in REGN table where course no is MGT681.
CREATE TABLE REGN5 LIKE REGN;
INSERT INTO REGN5 SELECT * FROM REGN;
SELECT * FROM REGN5;

UPDATE REGN5
SET GRADE = 'F'
WHERE CRSNBR = 'MGT681';

#Q66) All faculty members are to receive a 5% increment in salary.
SELECT SALARY, 0.05* SALARY INCREMENT, SALARY*1.05 INCREASED_SALARY FROM FACULTY;

#Q67) To create a view named “Acc_Fac” for accounting department to see faculty Ids, names, and their phone extensions.
SELECT * FROM FACULTY;

CREATE VIEW ACC_FAC AS
SELECT FID, FNAME, EXT FROM FACULTY;

#Q68) Retrieve fname, and ext from Acc_Fac ascending or descending by fname.
SELECT FNAME, EXT FROM ACC_FAC ORDER BY FNAME DESC;

#Q69) Create a view “Fac_Sum” that permits the retrieval of department salary totals and number of faculty members without disclosing individual salaries.
CREATE VIEW FAC_SUM AS
SELECT DEPT, SUM(SALARY) TOTAL_SALARY, COUNT(FID) TOTAL_FACULTY FROM FACULTY GROUP BY DEPT;

#Q70) Retrieve department, number of faculty members and total salary from view “Fac_Sum”.
SELECT * FROM FAC_SUM;

#Q71) Create a view “Roster” that enables the individual to visualize selected data from the STUDENT, REGN, COURSE and FACULTY tables as being one table, 
#This view includes course number, course name, name of person teaching the course, student ID and student name.
CREATE VIEW ROASTER AS
WITH S AS (SELECT * FROM STUDENT),
F AS (SELECT * FROM FACULTY),
C AS (SELECT * FROM COURSE),
R AS (SELECT * FROM REGN)
SELECT R.CRSNBR, C.CNAME, F.FNAME, R.SID, S.SNAME FROM R
LEFT JOIN S ON S.SID = R.SID
LEFT JOIN C ON C.CRSNBR = R.CRSNBR
LEFT JOIN F ON F.FID = C.FID;

SELECT * FROM ROASTER;

#Q72) Display course number, course name, student ID, and student name from view “Roster” for the course number “FIN601”
SELECT CRSNBR, CNAME, SID, SNAME FROM ROASTER WHERE CRSNBR = 'FIN601';

#Q73) A faculty member, DARDEN, changes office and receives a new phone extension. The accounting secretary, using the view ACC_FAC, updates the phone extension. DARDEN’s new extension is 943.
UPDATE ACC_FAC
SET EXT = '943'
WHERE FNAME = 'DARDEN';

SELECT * FROM ACC_FAC;
SELECT * FROM FACULTY;

#Q74) Eliminate the view “Acc_Fac” for accounting secretary.
DROP VIEW ACC_FAC;

#Q75) Add a faculty advisor column “FID” with Character (3) to the STUDENT table.
ALTER TABLE STUDENT
ADD COLUMN FID CHAR(3);

DESCRIBE STUDENT;

#Q76) Modify FID column to the STUDENT table: from Character (3) to Character (9).
ALTER TABLE STUDENT
MODIFY COLUMN FID CHAR(9);
SELECT * FROM STUDENT;

#Q77) Create a new table STUDENT2 with the following revised columns: SID Character (3), FNAME Character (10), LNAME Character (15), SEX Character (1), MAJOR Character (3), GPA Decimal (3,2). 
#And then load the existing student data into the new table (STUDENT2).
CREATE TABLE STUDENT5 (
	SID CHAR(3),
    FNAME CHAR(10),
    LNAME CHAR(15),
    SEX CHAR(1),
    MAJOR CHAR(3),
    GPA DECIMAL(3,2),
    PRIMARY KEY (SID));
    
INSERT INTO STUDENT5 (SID, FNAME, SEX, MAJOR, GPA) SELECT SID, SNAME, SEX, MAJOR, GPA FROM STUDENT;   
SELECT * FROM STUDENT5; 
    
#Q78) Create one index named “MAJORIND” using the MAJOR column of Student to improve performance.
CREATE INDEX MAJORIND ON STUDENT (MAJOR);
DESCRIBE STUDENT;
SELECT * FROM STUDENT;

SHOW INDEX FROM STUDENT;

#Q79) Create another index “MAJORIND1” using the MAJOR column of Student to improve performance, MAJOR descending.
CREATE INDEX MAJORIND1 ON STUDENT (MAJOR DESC);

#Q80) Create another index “STUINDEX” for the student table that prevents records with the same student ID from being stored in the table.
CREATE UNIQUE INDEX STUINDEX ON STUDENT (SID);

#Q81) Remove the index “STUINDEX” linked to Student table upon SID.
ALTER TABLE STUDENT
DROP INDEX STUINDEX;
#Q82) Combine and display the result of list SID of all female students and SID of all students who are having grade “A”. In this case there may be some female students having grade “A”.
SELECT S.SNAME, S.SEX, R.CRSNBR, R.GRADE FROM REGN R
LEFT JOIN STUDENT S ON S.SID = R.SID
WHERE S.SEX = 'F' OR R.GRADE = 'A';

#Q83) Describe structure of table “student”.
DESCRIBE STUDENT;

SHOW INDEX FROM STUDENT;

#Q84) Write a stored procedure named “Getstudents” : list all the sname of table student.
USE IPM;
DELIMITER $$
CREATE PROCEDURE GETSTUDENTS()
BEGIN
	SELECT 
		SNAME
		FROM
		STUDENT;
END$$
DELIMITER ;

#Q85) Run the procedure Getstudents created before/ i.e. existing.
CALL GETSTUDENTS();

#Q86) Remove the procedure Getstudents.
DROP PROCEDURE GETSTUDENTS;

#Q87) Without using stored procedure, display database metadata such as detail schema of the table “Student”.
USE INFORMATION_SCHEMA;
SELECT * FROM INFORMATION_SCHEMA;
SHOW TABLES;
SELECT * FROM TABLES WHERE TABLE_NAME = 'STUDENT';
SELECT * FROM PARTITIONS WHERE TABLE_NAME = 'STUDENT';

#Q88) Without using stored procedure, display database metadata such as detail schema of the table “Student” with ordinal position of columns.
SELECT * FROM COLUMNS WHERE TABLE_NAME = 'STUDENT';

#Q89) Display columns/structure of table faculty.
DESCRIBE FACULTY;

#Q90) Display all the column information (full information, not part) of table ‘Faculty”.
SELECT * FROM COLUMNS WHERE TABLE_NAME = 'FACULTY';
# SHOW COLUMNS FROM FACULTY;

#Q91) Show the execution plan (how MySQL executes the query) for select * from faculty.
USE IPM;
EXPLAIN ANALYZE SELECT * FROM FACULTY;
EXPLAIN SELECT * FROM FACULTY;

EXPLAIN SELECT S.SNAME, S.SEX, R.CRSNBR, R.GRADE FROM REGN R
LEFT JOIN STUDENT S ON S.SID = R.SID
WHERE S.SEX = 'F' OR R.GRADE = 'A';
SHOW WARNINGS;

ANALYZE TABLE FACULTY;

EXPLAIN ANALYZE SELECT S.SNAME, S.SEX, R.CRSNBR, R.GRADE FROM REGN R
LEFT JOIN STUDENT S ON S.SID = R.SID
WHERE S.SEX = 'F' OR R.GRADE = 'A';

#Q92) Delete/ remove the table “STUDENT” from the database.
SELECT * FROM STUDENT5;
DROP TABLE STUDENT5;

#Q93) Create one table for Faculty who are in probation (FACPROB) with following structure/ dictionary and 5 records/tuples
#FID Character (3) where null values are not allowed,
#PROBYEARS integer values
#Records:
#098,4
#138,8
#151,10
#988,11
#056,2
CREATE TABLE FACPROB (
	FID CHAR(3) NOT NULL,
    PROBYEARS INT,
    PRIMARY KEY (FID));

INSERT INTO FACPROB VALUES 
('098',4),
('138',8),
('151',10),
('988',11),
('056',2);

SELECT * FROM FACPROB;

#Q94) To show the complete CREATE TABLE statement used to create table “Student”. 
SHOW CREATE TABLE STUDENT;

#Q95) Can you use a select command without a table? Please write. 
SELECT NOW();
SELECT 'KARTIK JAIN' MY_NAME;

#Q96) Display only 1st 3 rows order by Rank1 of the records from faculty table. 
SELECT * FROM FACULTY ORDER BY RANK1 LIMIT 3;

#Q97) Skip one row followed by display of 3 rows order by Rank1 of the records from faculty table. 
SELECT * FROM FACULTY ORDER BY RANK1 LIMIT 1,3;

#Q98) Define an alias “CourseID” for crsnbr and an alias “MaximumEnrollment” for maxenrl of the table course and use it.
SELECT CRSNBR CourseID, MAXENRL MaximumEnrollment  FROM COURSE;

#Q99) Retrieve/ display the data starting from the left table and matching rows in the right table. The left join returns all rows from the left table and the matching rows from the right table. 
#If a row in the left table does not have a matching row in the right table, the columns of the right table will have nulls. Take any two tables and write the command
SELECT R.*, C.* FROM REGN R
LEFT JOIN COURSE C ON C.CRSNBR = R.CRSNBR;

#Q100) Can you write Q99 any other way?
SELECT R.*, C.* FROM REGN R
LEFT JOIN COURSE C USING (CRSNBR);

#Q101) Retrieve/ display the data starting from the right table. The command must result a set that contains all rows from the right table and the matching rows in the left table. 
# If a row in the right table that does not have a matching row in the left table, all columns in the left table will contain nulls. Take any two tables and write the command.
SELECT R.*, C.* FROM COURSE C
RIGHT JOIN REGN R ON R.CRSNBR = C.CRSNBR;

#Q102) Can you write Q101 any other way?
SELECT R.*, C.* FROM COURSE C
RIGHT JOIN REGN R USING(CRSNBR);

#Q103) Create a table IPMFA with the following structure: FID Character (3) where null values are not allowed; FNAME Character (10) where null values are not allowed, EXT Character (3) where null values are not allowed, 
# DEPT Character (3), RANK1 Character (4), SALARY as integer. In this table, FID is the primary key.
CREATE TABLE IPMFA (
	FID CHAR(3) NOT NULL,
    FNAME CHAR(10) NOT NULL,
    EXT CHAR(3) NOT NULL,
    DEPT CHAR(3),
    RANK1 CHAR(4),
    SALARY INT,
    PRIMARY KEY (FID));

#Q104) Create a table IPMCO with the following structure: CRSNBR Character (6) with null values not allowed, CNAME Character (25) with null values not allowed, CREDIT as integer, MAXENRL as integer, 
# FID Character (3) with null values not allowed. Now, introduce FID as Foreign Key and then reference to IPMFAC table considering FID of IPMFAC table and FID of IPMCO as common field.
CREATE TABLE IPMCO (
	CRSNBR CHAR(6) NOT NULL,
    CNAME	CHAR(25) NOT NULL,
    CREDIT INT,
    MAXENRL INT,
    FID CHAR(3) NOT NULL,
    PRIMARY KEY (CRSNBR),
    FOREIGN KEY (FID) REFERENCES IPMFA(FID));


#Q105) Remove the FOREIGN KEY constraint, created in table IPMCO: See the table IPMCO.
DESCRIBE IPMCO;
SHOW INDEX FROM IPMCO;
SHOW CREATE TABLE IPMCO;
SELECT DATABASE();
USE INFORMATION_SCHEMA;
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'IPMCO';

#Q106) Remove the FOREIGN KEY constraint, created in table IPMCO: Remove the foreign key constraint. 
USE IPM;
ALTER TABLE IPMCO
DROP CONSTRAINT ipmco_ibfk_1;
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'IPMCO';

#Q107) Remove the FOREIGN KEY constraint, created in table IPMCO: Execute the command to remove the key. 
ALTER TABLE IPMCO
ADD FOREIGN KEY (FID) REFERENCES IPMFA(FID);
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'IPMCO';
ALTER TABLE IPMCO
DROP FOREIGN KEY ipmco_ibfk_1;

#Q108) Introduce FID as a Primary Key to the existing Table Faculty. Note that Faculty table already exists with certain records. 
USE INFORMATION_SCHEMA;
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'FACULTY';

USE IPM;
ALTER TABLE FACULTY
DROP PRIMARY KEY;
DESCRIBE FACULTY;
SELECT * FROM FACULTY;

ALTER TABLE FACULTY
ADD PRIMARY KEY(FID);

#Q109) Introduce FID as Foreign Key to the existing Table Course and then reference to FID of Faculty table. Course table already exists with certain records. 
USE INFORMATION_SCHEMA;
SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'COURSE';

USE IPM;
ALTER TABLE COURSE
ADD CONSTRAINT FK_FAC_ID
FOREIGN KEY (FID) REFERENCES FACULTY(FID);

#Q110) Display course name and faculty name who is teaching that course.
SELECT C.CNAME, F.FNAME FROM COURSE C
LEFT JOIN FACULTY F ON F.FID = C.FID;

-- Creating a calculated column
use ipm;
select * from faculty;
create table faculty1 like faculty;
describe faculty1;

insert into faculty1 select * from faculty;
select * from faculty1;

alter table faculty1
add column new_salary INT generated always as (salary * 1.05) STORED;

# EXPLORING INFORMATION SCHEMA
USE INFORMATION_SCHEMA;
SELECT * FROM TABLE_CONSTRAINTS WHERE TABLE_SCHEMA = 'IPM'; -- LIST ALL CONSTRAINTS
SELECT * FROM TABLES WHERE TABLE_SCHEMA = 'IPM'; -- LIST TABLES
SELECT * FROM VIEWS WHERE TABLE_SCHEMA = 'IPM'; -- LIST VIEWS
SELECT * FROM STATISTICS WHERE TABLE_SCHEMA = 'IPM' AND TABLE_NAME = 'STUDENT'; -- LIST INDEXES
SELECT * FROM ROUTINES; -- LIST FUNCTIONS AND PROCEDURES
SELECT * FROM REFERENTIAL_CONSTRAINTS; -- LIST FOREIGN KEYS AND REFERENCES
SELECT * FROM PARTITIONS WHERE TABLE_NAME = 'STUDENT';
SELECT * FROM KEY_COLUMN_USAGE WHERE CONSTRAINT_SCHEMA = 'IPM' AND TABLE_NAME = 'COURSE'; -- LIST ALL CONSTRAINTS
SELECT * FROM INNODB_TABLESTATS WHERE NAME LIKE 'IPM%';
SELECT * FROM INNODB_TABLESPACES WHERE NAME LIKE 'IPM%';
SELECT * FROM INNODB_TABLES WHERE NAME LIKE 'IPM%';
SELECT * FROM INNODB_INDEXES;
SELECT * FROM INNODB_FOREIGN_COLS WHERE ID LIKE 'IPM%';
SELECT * FROM INNODB_FOREIGN WHERE ID LIKE 'IPM%';
SELECT * FROM INNODB_COLUMNS;
SELECT * FROM COLUMNS WHERE TABLE_NAME='STUDENT';
SELECT * FROM CHECK_CONSTRAINTS; -- LIST ALL THE CHECK
