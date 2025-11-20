# Summary Method for the Distribution-Based Approach

Summary Method for the Distribution-Based Approach

## Usage

``` r
# S3 method for class 'cs_distribution'
summary(object, ...)
```

## Arguments

- object:

  An object of class `cs_distribution`

- ...:

  Additional arguments

## Value

No return value, called for side effects only

## Examples

``` r
cs_results <- claus_2020 |>
  cs_distribution(id, time, hamd, pre = 1, post = 4, reliability = 0.8)

summary(cs_results)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:     Distribution-based
#> RCI Method:   JT
#> N (original): 43
#> N (used):     40
#> Percent used: 93.02%
#> Outcome:      hamd
#> Reliability:  0.8
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 29 |  72.50%
#> Unchanged    | 10 |  25.00%
#> Deteriorated |  1 |   2.50%
#> 
```
