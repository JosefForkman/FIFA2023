# FIFA2023

# Tabell
- Matches
    - id
    - date
    - match     //8-dels final 1 etc. Kommer ni på ett bättre namn för det här fältet får ni gärna säga till
    
    - head_referee_id
    - venues_id
- Scores //Innehåller poängställning för alla matcher vid olika tillfällen
    - match_id
    - final_score
    - full-time
    - half-time


- Goals   //Spelare borde hämta stats för antal mål och assists härifrån
    - id
    - game_id
    - scorer_id
    - assist_id
    - time        
    - type_of_time



Disciplinaries

    - action
    - game_id
    - referee_id


- GamesToTeams 
    - team_id (1)
    - game_id (1)

- Team
    - name
    - abbreviation
    - flagURL
    - wins
    - draws
    - losses
    - scored
    - conceded goals

- People
    - last name
    - first name
- Goalkeepers
    - Goalkeeperstats
    - shirt number
    - minutes played
    - matches started
    - red cards
    - yellow cards
- Outfielders
    - shirt number
    - minutes played
    - matches started
    - red cards    
    - yellow cards 
    - shots taken
    - goals     // Dessa två kan ev hämta info från scores-taben
    - assists   //
- coaches?
    - red cards
    - yellow cards
- referee?
    - red cards
    - yellow cards
    - free kicks
    - penalty kicks
- venues 
    - city
    - name
    - capacity


<!-- - schedule 
    - name
    - Date -->

Alla resultat ska innehålla information om det är efter ordinarie tid (90+ min), efter förlängning eller efter förlängning och straffläggning.

Alla resultat bör ha ett värde om poäng efter full tid, poäng i halvtid, om det har blivit förlängning (2 x 15 min), om matchen avgjordes med straffar, hur stor publik, vem var huvuddomaren? Och självklart även info om mål och assist, disciplinära (kort), byten mm.