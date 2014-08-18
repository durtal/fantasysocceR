#' Construct current season dataframe from fresh fantasy data
#' 
#' @description Converts the list returned by \link{collect_df} into a dataframe
#' with performances per gameweek for all current players in the game.
#' 
#' @details This function calls the \link{players_helper} function to provide 
#' summary data for the current season.  The dataframe returned consists of:
#' \itemize{
#'      \item \strong{pos} player pos
#'      \item \strong{team} player team
#'      \item \strong{pts} total pts this season
#'      \item \strong{id} player id
#'      \item \strong{name} player name
#'      \item \strong{value} player value
#'      \item \strong{pct} percentage of fantasy teams player is selected by
#'      \item \strong{date} fixture date
#'      \item \strong{gw} gameweek
#'      \item \strong{opp} opponent, home/away, and score
#'      \item \strong{mins} minutes played
#'      \item \strong{goals} goals scored
#'      \item \strong{assists} assists
#'      \item \strong{cs} clean sheet
#'      \item \strong{ga} goals against
#'      \item \strong{og} own goals
#'      \item \strong{pens_svd} penalties saved
#'      \item \strong{pens_msd} penalties missed
#'      \item \strong{yel} yellow cards
#'      \item \strong{red} red cards
#'      \item \strong{saves} saves
#'      \item \strong{bonus} bonus points
#'      \item \strong{ea_ppi} EA sports player performance index
#'      \item \strong{bps} bonus points system
#'      \item \strong{gw_val} gameweek value
#'      \item \strong{gw_pts} gameweek points 
#' }
#' 
#' @param \strong{player_list} list of players (the list returned by 
#' \link{collect_ff})
#' @param \strong{add_vars} extra variables to add if desired, see details of
#' \link{players_df} for available extra variables
#' @export
#' @examples
#' #' ## Collect fresh data
#' player_list <- collect_ff(n = 10)
#' players <- currentseason_df(player_list)
currentseason_df <- function(player_list, add_vars = NULL) {
    
    tmp <- ldply(player_list, function(x) {
        p_df <- players_helper(x, add_vars = add_vars)
        c_df <- currentseason_helper(x)
        compdf <- cbind(p_df, c_df)
        compdf
    })
    
    return(tmp)
}

