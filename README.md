# 🏦 Banking System Database — SQL / PostgreSQL

A relational database designed in PostgreSQL to manage customer 
accounts, transactions, loans, credit cards, and employee/branch 
information for a banking system, with built-in data integrity 
constraints.

# 🎯 Project Overview
This project models the core data structure of a bank's operations — 
tracking customers, their accounts and transactions, loans and credit 
cards, and the employees/branches serving them — with normalized 
tables, foreign key relationships, and CHECK constraints to enforce 
valid data at the database level.

# 🗂️ Tables

| Table | Key Fields |
|---|---|
| **Branches** | Branch ID (PK), Branch Name, Address |
| **Customers** | Customer ID (PK), Name, Address, Phone Number, Email (unique) |
| **Accounts** | Account ID (PK), Customer ID (FK), Account Type, Balance |
| **Employees** | Employee ID (PK), Name, Role, Branch ID (FK) |
| **Transactions** | Transaction ID (PK), Account ID (FK), Transaction Type, Amount, Transaction Date |
| **Loans** | Loan ID (PK), Customer ID (FK), Loan Amount, Interest Rate, Repayment Term |
| **Credit Cards** | Credit Card ID (PK), Customer ID (FK), Card Type, Card Limit, Expiry Date |

# 🔗 Relationships
- A **Customer** can have multiple **Accounts**, **Loans**, and **Credit Cards** (one-to-many)
- An **Account** belongs to one **Customer** and can have multiple **Transactions** (one-to-many)
- An **Employee** works at one **Branch**; a **Branch** can have multiple **Employees** (one-to-many)

# ✅ Data Integrity Constraints
- `account_type` restricted to **Savings** or **Current**
- `transaction_type` restricted to **Deposit** or **Withdrawal**
- Transaction `amount`, loan `loan_amount`, `interest_rate`, `repayment_term`, and credit card `card_limit` must all be positive
- Customer `email` enforced as unique
- Foreign keys enforced across all child tables (Accounts, Employees, Transactions, Loans, Credit Cards)

# 📊 Sample Data
The script includes realistic sample data: 5 branches, 10 customers, 
12 accounts, 8 employees, 20 transactions, 7 loans, and 7 credit cards 
— enough to run meaningful test queries (e.g., total balance per 
branch, transaction history per customer, active loans by interest rate).

# 🛠️ Tools & Skills Used
- **PostgreSQL** — schema design, constraints, and relational integrity
- **pgAdmin4** — development and query execution
- **Relational Database Design** — primary/foreign keys, CHECK constraints, normalization

# 📂 Files
- [`SQL Project banking_system.sql`](SQL%20Project%20banking_system.sql) — full schema (DDL) and sample data (DML)

# 🚀 How to Use
1. Install PostgreSQL and pgAdmin4
2. Create a new database
3. Run `SQL Project banking_system.sql` in the Query Tool to create all tables, constraints, and load sample data

---
**Author:** Vinit Ajay Doshi  
📧 doshivinit2004@gmail.com
