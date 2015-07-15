fantasysocceR (1.1.0)
=============

R package with datasets and functions for the fantasy football game [fantasy.premierleague.com](http://fantasy.premierleague.com/).

Here is a short blog post [introducing the package](http://durtal.github.io/blog/r-package-fantasysocceR.html).  Help pages can be found [here](http://durtal.github.io/fantasysocceR/)

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
players201415 | summary data for players in 2014/15 season
pastseasons201415 | data for previous season from 2014/15 season
season201415 | performance data for players across the 2014/15 season

Load data as normal
```R
data(players)
```

### New data

The data will quickly expire as users manage their teams and interact with the game, so there are functions to collect new data, and to turn this into dataframes in the same format as the 3 above.  During the off season, this function my be obsolete.

```R
player_list <- collect_ff(n = 10, .progress = "text")
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
or current season data
```R
currentseason <- currentseason_df(player_list)
```
