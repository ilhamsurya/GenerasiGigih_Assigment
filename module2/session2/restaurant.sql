SHOW DATABASES;

USE DATABASES;

SHOW TABLES;

DESCRIBE TABLES;

ALTER TABLE CATEGORIES ADD name varchar (50)

create table items(
     id int NOT NULL AUTO_INCREMENT ,
     name varchar(50) default null,
     price int default 0,
     primary key (id)
     );

insert into items (id,name,price) values (3,'Baso Tahu',12500);

select * from items;

select * from items where price >= 5000 and price <= 25000;

select * from items where price between 5000 and 25000; 

select * from items where name = 'Baso Tahu';

select * from items where name '%Baso%';

update items set name = 'Siomay' where id = 1;

update items set name = 'Ayam Goreng', price= 5000 where id = 2;

delete from items where name = "Ayam Goreng";

INSERT INTO items
    (name,price)
VALUES
    ("Nasi Goreng",25000),
    ("Ice Water",2000),
    ("Spaghetti",40000),
    ("Green Tea",18000),
    ("Orange Juice",15000),
    ("Vanilla Ice Cream",13000),
    ("Gordon Blue",36000),
    ("French Fries",20000);

INSERT INTO item_categories
    (item_id,category_id)
VALUES
    (5,2),
    (6,3),
    (7,1);

select items.id, items.name,item_categories.category_id from items left join item_categories on items.id = item_categories.item_id;

select items.id, items.name,item_categories.category_id from items join item_categories on items.id = item_categories.item_id;

select items.id, items.name,item_categories.category_id from items right join item_categories on items.id = item_categories.item_id;


select items.id, items.name,item_categories.category_id from items right join item_categories on items.id = item_categories.item_id;

select items.id, items.name,items.price, categories.name from items join categories on items.id = categories.id join item_categories on categories.id = item_categories.category_id;

select items.id, items.name from items join categories on items.id = categories.id where categories.name = "main dish";

select items.id, items.name, items.price from items join categories on items.id = categories.id join item_categories on categories.id = item_categories.category_id where categories.name = "main dish" and items.price > 30000;

select items.id, items.name, items.price from items join categories on items.id = categories.id join item_categories on categories.id = item_categories.category_id where categories.name = null;

alter table item_categories modify item_id int not null;

alter table item_categories modify category_id int not null;

alter table item_categories;

add foreign key (item_id) references items(id);
alter table item_categories;
add foreign key (category_id) references categories(id);

create unique index name on categories(name);

SELECT items.*, categories.name as category_name, categories.id as category_id
      FROM items 
      JOIN item_categories ON items.id = item_categories.item_id 
      JOIN categories ON item_categories.category_id = categories.id
      WHERE items.id = 3;