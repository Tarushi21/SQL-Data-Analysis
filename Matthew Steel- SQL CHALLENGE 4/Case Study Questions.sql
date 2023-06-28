-- 1. What are the names of all the customers who live in New York?

SELECT FirstName, LastName 
FROM CUSTOMERS
WHERE CITY = 'New York';

-- 2. What is the total number of accounts in the Accounts table?

SELECT COUNT(DISTINCT AccountID) AS TOTAL_ACCOUNT FROM ACCOUNTS;

-- 3. What is the total balance of all checking accounts?

SELECT SUM(BALANCE) as Total_Balance FROM ACCOUNTS
WHERE AccountType = 'Checking';

-- 4. What is the total balance of all accounts associated with customers who live in Los Angeles?

SELECT SUM(a.BALANCE) AS TOTAL_BALANCE 
FROM ACCOUNTS a
JOIN CUSTOMERS c ON a.CustomerID = c.CustomerID
WHERE c.CITY = 'Los Angeles';

-- 5. Which branch has the highest average account balance?

SELECT BranchName, AVG(BALANCE) AS AVG_BALANCE
FROM accounts a
JOIN branches b ON a.BranchID = b.BranchID
ORDER BY AVG_BALANCE DESC
LIMIT 1;

-- 6. Which customer has the highest current balance in their accounts?

SELECT FirstName, LastName, SUM(BALANCE) AS TOTAL_BALANCE
FROM ACCOUNTS a
JOIN CUSTOMERS c ON a.CustomerID = c.CustomerID
ORDER BY TOTAL_BALANCE DESC
LIMIT 1;
 
-- 7. Which customer has made the most transactions in the Transactions table? 
 
 SELECT FirstName, LastName, COUNT(TransactionID) as trnx_count
 FROM CUSTOMERS c
 JOIN ACCOUNTS a ON a.CustomerID = c.CustomerID
 JOIN TRANSACTIONS t ON a.AccountID = t.AccountID
 GROUP BY 1,2
 ORDER BY trnx_count DESC
 LIMIT 1;
 
 -- 8.Which branch has the highest total balance across all of its accounts?
 
 SELECT BranchName, SUM(BALANCE) AS TOTAL_BALANCE
 FROM ACCOUNTS a
 JOIN BRANCHES b ON a.BranchID = b.BranchID
 GROUP BY 1
 ORDER BY TOTAL_BALANCE DESC
 LIMIT 1;
 
 -- 9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
 
 SELECT FirstName, LastName, SUM(BALANCE) AS TOTAL_BALANCE
FROM ACCOUNTS a
JOIN CUSTOMERS c ON a.CustomerID = c.CustomerID
WHERE AccountType IN ('Checking', 'Savings')
ORDER BY TOTAL_BALANCE DESC
LIMIT 1; 
 
 -- 10. Which branch has the highest number of transactions in the Transactions table?
 
 SELECT BranchName, COUNT(TransactionID) AS TOTAL_TRNX
 FROM BRANCHES b 
 JOIN ACCOUNTS a ON b.BranchID = a.BranchID
 JOIN TRANSACTIONS t ON a.AccountID = t.AccountID
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 1;
 