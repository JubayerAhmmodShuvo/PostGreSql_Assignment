-- Active: 1691339737307@@127.0.0.1@5432@university_db
-- Table Creation
  
CREATE DATABASE UNIVERSITY_DB;


 -- students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(255),
    age INTEGER,
    email VARCHAR(255),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(255)
);

SELECT
  *
FROM
  STUDENTS;

  -- courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255),
    credits INTEGER
);

SELECT
  * 
FROM
  courses;


  -- enrollment table
  
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
);

SELECT
  *
FROM
  enrollment;

  -- Insert data in students

INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES
    ('Alice', 22, 'alice@example.com', 55, 57, NULL),
    ('Bob', 21, 'bob@example.com', 34, 45, NULL),
    ('Charlie', 23, 'charlie@example.com', 60, 59, NULL),
    ('David', 20, 'david@example.com', 40, 49, NULL),
    ('Eve', 24, 'newemail@example.com', 45, 34, NULL),
    ('Rahim', 23, 'rahim@gmail.com', 46, 42, NULL);

-- Insert data in courses

INSERT INTO courses (course_name, credits)
VALUES
    ('Next.js', 3),
    ('React.js', 4),
    ('Databases', 3),
    ('Prisma', 3);

-- Insert data enrollment

INSERT INTO enrollment (student_id, course_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);

    -- Queries

-- QUERY 1:

-- INSERT A NEW STUDENT RECORD

INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES ('John Doe', 25, 'john.doe@example.com', 80, 85, NULL);

-- QUERY 2:
-- RETRIEVE THE NAMES OF ALL STUDENTS WHO ARE ENROLLED IN THE COURSE TITLED 'Next.js'.

SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';

-- Query 3:
-- Update the status of the student with the highest total (frontend_mark + backend_mark) mark to 'Awarded'

UPDATE students
SET status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark)
    FROM students
);


-- QUERY 4:

-- DELETE ALL COURSES THAT HAVE NO STUDENTS ENROLLED.


DELETE FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollment);


-- QUERY 5:
-- RETRIEVE THE NAMES OF STUDENTS USING A LIMIT OF 2, STARTING FROM THE 3rd STUDENT.

SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2 OFFSET 2;


-- QUERY 6:
-- RETRIEVE THE COURSE NAMES AND THE NUMBER OF STUDENTS ENROLLED IN EACH COURSE.

SELECT c.course_name, COUNT(e.student_id) AS student_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;


-- QUERY 7:
-- CALCULATE AND DISPLAY THE AVERAGE AGE OF ALL STUDENTS.

SELECT AVG(age) AS average_age
FROM students;


-- QUERY 8:
-- RETRIEVE THE NAMES OF STUDENTS WHOSE EMAIL ADDRESSES CONTAIN 'example.com'.


SELECT student_name
FROM students
WHERE email LIKE '%example.com%';
