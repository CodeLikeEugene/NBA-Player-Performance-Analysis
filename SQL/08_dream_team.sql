
/*
=========================================================
NBA Player Performance Analysis
Query: Data-Driven Dream Team

Author: Eugene

Business Question:
What would a data-driven NBA Dream Team
look like?

Objective:
Identify the best players across key
performance categories and assemble
a representative Dream Team.

Categories:
- Best Scorer
- Best Rebounder
- Best Playmaker
- Most Efficient Shooter
- Data MVP

Techniques Used:
- CTEs
- Aggregations
- Ranking Analysis
- Exclusion Logic

=========================================================
*/


-- BUild your NBA dream team

WITH PlayerStats AS
(
    SELECT
        player_name,

        AVG(points_per_game) AS AvgPPG,
        AVG(rebounds_per_game) AS AvgRPG,
        AVG(assists_per_game) AS AvgAPG,
        AVG(true_shooting_pct) AS AvgTS,

        AVG(
            (0.40 * points_per_game)
            +
            (0.15 * rebounds_per_game)
            +
            (0.15 * assists_per_game)
            +
            (0.30 * true_shooting_pct)
        ) AS MVPScore

    FROM allseasons
    GROUP BY player_name
)

(
    SELECT
        'Best Scorer' AS Category,
        player_name,
        ROUND(AvgPPG,2) AS StatValue
    FROM PlayerStats
    ORDER BY AvgPPG DESC
    LIMIT 1
)

UNION ALL

(
    SELECT
        'Best Rebounder',
        player_name,
        ROUND(AvgRPG,2)
    FROM PlayerStats
    ORDER BY AvgRPG DESC
    LIMIT 1
)

UNION ALL

(
    SELECT
        'Best Playmaker',
        player_name,
        ROUND(AvgAPG,2)
    FROM PlayerStats
    ORDER BY AvgAPG DESC
    LIMIT 1
)

UNION ALL

(
    SELECT
        'Most Efficient Shooter',
        player_name,
        ROUND(AvgTS,2)
    FROM PlayerStats
    ORDER BY AvgTS DESC
    LIMIT 1
)

UNION ALL

(
    SELECT
        'Data MVP',
        player_name,
        ROUND(MVPScore,2)
    FROM PlayerStats
    ORDER BY MVPScore DESC
    LIMIT 2
);

-- second option selecting only unique players for each category

WITH PlayerStats AS
(
    SELECT
        player_name,
        AVG(points_per_game) AS AvgPPG,
        AVG(rebounds_per_game) AS AvgRPG,
        AVG(assists_per_game) AS AvgAPG,
        AVG(true_shooting_pct) AS AvgTS,

        AVG(
            (0.40 * points_per_game)
            + (0.15 * rebounds_per_game)
            + (0.15 * assists_per_game)
            + (0.30 * true_shooting_pct)
        ) AS MVPScore
    FROM allseasons
    GROUP BY player_name
),

BestScorer AS
(
    SELECT *
    FROM PlayerStats
    ORDER BY AvgPPG DESC
    LIMIT 1
),

BestRebounder AS
(
    SELECT *
    FROM PlayerStats
    WHERE player_name NOT IN
    (
        SELECT player_name FROM BestScorer
    )
    ORDER BY AvgRPG DESC
    LIMIT 1
),

BestPlaymaker AS
(
    SELECT *
    FROM PlayerStats
    WHERE player_name NOT IN
    (
        SELECT player_name FROM BestScorer
        UNION
        SELECT player_name FROM BestRebounder
    )
    ORDER BY AvgAPG DESC
    LIMIT 1
),

MostEfficient AS
(
    SELECT *
    FROM PlayerStats
    WHERE player_name NOT IN
    (
        SELECT player_name FROM BestScorer
        UNION
        SELECT player_name FROM BestRebounder
        UNION
        SELECT player_name FROM BestPlaymaker
    )
    ORDER BY AvgTS DESC
    LIMIT 1
),

DataMVP AS
(
    SELECT *
    FROM PlayerStats
    WHERE player_name NOT IN
    (
        SELECT player_name FROM BestScorer
        UNION
        SELECT player_name FROM BestRebounder
        UNION
        SELECT player_name FROM BestPlaymaker
        UNION
        SELECT player_name FROM MostEfficient
    )
    ORDER BY MVPScore DESC
    LIMIT 1
)

SELECT 'Best Scorer' AS Role, player_name
FROM BestScorer

UNION ALL

SELECT 'Best Rebounder', player_name
FROM BestRebounder

UNION ALL

SELECT 'Best Playmaker', player_name
FROM BestPlaymaker

UNION ALL

SELECT 'Most Efficient Shooter', player_name
FROM MostEfficient

UNION ALL

SELECT 'Data MVP', player_name
FROM DataMVP;
