/*
=======================================================
NBA Player Performance Analysis
Query: Most Improved Players
Author: Eugene

Business Question
Which players experienced the largest
year-over-year improvement in scoring?

Objective:
Identify breakout performers by measuring
changes in points per game between seasons

Techniques Used:
- LAG()
- Window Functions
- Trend Analysis

=======================================================
*/


-- Most improved players

WITH scoring_changes AS (
    SELECT 
        player_name,
        season,
        games_played,
        points_per_game,
        LAG(points_per_game) OVER (
            PARTITION BY player_name 
            ORDER BY season
        ) AS prev_season_ppg
    FROM allseasons
    WHERE games_played >= 40
)
SELECT 
    player_name,
    season,
    prev_season_ppg,
    points_per_game,
    ROUND(points_per_game - prev_season_ppg, 1) AS ppg_improvement
FROM scoring_changes
WHERE prev_season_ppg IS NOT NULL
ORDER BY ppg_improvement DESC
LIMIT 5; 