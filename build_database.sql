-- SCRIPT TO POPULATE SAMPLE DATABASE

CREATE SCHEMA `student-grade-database` ;

CREATE TABLE `student-grade-database`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE);

CREATE TABLE `student-grade-database`.`professor` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `professor_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`professor_id`),
  UNIQUE INDEX `professor_id_UNIQUE` (`professor_id` ASC) VISIBLE);
  
  CREATE TABLE `student-grade-database`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NOT NULL,
  `course_professor_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `course_id_UNIQUE` (`course_id` ASC) VISIBLE);

ALTER TABLE `student-grade-database`.`course` 
ADD INDEX `course_professor_id_idx` (`course_professor_id` ASC) VISIBLE;
;
ALTER TABLE `student-grade-database`.`course` 
ADD CONSTRAINT `course_professor_id`
  FOREIGN KEY (`course_professor_id`)
  REFERENCES `student-grade-database`.`professor` (`professor_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `student-grade-database`.`grade` (
  `grade_id` INT NOT NULL AUTO_INCREMENT,
  `grade_score` INT NOT NULL,
  `grade_student_id` INT NOT NULL,
  `grade_professor_id` INT NOT NULL,
  `grade_course_id` INT NOT NULL,
  PRIMARY KEY (`grade_id`),
  UNIQUE INDEX `grade_id_UNIQUE` (`grade_id` ASC) VISIBLE,
  INDEX `grade_student_id_idx` (`grade_student_id` ASC) VISIBLE,
  INDEX `grade_professor_id_idx` (`grade_professor_id` ASC) VISIBLE,
  INDEX `grade_course_id_idx` (`grade_course_id` ASC) VISIBLE,
  CONSTRAINT `grade_student_id`
    FOREIGN KEY (`grade_student_id`)
    REFERENCES `student-grade-database`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `grade_course_id`
    FOREIGN KEY (`grade_course_id`)
    REFERENCES `student-grade-database`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


USE `student-grade-database`;

-- Populate Students
INSERT INTO student(student_name)
VALUES ("Bill");

INSERT INTO student(student_name)
VALUES ("Carrie");

INSERT INTO student(student_name)
VALUES ("James");

INSERT INTO student(student_name)
VALUES ("Sally");

INSERT INTO student(student_name)
VALUES ("Sarah");

INSERT INTO student(student_name)
VALUES ("Zach");


-- Populate Professors 
INSERT INTO professor(professor_name)
VALUES ("Hahn");

INSERT INTO professor(professor_name)
VALUES ("DeJong");

INSERT INTO professor(professor_name)
VALUES ("Rafaelly");

INSERT INTO professor(professor_name)
VALUES ("Weidman");

-- Populate and Assign Courses

INSERT INTO course(course_name, course_professor_id)
VALUES ("Calculus", 1);

INSERT INTO course(course_name, course_professor_id)
VALUES ("Trigonometry", 1);

INSERT INTO course(course_name, course_professor_id)
VALUES ("Physics", 1);

INSERT INTO course(course_name, course_professor_id)
VALUES ("Organic Chemisty", 2);

INSERT INTO course(course_name, course_professor_id)
VALUES ("AP Chemisty", 2);

INSERT INTO course(course_name, course_professor_id)
VALUES ("Databases", 3);

INSERT INTO course(course_name, course_professor_id)
VALUES ("C++", 3);

INSERT INTO course(course_name, course_professor_id)
VALUES ("Python", 3);

INSERT INTO course(course_name, course_professor_id)
VALUES ("Digital Marketing", 4);

INSERT INTO course(course_name, course_professor_id)
VALUES ("New Product Development", 4);



-- Assign Course Grades to students
-- Random grade of 0-100, Students 1-6, courses 1-10

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 1, 1);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 1, 3);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 1, 7);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 1, 9);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 2, 1);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 2, 5);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 2, 6);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 2, 8);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 2, 10);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 3, 2);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 3, 4);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 3, 6);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 3, 10);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 4, 3);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 4, 6);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 4, 7);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 4, 9);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 5, 1);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 5, 5);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 5, 7);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 5, 9);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 5, 10);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 6, 1);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 6, 3);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 6, 4);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 6, 8);

INSERT INTO grade(grade_score, grade_student_id, grade_course_id)
VALUES (RAND() * 100, 6, 10);
