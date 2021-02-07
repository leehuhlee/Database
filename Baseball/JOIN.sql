USE BaseballData;

SELECT *
FROM players
ORDER BY playerID;
SELECT *
FROM salaries
ORDER BY playerID;

SELECT p.playerID, s.salary
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

SELECT p.playerID, s.salary
FROM players AS p
	LEFT JOIN salaries AS s
	ON p.playerID = s.playerID;

SELECT p.playerID, s.salary
FROM players AS p
	RIGHT JOIN salaries AS s
	ON p.playerID = s.playerID;