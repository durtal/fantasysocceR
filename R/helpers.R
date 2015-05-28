#' Helper function 
#' 
#' @param player individual player (list) returned by \link{collect_ff}
#' @param add_vars any additional variables to return from list
#' 
#' @description players_helper is called by both \link{players_df} and 
#' \link{pastseasons_df} to collate summary data for each player.
players_helper <- function(player, add_vars = NULL) {
   
    default_df <- c("id", "web_name", "team_name", "type_name", "now_cost",
                    "selected_by_percent", "total_points")
    
    if(!is.null(add_vars)) {
        default_df <- c(default_df, add_vars)
    }
    
    tmp <- data.frame(player[names(player) %in% default_df], stringsAsFactors = FALSE)
    
    names(tmp)[grep("web_name", names(tmp))] <- "name"
    names(tmp)[grep("type_name", names(tmp))] <- "pos"
    names(tmp)[grep("team_name", names(tmp))] <- "team"
    names(tmp)[grep("now_cost", names(tmp))] <- "value"
    names(tmp)[grep("selected_by_percent", names(tmp))] <- "pct"
    names(tmp)[grep("total_points", names(tmp))] <- "pts"
    
    tmp$value <- tmp$value / 10
    tmp$pct <- as.numeric(tmp$pct)
    
    return(tmp)
}

#' Helper function
#' 
#' @param player individual player (list) returned by \link{collect_ff}
#'
#' @description pastseasons_helper is called by \link{pastseasons_df} to 
#' collate data for players who
pastseasons_helper <- function(player) {
    
    seasons <- player$season_history
    
    if(length(seasons)==0) {
        ssn <- data.frame(season=NA, mins=NA, goals=NA, assists=NA,
                          cs=NA, ga=NA, og=NA, pens_svd=NA, pens_msd=NA, yel=NA,
                          red=NA, saves=NA, bonus=NA, ea_ppi=NA, bps=NA, 
                          fin_val=NA, ssn_pts=NA, stringsAsFactors = FALSE)
    } else {
        ssn <- plyr::ldply(seasons, function(x) {
            names(x) <- c("season", "mins", "goals", "assists", "cs", "ga", "og",
                          "pens_svd", "pens_msd", "yel", "red", "saves", 
                          "bonus", "ea_ppi", "bps", "fin_val", "ssn_pts")
            tmp <- data.frame(x, stringsAsFactors = FALSE)
            tmp$fin_val <- tmp$fin_val / 10
            tmp
        })
    }
    
    return(ssn)
}

#' Helper function
#' 
#' @param player individual player (list) returned by \link{collect_ff}
#' 
#' @description currentseason_helper is called by \link{currentseason_df} to
#' collate data for the current season
currentseason_helper <- function(player) {
    
    season <- player$fixture_history$all
    
    ssn <- plyr::ldply(season, function(x) {
        names(x) <- c("date", "gw", "opp", "mins", "goals", "assists", "cs",
                      "ga", "og", "pens_svd", "pens_msd", "yel", "red", "saves",
                      "bonus", "ea_ppi", "bps", "net_transfers", "gw_val", 
                      "gw_pts")
        tmp <- data.frame(x, stringsAsFactors = FALSE)
        tmp$gw_val <- tmp$gw_val / 10
        tmp
    })
    
    return(ssn)
}