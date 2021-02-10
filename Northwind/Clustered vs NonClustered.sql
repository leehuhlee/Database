USE Northwind;

SELECT *
INTO TestOrderDetails2 
FROM [Order Details];

SELECT *
FROM TestOrderDetails2;

CREATE INDEX Index_OrderDetails
ON TestOrderDetails2(OrderID, productID);

EXEC sp_helpindex 'TestOrderDetails2';

SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestOrderDetails2');

DBCC IND('Northwind', 'TestOrderDetails2', 2);

--					992
-- 928		960		961		962		963		964

DBCC PAGE('Northwind', 1, 928, 3);

CREATE CLUSTERED INDEX Index_OrderDetails_Clustered
ON TestOrderDetails2(OrderID);

SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestOrderDetails2');

DBCC IND('Northwind', 'TestOrderDetails2', 1);
DBCC IND('Northwind', 'TestOrderDetails2', 2);

-- Page Type
-- 1(DATA PAGE)
--					1016
-- 968	976	977	978	979	980	981	982	983	984

-- 2(INDEX PAGE)
--					9160
-- 9120		9128	9129	9130	9131	9132


-- Non-Clustered
DBCC PAGE('Northwind', 1, 9120, 3);
