is_scalar <- function(x) identical(length(x), 1L)

list_to_dt <- function(x) {
  x <- vapply(x, function(d) if (is.null(d)) NA_real_ else d/1000, double(1L))
  as.POSIXct(x, origin = "1970-01-01", tz = "America/New_York")
}

team_id_to_name <- function(id) {
  rows <- purrr::map_int(id, function(x) {
    matches <- x == team_ids$id
    if (any(matches)) which(matches)[1]
    else NA_integer_
  })

  team_ids$name[rows]
}

team_name_to_id <- function(name) {
  rows <- purrr::map_int(name, function(x) {
    matches <- x == team_ids$name
    if (any(matches)) which(matches)[1]
    else NA_integer_
  })

  team_ids$id[rows]
}

stat_id_to_name <- function(id) {
  dplyr::case_when(
    id == 0 ~ "pass_att",
    id == 1 ~ "pass_cmp",
    #id == 2 ~ "pass_cmp_loss", # pass completions in a loss?
    id == 3 ~ "pass_yds",
    id == 4 ~ "pass_tds",
    id == 20 ~ "pass_int",
    id == 23 ~ "rush_att",
    id == 24 ~ "rush_yds",
    id == 25 ~ "rush_tds",
    id == 42 ~ "rec_yds",
    id == 43 ~ "rec_tds",
    id == 53 ~ "rec_cmp",
    id == 58 ~ "rec_tgt",
    id == 64 ~ "sacked",
    id == 74 ~ "fg_cmp_50",
    id == 75 ~ "fg_att_50",
    id == 77 ~ "fg_cmp_40_49",
    id == 78 ~ "fg_att_40_49",
    id == 80 ~ "fg_cmp_1_39",
    id == 81 ~ "fg_att_1_39",
    id == 83 ~ "fg_cmp_tot",
    id == 84 ~ "fg_att_tot",
    id == 86 ~ "fg_cmp_xp",
    id == 87 ~ "fg_att_xp",
    id == 95 ~ "def_ints",
    id == 96 ~ "def_fmbl_recover",
    id == 99 ~ "def_sacks",
    id == 105 ~ "def_tds",
    # def_tds = ? 91, 92, 105, 122
    id == 120 ~ "def_pts_against",
    id == 127 ~ "def_yds_against",
    TRUE ~ paste0("unknown_", id)
  )
}

pos_id_to_name <- function(x) {
  dplyr::case_when(
    x == 1 ~ "QB",
    x == 2 ~ "RB",
    x == 3 ~ "WR",
    x == 4 ~ "TE",
    x == 5 ~ "K",
    x == 16 ~ "DST",
    TRUE ~ paste0("unknown_", x)
  )
}

camel_to_snake <- function(x) {
  tolower(gsub("(?<!^)(?=[A-Z])", "_", x, perl = TRUE))
}

as_tibble_snake <- function(x) {
  df <- tibble::as_tibble(x)
  colnames(df) <- camel_to_snake(colnames(df))
  df
}
