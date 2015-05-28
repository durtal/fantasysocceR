#' Construct past seasons dataframe from fresh fantasy data
#' 
#' @description Converts the list returned by \link{collect_df} into a dataframe
#' with past performances of all current players in the game.  
#' 
#' @details This function calls the \link{players_helper} function to provide 
#' summary data for the current season.  The dataframe returned consists of:
#' \itemize{
#'      \item \strong{pos} player pos
#'      \item \strong{team} player team
#'      \item \strong{pts} total points scored last season
#'      \item \strong{id} player id
#'      \item \strong{name} player name
#'      \item \strong{value} player value
#'      \item \strong{pct} percentage of fantasy teams player is selected by
#'      \item \strong{season} previous season
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
#'      \item \strong{saves} saves
#'      \item \strong{bonus} bonus points
#'      \item \strong{ea_ppi} EA sports player performance index
#'      \item \strong{bps} bonus points system
#'      \item \strong{fin_val} value at end of the season
#'      \item \strong{ssn_pts} total points for the season
#' }
#' 
#' @param player_list list of players (the list returned by 
#' \link{collect_ff})
#' @param add_vars extra variables to add if desired, see details of
#' \link{players_df} for available extra variables
#' @export
#' @examples
#' \dontrun{
#' # Collect fresh data
#' player_list <- collect_ff(n = 10)
#' pastseasons <- pastseasons_df(player_list)
#' }
pastseasons_df <- function(player_list, add_vars = NULL) {
    
    tmp <- plyr::ldply(player_list, function(x) {
        p_df <- players_helper(x, add_vars = add_vars)
        s_df <- pastseasons_helper(x)
        compdf <- cbind(p_df, s_df)
        compdf
    })
    
    return(tmp)
}