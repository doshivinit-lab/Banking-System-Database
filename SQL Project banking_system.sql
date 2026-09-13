/* ---------- BRANCHES ---------- */

CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    address VARCHAR(200)
);


/* ---------- CUSTOMERS ---------- */

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE
);


/* ---------- ACCOUNTS ---------- */

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    balance NUMERIC(12,2) DEFAULT 0,

    CONSTRAINT fk_account_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT chk_account_type
        CHECK (account_type IN ('Savings', 'Current'))
);


/* ---------- EMPLOYEES ---------- */

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    branch_id INT NOT NULL,

    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);


/* ---------- TRANSACTIONS ---------- */

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type VARCHAR(30) NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    transaction_date DATE NOT NULL,

    CONSTRAINT fk_transaction_account
        FOREIGN KEY (account_id)
        REFERENCES accounts(account_id),

    CONSTRAINT chk_transaction_type
        CHECK (transaction_type IN ('Deposit', 'Withdrawal')),

    CONSTRAINT chk_transaction_amount
        CHECK (amount > 0)
);


/* ---------- LOANS ---------- */

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_amount NUMERIC(12,2) NOT NULL,
    interest_rate NUMERIC(5,2) NOT NULL,
    repayment_term INT NOT NULL,

    CONSTRAINT fk_loan_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT chk_loan_amount
        CHECK (loan_amount > 0),

    CONSTRAINT chk_interest_rate
        CHECK (interest_rate > 0),

    CONSTRAINT chk_repayment_term
        CHECK (repayment_term > 0)
);


/* ---------- CREDIT CARDS ---------- */

CREATE TABLE credit_cards (
    credit_card_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    card_type VARCHAR(30) NOT NULL,
    card_limit NUMERIC(12,2) NOT NULL,
    expiry_date DATE NOT NULL,

    CONSTRAINT fk_creditcard_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT chk_card_limit
        CHECK (card_limit > 0)
);



/* =========================================================
   2. INSERT DATA
   ========================================================= */


/* ---------- BRANCHES ---------- */

INSERT INTO branches
(branch_id, branch_name, address)
VALUES
(101, 'Pune Main Branch', 'FC Road, Pune'),
(102, 'Mumbai Central Branch', 'Dadar, Mumbai'),
(103, 'Vadodara Branch', 'Alkapuri, Vadodara'),
(104, 'Bangalore Branch', 'Indiranagar, Bangalore'),
(105, 'Delhi Branch', 'Connaught Place, Delhi');


/* ---------- CUSTOMERS ---------- */

INSERT INTO customers
(customer_id, name, address, phone_number, email)
VALUES
(1, 'Rahul Sharma', 'Pune', '9876543210', 'rahul@gmail.com'),
(2, 'Priya Patel', 'Mumbai', '9876543211', 'priya@gmail.com'),
(3, 'Amit Shah', 'Vadodara', '9876543212', 'amit@gmail.com'),
(4, 'Sneha Mehta', 'Bangalore', '9876543213', 'sneha@gmail.com'),
(5, 'Karan Joshi', 'Delhi', '9876543214', 'karan@gmail.com'),
(6, 'Neha Desai', 'Pune', '9876543215', 'neha@gmail.com'),
(7, 'Rohan Gupta', 'Mumbai', '9876543216', 'rohan@gmail.com'),
(8, 'Anjali Verma', 'Delhi', '9876543217', 'anjali@gmail.com'),
(9, 'Vikram Rao', 'Bangalore', '9876543218', 'vikram@gmail.com'),
(10, 'Pooja Shah', 'Vadodara', '9876543219', 'pooja@gmail.com');


/* ---------- ACCOUNTS ---------- */

INSERT INTO accounts
(account_id, customer_id, account_type, balance)
VALUES
(1001, 1, 'Savings', 75000),
(1002, 1, 'Current', 150000),
(1003, 2, 'Savings', 95000),
(1004, 3, 'Savings', 45000),
(1005, 4, 'Current', 210000),
(1006, 5, 'Savings', 68000),
(1007, 6, 'Savings', 125000),
(1008, 7, 'Current', 175000),
(1009, 8, 'Savings', 56000),
(1010, 9, 'Savings', 89000),
(1011, 10, 'Current', 230000),
(1012, 3, 'Current', 110000);


