USE BaseballData;

SELECT teamID, COUNT(teamID) AS playerCount, SUM(HR) AS homeRuns
FROM batting
WHERE yearID=2004
GROUP BY teamID;

SELECT TOP 1 teamID, SUM(HR) AS homeRuns
FROM batting
WHERE yearID=2004
GROUP BY teamID;

SELECT teamID, SUM(HR) AS homeRuns
FROM batting
WHERE yearID=2004
GROUP BY teamID
HAVING SUM(HR) >= 200
ORDER BY homeRuns DESC;

SELECT DISTINCT(teamID), yearID, SUM(HR) AS homeRuns
FROM batting
GROUP By teamID, yearID
ORDER BY homeRuns DESC;
