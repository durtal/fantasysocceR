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
#'      \item \strong{players} Player summary data, see \link{players}
#'      \item \strong{pastseasons} Past season data, see \link{pastseasons}
#'      \item \strong{gameweeks} Fixture data, see \link{gameweeks}
#' }
#' @name fantasysocceR
#' @docType package
NULL

#' Players dataset
#' 
#' @description Summary data about the current players in the game, some 
#' variables in this dataset will almost immediately be out of date (such as 
#' \emph{pct}).  See \link{collect_ff} for getting up-to-date data.
#' 
#' @docType data
#' @keywords datasets
#' @name players
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

#' Past seasons dataset
#' 
#' @description Data about the current players in the game and their performance
#' in past seasons.  Unlike \link{players} or \link{gameweeks} datasets, the
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
#' @name pastseasons
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

#' Gameweeks dataset
#' 
#' @description Data about the gameweeks, which team will face which team.  Like
#' the \link{players} dataset, this will likely change as/when teams are forced
#' to change their fixture schedule.  See \link{collect_ff} and related 
#' functions for getting up-to-date data.
#' 
#' @docType data
#' @keywords datasets
#' @name gameweeks
#' @format 760 rows, 5 columns
#' @details Variables
#' \itemize{
#'      \item \strong{date} fixture data
#'      \item \strong{gw} gameweek
#'      \item \strong{team} team
#'      \item \strong{home} are team at home (\code{TRUE}), or away 
#'      (\code{FALSE})
#'      \item \strong{opp} opponent
#' }
NULL