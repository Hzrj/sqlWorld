use xsgl
--1．	查询所有选修了课程编号为3的学生信息。
SELECT SNO,SNAME,SSEX,SAGE,SDEPT FROM STUDENT WHERE  EXISTS(
SELECT CNO FROM SC WHERE CNO='3' AND SNO=STUDENT.SNO)

--2．	查询没有学生不及格的课程信息。<60 课程名
SELECT CNAME ,SNO,GRADE FROM COURSE,SC WHERE COURSE.CNO IN
(SELECT CNO FROM COURSE WHERE GRADE<60 AND SC.CNO=COURSE.CNO)

--3．	查询平均分高于数据库原理的平均分的课程名。
SELECT CNO,CNAME FROM COURSE WHERE CNO IN(SELECT CNO FROM SC GROUP BY CNO HAVING AVG(GRADE)>ANY(SELECT AVG(GRADE)FROM SC GROUP BY CNO HAVING CNO=1) )--4．	查询选课数目最多的学生姓名。
SELECT * FROM STUDENT WHERE SNO IN
(SELECT SNO FROM SC GROUP BY SNO HAVING COUNT(CNO)>=ALL
(SELECT COUNT(CNO) FROM SC GROUP BY SNO) )

--5．	查询年龄比张立大的学生信息。
SELECT SNO,SNAME FROM STUDENT WHERE SAGE >(
SELECT SAGE FROM STUDENT  WHERE SNAME='张立')

--6．	查询学时最少的课程及其学分数。
SELECT SNO,GRADE,SC.CNO FROM SC WHERE SC.CNO IN(
SELECT CNO FROM COURSE WHERE CREDIT IN(
SELECT MIN(CREDIT)FROM COURSE ))

--7．	查询只选修了3号课程的学生信息。
SELECT SNO FROM SC WHERE CNO='3'AND SNO IN 
(SELECT SNO FROM SC GROUP BY SNO HAVING COUNT(CNO)=1 )


--8．	查询这样的学生，他们至少选修了王敏 所选修的所有课程 AIY
--ANY 最少一个  ALL全部 =ANY  包含的意思
SELECT SNO FROM SC WHERE CNO =ANY (
SELECT CNO FROM SC WHERE SNO IN(
SELECT SNO FROM STUDENT WHERE SNAME='王敏' ))