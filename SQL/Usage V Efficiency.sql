/*
=========================================================
NBA Player Performance Analysis
Query: Usage vs Efficiency Analysis

Author: Eugene

Business Question:
Do high-volume scorers sacrifice efficiency?

Objective:
Evaluate whether increased offensive usage
results in reduced shooting efficiency.

Techniques Used:
- CASE Statements
- Aggregations
- Player Segmentation

Metric:
True Shooting Percentage (TS%)

=========================================================
*/


SELECT 
    CASE
        WHEN usage_pct < 0.164 THEN 'Low usage'
        WHEN usage_pct < 0.196 THEN 'Medium usage'
        ELSE 'High usage'
    END AS usage_group,
    ROUND(AVG(true_shooting_pct) * 100, 1) AS avg_ts_pct,
    COUNT(*) AS n
FROM
    allseasons
WHERE
    games_played >= 40
        AND usage_pct IS NOT NULL
        AND true_shooting_pct IS NOT NULL
GROUP BY usage_group
ORDER BY avg_ts_pct;

-- No correlation between true shooting and usage percetage. There no correlation between volume scorers and reduced efficiency]