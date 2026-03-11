---Query 1--
SELECT name
FROM players
JOIN groups
USING(groupid)
WHERE groupname = 'Cohort 4';

----Query2 --- Listing all fixtures for a specific date (i.e. 29th of October 2022 and including 
-- team names and venues).
SELECT
   MatchDate,
   MatchTime,
   HT.Team_Name AS HomeTeam,
   AT.Team_Name AS AwayTeam,
   Venue_Name
FROM
    Fixtures 
JOIN teams HT
ON Fixtures.Home_teamID = HT.teamID 
JOIN teams AT
ON Fixtures.Away_teamID = AT.teamID

Join venues
USING(VenueID)
WHERE MatchDate = '2022-10-29'

--Query 3  Listing all the players who have scored more than 2 goals -- 
select 
	name, 
	COUNT(E.eventID) 
FROM players
JOIN events E
ON players.playerID = E.playerID
WHERE E.event_Type_ID = '1'
GROUP BY name
HAVING COUNT(E.eventID) > 2;

-- query 4 Listing the number of cards (yellow and red) per team.
SELECT
	team_name,
	SUM(CASE WHEN E.event_Type_ID = 2 THEN 1 ELSE 0 END),
	SUM(CASE WHEN E.event_Type_ID = 3 THEN 1 ELSE 0 END),
	SUM(CASE WHEN E.event_Type_ID IN (2,3) THEN 1 ELSE 0 END) AS Totalcards
	
FROM teams
JOIN players P
ON teams.TeamID = P.TeamID
JOIN events E
ON P.playerID = E.playerID
GROUP BY team_name
ORDER BY Totalcards DESC;


-- query 5    --
SELECT
   MatchDate,
   MatchTime,
   HT.Team_Name AS HomeTeam,
   AT.Team_Name AS AwayTeam
   
FROM
    Fixtures 
JOIN teams HT
ON Fixtures.Home_teamID = HT.teamID 
JOIN teams AT
ON Fixtures.Away_teamID = AT.teamID
WHERE IsFriendly = 'TRUE'

--- query 6 The table displays the team's name and the points earned during the tournament.  STEP 1-----
--- first 
---Home points--
WITH MatchResults AS (
SELECT home_teamid AS TeamId,
	CASE
		WHEN resultsID = 1 THEN 3
		WHEN resultsID = 3 THEN 1
		ELSE 0
		END AS Points
	FROM fixtures
	
	
UNION ALL
----Away points---
SELECT away_teamid AS TeamID,
	CASE
		WHEN resultsID = 2 THEN 3
		WHEN resultsID = 3 THEN 1
		ELSE 0
		END AS Points
	
FROM fixtures
)
---- Above is scores below we print data in correct format----
SELECT teams.team_name, SUM(points) AS total_points
FROM MatchResults
JOIN teams
USING(teamID)
GROUP BY teams.team_name
ORDER BY total_points DESC;

-----query 7 For each team, present the distribution of goals scored and conceded in each half of the match
--first  Identify the scoring team, the match teams, and the minute for every goal an dthen store as its on tbale
WITH Goal AS (    
	SELECT 
		p.TeamID AS scoringTeam,
		f.Home_TeamID, 
		f.away_TeamID,
		Minute
	FROM Events
	JOIN fixtures F
	USING(matchID)
	JOIN players p
	USING(playerID)
	WHERE event_type_ID = '1')
-- main query 
SELECT team_name,
	
		SUM(CASE WHEN teamid = G.scoringteam AND minute<= 45 THEN 1 ELSE 0 END) AS ScoredFirstHalf,
		SUM(CASE WHEN teamid = G.scoringteam AND minute>= 46 THEN 1 ELSE 0 END) AS ScoredSecondHalf,
-- assumption that there was no extra time in any of the games---
		SUM(CASE WHEN teamid != G.scoringteam AND teamid= home_teamid OR teamid = away_teamid AND minute <= 45 THEN 1 ELSE 0 END) AS ConcededFirstHalf,
		SUM(CASE WHEN teamid != G.scoringteam AND teamid= home_teamid OR teamid = away_teamid AND minute >= 46 THEN 1 ELSE 0 END) AS ConcededSecondHalf
FROM teams 
JOIN Goal G
ON teams.teamID  IN (g.Home_TeamID, g.Away_TeamID)
GROUP BY team_name
ORDER BY team_name;

	