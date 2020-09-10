
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ffespn

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/ffespn)](https://CRAN.R-project.org/package=ffespn)
<!-- badges: end -->

The goal of ffespn is to get ESPN fantasy football projections.

## Installation

You can install the development version of ffespn from github with:

``` r
remotes::install_github("dfs-with-r/ffespn")
```

## Example

This is a basic example which shows you how to get projections for week
0 (the preseason).

``` r
library(ffespn)

qb <- ffespn_projections(2020, 0, "QB")
qb
#> # A tibble: 67 x 24
#>    id    player team  position is_active is_droppable is_injured slots
#>    <chr> <chr>  <chr> <chr>    <lgl>     <lgl>        <lgl>      <lis>
#>  1 3042… Logan… TEN   QB       TRUE      TRUE         FALSE      <chr…
#>  2 15864 Geno … SEA   QB       TRUE      TRUE         FALSE      <chr…
#>  3 3042… Ryan … CIN   QB       TRUE      TRUE         FALSE      <chr…
#>  4 15948 Matt … BUF   QB       TRUE      TRUE         FALSE      <chr…
#>  5 3124… Jake … JAX   QB       TRUE      TRUE         FALSE      <chr…
#>  6 3915… Joe B… CIN   QB       TRUE      TRUE         FALSE      <chr…
#>  7 3051… P.J. … CAR   QB       TRUE      TRUE         FALSE      <chr…
#>  8 4038… Gardn… JAX   QB       TRUE      TRUE         FALSE      <chr…
#>  9 12471 Chase… DET   QB       TRUE      TRUE         FALSE      <chr…
#> 10 12483 Matth… DET   QB       TRUE      TRUE         FALSE      <chr…
#> # … with 57 more rows, and 16 more variables: draft_ranks <list>,
#> #   ownership <list>, ratings <list>, notes <chr>, pass_att <dbl>,
#> #   pass_cmp <dbl>, pass_yds <dbl>, pass_tds <dbl>, pass_2pt <dbl>,
#> #   pass_int <dbl>, rush_att <dbl>, rush_yds <dbl>, rush_tds <dbl>,
#> #   rush_2pt <dbl>, sacked <dbl>, fumbles <dbl>
```
