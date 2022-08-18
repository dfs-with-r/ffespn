
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ffespn

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/ffespn)](https://CRAN.R-project.org/package=ffespn)
[![R-CMD-check](https://github.com/dfs-with-r/ffespn/workflows/R-CMD-check/badge.svg)](https://github.com/dfs-with-r/ffespn/actions)
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
#>    id      player  team  posit…¹ is_ac…² is_dr…³ is_in…⁴ slots draft_…⁵ owners…⁶
#>    <chr>   <chr>   <chr> <chr>   <lgl>   <lgl>   <lgl>   <lis> <list>   <list>  
#>  1 3917315 Kyler … ARI   QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  2 15864   Geno S… SEA   QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  3 3892775 Jarret… OAK   QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  4 2979501 Nate S… SF    QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  5 13987   Blaine… TB    QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  6 2979520 C.J. B… JAX   QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  7 3122840 Deshau… CLE   QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  8 4239086 Desmon… ATL   QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  9 14012   Andy D… NO    QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#> 10 3915511 Joe Bu… CIN   QB      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#> # … with 57 more rows, 52 more variables: ratings <list>, notes <chr>,
#> #   fpts_proj <dbl>, pass_att <dbl>, pass_cmp <dbl>, pass_inc <dbl>,
#> #   pass_yds <dbl>, pass_tds <dbl>, pass_tds_40_plus_yds <dbl>,
#> #   pass_tds_50_plus_yds <dbl>, pass_yds_300_399 <dbl>,
#> #   pass_yds_400_plus <dbl>, pass_2pt <dbl>, pass_int <dbl>, rush_att <dbl>,
#> #   rush_yds <dbl>, rush_tds <dbl>, rush_2pt <dbl>, rush_td_40_plus_yds <dbl>,
#> #   rush_td_50_plus_yds <dbl>, rush_yds_100_199 <dbl>, …
#> # ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names

# use custom league
dt <- ffespn_projections(2022, 0, "DT", league_id = "134971153")
dt
#> # A tibble: 164 × 31
#>    id      player  team  posit…¹ is_ac…² is_dr…³ is_in…⁴ slots draft_…⁵ owners…⁶
#>    <chr>   <chr>   <chr> <chr>   <lgl>   <lgl>   <lgl>   <lis> <list>   <list>  
#>  1 4242899 D.J. D… NYG   DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  2 3116449 L.J. C… SEA   DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  3 3886601 Shy Tu… NO    DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  4 15841   Johnat… OAK   DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  5 15846   John J… MIA   DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  6 4361662 Alim M… DET   DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  7 3915282 Zach A… ARI   DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  8 3894915 D.J. J… DEN   DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#>  9 4361791 Devont… GB    DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#> 10 4058825 Grover… IND   DT      TRUE    TRUE    FALSE   <chr> <tibble> <tibble>
#> # … with 154 more rows, 21 more variables: ratings <list>, notes <chr>,
#> #   fpts_proj <dbl>, def_total_ret_tds <dbl>, def_ints <dbl>,
#> #   def_fumbles_recovered <dbl>, def_blocks <dbl>, def_safeties <dbl>,
#> #   def_sacks <dbl>, def_stuffs <dbl>, def_fumble_ret_tds <dbl>,
#> #   def_int_ret_tds <dbl>, def_tds <dbl>, def_fumbles_forced <dbl>,
#> #   def_tackles_assisted <dbl>, def_tackles_solo <dbl>,
#> #   def_tackles_total <dbl>, def_passes_defended <dbl>, games <dbl>, …
#> # ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names
```
