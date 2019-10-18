-- Basic Queries to test sample data

USE `student-grade-database`;

SELECT c.course_id, c.course_name AS "Course", p.professor_name AS "Assigned Teacher"
FROM course c
JOIN professor p
ON p.professor_id = c.course_professor_id;

SELECT s.student_name AS "Student", c.course_name AS "Course", g.grade_score AS "Grade", p.professor_name AS "Scored By"
FROM student s
JOIN grade g
ON g.grade_student_id = s.student_id
JOIN course c 
ON g.grade_course_id = c.course_id
JOIN professor p 
ON c.course_professor_id = p.professor_id
ORDER BY student_name;
