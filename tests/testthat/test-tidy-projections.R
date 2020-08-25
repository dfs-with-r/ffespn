x <- readRDS("untidy-projections-dal.rds")

test_that("tidy projections works", {
  df <- tidy_projections(x)

  expect_identical(nrow(df), 23L)
  expect_identical(ncol(df), 19L)
  expect_identical(colnames(df)[1:3], c("id", "full_name", "team"))
})
