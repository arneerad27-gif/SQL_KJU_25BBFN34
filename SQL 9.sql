CREATE DATABASE student;
USE student;
CREATE TABLE details
(
  student_id INT,
  name VARCHAR(50),
  age INT,
  city VARCHAR(30),
  marks INT
);
INSERT INTO details(student_id,name,age,city,marks)
VALUES
(001,'Neerad',20,'Kerala',90),
(002,'Devji',22,'Saudi',75),
(003,'Arjun',21,'Chennai',85);
SELECT *FROM details;