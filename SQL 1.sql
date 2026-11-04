CREATE DATABASE CityBankDB;
USE CityBankDB;


CREATE TABLE branches (
    branch_id INT AUTO_INCREMENT PRIMARY KEY,
    branch_name VARCHAR(60) NOT NULL UNIQUE,
    city VARCHAR(50) DEFAULT 'Kochi'
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(80) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50) DEFAULT 'Kochi',
    joined_date DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL DEFAULT 'Savings',
    balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    opened_date DATE NOT NULL,
    status VARCHAR(15) NOT NULL DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE transactions (
    txn_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    txn_type VARCHAR(12) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    txn_date DATE NOT NULL,
    remarks VARCHAR(100),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type VARCHAR(30) NOT NULL,
    principal DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    start_date DATE NOT NULL,
    status VARCHAR(15) NOT NULL DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


ALTER TABLE customers ADD COLUMN phone VARCHAR(15);
ALTER TABLE customers ADD COLUMN credit_score INT DEFAULT 700;
ALTER TABLE customers MODIFY COLUMN phone VARCHAR(20);
ALTER TABLE customers RENAME COLUMN phone TO mobile_no;
ALTER TABLE customers DROP COLUMN mobile_no;
ALTER TABLE loans ADD COLUMN end_date DATE;


CREATE INDEX idx_txn_date ON transactions(txn_date);


CREATE TABLE atm_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(200) NOT NULL
);

INSERT INTO atm_log (message) VALUES
('ATM 05 cash low'),
('ATM 09 card jam'),
('ATM 02 restocked');

TRUNCATE TABLE atm_log;
DROP TABLE atm_log;

DESCRIBE accounts;
SHOW TABLES;


INSERT INTO branches (branch_name, city) VALUES
('MG Road Branch', 'Kochi'),
('Anna Nagar Branch', 'Chennai'),
('Civil Lines Branch', 'Jaipur'),
('Banjara Hills Branch', 'Hyderabad');

INSERT INTO customers (full_name, email, city, joined_date) VALUES
('Akhil Nair', 'akhil@example.com', 'Kochi', '2022-04-12'),
('Meera Pillai', 'meera@example.com', 'Chennai', '2021-08-23'),
('Rohan Sharma', 'rohan@example.com', 'Jaipur', '2023-02-17'),
('Ananya Das', 'ananya@example.com', 'Kolkata', '2023-07-09'),
('Vivek Menon', 'vivek@example.com', 'Hyderabad', '2020-12-05'),
('Sneha Kapoor', 'sneha@example.com', 'Jaipur', '2022-10-14'),
('Farhan Ali', 'farhan@example.com', 'Kochi', '2024-03-21'),
('Divya Joseph', 'divya@example.com', 'Chennai', '2026-08-25');

INSERT INTO accounts
(customer_id, branch_id, account_type, balance, opened_date) VALUES
(1, 1, 'Savings', 92000.00, '2022-04-12'),
(1, 1, 'Current', 210000.00, '2022-06-10'),
(2, 2, 'Savings', 135000.00, '2021-08-23'),
(3, 3, 'Savings', 52000.00, '2023-02-17'),
(4, 1, 'Savings', 38000.00, '2023-07-09'),
(5, 4, 'Savings', 110000.00, '2020-12-05'),
(6, 3, 'Current', 360000.00, '2022-10-14'),
(7, 1, 'Savings', 18000.00, '2024-03-21'),
(2, 2, 'Fixed Deposit', 280000.00, '2025-02-15'),
(5, 4, 'Current', 165000.00, '2021-05-18');

INSERT INTO transactions
(account_id, txn_type, amount, txn_date, remarks) VALUES
(1, 'Deposit', 18000.00, '2026-07-04', 'Monthly salary'),
(1, 'Withdrawal', 4500.00, '2026-07-12', 'ATM cash'),
(3, 'Deposit', 32000.00, '2026-07-06', 'Salary credit'),
(3, 'Withdrawal', 11000.00, '2026-07-19', 'House rent'),
(4, 'Deposit', 12000.00, '2026-07-23', 'Cash deposit'),
(6, 'Withdrawal', 7500.00, '2026-08-03', 'ATM cash'),
(7, 'Deposit', 140000.00, '2026-08-06', 'Business receipt'),
(7, 'Withdrawal', 55000.00, '2026-08-20', 'Supplier payment'),
(2, 'Deposit', 68000.00, '2026-08-26', 'Sales proceeds'),
(8, 'Withdrawal', 2500.00, '2026-09-02', 'ATM cash'),
(5, 'Deposit', 6500.00, '2026-09-05', 'Cash deposit'),
(10, 'Deposit', 85000.00, '2026-09-11', 'Customer payment'),
(3, 'Withdrawal', 18000.00, '2026-09-16', 'Insurance payment'),
(6, 'Deposit', 22000.00, '2026-09-21', 'Salary credit'),
(1, 'Withdrawal', 13000.00, '2026-09-23', 'Online purchase');

