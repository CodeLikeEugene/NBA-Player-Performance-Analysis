/*
=========================================================
NBA Player Performance Analysis
Query: Data MVP Analysis

Author: Eugene

Business Question:
Who is the MVP based on a
data-driven evaluation model?

Objective:
Develop a weighted MVP framework
that rewards scoring, playmaking,
rebounding, and efficiency.

MVP Formula:

40% Points Per Game
30% Rebounds + Assists
30% True Shooting Percentage

Techniques Used:
- Custom Metrics
- Weighted Scoring Model
- Ranking Analysis

=========================================================
*/


WITH MVPScores AS
(
    SELECT
        player_name,
        franchise_id,
        season,

        (
            0.40 * points_per_game
            +
            0.30 * (rebounds_per_game + assists_per_game)
            +
            0.30 * true_shooting_pct
        ) AS MVPScore

    FROM allseasons
)

SELECT *
FROM MVPScores
WHERE season = '2022-23'
ORDER BY MVPScore DESC
LIMIT 1;

-- Luka Doncic is the MVP for 2022-23
