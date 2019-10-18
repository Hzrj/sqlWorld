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
CREATE VIEW SELECT01
AS 
SELECT * FROM V_AVG_C_G--AVG G
SELECT * FROM V_AVG_S_G
SELECT * FROM V_YEAP
SELECT * FROM V_S_C_G 
--2.	��ѯƽ���ɼ�Ϊ90�����ϵ�ѧ��ѧ�š������ͳɼ���
SELECT SNO,V_AVG_S_G.SNAME,ƽ���� FROM V_AVG_S_G,V_S_C_G WHERE V_AVG_S_G.SNAME=V_S_C_G.SNAME AND ƽ����>90

--3.	��ѯ���γɼ�������ƽ���ɼ���ѧ��ѧ�š��������γ̺ͳɼ���
SELECT SNO,SNAME,CNO,CNAME,GRADE FROM V_AVG_S_G
--��ѯƽ���ɼ���ѧ��ѧ�š��������γ̺ͳɼ���
SELECT 
SELECT * FROM V_AVG_C_G 
SELECT * FROM V_AVG_S_G

SELECT SNO,SNAME,CNAME,GRADE FROM V_S_C_G GROUP BY SNO,SNAME,CNAME,GRADE HAVING GRADE>85
SELECT CNO ,GRADE FROM V_S_C_G WHERE EXISTS()
SELECT AVG(GRADE) FROM V_S_C_G
SELECT SNO,SNAME,CNAME,GRADE FROM V_S_C_G  GROUP BY SNO,SNAME,CNAME,GRADE HAVING GRADE> (SELECT AVG(GRADE) FROM V_S_C_G
)
SELECT SNO FROM V_S_C_G HAVING AVG(GRADE)>0
--4.	��ϵͳ�Ƹ�ϵƽ���ɼ���80�����ϵ�������������������У�
CREATE VIEW V_S_C
AS
SELECT SNO AS ѧ��,SDEPT as ϵ��, COUNT(SDEPT) as ���� FROM STUDENT WHERE SNO IN( 
SELECT SNO FROM SC  WHERE GRADE>80 )GROUP BY SNO,SDEPT
SELECT * FROM V_S_C ORDER BY V_S_C.ѧ��  DESC 
--����	�޸���ͼ, --COUNT(GRADE) GROUP BY SNO

--1.	Ҫͨ����ͼV_S_C_G����ѧ��Ϊ��95004����������Ϊ�����������Ƿ����ʵ�֣���˵��ԭ��
UPDATE V_S_C_G SET SNAME='����' WHERE SNO='95004'
SELECT * FROM V_S_C_G
--����ʵ�֣� ��Ϊ���������ݿ��Ա��޸ģ����Ҳ�ǶԵģ��������޸�

--2.	Ҫͨ����ͼV_AVG_S_G����ѧ��Ϊ��95003����ƽ���ɼ���Ϊ90�֣��Ƿ����ʵ�֣���˵��ԭ��
UPDATE V_AVG_S_G SET ƽ����='90' WHERE SNAME='����'
SELECT * FROM V_AVG_S_G
--����ʧ�� ��ʾ����ͼ���� 'V_AVG_S_G' �ĸ��»����ʧ�ܣ���������������������û�п���

--3.	������ͼV_YEAR
