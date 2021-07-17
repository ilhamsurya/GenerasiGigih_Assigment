-- Create tables that represent the entities
CREATE TABLE users(
     id int not null AUTO_INCREMENT,
     name varchar(50) default null,
     phone varchar(13) default 0 unique,
     primary key (id)
     );

CREATE TABLE orders(
     id int not null AUTO_INCREMENT,
     id_users int,
     order_date date,
     total_price decimal(10,2),
     primary key (id),
     FOREIGN KEY (id_users) REFERENCES users(id)
     );

CREATE TABLE order_details(
     order_id int,
     item_id int,
     FOREIGN KEY (order_id) REFERENCES orders(id),
     FOREIGN KEY (item_id) REFERENCES items(id)
     );

-- Insert minimal 5 dummy records for each entity
INSERT INTO users
    (name,order_date)
VALUES
    ("Budiawan", "+6212345678"),
    ("Mary Jones", "+6289753124"),
    ("Antonio", "+62123000123"),
    ("Jack Hill", "+6210910283"),
    ("Stephan Dest", "++6277716219");

INSERT INTO orders
    (id_users,order_date,total_price)
VALUES
    (1, "2021-02-10", "27000"),
    (2, "2021-02-11", "58000"),
    (3, "2021-02-13", "55000"),
    (4, "2021-03-19", "27000"),
    (5, "2021-03-21", "54000");

INSERT INTO order_details
    (order_id,item_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 4),
    (3, 5),
    (4, 1),
    (4, 2),
    (5, 7),
    (5, 4);

-- Display data which contains all orders information, with their respective customer name and phone information

SELECT orders.id AS "Order ID", orders.order_date AS "Order Date", users.name AS "Customer Name", users.phone AS "Customer Phone", orders.total_price AS "Total", GROUP_CONCAT(items.name) AS "Items Bought"
FROM orders
JOIN users ON orders.id_users = users.id
JOIN order_details ON orders.id = order_details.order_id
JOIN items ON order_details.item_id = items.id
GROUP BY orders.id;