/*
=========================================================
NBA Player Performance Analysis
Query: Rookie vs Veteran Comparison

Author: Eugene

Business Question:
How do rookie contributions compare
to veteran contributions?

Objective:
Evaluate differences in scoring,
rebounding, and playmaking between
rookies and veteran players.

Techniques Used:
- CASE Statements
- Aggregate Functions
- Group Comparisons

=========================================================
*/



 -- Rookies vs Veterans | Who contributes more
SELECT 
    CASE
        WHEN age <= 22 THEN 'Rookie'
        WHEN age >= 30 THEN 'Veteran'
    END AS PlayerType,
    ROUND(AVG(points_per_game), 2) AS AvgPPG,
    ROUND(AVG(rebounds_per_game), 2) AS AvgRPG,
    ROUND(AVG(assists_per_game), 2) AS AvgAPG
FROM
    allseasons
WHERE
    age <= 22 OR age >= 30
GROUP BY PlayerType;

-- Veterans contribute more
