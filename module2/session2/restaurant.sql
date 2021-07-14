SHOW DATABASES;

USE DATABASES;

SHOW TABLES;

DESCRIBE TABLES;

ALTER TABLE CATEGORIES ADD name varchar (50)

create table items(
     id int not null ,
     name varchar(50) default null,
     price int default 0,
     primary key (id)
     );

insert into items (id,name,price) values (1,'Baso Tahu',12500);

select * from items;