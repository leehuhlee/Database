USE BaseballData;

DECLARE @i AS INT = 10;

SELECT @i;

DECLARE @j AS INT;
SET @j = 20;

SELECT @j;

DECLARE @firstName AS NVARCHAR(15);

DECLARE @lastName AS NVARCHAR(15);


SET @firstName=(SELECT TOP 1 nameFirst
				FROM players AS p
					INNER JOIN salaries AS s
					ON p.playerID = s.playerID
				ORDER BY s.salary DESC);

SELECT @firstName;

GO

DECLARE @firstName AS NVARCHAR(15);
DECLARE @lastName AS NVARCHAR(15);
SELECT TOP 1 @firstName = p.nameFirst, @lastName = p.nameLast
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
ORDER BY s.salary DESC;

SELECT @firstName, @lastName;

GO

DECLARE @i AS INT =10;

SELECT *
FROM players;

SELECT *
FROM salaries;

GO

DECLARE @i AS INT = 10;

IF @i = 10
	PRINT('BINGO');
ELSE
	PRINT('NO');

DECLARE @i AS INT = 10;

IF @i=10
BEGIN
	PRINT('BINGO');
	PRINT('BINGO');
END
ELSE
BEGIN
	PRINT('NO');
END

GO

DECLARE @i AS INT = 0;
WHILE @i <=10
BEGIN
	SET @i = @i + 1;
	IF @i = 9 BREAK;
	IF @i = 6 CONTINUE;
	PRINT @i
END

GO

DECLARE @test TABLE
(
	name VARCHAR(50) NOT NULL,
	salary INT NOT NULL
);

INSERT INTO @test
SELECT p.nameFirst + ' ' + p.nameLast, s.salary
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

SELECT *
FROM @test;
