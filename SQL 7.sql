CREATE DATABASE retail_store;
USE retail_store;

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

DESC Client;
DESC Inventory;