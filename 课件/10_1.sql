--��ѯѧ����ѧ�εĿ������������ѧ�š��������γ̺š�
--�γ������ɼ�

--1.ȷ�������������Լ��ű�
--2.ȷ����Щ��֮������ù�ϵ��������ã�
--3.ȷ��������ѯ����

select student.sno,sname,course.cno,cname,grade
from student,sc,course
where student.sno=sc.sno and sc.cno=course.cno
and rtrim(cname)='��ѧ'

--��ѯÿ��ѧ��ѡ����������������������

select sname,count(cno) as num from student,sc
where student.sno=sc.sno group by sname

--��Ȼ���ӵĽ��������������

select sname,count(cno) as num from student,sc
where student.sno*=sc.sno group by sname
order by num

--��ѯ���µĿ������,����ѧ��,����,�γ̺�,�ɼ�
select student.sno,sname,cno,grade from student,sc
where student.sno=sc.sno and rtrim(sname)='����'
O(n^2)
select * from sc where sno=
(select sno from student where sname='����')
O(2n)

--Ƕ�ײ�ѯ���𲽽��δ֪�����Ĺ���

--����ʱ�临�Ӷ� ѭ������

select sdept from student where sname='����'

select * from student where sdept='is'

select * from student where sdept=
(select sdept from student where sname='����')