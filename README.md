
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

df <- ffespn_projections(2020, 0, "QB")
df
#> # A tibble: 123 x 16
#>    id    full_name team  default_position active draft_ranks_by_… droppable
#>    <chr> <chr>     <chr> <chr>            <lgl>  <list>           <lgl>    
#>  1 3087… Nick Fit… FA    QB               TRUE   <tibble [2 × 6]> TRUE     
#>  2 5526  Eli Mann… NYG   QB               TRUE   <tibble [2 × 6]> TRUE     
#>  3 5529  Philip R… IND   QB               TRUE   <tibble [2 × 6]> TRUE     
#>  4 5536  Ben Roet… PIT   QB               TRUE   <tibble [2 × 6]> TRUE     
#>  5 3042… Logan Wo… TEN   QB               TRUE   <tibble [2 × 6]> TRUE     
#>  6 3917… Kyler Mu… ARI   QB               TRUE   <tibble [2 × 6]> TRUE     
#>  7 15837 Mike Gle… JAX   QB               TRUE   <tibble [2 × 6]> TRUE     
#>  8 5615  Matt Sch… ATL   QB               TRUE   <tibble [2 × 6]> TRUE     
#>  9 3120… Easton S… LAC   QB               TRUE   <tibble [2 × 6]> TRUE     
#> 10 15864 Geno Smi… SEA   QB               TRUE   <tibble [2 × 6]> TRUE     
#> # … with 113 more rows, and 9 more variables: eligible_slots <list>,
#> #   first_name <chr>, injured <lgl>, jersey <chr>, last_name <chr>,
#> #   ownership <list>, season_outlook <chr>, stats <list>, ratings <list>
```
