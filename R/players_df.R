#' Construct summary dataframe for current players
#' 
#' @description Converts the list returned by \link{collect_ff} into a summary
#' dataframe with one row for each player.  The default dataframe consists of
#' 7 variables (more can be added, check details for available extra variables):
#' \itemize{
#'      \item \strong{pos} player pos
#'      \item \strong{team} player team
#'      \item \strong{pts} total points scored last season
#'      \item \strong{id} player id
#'      \item \strong{name} player name
#'      \item \strong{value} player value
#'      \item \strong{pct} percentage of fantasy teams player is selected by
#' }
#' 
#' @details The extra variables available are below, some are self-explanatory,
#' while others I have no idea what they are (at the moment):
#' \itemize{
#'      \item \strong{first_name} 
#'      \item \strong{second_name} 
#'      \item \strong{status} player status (available, or not)
#'      \item \strong{chance_of_playing_this_round}
#'      \item \strong{chance_of_playing_next_round} 
#'      \item \strong{value_form}
#'      \item \strong{value_season}
#'      \item \strong{cost_change_start}
#'      \item \strong{cost_change_event}
#'      \item \strong{cost_change_start_fall}
#'      \item \strong{cost_change_event_fall}
#'      \item \strong{in_dreamteam}
#'      \item \strong{dreamteam_count}
#'      \item \strong{form}
#'      \item \strong{transfers_out}
#'      \item \strong{transfers_in}
#'      \item \strong{transfers_out_event}
#'      \item \strong{transfers_in_event}
#'      \item \strong{event_points}
#'      \item \strong{points_per_game}
#'      \item \strong{ep_this}
#'      \item \strong{ep_next}
#'      \item \strong{special}
#'      \item \strong{minutes}
#'      \item \strong{goals_scored}
#'      \item \strong{assists}
#'      \item \strong{clean_sheets}
#'      \item \strong{goals_conceded}
#'      \item \strong{own_goals}
#'      \item \strong{penalties_saved}
#'      \item \strong{penalties_missed}
#'      \item \strong{yellow_cards}
#'      \item \strong{red_cards}
#'      \item \strong{saves}
#'      \item \strong{bonus}
#'      \item \strong{ea_index}
#'      \item \strong{bps}
#'      \item \strong{element_type}
#'      \item \strong{team}
#' }
#' @param player_list list of players (the list returned by 
#' \link{collect_ff})
#' @param add_vars extra variables to add if desired
#' @export
#' @examples
#' \dontrun{
#' # Collect fresh data
#' player_list <- collect_ff(n = 10)
#' players <- players_df(player_list)
#' }
players_df <- function(player_list, add_vars = NULL) {
    
    tmp <- plyr::ldply(player_list, players_helper, add_vars = add_vars)
    
    return(tmp)
}