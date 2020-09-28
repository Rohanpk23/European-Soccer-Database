--- Get the season wise highest scorer on home grounds; Similary highest scorer for overseas ground can also be found
--- Step 1: Given the season, find the corresponding team who scored the highest goals

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
	   
FROM Match AS mt
INNER JOIN team AS t
ON mt.home_team_api_id = t.team_api_id

WHERE mt.id IN(
               SELECT (SELECT m.id
	                   FROM Match AS m
	                   WHERE m.season = s.season AND m.home_team_goal = s.max_goals) AS m 
               FROM season_max AS s
		      )
ORDER BY mt.season