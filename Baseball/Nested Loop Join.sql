USE BaseballData;

-- Join
	-- 1) Nested Loop(NL) Join
	-- 2) Merge Join
	-- 3) Hash Join

-- Non-Clustered
-- 	 1 
-- 2 3 4 

-- Clustered
-- 	 1 
-- 2 3 4 

-- Merge
SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

-- Nested Loop
SELECT TOP 5 *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

-- Hash
SELECT *
FROM salaries AS s
	INNER JOIN teams AS t
	ON s.teamID = t.teamID;

-- NL
SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
	OPTION(LOOP JOIN);

SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID
	OPTION(FORCE ORDER, LOOP JOIN);

-- 부분범위 처리에 좋다(ex. TOP 5)