#' Construct gameweeks dataframe
#' 
#' @description Converts the list returned by \link{collect_ff} into a dataframe
#' of all the gameweeks for each of the 20 sides in the Premiership.  The 5
#' variables are: 
#' \itemize{
#'      \item \strong{team} team
#'      \item \strong{date} fixture data
#'      \item \strong{gw} gameweek
#'      \item \strong{opp} opponent
#'      \item \strong{home} are \strong{team} at home (\code{TRUE}), or away 
#'      (\code{FALSE})
#' }
#' 
#' @param \strong{player_list} list returned by \link{collect_ff}
#' @export
#' @examples
#' ## Collect fresh data
#' player_list <- collect_ff(n = 10)
#' gameweeks <- gameweeks_df(player_list)
gameweeks_df <- function(player_list) {
    
    tmp <- ldply(player_list, gameweeks_helper)
    
    tmp <- tmp[!duplicated(tmp),]
    
    return(tmp)
}