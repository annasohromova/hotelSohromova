CREATE PROCEDURE lisaGuest --loome uus protseduur, saame lisama uut väärtusi
@fname varchar(100),
@lname varchar(100),
@sinse date
as
begin
insert into guest(first_name, last_name, member_since)
values(@fname, @lname, @sinse);
select * from guest;
select * from logi;
end;
--käivitamine
exec lisaGuest 'Anna', 'Sohromova', '2006-02-21';

--Kustutamine ja SELECT
CREATE PROCEDURE deleteGuest
@id int
as 
begin
select * from guest;
delete from guest
where @id=id;
select * from guest;
select * from logi;
end;
--käivitamine
exec deleteGuest 1;



--Kasutajate (guest)arvu leidmine
CREATE PROCEDURE allGuest
AS
BEGIN
    SELECT COUNT(*) AS id FROM guest;
END;
--käivitamine
exec allGuest;
