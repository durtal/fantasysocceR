#' Helper function 
#' 
#' @description players_helper is called by both \link{players_df} and 
#' \link{pastseasons_df} to collate summary data for each player.
#' 
#' @export
players_helper <- function(player, add_vars = NULL) {
    options(stringsAsFactors = FALSE)
    
    default_df <- c("id", "web_name", "team_name", "type_name", "now_cost",
                    "selected_by_percent", "total_points")
    
    if(!is.null(add_vars)) {
        default_df <- c(default_df, add_vars)
    }
    
    tmp <- data.frame(player[names(player) %in% default_df])
    
    names(tmp)[1:7] <- c("pos", "team", "pts", "id", "name", "value", "pct")
    tmp$value <- tmp$value / 10
    tmp$pct <- as.numeric(tmp$pct)
    
    return(tmp)
}

#' Helper function
#'
#' @description pastseasons_helper is called by \link{pastseasons_df} to 
#' collate data for players who
#' 
#' @export
pastseasons_helper <- function(player) {
    
    seasons <- player$season_history
    
    if(length(seasons)==0) {
        ssn <- data.frame(season=NA, mins=NA, goals=NA, assists=NA,
                          cs=NA, og=NA, ga=NA, pens_svd=NA, pens_msd=NA, yel=NA,
                          red=NA, saves=NA, bonus=NA, ea_ppi=NA, bps=NA, 
                          fin_val=NA, ssn_pts=NA)
    } else {
        ssn <- ldply(seasons, function(x) {
            names(x) <- c("season", "mins", "goals", "assists", "cs", "og", "ga",
                          "pens_svd", "pens_msd", "yel", "red", "saves", 
                          "bonus", "ea_ppi", "bps", "fin_val", "ssn_pts")
            tmp <- data.frame(x)
            tmp
        })
    }
    
    return(ssn)
}