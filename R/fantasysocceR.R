#' fantasysocceR
#' 
#' Fantasy Football (soccer) datasets and functions
#' 
#' @description Datasets for players and teams in the fantasy football (soccer)
#' game (fantasy.premierleague.com).  The game data updates frequently as users
#' 'manage' their teams, so datasets can go out of date quickly.  I will try
#' to update datasets regularly, but functions are available to help collect
#' up-to-date data in the same/similar format to the existing, stable, datasets.
#' 
#' Datasets include:
#' \itemize{
#'      \item \strong{players} Player summary data for 2015/16 season, see \link{players}
#'      \item \strong{pastseasons} Past season data for the 2015/16 season, see
#'      \link{pastseasons}
#'      \item \strong{players201415} Player summary data for 2014/15 season, 
#'      see \link{players201415}
#'      \item \strong{pastseasons201415} Past season data for 2014/15 season, 
#'      see \link{pastseasons201415}
#'      \item \strong{season201415} Performance data for the 2014/15 Season, see \link{season201415}
#' }
#' @name fantasysocceR
#' @docType package
NULL

#' Players dataset
#' 
#' @description Summary data about the current players in the game, some 
#' variables in this dataset will almost immediately be out of date (such as 
#' \emph{pct}), data collected Jul 15, 2015.
#' See \link{collect_ff} for getting up-to-date data.
#' 
#' @docType data
#' @keywords datasets
#' @name players
#' @format 502 rows, 7 columns
#' @details Variables
#' \itemize{
#'      \item \strong{pos} player pos
#'      \item \strong{team} player team
#'      \item \strong{pts} total points scored last season
#'      \item \strong{id} player id
#'      \item \strong{name} player name
#'      \item \strong{value} player value
#'      \item \strong{pct} percentage of fantasy teams player is selected by
#' }
NULL

#' Past seasons dataset
#' 
#' @description Data about the current players in the game and their performance
#' in past seasons.  Unlike \link{players} dataset, the
#' majority of the variables in this dataset should be stable, but it does
#' include some of the data found in \link{players}, data collected Jul 15, 2015.  
#' 
#' @details If a player was included in more than one previous version of the 
#' game, then that player will have multiple rows.  If a player is new to the 
#' game, they will have summary data found in \link{players} but past seasons
#' will be filled with NAs.
#' 
#' @docType data
#' @keywords datasets
#' @name pastseasons
#' @format 1869 rows, 24 columns
#' @details Variables
#' \itemize{
#'      \item \strong{pos} player pos
#'      \item \strong{team} player team
#'      \item \strong{pts} total points scored last season
#'      \item \strong{id} player id
#'      \item \strong{name} player name
#'      \item \strong{value} player value
#'      \item \strong{pct} percentage of fantasy teams player is selected by
#'      \item \strong{season} past season
#'      \item \strong{mins} number of minutes played
#'      \item \strong{goals} goals scored
#'      \item \strong{assists} assists
#'      \item \strong{cs} clean sheets
#'      \item \strong{og} own goals
#'      \item \strong{ga} goals against
#'      \item \strong{pens_svd} penalties saved
#'      \item \strong{pens_msd} penalties missed
#'      \item \strong{yel} yellow cards
#'      \item \strong{red} red cards
#'      \item \strong{saves} number of saves (keepers)
#'      \item \strong{bonus} bonus points
#'      \item \strong{ea_ppi} ea sports player performace index
#'      \item \strong{bps} bonus points system
#'      \item \strong{fin_val} player value at close of season
#'      \item \strong{ssn_pts} total points for that season
#' }
NULL

#' Players 2014/15 dataset
#' 
#' @description Summary data about the current players in the game, some 
#' variables in this dataset will almost immediately be out of date (such as 
#' \emph{pct}).  See \link{collect_ff} for getting up-to-date data.
#' 
#' @docType data
#' @keywords datasets
#' @name players201415
#' @format 554 rows, 7 columns
#' @details Variables
#' \itemize{
#'      \item \strong{pos} player pos
#'      \item \strong{team} player team
#'      \item \strong{pts} total points scored last season
#'      \item \strong{id} player id
#'      \item \strong{name} player name
#'      \item \strong{value} player value
#'      \item \strong{pct} percentage of fantasy teams player is selected by
#' }
NULL

#' Past seasons 2014/15 dataset
#' 
#' @description Data about the current players in the game and their performance
#' in past seasons.  Unlike \link{players} dataset, the
#' majority of the variables in this dataset should be stable, but it does
#' include some of the data found in \link{players}.  
#' 
#' @details If a player was included in more than one previous version of the 
#' game, then that player will have multiple rows.  If a player is new to the 
#' game, they will have summary data found in \link{players} but past seasons
#' will be filled with NAs.
#' 
#' @docType data
#' @keywords datasets
#' @name pastseasons201415
#' @format 1920 rows, 24 columns
#' @details Variables
#' \itemize{
#'      \item \strong{pos} player pos
#'      \item \strong{team} player team
#'      \item \strong{pts} total points scored last season
#'      \item \strong{id} player id
#'      \item \strong{name} player name
#'      \item \strong{value} player value
#'      \item \strong{pct} percentage of fantasy teams player is selected by
#'      \item \strong{season} past season
#'      \item \strong{mins} number of minutes played
#'      \item \strong{goals} goals scored
#'      \item \strong{assists} assists
#'      \item \strong{cs} clean sheets
#'      \item \strong{og} own goals
#'      \item \strong{ga} goals against
#'      \item \strong{pens_svd} penalties saved
#'      \item \strong{pens_msd} penalties missed
#'      \item \strong{yel} yellow cards
#'      \item \strong{red} red cards
#'      \item \strong{saves} number of saves (keepers)
#'      \item \strong{bonus} bonus points
#'      \item \strong{ea_ppi} ea sports player performace index
#'      \item \strong{bps} bonus points system
#'      \item \strong{fin_val} player value at close of season
#'      \item \strong{ssn_pts} total points for that season
#' }
NULL

#' Season 2014/15 dataset
#' 
#' @description dataset of fantasy football performance scores for each player
#' included in the game and each gameweek
#' 
#' @docType data
#' @keywords datasets
#' @name season201415
#' @format 24876 rows, 27 columns
#' @details Variables
#' \itemize{
#'      \item \strong{id} player id
#'      \item \strong{name} player name
#'      \item \strong{pos} player position
#'      \item \strong{team} player's team
#'      \item \strong{pts} end of season points total
#'      \item \strong{value} end of season player value
#'      \item \strong{pct} percentage of teams player is included in at end of season 
#'      \item \strong{date} gameweek date
#'      \item \strong{gw} gameweek id
#'      \item \strong{opp} opponent and result
#'      \item \strong{mins} minutes played
#'      \item \strong{goals} goals scored
#'      \item \strong{assists} assists
#'      \item \strong{cs} clean sheets
#'      \item \strong{ga} goals against
#'      \item \strong{og} own goals
#'      \item \strong{pens_svd} penalties saved
#'      \item \strong{pens_mds} penalties missed
#'      \item \strong{yel} yellow cards
#'      \item \strong{red} red cards
#'      \item \strong{saves} saves
#'      \item \strong{bonus} bonus points
#'      \item \strong{ea_ppi} ea sports player performance index
#'      \item \strong{bps} bonus points system
#'      \item \strong{net_transfers} transfers in/out of fantasy teams
#'      \item \strong{gw_val} gameweek value
#'      \item \strong{gw_pts} gameweek points
#' }
NULL