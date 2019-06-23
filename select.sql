# 1.查询同时存在1课程和2课程的情况
SELECT * from student_course sc WHERE sc.courseId=1 OR sc.courseId=2;
# 2.查询同时存在1课程和2课程的情况
?????1,2题不是很了解什么意思????
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT s.id,s.name,AVG(sc.score) FROM student s LEFT JOIN student_course sc ON s.id=sc.studentId GROUP BY sc.studentId HAVING AVG(sc.score)>60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT * FROM student s WHERE s.id NOT IN (
	SELECT sc.studentId FROM student_course sc 
);
# 5.查询所有有成绩的SQL
SELECT s.id as '学号',s.`name` as '姓名',c.`name` as '课程',sc.score as '成绩' FROM student s, course c, student_course sc WHERE sc.studentId=s.id AND sc.courseId=c.id;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * FROM student s, student_course sc WHERE s.id=sc.studentId AND sc.courseId=1 AND EXISTS (
	SELECT sc2.score FROM student_course sc2 WHERE sc2.studentId=s.id AND sc2.courseId=2
);
# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT s.*, c.`name`,sc.score FROM student s, course c, student_course sc WHERE s.id=sc.studentId AND c.id=sc.courseId AND sc.courseId=1 AND sc.score<60 ORDER BY sc.score DESC;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT courseId as '课程编号', AVG(score) as '平均成绩' FROM student_course GROUP BY courseId ORDER BY courseId ASC;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT s.`name`, sc.score FROM student s, student_course sc WHERE s.id=sc.studentId AND sc.courseId=(
	SELECT id FROM course WHERE `name`='数学'
) AND sc.score<60;
