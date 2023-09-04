INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Anna', 'Sohromova', '2023-08-29');
select * from guest;

INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Darja', 'Miljukova', '2023-07-20');
select * from guest;

INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Matvei', 'Kulakovski', '2021-06-29');
select * from guest;

INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Ilia', 'Zverev', '2022-08-29');
select * from guest;

INSERT INTO guest(first_name, last_name, member_since)
VALUES ('Veronika', 'Milovzorova', '2023-07-29');
select * from guest;




INSERT INTO room_type(description, max_capacity)
VALUES ('Tuba metsavaatega', 2);
select * from room_type;


INSERT INTO room_type(description, max_capacity)
VALUES ('Tuba merevaatega', 2);
select * from room_type;




INSERT INTO room(number, name, status, smoke, room_type_id)
VALUES (222, 'meri', 'vaba', 00, 4);
select * from room;


	INSERT INTO hosted_at(guest_id, occupied_room_id)
	VALUES ('1','1');
	select * from hosted_at;



INSERT INTO occupied_room(check_in, check_out, room_id, reservation_id)
VALUES (2023-08-20, 2023-08-23, 1, 1);
select * from occupied_room;



INSERT INTO reserved_room(number_of_rooms, room_type_id, reservation_id, status)
VALUES (220, 1, 1, 1, 'vaba');
select * from reserved_room;


INSERT INTO reservation(date_in, date_out, made_by, guest_id)
VALUES ('2023-11-20', '2023-11-23', 'Lida', 5);
select * from reservation;

