select * from student

select * from student where sname like '张%'
select * from student where rtrim(sname) like '__'

select * from student where rtrim(sname) like '___'
select * from student where rtrim(sname) like '_[^云]%'
insert into student(sno,sname,ssex,sdept)
values('95009','程昱','男','MA')

select * from student where sage is null

select * from student where rtrim(sname) like 'li*_ly' escape '*'


select * from student order by sage desc

select * from student order by ssex,sage desc

select * from sc

select * from sc order by grade desc

select top 3 * from sc order by grade desc

select * from student
select count(*) from student
select count(sno) from student

select * from sc where sno='95001'

select sum(grade) as s_grade from sc where sno='95001'
select avg(grade) as avgs from sc where sno='95001'

select * from sc where cno='2'

select max(grade) from sc where cno='2'
select min(grade) from sc where cno='2'

select * from student order by ssex

select ssex,count(sno) from student
group by ssex

select sno,sum(grade) from sc
group by sno having sno='95001'

select * from sc

--查询各位学生课程及格门数

select sno,count(cno) from sc where grade>=60
group by sno

--查询所选课程及格门数大于2的学号

