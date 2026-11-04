CREATE DATABASE COMPANY_DB;
USE COMPANY_DB;

CREATE TABLE Client
(
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    client_city VARCHAR(30)
);

CREATE TABLE Inventory
(
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    price DECIMAL(10,2),
    quantity INT
);

SHOW DATABASES;
SHOW TABLES;
DESC Client;
DESC Inventory;

ALTER TABLE Client
ADD address VARCHAR(100);

DESC Client;

ALTER TABLE Client
MODIFY phone VARCHAR(25);

DESC Client;

ALTER TABLE Client
RENAME COLUMN client_city TO city;

DESC Client;

ALTER TABLE Client
DROP COLUMN address;

DESC Client;

INSERT INTO Client
(client_name, email, phone, city)
VALUES
('Meera', 'meera@example.com', '9123456701', 'Kochi'),
('Rahul', 'rahul@example.com', '9123456702', 'Mysuru'),
('Ananya', 'ananya@example.com', '9123456703', 'Pune'),
('Vivek', 'vivek@example.com', '9123456704', 'Jaipur'),
('Nisha', 'nisha@example.com', '9123456705', 'Coimbatore');

SELECT * FROM Client;

INSERT INTO Inventory
(item_name, category, price, quantity)
VALUES
('Tablet', 'Electronics', 32000.00, 12),
('Wireless Mouse', 'Electronics', 1200.00, 30),
('Mechanical Keyboard', 'Electronics', 2800.00, 18),
('Bookshelf', 'Furniture', 6800.00, 14),
('Study Table', 'Furniture', 10500.00, 9);

SELECT * FROM Inventory;

UPDATE Client
SET phone = '9000011111'
WHERE client_id = 1;

SELECT * FROM Client;

UPDATE Inventory
SET price = 33500.00
WHERE item_id = 1;

SELECT * FROM Inventory;

UPDATE Inventory
SET price = 1350.00,
    quantity = 35
WHERE item_id = 2;

SELECT * FROM Inventory;

DELETE FROM Client
WHERE client_id = 5;

SELECT * FROM Client;

DELETE FROM Inventory
WHERE item_id = 5;

SELECT * FROM Inventory;

SELECT * FROM Client;
SELECT * FROM Inventory;

TRUNCATE TABLE Client;
TRUNCATE TABLE Inventory;

DROP TABLE Inventory;
DROP TABLE Client;

DROP DATABASE COMPANY_DB;