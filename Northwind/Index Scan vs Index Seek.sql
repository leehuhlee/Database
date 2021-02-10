USE Northwind;

CREATE TABLE TestAccess
(
	id INT NOT NULL,
	name NCHAR(50) NOT NULL,
	dummy NCHAR(1000) NULL
);

GO

CREATE CLUSTERED INDEX TestAccess_CI
ON TestAccess(id);
GO

CREATE NONCLUSTERED INDEX TestAccess_NCI
ON TestAccess(name);
GO

DECLARE @i INT;
SET @i = 1;

WHILE(@i <= 500)
BEGIN
	INSERT INTO TestAccess
	VALUES(@i, 'Name' + CONVERT(VARCHAR, @i), 'Hello World' + CONVERT(VARCHAR, @i));
	SET @i = @i + 1;
END

EXEC sp_helpindex 'TestAccess';

SELECT index_id, name
FROM sys.indexes
WHERE object_id = object_id('TestAccess');

DBCC IND('Northwind', 'TestAccess', 1);
DBCC IND('Northwind', 'TestAccess', 2);

-- CLUSTERED(1) : id
--			8097
--	8096 8098 ...	1151 (167)

-- NONCLUSTERED(2) : name
--			929
--	928	933	...		930 (13)

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM TestAccess;

-- INDEX SEEK
SELECT *
FROM TestAccess
WHERE id = 104;

-- INDEX SEEK + KEY LOOKUP
SELECT *
FROM TestAccess
WHERE name = 'name5';

-- INDEX SCAN + KEY LOOKUP
-- N * 2 + @
SELECT TOP 5 *
FROM TestAccess
ORDER BY name;
