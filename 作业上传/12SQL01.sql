use xsgl
select * from student
SELECT * FROM COURSE
SELECT * FROM SC
--һ��	������ͼ
--�����ݿ��У���Student, Course ��sc ��Ϊ�������һ����ͼ����
--����	��Student, Course ��sc����ѧ����ѧ�ţ��������γ̺ţ��γ������ɼ�����Ϊ��ͼV_S_C_G
CREATE VIEW V_S_C_G
AS
SELECT STUDENT.SNO,SNAME,COURSE.CNO,COURSE.CNAME,SC.GRADE FROM STUDENT,COURSE,SC WHERE STUDENT.SNO=SC.SNO AND COURSE.CNO=SC.CNO

--����	����һ����ӳѧ��������ݵ���ͼV_YEAR�������м���
CREATE VIEW V_YEAP
with encryption--���м���
AS
SELECT SNO,SNAME,SAGE FROM STUDENT 

--����	����λѧ��ѡ�޿γ̵�������ƽ���ɼ�����Ϊ��ͼV_AVG_S_G
CREATE VIEW V_AVG_S_G
AS
SELECT SNAME, AVG(GRADE) AS ƽ����, COUNT(CNO) AS ���� FROM STUDENT,SC GROUP BY SC.SNO,STUDENT.SNO,STUDENT.SNAME HAVING STUDENT.SNO=SC.SNO

--����	�����ſγ̵�ѡ��������ƽ���ɼ�����Ϊ��ͼV_AVG_C_G
CREATE VIEW V_AVG_C_G
AS
SELECT COUNT(SNO) AS �γ̺�ѡ������,AVG(GRADE) AS ƽ���� FROM SC,COURSE GROUP BY COURSE.CNO,SC.CNO HAVING COURSE.CNO=SC.CNO
--SELECT COUNT(SNO) FROM SC WHERE CNO='1'
--SELECT AVG(GRADE) FROM SC WHERE CNO='1'

--����	ʹ����ͼ

--1.	��ѯ������������ͼ�����
CREATE VIEW SELECT
AS 
SELECT * FROM V_AVG_C_G--AVG G
SELECT * FROM V_AVG_S_G
SELECT * FROM V_YEAP
SELECT * FROM V_S_C_G 
--2.	��ѯƽ���ɼ�Ϊ90�����ϵ�ѧ��ѧ�š������ͳɼ���


--3.	��ѯ���γɼ�������ƽ���ɼ���ѧ��ѧ�š��������γ̺ͳɼ���


--4.	��ϵͳ�Ƹ�ϵƽ���ɼ���80�����ϵ�������������������У�

--����	�޸���ͼ

--1.	Ҫͨ����ͼV_S_C_G����ѧ��Ϊ��95006����������Ϊ�����������Ƿ����ʵ�֣���˵��ԭ��

--2.	Ҫͨ����ͼV_AVG_S_G����ѧ��Ϊ��95003����ƽ���ɼ���Ϊ90�֣��Ƿ����ʵ�֣���˵��ԭ��

--3.	������ͼV_YEAR