INSERT INTO loans
(customer_id, loan_type, principal, interest_rate, start_date, status) VALUES
(1, 'Home Loan', 4200000.00, 8.40, '2025-04-10', 'Active'),
(2, 'Car Loan', 750000.00, 9.10, '2025-11-20', 'Active'),
(3, 'Personal Loan', 275000.00, 11.80, '2026-02-15', 'Active'),
(5, 'Business Loan', 1400000.00, 10.75, '2025-08-25', 'Active'),
(6, 'Home Loan', 3100000.00, 8.65, '2024-12-10', 'Active'),
(7, 'Personal Loan', 175000.00, 13.25, '2026-05-20', 'Closed'),
(4, 'Car Loan', 550000.00, 9.35, '2026-03-05', 'Active');


INSERT INTO customers (full_name, email)
VALUES ('Sample Customer', 'sample@example.com');

SELECT customer_id, full_name, city, joined_date, credit_score
FROM customers
WHERE full_name = 'Sample Customer';


CREATE TABLE high_value_accounts AS
SELECT * FROM accounts WHERE 1 = 0;

INSERT INTO high_value_accounts
SELECT * FROM accounts WHERE balance >= 200000;

SELECT * FROM high_value_accounts;


SET SQL_SAFE_UPDATES = 1;

UPDATE customers
SET credit_score = 785
WHERE customer_id = 2;


INSERT INTO transactions
(account_id, txn_type, amount, txn_date, remarks)
SELECT account_id, 'Deposit', ROUND(balance * 0.01, 2),
       '2026-09-30', 'Quarterly interest'
FROM accounts
WHERE account_type = 'Savings' AND status = 'Active';

SET SQL_SAFE_UPDATES = 0;

UPDATE accounts
SET balance = ROUND(balance * 1.01, 2)
WHERE account_type = 'Savings' AND status = 'Active';

SET SQL_SAFE_UPDATES = 1;


INSERT INTO customers (full_name, email, city)
VALUES ('Kiran Mathew', 'kiran@example.com', 'Kochi');

SET @new_customer = LAST_INSERT_ID();

INSERT INTO accounts
(customer_id, branch_id, account_type, balance, opened_date)
VALUES (@new_customer, 1, 'Savings', 12000.00, '2026-09-25');

SET @new_account = LAST_INSERT_ID();

INSERT INTO transactions
(account_id, txn_type, amount, txn_date, remarks)
VALUES (@new_account, 'Deposit', 12000.00,
        '2026-09-25', 'Opening deposit');


INSERT INTO transactions
(account_id, txn_type, amount, txn_date, remarks)
VALUES (2, 'Withdrawal', 35000.00,
        '2026-09-26', 'Cheque payment');

UPDATE accounts
SET balance = balance - 35000.00
WHERE account_id = 2;


INSERT INTO transactions
(account_id, txn_type, amount, txn_date, remarks)
SELECT account_id, 'Withdrawal', balance,
       '2026-09-28', 'Account closure payment'
FROM accounts
WHERE account_id = 8;

UPDATE accounts
SET balance = 0, status = 'Closed'
WHERE account_id = 8;


SET SQL_SAFE_UPDATES = 0;

UPDATE loans
SET interest_rate = interest_rate - 0.25
WHERE loan_type = 'Home Loan' AND status = 'Active';

SET SQL_SAFE_UPDATES = 1;


UPDATE loans
SET status = 'Closed', end_date = '2026-09-27'
WHERE loan_id = 3;


INSERT INTO transactions
(account_id, txn_type, amount, txn_date, remarks)
VALUES (3, 'Deposit', 888888.00,
        '2026-09-28', 'Incorrect entry');

SET @wrong_txn = LAST_INSERT_ID();

DELETE FROM transactions
WHERE txn_id = @wrong_txn;

