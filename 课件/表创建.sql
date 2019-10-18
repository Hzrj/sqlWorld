use xsgl
go
--����ѧ����
create table student 
(
sno char(9) primary key,
sname varchar(20) not null,
sage int,
ssex char(2) not null,
sdept varchar(20)
)
--�γ̱�
create table course 
(
cno char(4) primary key,
cname varchar(20) not null,
credit int not null
)
--�ɼ���
create table sc 
(
sno char(9) not null,
cno char(4) not null,
grade int
)
--�������
alter table sc
add primary key(sno,cno)

--������
alter table sc
add constraint fk_student_sc foreign key(sno)
references student(sno) 

alter table sc
add constraint fk_course_sc foreign key(cno)
references course(cno)

insert into student values('170001','����',19,'��','���缼��')
insert into course values('0001','�������ݿ�',4)

select * from student
select * from course
select * from sc
insert into sc values('170001','0001',88)

insert into sc values('170002','0001',86)

alter table student
drop constraint DF_student_ssex

ALTER TABLE dbo.student ADD CONSTRAINT
	DF_student_ssex DEFAULT '��' FOR ssex

insert into student(sno,sname,sage,sdept)values('170002','����',20,'���缼��')

select * from student
