
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `strutilities`

<!-- badges: start -->
<!-- badges: end -->

The goal of `strutilities` is to perform obscure string manipulations.

## Installation

You can install the development version of strutilities like so:

``` r
install.packages('pak')
pak::pak('mjfrigaard/strutilities')
```

## Examples

This is a basic example which shows you how to solve a common problem:

``` r
library(strutilities)
d <- data.frame(value = c(29L, 91L, 39L, 28L, 12L),
                full_name = c("John", "John, Jacob",
                         "John, Jacob, Jingleheimer",
                         "Jingleheimer, Schmidt",
                         "JJJ, Schmidt"))
d
#>   value                 full_name
#> 1    29                      John
#> 2    91               John, Jacob
#> 3    39 John, Jacob, Jingleheimer
#> 4    28     Jingleheimer, Schmidt
#> 5    12              JJJ, Schmidt
```

``` r
sep_cols_mult(data = d, col = "full_name", col_prefix = "name")
#>   value                 full_name       name_1  name_2       name_3
#> 1    29                      John         John    <NA>         <NA>
#> 2    91               John, Jacob         John   Jacob         <NA>
#> 3    39 John, Jacob, Jingleheimer         John   Jacob Jingleheimer
#> 4    28     Jingleheimer, Schmidt Jingleheimer Schmidt         <NA>
#> 5    12              JJJ, Schmidt          JJJ Schmidt         <NA>
```

``` r
names(datasets::iris)
#> [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
names(process_text(datasets::iris))
#> [1] "sepal_length" "sepal_width"  "petal_length" "petal_width"  "species"
```

``` r
str(datasets::InsectSprays)
#> 'data.frame':    72 obs. of  2 variables:
#>  $ count: num  10 7 20 14 14 12 10 23 17 20 ...
#>  $ spray: Factor w/ 6 levels "A","B","C","D",..: 1 1 1 1 1 1 1 1 1 1 ...
str(process_text(datasets::InsectSprays, fct = TRUE))
#> 'data.frame':    72 obs. of  2 variables:
#>  $ count: num  10 7 20 14 14 12 10 23 17 20 ...
#>  $ spray: chr  "a" "a" "a" "a" ...
```

``` r
pivot_term_long("A large size in stockings is hard to sell.")
#>   Unique.Items                                       Term
#> 1            A A large size in stockings is hard to sell.
#> 2        large                                       <NA>
#> 3         size                                       <NA>
#> 4           in                                       <NA>
#> 5    stockings                                       <NA>
#> 6           is                                       <NA>
#> 7         hard                                       <NA>
#> 8           to                                       <NA>
#> 9        sell.                                       <NA>
```
