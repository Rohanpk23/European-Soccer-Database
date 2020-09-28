/* There are 3 tables in the main picture :- Table formed after the first JOIN(only home team mapped): T1, 
   Match table in FROM clause : T2 and the SELECT subquery that has the away ids mapped : T3.
   So the aim is to combine T1 and T3 */


SELECT m_m.home_team_api_id,
       t_m.team_long_name AS HomeTeam,
	   --- Exact process is repeated for away team ids + a mapping cond to be added
	   ( 
	    SELECT t_sub.team_long_name 
		FROM match AS m_sub
		 INNER JOIN team AS t_sub
		  ON m_sub.away_team_api_id = t_sub.team_api_id
		WHERE m_sub.away_team_api_id = m_m.away_team_api_id  --- mapping condition
	    ) AS AwayTeam
       
FROM match AS m_m
INNER JOIN team AS t_m
ON m_m.home_team_api_id = t_m.team_api_id
--- Before executing SELECT, home team names have been mapped using INNER JOIN between match and team tables; 
--- Away team ids are yet to be mapped
LIMIT 2000
