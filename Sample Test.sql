USE BaseballData;

SELECT *
FROM batting;

SELECT *
FROM batting
WHERE teamID = 'BOS';

SELECT COUNT(DISTINCT playerID)
FROM batting
WHERE teamID='BOS';

SELECT SUM(HR)
FROM batting
WHERE teamID='BOS' AND yearID=2004;

SELECT TOP 1 playerID
FROM batting
WHERE teamID='BOS'
ORDER BY HR DESC;

SELECT *
FROM players
WHERE playerID='ortizda01';