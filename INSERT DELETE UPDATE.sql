USE BaseballData;

SELECT *
FROM salaries
ORDER BY yearID DESC;

INSERT INTO salaries
VALUES (2020, 'KOR', 'NL', 'Hanna', 99999);

INSERT INTO salaries(yearID, teamID, playerID, lgID, salary)
VALUES (2020, 'KOR', 'Hanna2', 'NL', 88888);

INSERT INTO salaries(yearID, teamID, playerID, lgID)
VALUES (2020, 'KOR', 'Hanna3', 'NL');

DELETE FROM salaries
WHERE playerID='Hanna2'

UPDATE salaries
SET salary = salary * 2, yearID = yearID + 1
WHERE teamID='KOR';

DELETE FROM salaries
WHERE yearID >= 2020;


