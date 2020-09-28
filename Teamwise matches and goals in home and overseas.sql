/* Every team has played atleast one home game and a away game. There are two ways to include an extra table: 
Use CTE OR include the subquery in the FROM clause OR use INNER JOIN to combine the subquery (aliased) with Match table*/

--- Select the ids, team names, away, home's match & goal count along with total goal scores
SELECT m.home_team_api_id AS Team_id, 
       t.team_long_name AS Team_name,
	   
	   ---All aggregate functions for the GROUP BY clause
       COUNT (*) AS Home_matches,
	   SUM(m.home_team_goal) AS Home_Goals,
	   subq.Away_matches,
	   subq.Away_Goals,
       SUM(m.home_team_goal) + subq.Away_Goals AS Total_goals
	   	   
--- Two tables in FROM clause	   
FROM Match AS m,
    (SELECT away_team_api_id,
           COUNT(*) AS Away_matches,
		   SUM(away_team_goal) AS Away_Goals
     FROM Match
     GROUP BY away_team_api_id) AS subq --- Subquery in FROM clause to include an extra table for counting away matches 
	 
--- INNER JOIN to get the team names along with their ids
INNER JOIN Team AS t
ON m.home_team_api_id = t.team_api_id
WHERE m.home_team_api_id = subq.away_team_api_id --- Matches a team's corresponding home and away matches from 2 diff table
GROUP BY m.home_team_api_id
ORDER BY Total_goals DESC