--1）查询全体学生的学号和姓名。
select sname,sno from student;

--2）查询全体学生的详细信息。
select * from  student

--3）查询全体学生的姓名及其出生年份。
select sname,2018-sage from student

--4）查询所有年龄在19岁以上的学生姓名以及年龄。
select sname from student where sage>19

--5）查询考试成绩不及格的学生的学号及所选课程号。
select sno cno  from sc where grade<60

--6）查询年龄在18-19岁之间的学生的姓名和年龄。
select sname ,sage from student where sage <=19 and sage>=18

--7）查询所有姓刘的学生的姓名、学号和性别。
select sname ,sno,ssex from student where sname like '刘%';

--8）查询姓“刘”且全名为三个汉字的学生的姓名。
select sname,sno from student where sname like '刘____';

--9）查询所有不姓刘的学生的姓名、学号。
select sname ,sno from student where sname not like'刘%';

--10）查询选修了3号课程的学生的学号及其成绩，查询结果按分数的降序排列。
select  cno,sno,grade from sc where cno='3' order by grade desc;

--11）统计学生总人数。
select  count(*)from student;

--12）计算选修了1号课程的学生平均成绩。
select avg(grade) from sc where cno='1';

--13）查询选修了1号课程的学生最高分数。
select max(grade) from sc where cno='1';

--14）求各课程号及相应的选课人数。
select cno ,count(sno) from sc group by cno;

--15）查询选修2号课程且成绩在85分以上的所有学生。
select  cno,sno,grade from sc where cno='2'and grade>85;


