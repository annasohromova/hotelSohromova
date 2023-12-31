create table tblProduct--loome tabeli tblProduct
(
ProductId int primary key,
Name varchar(20),
UnitPrice int
)

select * from tblProduct

insert into tblProduct values(1, 'Books', 20)--lisame väärtusi
insert into tblProduct values(2, 'Pens', 14)
insert into tblProduct values(3, 'Pencils', 11)
insert into tblProduct values(4, 'Clips', 10)

create table tblProductSales--loome tabeli tblProductSales
(
ProductId int, 
QuantitySold int
)
select * from tblProductSales
insert into tblProductSales values(1,10)--lisame väärtusi
insert into tblProductSales values(3,23)
insert into tblProductSales values(4,21)
insert into tblProductSales values(2,12)
insert into tblProductSales values(1,13)
insert into tblProductSales values(3,12)
insert into tblProductSales values(4,13)
insert into tblProductSales values(1,11)
insert into tblProductSales values(2,12)
insert into tblProductSales values(1,14)

create view vWTotalSalesByProduct --loome view tabelist tblProductSales
with SchemaBinding
as
Select Name,
SUM(ISNULL((QuantitySold * UnitPrice), 0)) as TotalSales,
COUNT_BIG(*) as TotalTransactions
from dbo.tblProductSales
inner join dbo.tblProduct
on dbo.tblProduct.ProductId = dbo.tblProductSales.ProductId
group by Name

select * from vWTotalSalesByProduct

Create Unique Clustered Index UIX_vWTotalSalesByProduct_Name --loome indexi
on vWTotalSalesByProduct(Name)


CREATE TABLE tblEmployee --loome tabeli tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

Insert into tblEmployee values (1,'John', 5000, 'Male', 3) --lisame väärtusi
Insert into tblEmployee values (2,'Mike', 3400, 'Male', 2)
Insert into tblEmployee values (3,'Pam', 6000, 'Female', 1)
Insert into tblEmployee values (4,'Todd', 4800, 'Male', 4)
Insert into tblEmployee values (5,'Sara', 3200, 'Female', 1)
Insert into tblEmployee values (6,'Ben', 4800, 'Male', 3)

select * from tblEmployee

Create View vWEmployeeDetails --loome view tabelist tblEmployee
@Gender nvarchar(20)
as
Select Id, Name, Gender, DepartmentId
from  tblEmployee
where Gender = @Gender

Create function fnEmployeeDetails(@Gender nvarchar(20)) --loome funktsioon, mis näitab Id, Name, Gender, DepartmentId
Returns Table
as
Return 
(Select Id, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)

Select * from dbo.fnEmployeeDetails('Male')

Create View vWEmployeeDetailsSorted--loome view tabelist tblEmployee
as
Select Id, Name, Gender, DepartmentId
from tblEmployee
order by Id


Create Table ##TestTempTable(Id int, Name nvarchar(20), Gender nvarchar(10))--Loome uus tabel ##TestTempTable

Insert into ##TestTempTable values(101, 'Martin', 'Male')
Insert into ##TestTempTable values(102, 'Joe', 'Female')
Insert into ##TestTempTable values(103, 'Pam', 'Female')
Insert into ##TestTempTable values(104, 'James', 'Male')

Select * from ##TestTempTable

Create View vwOnTempTable--loome view
as
Select Id, Name, Gender
from ##TestTempTable


create trigger trMyFirstTrigger--loome triggeri mis printib 'new table created' kui tehtud uus tabel
On Database
For Create_Table
as 
begin
print'New table created'
end

create table Test(Id int)

alter trigger trMyFirstTrigger --muutume triggeri
on database
for create_table, alter_table, drop_table
as
begin
print 'A table has just been created. modified or deleted'
end

drop table Test --kutstuta tabel

alter trigger trMyFirstTrigger --muutume trigger
on database
for create_table, alter_table, drop_table
as begin
rollback
print 'You cannot sreate, alter or drop a table'
end

disable trigger trMyFirstTrigger on database--välja lülita trigger

drop trigger trMyFirstTrigger on database--kustuta trigger

create trigger trRenameTable --loome uus trigger 
on database
for rename
as
begin
print 'You just renamed something'
end

create trigger tr_DatabseScopeTrigger--loome uus trigger 
on database
for create_table, alter_table, drop_table
as
begin
rollback
print 'You cannot create, alter or drop a table in the current database'
end

create trigger tr_ServerScopeTrigger--loome uus trigger 
on all server
for create_table, alter_table, drop_table
as 
begin
rollback
print 'You cannot create, alter or drop a table in any database on the server'
end

disable trigger tr_ServerScopeTrigger on all server--väla lülita trigger

enable trigger tr_ServerScopeTrigger on all server

drop trigger tr_ServerScopeTrigger on all server--kustuta trigger

create trigger tr_DatabaseScopeTrigger--loome uus trigger 
on database
for create_table
as
begin
print 'Database Scope Trigger'
end
go

create trigger tr_ServerScopeTrigger--loome uus trigger 
on all server
for create_table
as
begin
priny 'Server Scope Trigger'
end
go

exec sp_settriggerorder--vaatame kuidas töötab trigger
@triggername = 'tr_DatabaseScopeTrigger',
@order = 'none',
@stmttype = 'CREATE_TABLE',
@namespace = 'DATABASE'
go

create trigger tr_LogonAuditTriggers--loome uus trigger 
on all server
for logon
as
begin
declare @LoginName varchar(100)
set @LoginName=ORIGINAL_LOGIN()
if (select count(*) from sys.dm_exec_sessions
where is_user_process=1
and original_login_name=@LoginName)>3
begin
print 'Fourth connection of' + @LoginName + 'blocked'
rollback
end
end

Execute sp_readerrorlog

disable trigger tr_LogonAuditTriggers on all server