DELETE FROM customers
WHERE full_name = 'Sample Customer'
AND customer_id = 9;

DROP TABLE high_value_accounts;


SELECT * FROM branches;

SELECT full_name, city FROM customers;

SELECT account_id, account_type, balance
FROM accounts
WHERE balance > 100000;

SELECT account_id, balance
FROM accounts
WHERE balance BETWEEN 50000 AND 150000;

SELECT full_name, city
FROM customers
WHERE city IN ('Jaipur', 'Chennai');

SELECT full_name
FROM customers
WHERE full_name LIKE 'M%' OR full_name LIKE '%Mathew';

SELECT loan_id, loan_type
FROM loans
WHERE end_date IS NULL;

SELECT DISTINCT account_type
FROM accounts;

SELECT account_id, balance
FROM accounts
ORDER BY balance DESC
LIMIT 5;


SELECT loan_id, loan_type, principal, interest_rate,
       ROUND(principal * interest_rate / 100, 2) AS yearly_interest,
       TIMESTAMPDIFF(MONTH, start_date, CURDATE()) AS months_running
FROM loans;


SELECT account_id, balance,
       CASE
           WHEN balance >= 250000 THEN 'Premium'
           WHEN balance >= 50000 THEN 'Regular'
           ELSE 'Basic'
       END AS account_tier
FROM accounts
WHERE status = 'Active'
ORDER BY balance DESC;


SELECT a.account_id, c.full_name, a.account_type,
       a.balance, b.branch_name
FROM accounts a
JOIN customers c ON c.customer_id = a.customer_id
JOIN branches b ON b.branch_id = a.branch_id
ORDER BY c.full_name;


SELECT t.txn_id, t.txn_date, c.full_name, a.account_type,
       t.txn_type, t.amount, t.remarks
FROM transactions t
JOIN accounts a ON a.account_id = t.account_id
JOIN customers c ON c.customer_id = a.customer_id
ORDER BY t.txn_date, t.txn_id;


SELECT c.customer_id, c.full_name
FROM customers c
LEFT JOIN accounts a ON a.customer_id = c.customer_id
WHERE a.account_id IS NULL;


SELECT DISTINCT c.full_name
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
JOIN loans l ON l.customer_id = c.customer_id;


SELECT account_id, account_type, balance
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
    WHERE status = 'Active'
)
ORDER BY balance DESC;


SELECT a.account_id, a.account_type, a.balance
FROM accounts a
WHERE a.balance > (
    SELECT AVG(balance)
    FROM accounts
    WHERE account_type = a.account_type
);


SELECT COUNT(*) AS total_accounts,
       SUM(balance) AS total_deposits,
       ROUND(AVG(balance), 2) AS average_balance,
       MIN(balance) AS smallest_balance,
       MAX(balance) AS largest_balance
FROM accounts
WHERE status = 'Active';


SELECT account_type,
       COUNT(*) AS accounts,
       SUM(balance) AS total_balance,
       ROUND(AVG(balance), 2) AS avg_balance
FROM accounts
WHERE status = 'Active'
GROUP BY account_type
ORDER BY total_balance DESC;


SELECT b.branch_name, b.city,
       COUNT(a.account_id) AS accounts,
       SUM(a.balance) AS deposits_held,
       MAX(a.balance) AS largest_account
FROM branches b
JOIN accounts a ON a.branch_id = b.branch_id
WHERE a.status = 'Active'
GROUP BY b.branch_name, b.city
ORDER BY deposits_held DESC;


SELECT b.branch_name, SUM(a.balance) AS deposits_held
FROM branches b
JOIN accounts a ON a.branch_id = b.branch_id
WHERE a.status = 'Active'
GROUP BY b.branch_name
HAVING SUM(a.balance) > 500000;

SELECT txn_type,
       COUNT(*) AS transactions,
       SUM(amount) AS total_amount,
       AVG(amount) AS average_amount,
       MAX(amount) AS largest
FROM transactions
GROUP BY txn_type;


SELECT DATE_FORMAT(txn_date, '%Y-%m') AS month,
       SUM(CASE WHEN txn_type = 'Deposit'
                THEN amount ELSE 0 END) AS money_in,
       SUM(CASE WHEN txn_type = 'Withdrawal'
                THEN amount ELSE 0 END) AS money_out
