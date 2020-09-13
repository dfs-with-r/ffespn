x <- readRDS("untidy-projections-dal.rds")

test_that("tidy projections works", {
  df <- tidy_projections(x)

  expect_identical(nrow(df), 16L)
  expect_identical(ncol(df), 146L)
  expect_identical(colnames(df)[1:3], c("id", "player", "team"))
})
