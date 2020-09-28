--- Get the season wise highest scorer on home grounds; Similary highest scorer for overseas ground can also be found
--- Step 1: Given the season, find the corresponding team who scored the highest goals

--- CTE to get the highest home goals scored in each season
WITH season_max AS (
                    SELECT season,
                           MAX(home_team_goal) AS max_goals
                    FROM Match
                    GROUP BY season
                   )

SELECT mt.id AS match_id, 
       mt.Season, 
       mt.home_team_api_id AS Team_id, 
	   t.team_long_name AS HomeTeam,
	   mt.home_team_goal AS Max_HomeGoals
	   
--- This section replaces the team Ids with their names	(joining team and match table)	   
FROM Match AS mt
INNER JOIN team AS t
ON mt.home_team_api_id = t.team_api_id

--- select those match id from match table if and only if their home goals and seasons are equal. Comparison happens for every row in s table
WHERE mt.id IN(
               SELECT (SELECT m.id
	                   FROM Match AS m
	                   WHERE m.season = s.season AND m.home_team_goal = s.max_goals) AS m 
               FROM season_max AS s
		      )
ORDER BY mt.season