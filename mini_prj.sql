DROP database session04;
CREATE database session04;

USE session04;

create table Student (
	student_id int primary key,
    student_name varchar(100) not null,
    date_of_birth date,
    email varchar(100) unique not null
);

create table Teacher(
	teacher_id int primary key,
    teacher_name varchar(100) not null,
    email varchar(100) unique not null
);

create table Course(
	course_id int primary key,
    course_name varchar(100) not null,
    description  text,
    total_lesson int check(total_lesson > 0),
    teacher_id int not null,
    foreign key(teacher_id) references Teacher(teacher_id)
);

create table Enrollment(
	student_id int,
    course_id int, 
    enroll_date date not null,
    primary key(student_id,course_id),
    foreign key(student_id) references Student(student_id),
    foreign key(course_id) references Course(course_id)
);

create table Score(
	student_id int,
    course_id int,
    mid_grade decimal(4,2) check(mid_grade >= 0 and mid_grade <= 10),
    final_grade decimal(4,2) check(final_grade >= 0 and final_grade <= 10),
    primary key (student_id,course_id),
    foreign key(student_id) references Student(student_id),
    foreign key(course_id) references Course(course_id)
);

insert into Student(student_id,student_name,date_of_birth,email) values
(1, 'Nguyen Van A', '2002-01-10', 'a@gmail.com'),
(2, 'Tran Thi B', '2001-03-15', 'b@gmail.com'),
(3, 'Le Van C', '2002-06-20', 'c@gmail.com'),
(4, 'Pham Thi D', '2000-11-05', 'd@gmail.com'),
(5, 'Hoang Van E', '2001-09-09', 'e@gmail.com');

insert into Teacher(teacher_id,teacher_name,email) values
(1, 'Thay An', 'an@gmail.com'),
(2, 'Co Binh', 'binh@gmail.com'),
(3, 'Thay Cuong', 'cuong@gmail.com'),
(4, 'Co Dao', 'dao@gmail.com'),
(5, 'Thay Huy', 'huy@gmail.com');
insert into Course(course_id ,course_name, description,total_lesson,teacher_id) values
(1, 'SQL Co Ban', 'Hoc SQL tu dau', 20, 1),
(2, 'Java Core', 'Lap trinh Java', 30, 2),
(3, 'HTML CSS', 'Thiet ke web', 15, 3),
(4, 'JavaScript', 'Lap trinh frontend', 25, 4),
(5, 'Database Design', 'Thiet ke CSDL', 18, 5);

insert into Enrollment(student_id,course_id,enroll_date) values
(1, 1, '2025-01-10'),
(1, 2, '2025-01-11'),
(2, 1, '2025-01-10'),
(3, 3, '2025-01-12'),
(4, 4, '2025-01-13');

insert into Score(student_id,course_id,mid_grade,final_grade) values
(1, 1, 7.5, 8.0),
(1, 2, 6.5, 7.0),
(2, 1, 8.0, 8.5),
(3, 3, 7.0, 7.5),
(4, 4, 9.0, 9.5);


update Student
set email = 'newa@gmail.com'
where student_id = 1;

update Course
set description = 'Lap trinh Java nang cao'
where course_id = 2;

update Score
set final_grade = 9.0
where student_id = 1 and course_id = 1;

delete from Enrollment
where student_id = 4 and course_id = 4;

delete from Score
where student_id = 4 and course_id = 4;

select * from Student;
select * from Teacher;
select * from Course;
select * from Enrollment;
select * from Score;
