Create trigger guestLisamine --loome uus trigger tabelist guest
on guest
for insert
as
insert logi(kuupaev, kasutaja, andmed, tegevus)
select getdate(), user, 
concat(inserted.first_name, ', ', inserted.last_name),
'guest on lisatud'
from inserted

--kontroll

INSERT INTO guest(first_name, last_name, member_since)--lisame uued väärtused
VALUES ('Anna', 'Sohromova', '2023-08-29');
select * from guest;
select * from logi;




CREATE TRIGGER roomUuendamine--loome uus trigger mis näitab, millal me vahetasime väärtused tabelis room
ON room
AFTER UPDATE
AS
BEGIN
INSERT INTO logi (kuupaev, kasutaja, andmed, tegevus)
SELECT
getdate(),
USER,
CONCAT(
'VANAD - ',
deleted.number, ', ',
deleted.name, ', ',
deleted.status, ', ',
deleted.smoke,
'UUED - ',
inserted.number, ', ',
inserted.name, ', ',
inserted.status, ', ',
inserted.smoke
),
'room on uuendatud'
FROM deleted INNER JOIN inserted ON deleted.id = inserted.id;
END;

--kontroll
select * from room;
UPDATE room set name='mets'
Where id=1;
select * from room;
select * from logi;
