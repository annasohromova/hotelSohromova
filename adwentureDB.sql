--funkts.loomine
select * from DimEmployee;

create function ILTVF_DimEmployee()
returns table
as
return(select EmployeeKey, FirstName,cast(BirthDate as date) as DOB
from DimEmployee)

Select * from ILTVF_DimEmployee();



create function MSTVF_DimEmployee()
returns @Table Table (id int, FirstName varchar(20), DOB date)
as begin 
insert into @Table
select EmployeeKey, FirstName, cast(BirthDate as Date)
from DimEmployee
return
end

select * from MSTVF_DimEmployee();


Update ILTVF_DimEmployee() set FirstName='Sam1' Where id=1

create function fn_GetEmployeeNameByld(@Id int)
returns varchar(20)
as begin
return(select FirstName from DimEmployee where EmployeeKey=@Id)
end

select dbo.fn_GetEmployeeNameByld(17)


alter function fn_GetEmployeeNameByld(@Id int)
returns varchar(20)
with SchemaBinding
as begin
return(select FirstName from dbo.DimEmployee Where EmployeeKey=@Id)
end

select dbo.fn_GetEmployeeNameByld(47)

  
--
--ajutisedtabelid
  
Create Table #PersonDetails(Id int, Name varchar(20))

insert into #PersonDetails values (1, 'Mike')
insert into #PersonDetails values (2, 'John')
insert into #PersonDetails values (3, 'Todd')
select * from #PersonDetails;

select Name from tempdb.sys.all_objects
where Name like '#PersonDetails'

create Procedure spCreateLocalTemplTable
as begin
create table #PersonDetails(id int, Name varchar(20))

insert into #PersonDetails values (1, 'Mike')
insert into #PersonDetails values (2, 'John')
insert into #PersonDetails values (3, 'Todd')

select * from #PersonDetails
end;


create table ##EmployeeDetails(Id int, Name varchar(20))
--ideksidServeris

Select * from DimEmployee where BaseRate > 35 and BaseRate < 50

create Index IX_tblEmployee_Salary
ON DimEmployee(BaseRate ASC)

select top 10 * from DimEmployee order by IX_tblEmployee_Salary

exec sys.sp_helpindex @Objname = 'DimEmployee'


drop index DimEmployee.IX_tblEmployee_Salary
drop index DimEmployee.IX_tblEmployee_Name
