USE Northwind;

-- Index Scan vs Index Seek

-- Non-Clustered
--		1
-- 2 3 4 5 6

-- Clurstered
--		1
-- 2 3 4 5 6


-- Heap Table[({Page} {Page} ... ]

SELECT *
INTO TestOrders
FROM Orders;

SELECT *
FROM TestOrders;

CREATE NONCLUSTERED INDEX Orders_Index01
ON TestOrders(CustomerID);

-- 인덱스 번호
SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestOrders');

-- 조회
DBCC IND('Northwind', 'TestOrders', 2);

-- Heap Table [	{Page}	{Page} ... ]

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SET STATISTICS PROFILE ON;

SELECT *
FROM TestOrders
WHERE CustomerID = 'QUICK';

SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK';

SELECT *
FROM TestOrders WITH(INDEX(Orders_Index01))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

DROP INDEX TESTORDES.Orders_Index01;

-- Covered Index

CREATE NONCLUSTERED INDEX Orders_Index02
ON TestOrders(CustomerID, ShipVia);

SELECT *
FROM TestOrders WITH(INDEX(Orders_Index02))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;

DROP INDEX TESTORDES.Orders_Index02;

CREATE NONCLUSTERED INDEX Orders_Index03
ON TestOrders(CustomerID) INCLUDE (ShipVia);

-- Non-Clustered
--		1
-- 2[(data1(ShipVia=3), data2(ShipVia=2), ... data28)] 3 4 5 6

SELECT *
FROM TestOrders WITH(INDEX(Orders_Index03))
WHERE CustomerID = 'QUICK' AND ShipVia = 3;