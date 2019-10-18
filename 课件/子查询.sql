select cno from course where cname='信息系统'

select sno from sc where cno='3'

select sno,sname from student 
where sno in('95001','95002')


select sno,sname from student where sno in
(select sno from sc where cno=
  (select cno from course where cname='信息系统')
)


select student.sno,sname from student,sc,course
where student.sno=sc.sno and sc.cno=course.cno
and cname='信息系统'

select sno,cno from sc s1 where grade>
(select avg(grade) from sc s2 where s1.cno=s2.cno)

select * from sc

select * from student

select * from student where sage< 
any(select sage from student where sdept='is')
and sdept<>'is'

select * from student where sage< 
(select max(sage) from student where sdept='is')
and sdept<>'is'