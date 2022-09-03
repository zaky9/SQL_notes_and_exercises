# table name: STUDENTS
# id
# first_name

# table name: PAPERS
# title
# grade
# student_id

DROP DATABASE IF EXISTS students_and_papers;
CREATE DATABASE students_and_papers;
USE students_and_papers;

# Q1 
CREATE TABLE students(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers(
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) 
        REFERENCES students(id) 
        ON DELETE CASCADE
);

DESC students;
DESC papers;

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

# Q1.
SELECT first_name, title, grade FROM students, papers WHERE students.id = papers.student_id ODER BY grade DESC;  
SELECT first_name, title, grade FROM students JOIN papers ON students.id = papers.student_id ODER BY grade DESC;  

# Q2. 
SELECT first_name, title, grade FROM students LEFT JOIN papers ON students.id = papers.student_id;  

# Q3. 
SELECT first_name, 
       IFNULL(title, 'MISSING') AS title, 
       IFNULL(grade, 0) AS grade 
       FROM students 
       LEFT JOIN papers ON students.id = papers.student_id;  
       
# Q5. 
SELECT first_name, 
       IFNULL(AVG(grade),0) AS average
       FROM students 
       LEFT JOIN papers ON students.id = papers.student_id
       GROUP BY students.id
       ORDER BY average DESC;

# Q6.  
SELECT first_name,
       IFNULL(AVG(grade),0) AS average,
       CASE 
           WHEN AVG(grade) >= 75 THEN 'PASSING'
           WHEN AVG(grade) IS NULL THEN 'FAILING'
           ELSE 'FAILING'
       END AS passing_status
       FROM students 
       LEFT JOIN papers ON students.id = papers.student_id
       GROUP BY students.id 
       ORDER BY average DESC;
       
SELECT first_name,
       IFNULL(AVG(grade),0) AS average,
       CASE 
           WHEN AVG(grade) BETWEEN 75 AND 100 THEN 'PASSING'
           WHEN AVG(grade) IS NULL THEN 'FAILING'
           ELSE 'FAILING'
       END AS passing_status
       FROM students 
       LEFT JOIN papers ON students.id = papers.student_id
       GROUP BY students.id 
       ORDER BY average DESC;