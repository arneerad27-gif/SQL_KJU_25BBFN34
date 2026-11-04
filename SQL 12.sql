CREATE DATABASE CAMPUS_STORE_DB;
USE CAMPUS_STORE_DB;

CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    subscription_level VARCHAR(20) DEFAULT 'Standard',
    city VARCHAR(50) NOT NULL
);

CREATE TABLE Inventory (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(50) NOT NULL,
    item_category VARCHAR(30) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    available_stock INT DEFAULT 0
);

CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    item_id INT,
    purchase_date DATE NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (item_id) REFERENCES Inventory(item_id)
);

ALTER TABLE Clients ADD contact_number VARCHAR(15);
ALTER TABLE Clients DROP COLUMN contact_number;

INSERT INTO Clients (client_name, email, subscription_level, city) VALUES
('Nikhil Menon', 'nikhil@example.com', 'Gold', 'Mangaluru'),
('Kavya Rao', 'kavya@example.com', 'Standard', 'Kochi'),
('Arjun Das', 'arjun@example.com', 'Gold', 'Mangaluru'),
('Sana Thomas', 'sana@example.com', 'Standard', 'Jaipur'),
('Aditya Jain', 'aditya@example.com', 'Standard', 'Nagpur');

INSERT INTO Inventory (item_name, item_category, unit_price, available_stock) VALUES
('Notebook Computer', 'Electronics', 58000.00, 18),
('Bluetooth Mouse', 'Electronics', 1400.00, 35),
('Gaming Keyboard', 'Electronics', 4200.00, 22),
('Office Recliner', 'Furniture', 9200.00, 12),
('Compact Work Desk', 'Furniture', 13500.00, 7),
('Retired Stock Item', 'Obsolete', 650.00, 0);

INSERT INTO Purchases (client_id, item_id, purchase_date, quantity) VALUES
(1, 1, '2025-08-11', 1),
(1, 2, '2025-08-12', 3),
(2, 4, '2025-08-12', 1),
(3, 1, '2025-08-13', 1),
(4, 5, '2025-08-14', 1),
(5, 2, '2025-08-15', 4);

SET SQL_SAFE_UPDATES = 0;

UPDATE Inventory
SET unit_price = unit_price * 1.05
WHERE item_category = 'Electronics';

DELETE FROM Inventory
WHERE available_stock = 0 AND item_category = 'Obsolete';

SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Clients;
SELECT * FROM Inventory;

SELECT city, COUNT(*) AS client_count
FROM Clients
GROUP BY city;

SELECT
    item_category,
    COUNT(*) AS product_count,
    SUM(available_stock) AS total_stock,
    AVG(unit_price) AS average_price,
    MIN(unit_price) AS lowest_price,
    MAX(unit_price) AS highest_price
FROM Inventory
GROUP BY item_category;

SELECT item_category, AVG(unit_price) AS average_price
FROM Inventory
GROUP BY item_category
HAVING AVG(unit_price) > 5000.00;

SELECT
    pu.purchase_id,
    cl.client_name,
    cl.city,
    inv.item_name,
    inv.item_category,
    pu.quantity,
    inv.unit_price,
    pu.quantity * inv.unit_price AS purchase_total
FROM Purchases pu
INNER JOIN Clients cl ON pu.client_id = cl.client_id
INNER JOIN Inventory inv ON pu.item_id = inv.item_id
ORDER BY purchase_total DESC;