--1.	��ʾѡ���ˡ����ݿ⡱������ͬѧ��ѧ�š�����
select sname ,sno from student where sno in
(select sno from sc where cno=
(select cno from course where cname='���ݿ�'))
--�𲽽������

--SELECT Sname  /*����ѯ�򸸲�ѯ*/
--FROM Student
--WHERE Sno IN
--    (SELECT Sno  /*�ڲ��ѯ���Ӳ�ѯ*/
--     FROM SC
--     WHERE Cno='2');
--select * from sc where sno=
--(select sno from student where sname='����')


--2.	��ѯ���γ����͸��γ�ƽ����
select cno ,avg(grade)as �γ�ƽ���� from sc group by cno 
select cname from course where cno in
(select cno from sc)
--or---��Ȼ����
select cname,avg(grade) as ƽ���� from course,sc
where course.cno*=sc.cno group by cname
order by ƽ���� desc

--3.	��ʾ���ݿ���ĩ�ɼ�85�����ϵ�ͬѧ��ѧ�š���������ĩ�ɼ�
--���ݿ���ĩ�ɼ�85
select sno,grade from sc where grade>=85 and cno='1'
select sno,sname grade from student where sno in
(select sno from sc where grade>=85 and cno='1') 

--4.	ͳ��CSϵÿ��ͬѧ�Ѿ������ѧ�֣���ʾѧ�š�������ѧ������

--5.	��ʾ����ͬѧ���޿γ̼��ɼ�

--6.	��ʾƽ���ɼ�75�����ϵĿγ�������ƽ���ɼ�

--7.	��ʾƽ���ɼ�80������ͬѧ��ѧ�š�������ƽ���ɼ�

--8.	��ʾû��ѡ���κογ̵�ѧ��ѧ�š����� 

--9.	��ʾû���޹����ݿ��ͬѧ�����ƣ�����ѧ�š�����

--10.	��ʾ������1�����ϵ�ͬѧѧ�š�����������

--11.	����ѧ��ͳ��ѧ����ͬ�Ŀγ���
