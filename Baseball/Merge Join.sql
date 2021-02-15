USE BaseballData;

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SET STATISTICS PROFILE ON;

-- Merge(병합) 조인 = Sort Merge(정렬 병합) 조인

SELECT *
FROM players AS p
	INNER JOIN salaries AS s
	ON p.playerID = s.playerID;

-- Merge Join has Condition
-- outer has to be unique
-- One-TO-Many(PK, unique)
-- Random Access X -> Clustered Scan and sorting

SELECT *
FROM schools AS s
	INNER JOIN schoolsplayers AS p
	ON s.schoolID = p.schoolID;

-- Merge -> Sort Merge Join
	-- 1) two set need to Sort and Merge
		-- if already be sorted, then skip(Clustered sorted in physically is best)
		-- so many data to sort is bad -> Hash
	-- 2) Process is not always Random Access
	-- 3) One-to-Many is better to join then Many-toMany
		-- PK, Unique


