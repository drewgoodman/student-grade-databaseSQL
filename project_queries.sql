-- QUERIES FOR CLASS PROJECT

USE `student-grade-database`;

-- AVERAGE SCORE PER PROFESSOR
SELECT p.professor_name AS "Professor", AVG(g.grade_score) AS "Average Grade"
FROM professor p
JOIN course c
ON c.course_professor_id = p.professor_id
JOIN grade g 
ON g.grade_course_id = c.course_id
GROUP BY p.professor_name;

-- TOP GRADE PER STUDENT

SELECT s.student_name AS "Student", MAX(g.grade_score) AS "Top Grade"
FROM student s 
JOIN grade g 
ON g.grade_student_id = s.student_id
GROUP BY s.student_name;

-- STUDENTS ENROLLED IN EACH COURSE

SELECT c.course_name AS "Course", s.student_name AS "Student Enrolled"
FROM course c 
JOIN grade g
ON g.grade_course_id = c.course_id
JOIN student s 
ON g.grade_student_id = s.student_id
ORDER BY c.course_id;

-- SUMMARY REPORT: Courses, Average Grades, sorted by level of challenge

SELECT c.course_id AS "ID", c.course_name AS "Course", AVG(g.grade_score) AS "Average Grade"
FROM course c
JOIN grade g 
ON g.grade_course_id = c.course_id
GROUP BY c.course_name
ORDER BY AVG(g.grade_score);

-- WHICH STUDENT AND PROFESSOR HAVE THE MOST COURSES IN COMMON:

SELECT
	p.professor_name AS "Professor",
    s.student_name AS "Student"
FROM professor p 
JOIN course c 
ON c.course_professor_id = p.professor_id
JOIN grade g 
ON g.grade_course_id = c.course_id
JOIN student s 
ON s.student_id = g.grade_student_id
GROUP BY p.professor_name, s.student_name
ORDER BY COUNT(s.student_name) DESC
LIMIT 1
