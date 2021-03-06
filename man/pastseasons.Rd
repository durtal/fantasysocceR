% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fantasysocceR.R
\docType{data}
\name{pastseasons}
\alias{pastseasons}
\title{Past seasons dataset}
\format{1920 rows, 24 columns}
\description{
Data about the current players in the game and their performance
in past seasons.  Unlike \link{players} dataset, the
majority of the variables in this dataset should be stable, but it does
include some of the data found in \link{players}, data collected Jul 15, 2015.
}
\details{
If a player was included in more than one previous version of the 
game, then that player will have multiple rows.  If a player is new to the 
game, they will have summary data found in \link{players} but past seasons
will be filled with NAs.

Variables
\itemize{
     \item \strong{pos} player pos
     \item \strong{team} player team
     \item \strong{pts} total points scored last season
     \item \strong{id} player id
     \item \strong{name} player name
     \item \strong{value} player value
     \item \strong{pct} percentage of fantasy teams player is selected by
     \item \strong{season} past season
     \item \strong{mins} number of minutes played
     \item \strong{goals} goals scored
     \item \strong{assists} assists
     \item \strong{cs} clean sheets
     \item \strong{og} own goals
     \item \strong{ga} goals against
     \item \strong{pens_svd} penalties saved
     \item \strong{pens_msd} penalties missed
     \item \strong{yel} yellow cards
     \item \strong{red} red cards
     \item \strong{saves} number of saves (keepers)
     \item \strong{bonus} bonus points
     \item \strong{ea_ppi} ea sports player performace index
     \item \strong{bps} bonus points system
     \item \strong{fin_val} player value at close of season
     \item \strong{ssn_pts} total points for that season
}
}
\keyword{datasets}

