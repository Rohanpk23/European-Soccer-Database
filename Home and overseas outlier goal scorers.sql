/* PART 1 : Finding all those teams who scored 3 times more than the overall goal average in their home games 
Remove the comments to run each part */
SELECT m.id AS Match_Id,
       m.season,
       m.home_team_api_id, 
       t.team_long_name AS HomeTeam, 
       m.home_team_goal,
	   ROUND((SELECT AVG(home_team_goal + away_team_goal) FROM match),3) AS overall_avg
FROM match AS m
INNER JOIN Team AS t
ON m.home_team_api_id = t.team_api_id
WHERE m.home_team_goal > 3*(SELECT AVG(home_team_goal + away_team_goal) 
                            FROM Match) 
ORDER BY m.home_team_goal DESC


/* PART 2 : Finding all those teams who scored 3 times more than the overall goal average in their away games */
/*
SELECT m.id AS Match_Id,
       m.season,
       m.away_team_api_id, 
       t.team_long_name AS AwayTeam, 
       m.away_team_goal,
	   ROUND((SELECT AVG(home_team_goal + away_team_goal) FROM match),3) AS overall_avg
FROM match AS m
INNER JOIN Team AS t
ON m.away_team_api_id = t.team_api_id
WHERE m.away_team_goal > 3*(SELECT AVG(home_team_goal + away_team_goal) 
                            FROM Match) 
ORDER BY m.away_team_goal DESC
*/


