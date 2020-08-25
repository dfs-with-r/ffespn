
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

df <- ffespn_projections(2020, 0, "DAL")
df
#> # A tibble: 23 x 19
#>    id    full_name team  default_position active draft_ranks_by_… droppable
#>    <chr> <chr>     <chr> <chr>            <lgl>  <list>           <lgl>    
#>  1 2991… Blake Ja… DAL   TE               TRUE   <tibble [2 × 6]> TRUE     
#>  2 14012 Andy Dal… DAL   QB               TRUE   <tibble [2 × 6]> TRUE     
#>  3 4036… Michael … DAL   WR               TRUE   <tibble [2 × 6]> TRUE     
#>  4 4036… Cedrick … DAL   WR               TRUE   <tibble [2 × 6]> TRUE     
#>  5 4038… Darius A… DAL   RB               TRUE   <tibble [2 × 6]> TRUE     
#>  6 3051… Ezekiel … DAL   RB               TRUE   <tibble [2 × 6]> FALSE    
#>  7 4241… CeeDee L… DAL   WR               TRUE   <tibble [2 × 6]> TRUE     
#>  8 2576… Devin Sm… DAL   WR               TRUE   <tibble [2 × 6]> TRUE     
#>  9 2586… Tevin Jo… DAL   WR               TRUE   <tibble [2 × 6]> TRUE     
#> 10 3117… Dalton S… DAL   TE               TRUE   <tibble [2 × 6]> TRUE     
#> # … with 13 more rows, and 12 more variables: eligible_slots <list>,
#> #   first_name <chr>, injured <lgl>, injury_status <chr>, jersey <chr>,
#> #   last_name <chr>, last_news_date <dttm>, ownership <list>, rankings <list>,
#> #   season_outlook <chr>, stats <list>, ratings <list>
```
