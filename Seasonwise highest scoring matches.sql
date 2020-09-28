--- CTE to get the highest goals scored in each season
WITH maxgoals AS (
SELECT season,
       MAX(home_team_goal + away_team_goal) AS tot_max
FROM match
GROUP BY season)

--- select the respective columns from tables for the match ids got through WHERE clause
SELECT mt.id, 
       mt.season,
	   t.team_long_name AS HomeTeam,
	   t2.team_long_name AS AwayTeam,
	   mt.home_team_goal + mt.away_team_goal AS max_TotalGoals
	   
--- This section replaces the team Ids with their names	(joining team and match table)
FROM match AS mt 
INNER JOIN team AS t
ON mt.home_team_api_id = t.team_api_id
INNER JOIN team AS t2
ON mt.away_team_api_id = t2.team_api_id

WHERE mt.id IN (
--- select those match id from match table if and only if their total goals and seasons are equal. Comparison happens for every row in mx table
                SELECT (SELECT id
                        FROM Match AS m
                        WHERE m.season = mx.season AND 
		                      (m.home_team_goal + m.away_team_goal) = mx.tot_max) AS match_id
                FROM maxgoals AS mx
			   )
ORDER BY mt.season