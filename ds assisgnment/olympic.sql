USE olympicsdataset;
-- Question A:
SELECT * FROM olympics;
-- Question B:
SELECT name, medal FROM olympics;
-- Question C:
SELECT COUNT(DISTINCT name) AS Total_Athletes FROM olympics;
-- Question D:
SELECT * FROM olympics WHERE medal = 'Gold';
-- Question E: 
SELECT name, year, medal FROM olympics WHERE medal = 'Silver' ORDER BY year;
-- Question F: 
SELECT team, 
       COUNT(CASE WHEN medal = 'Gold' THEN 1 END) AS Gold_Medals,
       COUNT(CASE WHEN medal = 'Silver' THEN 1 END) AS Silver_Medals,
       COUNT(CASE WHEN medal = 'Bronze' THEN 1 END) AS Bronze_Medals
FROM olympics
GROUP BY team;
-- Question G: 
SELECT team 
FROM olympics
WHERE medal = 'Gold'
GROUP BY team
HAVING COUNT(*) > 50;
-- Question I: 
SELECT name, COUNT(*) AS Total_Medals
FROM olympics
GROUP BY name
ORDER BY Total_Medals DESC
LIMIT 1;
-- Question J: 
SELECT DISTINCT event
FROM olympics
WHERE event LIKE '%Freestyle%';
-- Question K: 
SELECT sport, name, COUNT(*) AS Total_Medals
FROM olympics
GROUP BY sport, name
ORDER BY Total_Medals DESC
LIMIT 3;
-- Question L: 
SELECT name, year, COUNT(*) AS Total_Medals
FROM olympics
GROUP BY name, year
HAVING COUNT(*) > 1;
-- Question M: 
SELECT team
FROM olympics
WHERE medal = 'Gold'
GROUP BY team
HAVING COUNT(DISTINCT season) > 1;
-- Question N: 
SELECT team, MAX(year) - MIN(year) AS Year_Difference
FROM olympics
GROUP BY team;
-- Question O: 
SELECT team, AVG(Total_Medals) AS Avg_Medals_Per_Athlete
FROM (SELECT team, name, COUNT(*) AS Total_Medals
      FROM olympics
      GROUP BY team, name) AS Subquery
GROUP BY team;
-- Question P: 
SELECT DISTINCT name, event
FROM olympics
WHERE medal = 'Silver'
  AND event IN (SELECT event
                FROM olympics
                WHERE medal = 'Gold');
-- Question S: 
SELECT team
FROM olympics
GROUP BY team
HAVING COUNT(DISTINCT sport) > 10;