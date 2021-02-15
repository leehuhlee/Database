USE Northwind;

-- Hash Join
-- 1) Don't need to sort -> The more data to Merge, The better to Hash
-- 2) not infected by Index
	-- Hash is better than NL/Merge 
	-- But you habe to consider the cost of hash table(process time become bigger -> Index)
-- 3) Random Access X
-- 4) smaller data is good to make Hash Table


SELECT * INTO TestOrders FROM Orders;
SELECT * INTO TestCustomers FROM Customers;

SELECT * FROM TestOrders;
SELECT * FROM TestCustomers;

-- HASH
-- smaller one is Hash Table
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON o.CustomerID = c.CustomerID;

-- NL (no index in inner table)
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON c.CustomerID = c.CustomerID
	OPTION(FORCE ORDER, LOOP JOIN);

-- Merge (outer and inner need sort => many-to-many)
SELECT *
FROM TestOrders AS o
	INNER JOIN TestCustomers AS c
	ON c.CustomerID = c.CustomerID
	OPTION(FORCE ORDER, MERGE JOIN);

