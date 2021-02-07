SELECT
	CASE birthMonth
		WHEN 1 THEN 'Winter'
		WHEN 2 THEN 'Winter'
		WHEN 3 THEN 'Spring'
		WHEN 4 THEN 'Spring'
		WHEN 5 THEN 'Spring'
		WHEN 6 THEN 'Summer'
		WHEN 7 THEN 'Summer'
		WHEN 8 THEN 'Summer'
		WHEN 9 THEN 'Autumn'
		WHEN 10 THEN 'Autumn'
		WHEN 11 THEN 'Autumn'
		WHEN 12 THEN 'Winter'
		ELSE 'NONE'
	END AS birthSeason
FROM players;


SELECT
	CASE
		WHEN birthMonth <= 2 THEN 'Witer'
		WHEN birthMonth <= 5 THEN 'Spring'
		WHEN birthMonth <= 8 THEN 'Summer'
		WHEN birthMonth <= 11 THEN 'Autumn'
		ELSE 'NONE'
	END AS birthSeason
FROM players;