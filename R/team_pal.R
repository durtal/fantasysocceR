#' List of Premiership team palettes
#' 
#' Use \code{\link{team_pal}} to construct palettes
#' 
#' @export
epl_palettes <- list(
    "Arsenal" = c("#EF0107", "#023474", "#9C824A"),
    "Aston Villa" = c("#7A003C", "#94BEE5", "#FFE600"),
    "Bournemouth" = c("#EB172B", "#231F20", "#0053A0"),
    "Burnley" = c("#53162F", "#8CCCE5", "#F9EC34"),
    "Chelsea" = c("#034694", "#DBA111", "#ED1C24"),
    "Crystal Palace" = c("#1B458F", "#C4122E", "#A7A5A6"),
    "Everton" = c("#274488", "#FFFFFF", "#000000"),
    "Hull" = c("#F5A12D", "#000000", "#94BEE5"),
    "Leicester" = c("#0053A0", "#FDBE11", "#FFE600"),
    "Liverpool" = c("#D00027", "#00A398", "#FEF667"),
    "Man City" = c("#5DBFEB", "#FFCE65", "#FFE600"),
    "Man Utd" = c("#DA020E", "#FFE500", "#000000"),
    "Newcastle" = c("#231F20", "#00B6F1", "#BBBDBF"),
    "Norwich" = c("#F1F100", "#19C410", "#000000"),
    "QPR" = c("#005CAB", "#D00027", "#FFFFFF"),
    "Southampton" = c("#ED1A3B", "#211E1F", "#FFC20E"),
    "Spurs" = c("#001C58", "#FFFFFF", "#000000"),
    "Stoke" = c("#E03A3E", "#1B449C", "#94BEE5"),
    "Sunderland" = c("#EB172B", "#A68A26", "#211E1E"),
    "Swansea" = c("#000000", "#DA020E", "#FFFFFF"),
    "Watford" = c("#EAEA0C", "#231F20", "#D00027"),
    "West Brom" = c("#091453", "#FFFFFF", "#EB172B"),
    "West Ham" = c("#60223B", "#F7C240", "#5299C6")
)

#' Premiership Team colors palette
#' 
#' Palette of primary team colors where possible - the secondary color is used
#' when the primary color is white.  
#' 
#' @details It returns a named vector, with the team names matching the format 
#' of the datasets in this package.  It can simply be called within a ggplot 
#' plot, see \emph{examples}
#' 
#' @param teams specify teams (not always necessary)
#' @param simple return a single colour per team
#' @param n number of colours to return in a palette (per team) (maximum of 3)
#' 
#' @export
#' @examples
#' \dontrun{
#' team_pal(teams = c("Arsenal", "Aston Villa"))
#'
#' # using within ggplot
#' data(players)
#' ggplot(players, aes(x=value, y=pts, color=team)) +
#'      geom_point() +
#'      scale_color_manual(values = team_pal()) 
#' }
team_pal <- function(teams = NULL, simple = TRUE, n = 1) {

    if(is.null(teams)) {
        # if no teams are entered return all 20
        pal <- lapply(epl_palettes, function(x) x[1])
        pal <- unlist(pal)
        return(pal)
    }
    
    teampals <- lapply(teams, function(x) epl_palettes[[x]])
    names(teampals) <- teams
    
    if(simple && n == 1) {
        pal <- unlist(lapply(teampals, function(x) x[1]))
        return(pal)
    } else {
        if(n > 3) stop("Number of requested colours greater than number available, choose 3 or fewer.")
        pal <- lapply(teampals, function(x) x[1:n])
        return(pal)
    }
}