# FIFA2023

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
