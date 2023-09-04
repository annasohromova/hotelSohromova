CREATE TABLE guest(
id int not null Primary key IDENTITY(1,1),
first_name varchar(80),
last_name varchar(80) NULL,
member_since date
);



CREATE TABLE room_type(
id int not null Primary key IDENTITY(1,1),
description varchar(80),
max_capacity int
);

CREATE TABLE reservation(
id int not null Primary key IDENTITY(1,1),
date_in date,
date_out date,
made_by varchar(20),
guest_id int,
foreign key (guest_id) references guest(id)
);


CREATE TABLE reserved_room(
id int not null Primary key IDENTITY(1,1),
number_of_rooms int,
room_type_id int,
foreign key (room_type_id) references room_type(id),
reservation_id int,
foreign key (reservation_id) references reserved_room(id),
status varchar(20)
);


CREATE TABLE room(
id int not null Primary key IDENTITY(1,1),
number varchar(10),
name varchar(40),
status varchar(10),
smoke bit,
room_type_id int,
foreign key (room_type_id) references room_type(id),
);



CREATE TABLE occupied_room(
id int not null Primary key IDENTITY(1,1),
check_in datetime,
check_out datetime,
room_id int,
foreign key (room_id) references room(id),
reservation_id int,
foreign key (reservation_id) references reserved_room(id)
);

CREATE TABLE hosted_at(
id int not null Primary key IDENTITY(1,1),
guest_id int,
foreign key (guest_id) references guest(id),
occupied_room_id int,
foreign key (occupied_room_id) references occupied_room(id)
);
