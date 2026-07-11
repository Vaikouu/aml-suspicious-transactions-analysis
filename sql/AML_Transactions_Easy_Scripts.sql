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

-- Customers who are Freelancers or Unemployed
SELECT DISTINCT(FullName), Occupation
FROM customers
WHERE Occupation IN ('Freelancer', 'Unemployed');

-- Customers that are PEP and their Occupation
SELECT FullName, Occupation, Country
FROM customers
WHERE PEP_Flag = 'Yes';

-- Clients from Bulgaria
SELECT FullName, Country
FROM customers
WHERE Country = 'Bulgaria';
