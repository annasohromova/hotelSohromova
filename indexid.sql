select * from DimEmployee
create clustered index IX_tblEmployee_Name --loome uus index
on DimEmployee(FirstName)

Drop index DimEmployee.PK_DimEmplo_3214EC070A9D95DB--kustutame index

create clustered Index IX_tblEmployee_Gender_Salary--loome uus clustered index
on tblEmployee(Gender DESC, Salary ASC)

create table [tblEmployee]--loome uus tabel
(
[ID] int Primary Key,
[Name] varchar(50),
[Salary] int,
[Gender] varchar(10),
[City] varchar(50)
)
select * from tblEmployee
insert into tblEmployee values(3, 'John', 4500, 'Male', 'New York')--lisame väärtusi tabeli tblEmployee
insert into tblEmployee values(1, 'Sam', 2500, 'Male', 'London')
insert into tblEmployee values(4, 'Sara', 5500, 'Female', 'Tokyo')
insert into tblEmployee values(5, 'Todd', 3100, 'Male', 'Toronto')
insert into tblEmployee values(2, 'Pam', 6500, 'Female', 'Sydney')

create NonClustered Index IX_tblEmployee_Salary--loome none clustered indexi
on tblEmployee(Salary ASC)

Execute sp_helpindex tblEmployee;--kontroll

insert into tblEmployee values(1, 'Mike', 4500, 'Male', 'New York')--lisame väärtusi
insert into tblEmployee values(1, 'John', 2500, 'Male', 'London')

drop index tblEmployee.PK_tblEmplo_3214EC07236943A5--kustuta index

select * from tblEmployee where Salary>4000 and Salary<8000

delete from tblEmployee where Salary = 2500--kustutame väärtusid mis on 2500 võrdub
update tblEmployee set Salary=9000 where Salary=6500 --uuendame väärtusi

select * from tblEmployee order by Salary;
select * from tblEmployee order by Salary DESC;

select Salary, Count(Salary) as Total
from tblEmployee
group by Salary
