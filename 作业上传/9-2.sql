
select *from student
--1.	ͳ�Ƹ�ϵ����Ů��������ͳ�ƽ������ϵ������
select sdept,ssex ,count(*)from student where ssex='��'or ssex='Ů'group by sdept,ssex order by sdept asc
select ssex,count(sno) from student
group by ssex


--2.	��ѯ���ſε���߳ɼ���
select max(grade) from sc where cno='1'
select max(grade) from sc where cno='2'
select max(grade) from sc where cno='3'
--��
select cno,MAX(grade) as maxgrade from sc group by cno

--3.	��ѯƽ����85�����ϵĿγ̺š�

select cno,count(cno) from sc where grade>=85
group by cno
--select cno,AVG(grade)as ƽ���ɼ� from sc where avg(grade)>85
group by cno ;

--4.	���γ̺ŶԳɼ��������������ͬ�ſγ̵İ��ɼ���������
select * from sc order by grade desc--����
select * from sc order by grade asc--����

--5.	��ѯѡ������3�����ϵĿγ̡�
select cno ,count(sno)as ss from sc where sno>=3
order by 

