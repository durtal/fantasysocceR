#' Collect up-to-date fantasy football data
#' 
#' Use this function sparingly!! It will collect fantasy football data from 
#' \url{http://fantasy.premierleague.com}, and will take a while to complete as
#' it makes calls to the games website for the player data.
#' 
#' @details Users can specify the number of players they wish to collect data 
#' for by changing the \emph{n} parameter.  If \emph{n} is greater than the 
#' number of players, the function will only return the number of players
#' available, however it will attempt to find \emph{n} players, so do not input
#' large \emph{n}.  The number of players in the game is around 550, the default
#' value of \emph{n} is 600.
#' 
#' Alternatively, passing a numeric vector to the
#' \emph{specify_ids} parameter, it is possible to collect data for specific
#' players (I am unsure if ids change during the season). This function takes 
#' some time to run, and returns a list which can then be turned into dataframes
#' using other functions in the package, see \link{players_df}, \link{pastseasons_df}.
#' 
#' @param \strong{n} number of players (default = 600)
#' @param \strong{specify_ids} numeric vector, collect data for specific players
#' using their id
#' @param \strong{.progress} progress bar - "text", "time", "tk", or "win"
#' @export
collect_ff <- function(n = 600, specify_ids = NULL, .progress = "none") {
    
    if(!is.null(specify_ids)) {
        ids <- specify_ids
    } else {
        ids <- 1:n
    }
    
    player_list <- llply(ids, function(x) {
        Sys.sleep(1)
        new_url <- sprintf("http://fantasy.premierleague.com/web/api/elements/%s/?format=json", x)
        if(url.exists(new_url)) {
            tmp <- fromJSON(file = new_url)
        } else {
            tmp <- NULL
        }
    }, .progress = .progress)
    
    player_list <- player_list[!sapply(player_list, is.null)]
    
    return(player_list)
}