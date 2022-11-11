# FIFA2023
## SQL query
- List all games today
```SQL
SELECT * FROM games
	WHERE "date" = "27/7";
```
- List a team’s matches and results.
```SQL
SELECT 
	games.match,
	games.date,
	team1.name,
	scores.finalScoreTeam1 as "Fulltime",
	scores."half-timeScoreTeam1" as "Half-time",
	team2.name,
	scores.finalScoreTeam2 as "Fulltime",
	scores."half-timeScoreTeam2" as "Half-time"
	from games
inner join teams team1
on team1.id = team1Id 
inner join teams team2
on team2.id = team2Id
inner join scores
on games.id = scores.matchId

where team1.name like "Norway" or team2.name like "Norway";
```
### Våran
- List a group table with teams, wins, draws, losses, goal difference and points.
```SQL
SELECT
    "groups"."groupName",
    teams."name",
    teams.wins,
    teams.draws,
    teams.losses,
    teams.points,
    teams."goalDifference"
FROM
    "groups"
JOIN 
	teams 
ON 
	"groups"."teamId" = teams.id
WHERE
	groups.groupName == "A";
```
- List the top-10 players sorted first by goals, then by assists
```SQL
SELECT
	people."firstName",
	people."lastName",
    outfielders.goals,
    outfielders.assists
FROM
    outfielders
JOIN people ON outfielders."peopleId" = people.id
ORDER BY
   outfielders.assists, outfielders.goals DESC
LIMIT 10;
```
- List all players that are unavailable due to disciplinary reasons (i.e 2 yellow cards or 1 red card)
```SQL
SELECT
    people."firstName",
    people."lastName",
    outfielders."yellowCards",
    outfielders."redCards"
FROM
    people
    JOIN outfielders ON outfielders."peopleId" = people.id
WHERE
    outfielders."redCards" != 0 OR outfielders."yellowCards" >= 2
    
    
UNION


SELECT
    people."firstName",
    people."lastName",
    goalkeepers."yellowCards",
    goalkeepers."redCards"
FROM
    people
    JOIN goalkeepers ON goalkeepers."peopleId" = people.id
WHERE
    goalkeepers."redCards" != 0 OR goalkeepers."yellowCards" >= 2;
------------------------------------------------------------
Konstig fel
SELECT DISTINCT 
    people."firstName",
    people."lastName",
    goalkeepers."yellowCards" as "Goalkeepers yellow cards",
    goalkeepers."redCards" as "Goalkeepers red card",
    outfielders."yellowCards" as "Outfielders yellow cards",
    outfielders."redCards" as "Outfielders red card"
FROM
    people
    JOIN goalkeepers, outfielders ON goalkeepers."peopleId" = people.id or outfielders."peopleId" = people.id
WHERE
    goalkeepers."redCards" != 0
    OR goalkeepers."yellowCards" != 0
ORDER BY
    goalkeepers."redCards" DESC;
```
- List a teams roster with players and coach, goals, assists, shots and disciplinary, matches played, matches started, minutes played. Number of clean sheets and save percentage for the goalkeepers.
```SQL
  select * from people
  left join outfielders
  on people.id = outfielders.peopleId
  left join goalkeepers
  on people.id = goalkeepers.peopleId
  left join coaches
  on people.id = coaches.peopleId
  inner join teams
  on outfielders.teamId = teams.id or goalkeepers.teamId = teams.id or coaches.teamId = teams.id
  where teams.name like "Philippines"




```
- Detailed info for a finished game including teams, players, goals, disciplinary, substitutions, referee, venue, date. Every situation often includes one or more players, a time and sometimes additional info


General info about game:
```SQL
select 
	games.date,
	games.match,
	venues.stadium,
	venues.city,
	games.attendance,
	team1.name as Team1,
	scores.finalScoreTeam1 as "Full-time Score",
	scores."half-timeScoreTeam1" as "Half-time Score",
	team2.name as Team2,
	scores."half-timeScoreTeam2" as "Half-time Score",
	scores.finalScoreTeam2 as "Full-time Score",
	refereePeople.firstName as "Referee",
	refereePeople.lastName
	
	
	
from games
inner join venues
on venues.id = games.venuesId
inner join referee
on games.headRefereeeId = referee.id
inner join people refereePeople
on refereePeople.id = referee.id
inner join teams team1
on team1.id = games.team1Id
inner join teams team2
on team2.id = games.team2Id
inner join scores
on scores.matchId = games.id
where games.id = 1;

```

