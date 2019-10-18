
select *from student
--1.	统计各系部男女生人数，统计结果按照系部排序。
select sdept,ssex ,count(*)from student where ssex='男'or ssex='女'group by sdept,ssex order by sdept asc
select ssex,count(sno) from student
group by ssex


--2.	查询各门课的最高成绩。
select max(grade) from sc where cno='1'
select max(grade) from sc where cno='2'
select max(grade) from sc where cno='3'
--或
select cno,MAX(grade) as maxgrade from sc group by cno

--3.	查询平均分85分以上的课程号。

select cno,count(cno) from sc where grade>=85
group by cno
--select cno,AVG(grade)as 平均成绩 from sc where avg(grade)>85
group by cno ;

--4.	按课程号对成绩表进行升序排序，同门课程的按成绩降序排序。
select * from sc order by grade desc--降序
select * from sc order by grade asc--升序

--5.	查询选课人数3人以上的课程。
select cno ,count(sno)as ss from sc where sno>=3
order by 