/* ---------- EMPLOYEES ---------- */

INSERT INTO employees
(employee_id, name, role, branch_id)
VALUES
(201, 'Arjun Singh', 'Branch Manager', 101),
(202, 'Meera Kapoor', 'Bank Officer', 101),
(203, 'Raj Malhotra', 'Cashier', 102),
(204, 'Nisha Patel', 'Bank Officer', 102),
(205, 'Dev Joshi', 'Branch Manager', 103),
(206, 'Kavita Shah', 'Cashier', 103),
(207, 'Suresh Kumar', 'Bank Officer', 104),
(208, 'Riya Mehta', 'Cashier', 105);


/* ---------- TRANSACTIONS ---------- */

INSERT INTO transactions
(transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
(5001, 1001, 'Deposit', 25000, '2026-01-05'),
(5002, 1001, 'Withdrawal', 5000, '2026-01-10'),
(5003, 1002, 'Deposit', 50000, '2026-01-12'),
(5004, 1002, 'Withdrawal', 15000, '2026-01-20'),

(5005, 1003, 'Deposit', 30000, '2026-02-02'),
(5006, 1003, 'Withdrawal', 8000, '2026-02-10'),
(5007, 1004, 'Deposit', 20000, '2026-02-15'),

(5008, 1005, 'Deposit', 75000, '2026-03-01'),
(5009, 1005, 'Withdrawal', 25000, '2026-03-05'),
(5010, 1006, 'Deposit', 15000, '2026-03-10'),
(5011, 1007, 'Deposit', 40000, '2026-03-15'),
(5012, 1007, 'Withdrawal', 10000, '2026-03-20'),

(5013, 1008, 'Deposit', 55000, '2026-04-02'),
(5014, 1008, 'Withdrawal', 20000, '2026-04-08'),
(5015, 1009, 'Deposit', 18000, '2026-04-15'),
(5016, 1010, 'Withdrawal', 7000, '2026-04-20'),

(5017, 1011, 'Deposit', 90000, '2026-05-01'),
(5018, 1011, 'Withdrawal', 30000, '2026-05-10'),
(5019, 1012, 'Deposit', 35000, '2026-05-15'),
(5020, 1012, 'Withdrawal', 12000, '2026-05-20');


/* ---------- LOANS ---------- */

INSERT INTO loans
(loan_id, customer_id, loan_amount, interest_rate, repayment_term)
VALUES
(3001, 1, 500000, 8.50, 60),
(3002, 2, 750000, 9.00, 84),
(3003, 3, 300000, 8.25, 48),
(3004, 4, 1000000, 9.50, 120),
(3005, 5, 450000, 8.75, 60),
(3006, 6, 600000, 8.90, 72),
(3007, 1, 250000, 8.20, 36);


/* ---------- CREDIT CARDS ---------- */

INSERT INTO credit_cards
(credit_card_id, customer_id, card_type, card_limit, expiry_date)
VALUES
(4001, 1, 'Visa', 100000, '2028-06-30'),
(4002, 2, 'MasterCard', 150000, '2027-12-31'),
(4003, 3, 'Visa', 80000, '2028-03-31'),
(4004, 4, 'MasterCard', 200000, '2029-01-31'),
(4005, 5, 'Visa', 120000, '2027-08-31'),
(4006, 6, 'MasterCard', 100000, '2028-11-30'),
(4007, 1, 'Visa', 75000, '2029-05-31');




SELECT* FROM branches;

SELECT * FROM customers;

SELECT * FROM accounts;

SELECT * FROM employees;

SELECT * FROM transactions;

SELECT * FROM loans;

SELECT * FROM credit_cards;



/* Q1. Display all customers and their accounts */

SELECT
    c.customer_id,
    c.name,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id;



/* Q2. Find customers having multiple accounts */

SELECT
    c.customer_id,
    c.name,
    COUNT(a.account_id) AS number_of_accounts
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(a.account_id) > 1;



/* Q3. Find total balance of each customer */

SELECT
    c.customer_id,
    c.name,
    SUM(a.balance) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_balance DESC;



/* Q4. Find customer with highest total balance */

SELECT
    c.customer_id,
    c.name,
    SUM(a.balance) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_balance DESC
LIMIT 1;



/* Q5. Find average balance by account type */

SELECT
    account_type,
    ROUND(AVG(balance), 2) AS average_balance
FROM accounts
GROUP BY account_type;



/* Q6. Find total balance maintained by the bank */

SELECT
    SUM(balance) AS total_bank_balance
FROM accounts;



/* Q7. Deposit vs Withdrawal analysis */

SELECT
    transaction_type,
    COUNT(*) AS number_of_transactions,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type;



/* Q8. Find highest transaction */

SELECT *
FROM transactions
ORDER BY amount DESC
LIMIT 1;



/* Q9. Display customer transaction history */

SELECT
    c.name,
    a.account_id,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
ORDER BY c.name, t.transaction_date;



/* Q10. Find total transactions by customer */

SELECT
    c.customer_id,
    c.name,
    COUNT(t.transaction_id) AS total_transactions,
    SUM(t.amount) AS total_transaction_value
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.name
ORDER BY total_transaction_value DESC;



/* Q11. Display employees and their branches */

SELECT
    e.employee_id,
    e.name AS employee_name,
    e.role,
    b.branch_name,
    b.address
FROM employees e
INNER JOIN branches b
    ON e.branch_id = b.branch_id;



/* Q12. Count employees in each branch */

SELECT
    b.branch_id,
    b.branch_name,
    COUNT(e.employee_id) AS number_of_employees
FROM branches b
LEFT JOIN employees e
    ON b.branch_id = e.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY number_of_employees DESC;



/* Q13. Find highest loan */

SELECT
    l.loan_id,
    c.name,
    l.loan_amount,
    l.interest_rate,
    l.repayment_term
FROM loans l
INNER JOIN customers c
    ON l.customer_id = c.customer_id
ORDER BY l.loan_amount DESC
LIMIT 1;



/* Q14. Find total loan amount for each customer */

SELECT
    c.customer_id,
    c.name,
    SUM(l.loan_amount) AS total_loan
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_loan DESC;



/* Q15. Find customers having loans above ₹5 lakh */

SELECT
    c.name,
    l.loan_amount
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
WHERE l.loan_amount > 500000;



/* Q16. Display credit card information */

SELECT
    c.name,
    cc.credit_card_id,
    cc.card_type,
    cc.card_limit,
    cc.expiry_date
FROM customers c
INNER JOIN credit_cards cc
    ON c.customer_id = cc.customer_id;



/* Q17. Find customers having multiple credit cards */

SELECT
    c.customer_id,
    c.name,
    COUNT(cc.credit_card_id) AS number_of_cards
FROM customers c
INNER JOIN credit_cards cc
    ON c.customer_id = cc.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(cc.credit_card_id) > 1;



/* Q18. Find customer with highest credit card limit */

SELECT
    c.name,
    cc.card_limit
FROM customers c
INNER JOIN credit_cards cc
    ON c.customer_id = cc.customer_id
ORDER BY cc.card_limit DESC
LIMIT 1;



/* =========================================================
   5. SUBQUERY
   ========================================================= */


/* Q19. Find accounts having balance above average */

SELECT
    c.name,
    a.account_id,
    a.balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE a.balance > (
    SELECT AVG(balance)
    FROM accounts
)
ORDER BY a.balance DESC;



/* =========================================================
   6. WINDOW FUNCTION
   ========================================================= */


/* Q20. Rank customers based on total balance */

SELECT
    c.name,
    SUM(a.balance) AS total_balance,
    RANK() OVER (
        ORDER BY SUM(a.balance) DESC
    ) AS balance_rank
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
ORDER BY balance_rank;



/* =========================================================
   7. DATE ANALYSIS
   ========================================================= */


/* Q21. Monthly transaction analysis */

SELECT
    EXTRACT(MONTH FROM transaction_date) AS transaction_month,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY transaction_month;



/* Q22. Transaction analysis by month and type */

SELECT
    TO_CHAR(transaction_date, 'Month') AS month,
    transaction_type,
    COUNT(*) AS number_of_transactions,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY
    TO_CHAR(transaction_date, 'Month'),
    EXTRACT(MONTH FROM transaction_date),
    transaction_type
ORDER BY
    EXTRACT(MONTH FROM transaction_date),
    transaction_type;

