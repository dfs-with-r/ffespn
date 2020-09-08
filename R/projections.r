# scoringPeriodId = week
# seasonId = year
# statSourceId = ? stats vs projections?
# statSplitTypeId = ?


#' Projections
#' @param season integer year
#' @param week integer week (0 - 17)
#' @param pos character position
#'
#' @export
ffespn_projections <- function(season, week, pos = c("QB", "RB", "WR", "TE", "K", "DST", "DT", "DE", "LB", "CB", "S", "DB")) {
  # validate input
  pos <- match.arg(pos)
  stopifnot(is.numeric(week), is.numeric(season), is.character(pos))
  stopifnot(is_scalar(week), is_scalar(season), is_scalar(pos))
  stopifnot(week >= 0L, week <= 17L)
  #stopifnot(is.null(team) || team %in% team_ids$name)

  # convert input
  week <- as.integer(week)
  season <- as.integer(season)
  #team <- team_name_to_id(team)
  pos <- slot_name_to_id(pos)

  # build path
  path <- sprintf("seasons/%s/segments/0/leaguedefaults/1/", season)

  # build query
  if (week > 0) {
    query <- list("view" = "kona_player_info", "scoringPeriodId" = week)
  } else {
    query <- list("view" = "kona_player_info")
  }

  # build headers
  # team 6 is DALLAS
  x_fantasy_filter <- list(
    players = list(
      filterSlotIds = list(value = pos),
      #filterProTeamIds = if (is.null(team)) NULL else list(value = team),
      filterStatsForExternalIds = list(value = season),
      filterStatsForSourceIds = list(value = 1),
      #limit = jsonlite::unbox(50)
      offset = jsonlite::unbox(0)
    )
  )

  headers <- httr::add_headers(.headers = c(
    "X-Fantasy-Filter" = jsonlite::toJSON(x_fantasy_filter),
    "X-Fantasy-Source" = "kona",
    "Accept" =  "application/json",
    "Referer" =  "http://fantasy.espn.com/football/players/projections",
    "DNT" = "1",
    "Connection" =  "keep-alive",
    "X-Fantasy-Platform" = "kona-PROD-669a217c5628b670cf386bd4cebe972bf88022eb"
  ))


  # GET (with no headers it returns all teams?)
  x <- ffespn_api(path, query, headers)

  if (identical(length(x$players), 0L)) {
    stop("results are empty. no players found", call. = FALSE)
  }

  # parse json
  tidy_projections(x)
}

#' Tidy projections
#'
#' @param x data frame of projections
#'
#' @keywords internal
tidy_projections <- function(x) {
  # convert json to data frame
  x <- tibble::as_tibble(purrr::simplify_all(purrr::transpose(x$players)))

  # convert column types
  x$id <- as.character(x$id)
  x$waiverProcessDate <- as.POSIXct(x$waiverProcessDate/1000, origin = "1970-01-01", tz = "America/New_York")

  # parse rating
  ratings <- purrr::map(x$ratings, tidy_projection_ratings)

  # parse player
  player <-  purrr::simplify_all(purrr::transpose(x$player))
  player$id <- as.character(player$id)

  player$team <- team_id_to_name(player$proTeamId)
  player$proTeamId <- NULL

  if ("lastNewsDate" %in% names(player)) {
    player$lastNewsDate <- list_to_dt(player$lastNewsDate)
  }

  if ("lastVideoDate" %in% names(player)) {
    player$lastVideoDate <- list_to_dt(player$lastVideoDate)
  }

  if ("injuryStatus" %in% names(player)) {
    player$injuryStatus <- purrr::simplify(tidyr::replace_na(player$injuryStatus, NA_character_))
  }

  if ("jersey" %in% names(player)) {
    player$jersey <- purrr::simplify(tidyr::replace_na(player$jersey, NA_character_))
  }

  player$defaultPosition <- pos_id_to_name(player$defaultPositionId)
  player$defaultPositionId <- NULL
  player$seasonOutlook <- dplyr::if_else(nchar(player$seasonOutlook) == 0, NA_character_, player$seasonOutlook)
  player$stats <- purrr::map(player$stats, tidy_projection_stats)
  player$eligibleSlots <- purrr::simplify_all(player$eligibleSlots)
  player$eligibleSlots <- purrr::map(player$eligibleSlots, slot_id_to_name)

  player <- tibble::as_tibble(player)

  # parse player ownership
  ownership <- lapply(player$ownership, tidyr::replace_na, NA_real_)
  ownership <- lapply(ownership, function(x) {
    x$date <- list_to_dt(x$date)
    x
    })
  ownership <- purrr::map(ownership, as_tibble_snake)
  player$ownership <- ownership

  # player rankings
  if ("rankings" %in% names(player)) {
    player$rankings <- purrr::map(player$rankings, tidy_projection_rankings)
  }

  # ranks by rank type
  player$draftRanksByRankType <- purrr::map(player$draftRanksByRankType, tidy_projection_draft_ranks)

  # prepare data frame
  x <- player
  x <- dplyr::select(x, "id", "fullName", "team", "defaultPosition", dplyr::everything())
  x$ratings <- ratings

  # clean column names
  colnames(x) <- camel_to_snake(colnames(x))
  x <- dplyr::select(
    x,
    "id",
    "player" = "full_name",
    "team",
    "position" = "default_position",
    "is_active" = "active",
    "is_droppable" = "droppable",
    "is_injured" = "injured",
    "slots" = "eligible_slots",
    "draft_ranks" = "draft_ranks_by_rank_type",
    "ownership",
    "ratings",
    "notes" = "season_outlook",
    "stats"
  )

  # unnest the stats (projections)
  x <- tidyr::unnest(x, "stats")

  # return data frame
  x
}

tidy_projection_ratings <- function(ratings) {
  ratings <- purrr::simplify_all(purrr::transpose(ratings))
  df <- as_tibble_snake(ratings)
  df$week <- as.integer(names(ratings[[1]]))
  df <- dplyr::select(df, "week", dplyr::everything())
  df
}

tidy_projection_stats <- function(stats) {
  if (length(stats) == 0) return(tibble::tibble())
  stats <- stats[[1]]$stats
  names(stats) <- stat_id_to_name(names(stats))
  df <- as_tibble_snake(stats)
  dplyr::select(df, -dplyr::starts_with("unknown_"))
}

tidy_projection_rankings <- function(x) {
  if (length(x) == 0) return(tibble::tibble())
  x <- x[[1]]
  df <- tibble::as_tibble(purrr::simplify_all(purrr::transpose(x)))
  colnames(df) <- camel_to_snake(colnames(df))
  df
}

tidy_projection_draft_ranks <- function(x) {
  if (length(x) == 0) return(tibble::tibble())
  purrr::map_dfr(x, as_tibble_snake)
}
