use xsgl
select * from student
SELECT * FROM COURSE
SELECT * FROM SC
--一．	定义视图
--在数据库中，以Student, Course 和sc 表为基础完成一下视图定义
--１．	将Student, Course 和sc表中学生的学号，姓名，课程号，课程名，成绩定义为视图V_S_C_G
CREATE VIEW V_S_C_G
AS
SELECT STUDENT.SNO,SNAME,COURSE.CNO,COURSE.CNAME,SC.GRADE FROM STUDENT,COURSE,SC WHERE STUDENT.SNO=SC.SNO AND COURSE.CNO=SC.CNO

--２．	定义一个反映学生出生年份的视图V_YEAR，并进行加密
CREATE VIEW V_YEAP
with encryption--进行加密
AS
SELECT SNO,SNAME,SAGE FROM STUDENT 

--３．	将各位学生选修课程的门数及平均成绩定义为视图V_AVG_S_G
CREATE VIEW V_AVG_S_G
AS
SELECT SNAME, AVG(GRADE) AS 平均分, COUNT(CNO) AS 门数 FROM STUDENT,SC GROUP BY SC.SNO,STUDENT.SNO,STUDENT.SNAME HAVING STUDENT.SNO=SC.SNO

--４．	将各门课程的选修人数及平均成绩定义为视图V_AVG_C_G
CREATE VIEW V_AVG_C_G
AS
SELECT COUNT(SNO) AS 课程号选修人数,AVG(GRADE) AS 平均分 FROM SC,COURSE GROUP BY COURSE.CNO,SC.CNO HAVING COURSE.CNO=SC.CNO
--SELECT COUNT(SNO) FROM SC WHERE CNO='1'
--SELECT AVG(GRADE) FROM SC WHERE CNO='1'

--二．	使用视图

--1.	查询以上所建的视图结果。
CREATE VIEW SELECT
AS 
SELECT * FROM V_AVG_C_G--AVG G
SELECT * FROM V_AVG_S_G
SELECT * FROM V_YEAP
SELECT * FROM V_S_C_G 
--2.	查询平均成绩为90分以上的学生学号、姓名和成绩；


--3.	查询各课成绩均大于平均成绩的学生学号、姓名、课程和成绩；


--4.	按系统计各系平均成绩在80分以上的人数，结果按降序排列；

--三．	修改视图

--1.	要通过视图V_S_C_G，将学号为“95006”的姓名改为“刘三”，是否可以实现？并说明原因

--2.	要通过视图V_AVG_S_G，将学号为“95003”的平均成绩改为90分，是否可以实现？并说明原因

--3.	解密视图V_YEAR