FROM transactions
GROUP BY DATE_FORMAT(txn_date, '%Y-%m')
ORDER BY month;


SELECT c.full_name,
       COUNT(a.account_id) AS accounts_held,
       SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
WHERE a.status = 'Active'
GROUP BY c.customer_id, c.full_name
HAVING SUM(a.balance) >= 200000
ORDER BY total_balance DESC;


SELECT loan_type,
       COUNT(*) AS loans,
       SUM(principal) AS total_lent,
       ROUND(AVG(interest_rate), 2) AS avg_interest_rate,
       MIN(interest_rate) AS lowest_rate,
       MAX(interest_rate) AS highest_rate
FROM loans
WHERE status = 'Active'
GROUP BY loan_type
ORDER BY total_lent DESC;


SELECT c.full_name,
       COUNT(l.loan_id) AS active_loans,
       SUM(l.principal) AS total_borrowed
FROM customers c
JOIN loans l ON l.customer_id = c.customer_id
WHERE l.status = 'Active'
GROUP BY c.customer_id, c.full_name
HAVING SUM(l.principal) > 1000000;


SELECT c.full_name,
       SUM(CASE WHEN t.txn_type = 'Deposit'
                THEN t.amount ELSE -t.amount END) AS net_flow
FROM transactions t
JOIN accounts a ON a.account_id = t.account_id
JOIN customers c ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY net_flow DESC;


CREATE USER 'cashier'@'localhost'
IDENTIFIED BY 'Cashier@123';

CREATE USER 'credit_officer'@'localhost'
IDENTIFIED BY 'Credit@123';

CREATE USER 'bank_auditor'@'localhost'
IDENTIFIED BY 'Audit@123';


GRANT SELECT ON CityBankDB.customers
TO 'cashier'@'localhost';

GRANT SELECT, UPDATE ON CityBankDB.accounts
TO 'cashier'@'localhost';

GRANT SELECT, INSERT ON CityBankDB.transactions
TO 'cashier'@'localhost';

GRANT SELECT, INSERT, UPDATE ON CityBankDB.loans
TO 'credit_officer'@'localhost';

GRANT SELECT ON CityBankDB.customers
TO 'credit_officer'@'localhost';

GRANT SELECT ON CityBankDB.*
TO 'bank_auditor'@'localhost';

SHOW GRANTS FOR 'cashier'@'localhost';
SHOW GRANTS FOR 'credit_officer'@'localhost';


REVOKE UPDATE ON CityBankDB.accounts
FROM 'cashier'@'localhost';

REVOKE UPDATE ON CityBankDB.loans
FROM 'credit_officer'@'localhost';

SHOW GRANTS FOR 'cashier'@'localhost';


DROP USER 'cashier'@'localhost';
DROP USER 'credit_officer'@'localhost';
DROP USER 'bank_auditor'@'localhost';


SET autocommit = 0;

START TRANSACTION;

UPDATE customers
SET credit_score = credit_score + 10
WHERE customer_id = 4;

COMMIT;


START TRANSACTION;

UPDATE accounts
SET balance = 0
WHERE account_id = 7;

SELECT account_id, balance
FROM accounts
WHERE account_id = 7;

ROLLBACK;

SELECT account_id, balance
FROM accounts
WHERE account_id = 7;


START TRANSACTION;

UPDATE customers
SET credit_score = credit_score + 20
WHERE customer_id = 5;

SAVEPOINT after_score;

UPDATE customers
SET city = 'Unknown'
WHERE customer_id = 5;

ROLLBACK TO SAVEPOINT after_score;

COMMIT;

SELECT customer_id, full_name, city, credit_score
FROM customers
WHERE customer_id = 5;


START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000.00
WHERE account_id = 3;

UPDATE accounts
SET balance = balance + 10000.00
WHERE account_id = 1;

INSERT INTO transactions
(account_id, txn_type, amount, txn_date, remarks)
VALUES
(3, 'Withdrawal', 10000.00, '2026-09-29', 'Transfer to account 1'),
(1, 'Deposit', 10000.00, '2026-09-29', 'Transfer from account 3');

SELECT account_id, balance
FROM accounts
WHERE account_id IN (1, 3);

COMMIT;


START TRANSACTION;

UPDATE accounts
SET balance = balance - 5000.00
WHERE account_id = 3;

ROLLBACK;

SELECT account_id, balance
FROM accounts
WHERE account_id = 3;

SET autocommit = 1;