USE BaseballData;

SELECT playerID
FROM players
WHERE playerID = (SELECT TOP 1 playerID FROM salaries ORDER BY salary DESC);

SELECT playerID
FROM players
WHERE playerID IN (SELECT TOP 20 playerID FROM salaries ORDER BY salary DESC);

SELECT(SELECT COUNT(*) FROM players) AS playerCount, (SELECT COUNT(*) FROM batting) AS battingCount;

INSERT INTO salaries
VALUES(2020, 'KOR', 'NL', 'Hanna', (SELECT MAX(salary) FROM salaries));

INSERT INTO salaries
SELECT 2020, 'KOR', 'NL', 'Hanna2', (SELECT MAX(salary) FROM salaries);

DELETE FROM salaries
WHERE yearID>=2020;

SELECT *
FROM salaries
ORDER BY yearID DESC;

INSERT INTO salaries_temp
SELECT yearID, playerID, salary FROM salaries;

SELECT *
FROM salaries_temp;

SELECT playerID
FROM players
WHERE playerID IN(SELECT playerID FROM battingpost);

SELECT playerID
FROM players
WHERE EXISTS (SELECT playerID FROM battingpost WHERE players.playerID = battingpost.playerID);

