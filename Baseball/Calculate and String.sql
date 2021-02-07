SELECT 2021 - birthYear As KoreanAge
FROM players
WHERE deathYear IS NULL AND birthYear IS NOT NULL AND 2021 - birthYear <= 80
ORDER BY KoreanAge;

SELECT ROUND(3.141592, 3);

SELECT COS(0);

SELECT N'¾È³çÇÏ¼¼¿ä';

SELECT SUBSTRING('20200425', 1, 4);

SELECT TRIM('          HelloWorld');

SELECT nameFirst + ' ' + nameLast AS fullName
From players
WHERE nameFirst IS NOT NULL AND nameLast IS NOT NULL;