--1.	显示选修了“数据库”的所有同学的学号、姓名
select sname ,sno from student where sno in
(select sno from sc where cno=
(select cno from course where cname='数据库'))
--逐步解决问题

--SELECT Sname  /*外层查询或父查询*/
--FROM Student
--WHERE Sno IN
--    (SELECT Sno  /*内层查询或子查询*/
--     FROM SC
--     WHERE Cno='2');
--select * from sc where sno=
--(select sno from student where sname='李勇')


--2.	查询各课程名和各课程平均分
select cno ,avg(grade)as 课程平均分 from sc group by cno 
select cname from course where cno in
(select cno from sc)
--or---自然连接
select cname,avg(grade) as 平均分 from course,sc
where course.cno*=sc.cno group by cname
order by 平均分 desc

--3.	显示数据库期末成绩85分以上的同学的学号、姓名及期末成绩
--数据库期末成绩85
select sno,grade from sc where grade>=85 and cno='1'
select sno,sname grade from student where sno in
(select sno from sc where grade>=85 and cno='1') 

--4.	统计CS系每个同学已经修完的学分，显示学号、姓名、学分总数

--5.	显示李勇同学已修课程及成绩

--6.	显示平均成绩75分以上的课程名称与平均成绩

--7.	显示平均成绩80分以上同学的学号、姓名与平均成绩

--8.	显示没有选修任何课程的学生学号、姓名 

--9.	显示没有修过数据库的同学的名称，包括学号、姓名

--10.	显示不及格1门以上的同学学号、姓名、门数

--11.	按照学分统计学分相同的课程数
