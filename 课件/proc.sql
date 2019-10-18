create proc Slt_stu
as
select * from student

exec slt_stu

create proc slt_stu_by_sno @sno nchar(10)
as
select * from student where sno=@sno

exec slt_stu_by_sno '95002'

create proc slt_name_by_sno @sno nchar(10),
@sname nchar(10) output
as
select @sname=sname from student where sno=@sno
select @sname

declare @sname nchar(10)
exec slt_name_by_sno '95001',@sname
