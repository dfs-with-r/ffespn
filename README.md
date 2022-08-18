
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

# use default espn league
qb <- ffespn_projections(2022, 0, "QB")
qb
#> # A tibble: 67 × 62
#>    id      player       team  position is_active is_droppable is_injured slots  
#>    <chr>   <chr>        <chr> <chr>    <lgl>     <lgl>        <lgl>      <list> 
#>  1 3917315 Kyler Murray ARI   QB       TRUE      TRUE         FALSE      <chr […
#>  2 15864   Geno Smith   SEA   QB       TRUE      TRUE         FALSE      <chr […
#>  3 3892775 Jarrett Sti… OAK   QB       TRUE      TRUE         FALSE      <chr […
#>  4 2979501 Nate Sudfeld SF    QB       TRUE      TRUE         FALSE      <chr […
#>  5 13987   Blaine Gabb… TB    QB       TRUE      TRUE         FALSE      <chr […
#>  6 2979520 C.J. Beatha… JAX   QB       TRUE      TRUE         FALSE      <chr […
#>  7 3122840 Deshaun Wat… CLE   QB       TRUE      TRUE         FALSE      <chr […
#>  8 4239086 Desmond Rid… ATL   QB       TRUE      TRUE         FALSE      <chr […
#>  9 14012   Andy Dalton  NO    QB       TRUE      TRUE         FALSE      <chr […
#> 10 3915511 Joe Burrow   CIN   QB       TRUE      TRUE         FALSE      <chr […
#> # … with 57 more rows, and 54 more variables: draft_ranks <list>,
#> #   ownership <list>, ratings <list>, notes <chr>, fpts_proj <dbl>,
#> #   pass_att <dbl>, pass_cmp <dbl>, pass_inc <dbl>, pass_yds <dbl>,
#> #   pass_tds <dbl>, pass_tds_40_plus_yds <dbl>, pass_tds_50_plus_yds <dbl>,
#> #   pass_yds_300_399 <dbl>, pass_yds_400_plus <dbl>, pass_2pt <dbl>,
#> #   pass_int <dbl>, rush_att <dbl>, rush_yds <dbl>, rush_tds <dbl>,
#> #   rush_2pt <dbl>, rush_td_40_plus_yds <dbl>, rush_td_50_plus_yds <dbl>, …

# use custom league
dt <- ffespn_projections(2022, 0, "DT", league_id = "134971153")
dt
#> # A tibble: 164 × 31
#>    id      player       team  position is_active is_droppable is_injured slots  
#>    <chr>   <chr>        <chr> <chr>    <lgl>     <lgl>        <lgl>      <list> 
#>  1 4242899 D.J. Davids… NYG   DT       TRUE      TRUE         FALSE      <chr […
#>  2 3116449 L.J. Collier SEA   DT       TRUE      TRUE         FALSE      <chr […
#>  3 3886601 Shy Tuttle   NO    DT       TRUE      TRUE         FALSE      <chr […
#>  4 15841   Johnathan H… OAK   DT       TRUE      TRUE         FALSE      <chr […
#>  5 15846   John Jenkins MIA   DT       TRUE      TRUE         FALSE      <chr […
#>  6 4361662 Alim McNeill DET   DT       TRUE      TRUE         FALSE      <chr […
#>  7 3915282 Zach Allen   ARI   DT       TRUE      TRUE         FALSE      <chr […
#>  8 3894915 D.J. Jones   DEN   DT       TRUE      TRUE         FALSE      <chr […
#>  9 4361791 Devonte Wya… GB    DT       TRUE      TRUE         FALSE      <chr […
#> 10 4058825 Grover Stew… IND   DT       TRUE      TRUE         FALSE      <chr […
#> # … with 154 more rows, and 23 more variables: draft_ranks <list>,
#> #   ownership <list>, ratings <list>, notes <chr>, fpts_proj <dbl>,
#> #   def_total_ret_tds <dbl>, def_ints <dbl>, def_fumbles_recovered <dbl>,
#> #   def_blocks <dbl>, def_safeties <dbl>, def_sacks <dbl>, def_stuffs <dbl>,
#> #   def_fumble_ret_tds <dbl>, def_int_ret_tds <dbl>, def_tds <dbl>,
#> #   def_fumbles_forced <dbl>, def_tackles_assisted <dbl>,
#> #   def_tackles_solo <dbl>, def_tackles_total <dbl>, …
```