Goals:
```SQL
select 
	goals.goalMinute, 
	people.firstName as Scorer,
	people.lastName, goalmakers.shirtNumber, 
	assistersPeople.firstName as Assist, 
	assistersPeople.lastName, 
	assisters.shirtNumber, 
	goals.goalMinute, 
	teams.name as 
	Country from goals
inner join people 
on people.id = goals.scoreId
inner join outfielders goalmakers
on people.id = goalmakers.peopleId
inner join outfielders assisters
on people.id = assisters.peopleId
inner join people assistersPeople
on assistersPeople.id = assisters.peopleId
inner join games
on games.id = goals.gameId
inner join teams
on goalmakers.teamId = teams.id
where goals.GameId = 1;


```
- Short info (teams, flags, abbreviations, score) for the same game as above.
```SQL

select team1.name, scores.finalScoreTeam1 as Score, team1.flagURL, team1.abbreviation, team2.name, scores.finalScoreTeam2 as Score, team2.flagURL, team2.abbreviation from games
inner join teams team1
on team1Id = team1.id
inner join teams team2
on team2Id = team2.id
inner join scores
on scores.matchId = games.id
where games.id = "1";





```
- List the playoff tree with team abbreviations and -flags, score (if any)/date and time if no result.
```SQL

select 
	games.date, 
	games.match, 
	games.utc as "Time(UTC)",
	team1.name as "Team 1",
	scores.finalScoreTeam1 as "Fulltime",
	scores."half-timeScoreTeam1" as "Half-time",
	team1.abbreviation,
	team1.flagURL, 
	team2.name as "Team 2",
	scores.finalScoreTeam1 as "Fulltime",
	scores."half-timeScoreTeam1" as "Half-time",
	team2.abbreviation,
	team2.flagURL 
from games
LEFT join teams team1
on team1.id = games.team1Id
LEFT join teams team2
on team2.id = games.team2Id
left join scores
on games.id = scores.matchId
where games.match not like "%Group%"

```
# Tabell
- games

  - id
  - date
  - match //8-dels final 1 etc. Kommer ni på ett bättre namn för det här fältet får ni gärna säga till

  - headRefereeId
  - venuesId
  - team1Id
  - team2Id

- scores //Innehåller poängställning för alla matcher vid olika tillfällen

  - matchId
  - finalScore
  - full-time
  - half-time

- goals //Spelare borde hämta stats för antal mål och assists härifrån
  - id
  - gameId
  - scorerId
  - assistId
  - time
  - typeOfTime

disciplinaries

    - action
    - gameId
    - refereeId

- teams

  - name
  - abbreviation
  - flagURL
  - wins
  - draws
  - losses
  - scored
  - concededGoals

- people
  - lastName
  - firstName
- Goalkeepers
  - Goalkeeperstats
  - shirtNumber
  - minutesPlayed
  - matchesStarted
  - redCards
  - yellowCards
- Outfielders
  - shirtNumber
  - minutesPlayed
  - matchesStarted
  - redCards
  - yellowCards
  - shotsTaken
  - goals // Dessa två kan ev hämta info från scores-taben
  - assists //
- coaches?
  - redCards
  - yellowCards
- referee?
  - redCards
  - yellowCards
  - freeKicks
  - penaltyKicks
- venues
  - city
  - name
  - capacity

<!-- - schedule
    - name
    - Date -->

Alla resultat ska innehålla information om det är efter ordinarie tid (90+ min), efter förlängning eller efter förlängning och straffläggning.

Alla resultat bör ha ett värde om poäng efter full tid, poäng i halvtid, om det har blivit förlängning (2 x 15 min), om matchen avgjordes med straffar, hur stor publik, vem var huvuddomaren? Och självklart även info om mål och assist, disciplinära (kort), byten mm.
