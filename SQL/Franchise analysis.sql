/*
======================================================
NBA Player Performance Analysis
Query: Franchise Excellence Analysis
Author Eugene

Business Question
Which teams consistently produce
top performing players?

Objective*
Measure franchise success by calculating
how frequently teams appear among the
Top scorers across seasons.

Techniques Used:
-ROW_NUMBER()
-Window Functions
-Aggregations
- Ranking Analysis

*=======================================================
*/


WITH RankedPlayers AS
(
    SELECT
        player_name,
        franchise_id,
        CAST(SUBSTR(season, 1, 4) AS UNSIGNED) AS RealSeason,
        points_per_game,
        ROW_NUMBER() OVER(
            PARTITION BY CAST(SUBSTR(season, 1, 4) AS UNSIGNED)
            ORDER BY points_per_game DESC
        ) AS PlayerRank
    FROM allseasons
)

SELECT
    franchise_id,
    COUNT(*) AS Top2_Appearances
FROM RankedPlayers
WHERE PlayerRank <= 2
GROUP BY franchise_id
ORDER BY Top2_Appearances desc;

-- LA Lakers have produced the most top performing players