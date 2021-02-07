USE BaseballData;

SELECT playerId
FROM salaries
GROUP BY playerId
HAVING AVG(salary) >= 3000000
UNION
SELECT playerID
FROM players
WHERE birthMonth = 12;

SELECT playerId
FROM salaries
GROUP BY playerId
HAVING AVG(salary) >= 3000000
UNION ALL
SELECT playerId
FROM players
WHERE birthMonth = 12
ORDER BY playerId;

SELECT playerId
FROM salaries
GROUP BY playerId
HAVING AVG(salary) >= 3000000
INTERSECT
SELECT playerId
FROM players
WHERE birthMonth = 12
ORDER BY playerId;

SELECT playerId
FROM salaries
GROUP BY playerId
HAVING AVG(salary)>=3000000
EXCEPT
SELECT playerId
FROM players
WHERE birthMonth=12
ORDER BY playerId;
