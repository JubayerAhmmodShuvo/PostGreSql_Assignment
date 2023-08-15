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
