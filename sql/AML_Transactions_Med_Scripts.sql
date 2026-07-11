-- Count of transactions per country
SELECT Country, COUNT(CustomerID) AS num_of_transactions
FROM customers
GROUP BY Country
ORDER BY num_of_transactions DESC;

-- Total type of transactions
SELECT TransactionType, COUNT(TransactionID) as total_transactions
FROM transactions
GROUP BY TransactionType
ORDER BY total_transactions DESC;

-- Total High Risk Clients and their transactions
SELECT 
c.FullName, c.Country, t.Amount, t.TransactionType
FROM customers AS c
JOIN transactions AS t
	ON c.CustomerID = t.CustomerID
WHERE c.RiskRating = 'High';

-- High Risk Clients with transactions above 15
SELECT c.FullName, COUNT(t.TransactionID) AS total_transactions
FROM customers AS c
JOIN transactions AS t
ON c.CustomerID = t.CustomerID
GROUP BY c.FullName
HAVING total_transactions > 15
ORDER BY total_transactions DESC;

SELECT * FROM customers;

-- Clients who transfer to High Risk Countries
SELECT c.FullName, t.CounterpartyName, t.CounterpartyCountry, t.Amount
FROM customers AS c
JOIN transactions AS t
ON c.CustomerID = t.CustomerID
WHERE t.TransactionType LIKE 'Wire Transfer Out'
AND t.CounterpartyCountry IN ('Iran', 'North Korea', 'Russia', 'Afghanistan', 'India');

-- Unemployed clients with suspicious transactions
SELECT c.FullName, COUNT(t.TransactionID) as total_transactions, SUM(t.Amount) AS total_amount
FROM customers AS c
JOIN transactions AS t
ON c.CustomerID = t.CustomerID
WHERE c.Occupation = 'Unemployed'
GROUP BY c.FullName;

-- Clients with multiple transactions in a day
SELECT c.FullName, SUM(t.Amount) AS total_amount, COUNT(t.TransactionDate) as day_transactions
FROM customers AS c
JOIN transactions AS t
ON c.CustomerID = t.CustomerID
GROUP BY c.FullName, t.TransactionDate
HAVING day_transactions > 1
ORDER BY day_transactions DESC;

-- Top 10 Clients by transactions
SELECT c.FullName, COUNT(t.TransactionID) as total_transactions, SUM(t.Amount) AS total_amount
FROM customers AS c
JOIN transactions AS t
ON c.CustomerID = t.CustomerID
GROUP BY c.FullName
ORDER BY total_transactions DESC
LIMIT 10;

-- PEP Clients and Total Amount
SELECT c.FullName, SUM(t.Amount) AS total_amount
FROM customers AS c
JOIN transactions AS t
ON c.CustomerID = t.CustomerID
WHERE c.PEP_Flag = 'Yes'
GROUP BY c.FullName;

-- Type of transactions (Wire, ATM, etc.)
SELECT COUNT(TransactionID) as total_transactions, Channel
FROM transactions
GROUP BY Channel
ORDER BY total_transactions DESC;

-- Difference between Individual and Business clients and Total Amount
SELECT COUNT(transactionID) as total_transactions, c.CustomerType, SUM(Amount) as total_amount
FROM customers AS c
JOIN transactions AS t
On c.CustomerID = t.CustomerID
GROUP BY CustomerType;
