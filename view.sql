create table tblEmployee
(
ID int Primary Key,
Name varchar(50),
Salary int,
Gender varchar(10),
DepartmentID int, 
)

create table tblDepartment
(
DeptID int primary key,
DeptName varchar(20)
)

Insert into tblDepartment values(1, 'IT')
Insert into tblDepartment values(2, 'Payroll')
Insert into tblDepartment values(3, 'HR')
Insert into tblDepartment values(4, 'Admin')

insert into tblEmployee values(1, 'John', 5000, 'Male', 3)
insert into tblEmployee values(2, 'Mike', 3400, 'Male', 2)
insert into tblEmployee values(3, 'Pam', 6000, 'Female', 1)
insert into tblEmployee values(4, 'Todd', 4800, 'Male', 4)
insert into tblEmployee values(5, 'Sara', 3200, 'Female', 1)
insert into tblEmployee values(6, 'Ben', 4800, 'Male', 3)

select * from tblDepartment;
select * from tblEmployee

select ID, Name, Salary, Gender, DeptName
from tblEmployee
inner join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.DeptID

create View vWEEmployeesByDepartment
as
select ID, Name, Salary, Gender, DeptName
from tblEmployee
inner join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.DeptID


select * from vWEEmployeesByDepartment;

create View vWITDepartment_Employees
as
select ID, Name, Salary, Gender, DeptName
from tblEmployee
inner join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.DeptID
where tblDepartment.DeptName = 'IT'
select * from vWITDepartment_Employees

create view vWEmployeesNonConfidentalData
as
Select ID, Name, Gender, DeptName
from tblEmployee
inner join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.DeptID

create view vWEmployeesCountByDepartment
as
select DeptName, count(ID) as TotalEmployees
from tblEmployee
inner join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.DeptID
group by DeptName

select * from vWEmployeesCountByDepartment


create view vWEmployeesDataExceptSalary
as
Select ID, Name, Gender, DepartmentID
from tblEmployee
select * from vWEmployeesDataExceptSalary

update vWEmployeesDataExceptSalary
set Name='Mikey' where id=2


delete from vWEmployeesDataExceptSalary where id=2
insert into vWEmployeesDataExceptSalary values (2, 'Mikey', 'Male', 2)

create view vwEmployeeDetailsByDepartment
as 
select ID, Name, Salary, Gender, DeptName
from tblEmployee
inner join tblDepartment
on tblEmployee.DepartmentID = tblDepartment.DeptID
select * from vwEmployeeDetailsByDepartment

update vWEEmployeesByDepartment
set DeptName='IT' where Name='John'
