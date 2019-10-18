--查询学生数学课的考试情况，包括学号、姓名、课程号、
--课程名、成绩

--1.确定数据最少来自几张表
--2.确定这些表之间的引用关系（外键引用）
--3.确定其它查询条件

select student.sno,sname,course.cno,cname,grade
from student,sc,course
where student.sno=sc.sno and sc.cno=course.cno
and rtrim(cname)='数学'

--查询每个学生选课门数，包括姓名、门数

select sname,count(cno) as num from student,sc
where student.sno=sc.sno group by sname

--自然连接的结果集由外键表决定

select sname,count(cno) as num from student,sc
where student.sno*=sc.sno group by sname
order by num

--查询李勇的考试情况,包括学号,姓名,课程号,成绩
select student.sno,sname,cno,grade from student,sc
where student.sno=sc.sno and rtrim(sname)='李勇'
O(n^2)
select * from sc where sno=
(select sno from student where sname='李勇')
O(2n)

--嵌套查询是逐步解决未知条件的过程

--程序时间复杂度 循环重数

select sdept from student where sname='刘晨'

select * from student where sdept='is'

select * from student where sdept=
(select sdept from student where sname='刘晨')