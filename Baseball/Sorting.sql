USE BaseballData;

-- Decrease Sorting

-- O(NLogN) -> DB has too many data
-- if size is to big to cover useable memory, then go disk also
-- when the sorting is excuteing

-- Soring time
-- 1) SORT MERGE JOIN
	-- Cause) in Algorithm, before Merge, Sort is caused

-- 2) ORDER BY
	-- Cause) have to Sort by ORDER BY
SELECT *
FROM players
ORDER BY college;

SELECT *
FROM batting
ORDER BY playerID;

-- 3) GROUP BY
	-- Cause) to sum up
SELECT college, COUNT(college)
FROM players
WHERE college LIKE 'C%'
GROUP BY college;

SELECT playerID, COUNT(playerID)
FROM players
WHERE playerID LIKE 'C%'
GROUP BY playerID;

-- 4) DISTINCT
	-- Cause) to remove duplication
SELECT DISTINCT college
FROM players
WHERE college LIKE 'C%';

-- 5) UNION
	-- Cause) to remove duplication
SELECT college
FROM players
WHERE college LIKE 'B%'
UNION
SELECT college
FROM players
WHERE college LIKE 'C%';

SELECT college
FROM players
WHERE college LIKE 'B%'
UNION ALL
SELECT college
FROM players
WHERE college LIKE 'C%';

-- 6) RANKING WINDOWS FUNCTION
	-- Cause) to sum up
SELECT ROW_NUMBER() OVER (ORDER BY college)
FROM players;

SELECT ROW_NUMBER() OVER (ORDER BY playerID)
FROM players;

-- 7) MIN MAX
	-- Cause) to sum up

-- If use index, you don't need to sort
