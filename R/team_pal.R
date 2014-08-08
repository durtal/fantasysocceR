#' Premiership Team colors palette
#' 
#' Palette of primary team colors where possible - the secondary color is used
#' when the primary color is white.  
#' 
#' @details It returns a named vector, with the team names matching the format 
#' of the datasets in this package.  It can simply be called within a ggplot 
#' plot, see \emph{examples}
#' 
#' @param \strong{teams} specify teams (not always necessary)
#' @export
#' @examples
#' team_pal(teams = c("Arsenal", "Aston Villa"))
#'    Arsenal Aston Villa 
#'  "#F12933"   "#A32249" 
#'
#' # using within ggplot
#' data(players)
#' ggplot(players, aes(x=value, y=pts, color=team)) +
#'      geom_point() +
#'      scale_color_manual(values = team_pal()) 
team_pal <- function(teams = NULL) {
    
    pal <- c('Arsenal'="#F12933", 
             'Aston Villa'="#A32249", 
             'Burnley'="#A32249", 
             'Chelsea'="#4358AB", 
             'Crystal Palace'="#F12933", 
             'Everton'="#0B4A99",
             'Hull'="#FD9A34", 
             'Leicester'="#0B4A99", 
             'Liverpool'="#F12933", 
             'Man City'="#98CDEC", 
             'Man Utd'="#F12933", 
             'Newcastle'="#000000",
             'QPR'="#0B4A99", 
             'Southampton'="#F12933", 
             'Spurs'="#182341", 
             'Stoke'="#F12933", 
             'Sunderland'="#F12933", 
             'Swansea'="#000000",
             'West Brom'="#182341",
             'West Ham'="#A32249")
    
    if(is.null(teams)) {
        return(pal)
    } else {
        new_pal <- vector()
        for(team in teams) {
            new_pal[team] <- pal[team]
        }
        return(new_pal)
    }
}