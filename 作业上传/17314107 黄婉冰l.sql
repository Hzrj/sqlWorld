--1.	显示选修了“数据库”的所有同学的学号、姓名
select sno,sname from student where sno in
(select sno from sc where cno=(select cno
from course where cname='数据库'))

--2.	查询各课程名和各课程平均分
select cname,avg(grade)平均分 from sc,course
where sc.cno=course.cno group by cname

--3.	显示数据库期末成绩85分以上的同学的学号、姓名及期末成绩
select student.sno,sname,grade from sc,student,course 
where sc.sno=student.sno and course.cno=sc.cno
 and grade>85 and cname='数据库'

--4.	统计CS系每个同学已经修完的学分，显示学号、姓名、学分总数
select sc.sno,sname,sum(credit)总学分 from student,course,sc
where student.sno=sc.sno and sc.cno=course.cno
 and sdept='cs' group by sc.sno,sname

--5.显示李勇同学已修课程及成绩
select cname,grade from student,sc,course where sc.cno=course.cno 
and sc.sno=student.sno and sname='李勇'

--6.显示平均成绩75分以上的课程名称与平均成绩
select cname,avg(grade)平均分 from sc,course
where sc.cno=course.cno group by cname having avg(grade)>75

--7.显示平均成绩80分以上同学的学号、姓名与平均成绩
select student.sno,sname,avg(grade)平均成绩 from student,sc where 
student.sno=sc.sno group by student.sno,sname having avg(grade)>80

--8.显示没有选修任何课程的学生学号、姓名 
select student.sno,sname from student where sno not in(select sno from sc)

--9.显示没有修过数据库的同学的名称，包括学号、姓名
select sno,sname from student where sno not in(select sno from sc where
cno=(select cno from course where cname='数据库'))

--10.显示不及格1门以上的同学学号、姓名、门数
select sc.sno,sname,count(grade)不及格门数 from sc,student where 
sc.sno=student.sno group by sc.sno,sname,grade having grade<60

--11.按照学分统计学分相同的课程数
select count(credit)学分相同的课程数 from course group by cname having credit 

select count(cname) from course group by cname,credit having credit=(select credit from course
 where cname='数据库') 