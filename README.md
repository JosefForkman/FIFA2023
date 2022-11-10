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
    name,
    wins,
    draws,
    losses,
    points,
    scored,
    concededGoals,
    goalDifference
FROM
    teams;
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
    JOIN teams ON "groups"."teamId" = teams.id;
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
    outfielders."redCards" != 0
    OR outfielders."yellowCards" != 0
ORDER BY
    outfielders."redCards" DESC;
-----------------------------------------------------------
SELECT
    people."firstName",
    people."lastName",
    goalkeepers."yellowCards",
    goalkeepers."redCards"
FROM
    people
    JOIN goalkeepers ON goalkeepers."peopleId" = people.id
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
```SQL

```
- Short info (teams, flags, abbreviations, score) for the same game as above.
```SQL

```
- List the playoff tree with team abbreviations and -flags, score (if any)/date and time if no result.
```SQL

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
