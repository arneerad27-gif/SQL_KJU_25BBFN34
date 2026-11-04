CREATE DATABASE RevenueTracker;
USE RevenueTracker;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE NOT NULL,
    territory VARCHAR(10) NOT NULL,
    item_name VARCHAR(30) NOT NULL,
    units_sold INT NOT NULL,
    unit_price INT NOT NULL
);

INSERT INTO transactions
(transaction_id, transaction_date, territory, item_name, units_sold, unit_price)
VALUES
(101, '2025-08-02', 'Central', 'Tablet',     3, 32000),
(102, '2025-08-04', 'Coastal', 'Smartwatch',  6, 12000),
(103, '2025-08-06', 'Highland','Speaker',     8,  3500),
(104, '2025-08-09', 'Metro',   'Smartwatch',  4, 12000),
(105, '2025-08-11', 'Central', 'Smartwatch',  5, 12000),
(106, '2025-08-13', 'Coastal', 'Tablet',      2, 32000),
(107, '2025-08-16', 'Highland','Tablet',      1, 32000),
(108, '2025-08-19', 'Metro',   'Speaker',     9,  3500),
(109, '2025-08-21', 'Central', 'Speaker',     7,  3500),
(110, '2025-08-26', 'Coastal', 'Speaker',    11,  3500);

SELECT * FROM transactions;

SELECT COUNT(*) AS total_transactions FROM transactions;
SELECT COUNT(*) AS central_transactions FROM transactions WHERE territory = 'Central';
SELECT territory, COUNT(*) AS transaction_count
FROM transactions
GROUP BY territory;

SELECT SUM(units_sold) AS total_units_sold FROM transactions;
SELECT SUM(units_sold * unit_price) AS total_revenue FROM transactions;
SELECT item_name, SUM(units_sold * unit_price) AS revenue
FROM transactions
GROUP BY item_name;

SELECT AVG(units_sold) AS average_units FROM transactions;
SELECT AVG(units_sold * unit_price) AS average_transaction_value FROM transactions;
SELECT territory, AVG(units_sold * unit_price) AS average_transaction_value
FROM transactions
GROUP BY territory;

SELECT MIN(unit_price) AS lowest_unit_price,
       MIN(units_sold * unit_price) AS smallest_transaction
FROM transactions;

SELECT MIN(transaction_date) AS earliest_transaction FROM transactions;
SELECT territory, MIN(units_sold * unit_price) AS smallest_transaction
FROM transactions
GROUP BY territory;

SELECT MAX(unit_price) AS highest_unit_price,
       MAX(units_sold * unit_price) AS largest_transaction
FROM transactions;

SELECT MAX(transaction_date) AS latest_transaction FROM transactions;
SELECT territory, MAX(units_sold * unit_price) AS largest_transaction
FROM transactions
GROUP BY territory;

SELECT COUNT(*) AS total_transactions,
       SUM(units_sold * unit_price) AS total_revenue,
       AVG(units_sold * unit_price) AS average_transaction,
       MIN(units_sold * unit_price) AS smallest_transaction,
       MAX(units_sold * unit_price) AS largest_transaction
FROM transactions;

SELECT territory,
       COUNT(*) AS transaction_count,
       SUM(units_sold * unit_price) AS revenue,
       AVG(units_sold * unit_price) AS average_transaction,
       MIN(units_sold * unit_price) AS smallest_transaction,
       MAX(units_sold * unit_price) AS largest_transaction
FROM transactions
GROUP BY territory
ORDER BY revenue DESC;

SELECT transaction_id, transaction_date, territory, item_name,
       units_sold * unit_price AS transaction_value
FROM transactions
WHERE units_sold * unit_price =
      (SELECT MAX(units_sold * unit_price) FROM transactions);