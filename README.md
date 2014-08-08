fantasysocceR
=============

R package with datasets and functions for the fantasy football game [fantasy.premierleague.com](http://fantasy.premierleague.com/)

#### Installation
Within R
```R
devtools::install_github("fantasysocceR", "durtal")
```

#### Datasets
Name | Contents
-----|--------
players| summary data for current players
pastseasons| data from previous seasons
gameweeks| fixtures per team, per gameweek

Load data as normal
```R
data(players)
```

### New data
The data will quickly expire as users manage their teams and interact with the game, so there are functions to collect new data, and to turn this into dataframes in the same format as the 3 above.  

```R
player_list <- collect_ff(n = 10)
```

Convert player_list into players dataframe (see help page for more options)
```R
new_players <- players_df(player_list)
?players_df
```
or past seasons
```R
new_pastseasons <- pastseasons_df(player_list)
```
or gameweeks
```R
new_gameweeks <- gameweeks_df(player_list)
```
