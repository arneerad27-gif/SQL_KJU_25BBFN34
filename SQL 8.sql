CREATE DATABASE retail_hub;
USE retail_hub;

CREATE TABLE Client
(
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(30)
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

SELECT * FROM Client;
SELECT * FROM Inventory;

DESC Client;
DESC Inventory;

ALTER TABLE Client
ADD address VARCHAR(100);

DESC Client;

ALTER TABLE Client
MODIFY phone VARCHAR(25);

DESC Client;

ALTER TABLE Client
RENAME COLUMN city TO client_city;

DESC Client;

ALTER TABLE Client
DROP COLUMN address;

DESC Client;

TRUNCATE TABLE Client;
TRUNCATE TABLE Inventory;

DESC Client;

DROP TABLE Inventory;
DROP TABLE Client;

DROP DATABASE retail_hub;