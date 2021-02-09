USE Northwind;

EXEC sp_helpdb 'Northwind';

CREATE TABLE Test
(
	EmployeeID INT NOT NULL,
	LastName NVARCHAR(20) NULL,
	FirstName NVARCHAR(20) NULL,
	HireDate DATETIME NULL
);

GO

INSERT INTO Test
SELECT EmployeeID, LastName, FirstName, HireDate
FROM Employees;

SELECT *
FROM Test;

CREATE INDEX Test_Inde ON Test(LastName)
WITH (FILLFACTOR = 1, PAD_INDEX = ON)

GO

SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('Test');

DBCC IND('Northwind', 'Test', 2);

DBCC PAGE('Northwind', 1, 840, 3);
DBCC PAGE('Northwind', 1, 848, 3);
DBCC PAGE('Northwind', 1, 849, 3);

DBCC PAGE('Northwind', 1, 880, 3);
DBCC PAGE('Northwind', 1, 856, 3);
DBCC PAGE('Northwind', 1, 857, 3);

--              857
--         880		856		
--		840  848   849

