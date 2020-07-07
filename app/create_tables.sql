create table users (username varchar(100) primary key, password varchar(100), full_name varchar(200), is_admin boolean);
insert into users values ('fred','fred','Fred Flinstone', false);
insert into users values ('dalb','al','Dylan', true);
insert into users values ('dongji','cpsc4973','dongji', true);
insert into users values ('lau','lau','lau', false);
insert into users values ('luca', 'luca', 'luca', false);
create table s3_images (username varchar(100), image_name varchar(100));
