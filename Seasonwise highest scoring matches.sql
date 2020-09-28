WITH maxgoals AS (
SELECT season,
       MAX(home_team_goal + away_team_goal) AS tot_max
FROM match
GROUP BY season)

SELECT mt.id, 
       mt.season,
	   t.team_long_name AS HomeTeam,
	   t2.team_long_name AS AwayTeam,
	   mt.home_team_goal + mt.away_team_goal AS max_TotalGoals
	   
FROM match AS mt 
INNER JOIN team AS t
ON mt.home_team_api_id = t.team_api_id
INNER JOIN team AS t2
ON mt.away_team_api_id = t2.team_api_id

WHERE mt.id IN (
                SELECT (SELECT id
                        FROM Match AS m
                        WHERE m.season = mx.season AND 
		                      (m.home_team_goal + m.away_team_goal) = mx.tot_max) AS match_id
                FROM maxgoals AS mx
			   )
ORDER BY mt.season