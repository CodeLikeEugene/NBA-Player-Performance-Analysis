/*
=======================================================
NBA Player Performance Analysis
Query: Era Analysis
Author: Eugene

Business Question:
How has the physical profile of NBA players
changed over time?

Objective
Compare average player height and weight
across NBA decades.

Techniques Used:
- CTEs
-CASE Statements
-Aggregate Functions

Metrics:
-Average Height
-Average Weight

========================================================
*/


-- Avg Height & Weight per decade
WITH sized AS (
    SELECT 
        player_name,
        season,
        player_height,
        player_weight,
        CAST(SUBSTR(season, 1, 4) AS unsigned) AS start_year
    FROM allseasons
)
SELECT 
    CASE 
        WHEN start_year < 2000 THEN '90s'
        WHEN start_year < 2010 THEN '00s'
        WHEN start_year < 2020 THEN '10s'
        ELSE '20s'
    END AS decade,
    ROUND(AVG(player_height), 1) AS avg_height,
    ROUND(AVG(player_weight), 1) AS avg_weight
FROM sized
GROUP BY decade
ORDER BY decade;
