#' ESPN Fantasy Football API
#'
#' @param path path to pull
#' @param query query parameters
#' @param headers headers
#' @keywords internal
ffespn_api <- function(path, query = NULL, headers = NULL) {
  # url
  #baseurl <- "http://games.espn.com/"
  baseurl <- "http://fantasy.espn.com/"
  path <- paste0("apis/v3/games/ffl/", path)
  url <- httr::modify_url(baseurl, path = path, query = query)

    # get data
  if (is.null(headers)) {
    resp <- httr::GET(url, headers)
  } else {
    resp <- httr::GET(url, headers)
  }

  # get content
  page <- httr::content(resp, "text", encoding = "utf-8")

  # check errors
  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "ESPN API request failed [%s]\n[%s]",
        httr::status_code(resp), url
      ),
      call. = FALSE
    )
  }

  # check data type
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return html", call. = FALSE)
  }

  # parse content
  x <- jsonlite::fromJSON(page, simplifyVector = FALSE, simplifyDataFrame = FALSE, simplifyMatrix = FALSE)

  # return S3 object
  class(x) <- c("ffespn", class(x))
  x
}

