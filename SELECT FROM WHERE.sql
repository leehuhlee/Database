USE BaseballData;

SELECT *
  FROM players
 WHERE deathYear IS NULL;

SELECT nameFirst, nameLast, birthYear, birthCountry
  FROM players
 WHERE birthYear = 1974 AND birthCountry != 'USA' AND weight > 185;

 SELECT *
   FROM players
  WHERE birthCity LIKE 'New%';

 SELECT *
   FROM players
  WHERE birthCity LIKE 'New Yor_';