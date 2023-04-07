Create database PartikTest
use PartikTest

Create table Employee
(
Emp_id int primary key identity,
Emp_Name varchar(50),
Email_Address varchar(100),
Emp_Gender int,
Contact_Number bigint,
Address varchar(100),
Experience varchar(50),
Department varchar(50),
Education varchar(50),
Hobby varchar(50)
)

select * from Employee

drop table Employee

alter procedure AddUpdateEmp
@Emp_id int =null,
@Emp_Name varchar(50),
@Email_Address varchar(100),
@Emp_Gender int,
@Contact_Number bigint,
@Address varchar(100),
@Experience varchar(50),
@Department varchar(50),
@Education varchar(50),
@Hobby varchar(50)
as
begin

if(@Emp_id<0)
begin
--insert--------------------------------------------
insert into Employee(Emp_Name,Email_Address,Emp_Gender,Contact_Number,Address,Experience,Department,Education,Hobby)
values(@Emp_Name,@Email_Address,@Emp_Gender,@Contact_Number,@Address,@Experience,@Department,@Education,@Hobby)
end
else
begin
--update-------------
Update Employee set 
Emp_Name=@Emp_Name,Email_Address=@Email_Address,Emp_Gender=@Emp_Gender,Contact_Number=@Contact_Number,Address=@Address,Experience=@Experience,
Department=@Department,Education=@Education,Hobby=@Hobby where Emp_id=@Emp_id
end

end
------------------------------------Delete---------------------------------
Create Procedure DeleteEmp 
@DeleteEmp int
as
begin
delete from Employee where Emp_id=@DeleteEmp
end


------------------------------------Emp_Get_Record------------------------------
alter Procedure GetEmp_Record 
as
begin
select * from Employee 
end
--------------------------------------------------------------------------------------
--truncate table Employee

alter procedure GetEmpEditRecord
@Emp_id int
as
begin
select * from Employee where Emp_id=@Emp_id
end