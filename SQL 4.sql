CREATE DATABASE learner_db;
USE learner_db;

CREATE TABLE student_info
(
    student_id INT,
    name VARCHAR(50),
    age INT,
    city VARCHAR(30),
    marks INT
);

INSERT INTO student_info (student_id, name, age, city, marks)
VALUES
(101, 'Meera', 19, 'Kochi', 88),
(102, 'Rahul', 21, 'Mysuru', 76),
(103, 'Ananya', 20, 'Pune', 92);

SELECT * FROM student_info;