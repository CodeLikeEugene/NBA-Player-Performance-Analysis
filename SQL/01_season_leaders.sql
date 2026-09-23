/*
=========================================================
NBA Player Performance Analysis
Query: Season Leaders Analysis

Author: Eugene

Business Question:
Who were the league leaders in scoring,
rebounding, and assists for each NBA season?

Objective:
Identify the top-performing players in each major
statistical category across all seasons.

Techniques Used:
- ROW_NUMBER()
- Window Functions
- Seasonal Ranking

=========================================================
*/


-- Highest scorers in each season
SELECT player_name, franchise_id, season, points_per_game
FROM (
    SELECT 
        player_name, 
        franchise_id, 
        season, 
        points_per_game,
        ROW_NUMBER() OVER (PARTITION BY season ORDER BY points_per_game DESC) AS rank_in_season
    FROM allseasons
) AS ranked_seasons
WHERE rank_in_season = 1
ORDER BY season;
-- The query above shows us the top scorer in each season

-- Highest rebounds per game

SELECT player_name,
       franchise_id,
       season,
       rebounds_per_game
FROM  (SELECT player_name,
              franchise_id,
              season,
              rebounds_per_game,
              ROW_NUMBER()
                OVER(
                  PARTITION BY season
                  ORDER BY rebounds_per_game DESC) AS RankInSeason
       FROM   allseasons) AS Ranks
WHERE  RankInSeason <= 1
ORDER  BY season; 



-- The query above shows the player with the highest rebounds per game in each season


-- Highest assists per game

SELECT player_name,
       franchise_id,
       season,
       assists_per_game
FROM   (SELECT player_name,
               franchise_id,
               season,
               assists_per_game,
               ROW_NUMBER()
                 OVER(
                   PARTITION BY season
                   ORDER BY assists_per_game DESC) AS Assts
        FROM   allseasons) AS RanksAssts
WHERE  assts = 1; 


-- Query above shows the player wuth the highest assist per game in each season
