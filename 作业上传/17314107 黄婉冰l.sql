--1.	��ʾѡ���ˡ����ݿ⡱������ͬѧ��ѧ�š�����
select sno,sname from student where sno in
(select sno from sc where cno=(select cno
from course where cname='���ݿ�'))

--2.	��ѯ���γ����͸��γ�ƽ����
select cname,avg(grade)ƽ���� from sc,course
where sc.cno=course.cno group by cname

--3.	��ʾ���ݿ���ĩ�ɼ�85�����ϵ�ͬѧ��ѧ�š���������ĩ�ɼ�
select student.sno,sname,grade from sc,student,course 
where sc.sno=student.sno and course.cno=sc.cno
 and grade>85 and cname='���ݿ�'

--4.	ͳ��CSϵÿ��ͬѧ�Ѿ������ѧ�֣���ʾѧ�š�������ѧ������
select sc.sno,sname,sum(credit)��ѧ�� from student,course,sc
where student.sno=sc.sno and sc.cno=course.cno
 and sdept='cs' group by sc.sno,sname

--5.��ʾ����ͬѧ���޿γ̼��ɼ�
select cname,grade from student,sc,course where sc.cno=course.cno 
and sc.sno=student.sno and sname='����'

--6.��ʾƽ���ɼ�75�����ϵĿγ�������ƽ���ɼ�
select cname,avg(grade)ƽ���� from sc,course
where sc.cno=course.cno group by cname having avg(grade)>75

--7.��ʾƽ���ɼ�80������ͬѧ��ѧ�š�������ƽ���ɼ�
select student.sno,sname,avg(grade)ƽ���ɼ� from student,sc where 
student.sno=sc.sno group by student.sno,sname having avg(grade)>80

--8.��ʾû��ѡ���κογ̵�ѧ��ѧ�š����� 
select student.sno,sname from student where sno not in(select sno from sc)

--9.��ʾû���޹����ݿ��ͬѧ�����ƣ�����ѧ�š�����
select sno,sname from student where sno not in(select sno from sc where
cno=(select cno from course where cname='���ݿ�'))

--10.��ʾ������1�����ϵ�ͬѧѧ�š�����������
select sc.sno,sname,count(grade)���������� from sc,student where 
sc.sno=student.sno group by sc.sno,sname,grade having grade<60

--11.����ѧ��ͳ��ѧ����ͬ�Ŀγ���
select count(credit)ѧ����ͬ�Ŀγ��� from course group by cname having credit 

select count(cname) from course group by cname,credit having credit=(select credit from course
 where cname='���ݿ�') 