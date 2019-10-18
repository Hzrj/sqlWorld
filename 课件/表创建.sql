use xsgl
go
--创建学生表
create table student 
(
sno char(9) primary key,
sname varchar(20) not null,
sage int,
ssex char(2) not null,
sdept varchar(20)
)
--课程表
create table course 
(
cno char(4) primary key,
cname varchar(20) not null,
credit int not null
)
--成绩表
create table sc 
(
sno char(9) not null,
cno char(4) not null,
grade int
)
--添加主键
alter table sc
add primary key(sno,cno)

--添加外键
alter table sc
add constraint fk_student_sc foreign key(sno)
references student(sno) 

alter table sc
add constraint fk_course_sc foreign key(cno)
references course(cno)

insert into student values('170001','李明',19,'男','网络技术')
insert into course values('0001','大型数据库',4)

select * from student
select * from course
select * from sc
insert into sc values('170001','0001',88)

insert into sc values('170002','0001',86)

alter table student
drop constraint DF_student_ssex

ALTER TABLE dbo.student ADD CONSTRAINT
	DF_student_ssex DEFAULT '男' FOR ssex

insert into student(sno,sname,sage,sdept)values('170002','张三',20,'网络技术')

select * from student
