--1����ѯȫ��ѧ����ѧ�ź�������
select sname,sno from student;

--2����ѯȫ��ѧ������ϸ��Ϣ��
select * from  student

--3����ѯȫ��ѧ�����������������ݡ�
select sname,2018-sage from student

--4����ѯ����������19�����ϵ�ѧ�������Լ����䡣
select sname from student where sage>19

--5����ѯ���Գɼ��������ѧ����ѧ�ż���ѡ�γ̺š�
select sno cno  from sc where grade<60

--6����ѯ������18-19��֮���ѧ�������������䡣
select sname ,sage from student where sage <=19 and sage>=18

--7����ѯ����������ѧ����������ѧ�ź��Ա�
select sname ,sno,ssex from student where sname like '��%';

--8����ѯ�ա�������ȫ��Ϊ�������ֵ�ѧ����������
select sname,sno from student where sname like '��____';

--9����ѯ���в�������ѧ����������ѧ�š�
select sname ,sno from student where sname not like'��%';

--10����ѯѡ����3�ſγ̵�ѧ����ѧ�ż���ɼ�����ѯ����������Ľ������С�
select  cno,sno,grade from sc where cno='3' order by grade desc;

--11��ͳ��ѧ����������
select  count(*)from student;

--12������ѡ����1�ſγ̵�ѧ��ƽ���ɼ���
select avg(grade) from sc where cno='1';

--13����ѯѡ����1�ſγ̵�ѧ����߷�����
select max(grade) from sc where cno='1';

--14������γ̺ż���Ӧ��ѡ��������
select cno ,count(sno) from sc group by cno;

--15����ѯѡ��2�ſγ��ҳɼ���85�����ϵ�����ѧ����
select  cno,sno,grade from sc where cno='2'and grade>85;


