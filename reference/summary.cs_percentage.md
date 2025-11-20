# Summary Method for the Percentage-Change Approach

Summary Method for the Percentage-Change Approach

## Usage

``` r
# S3 method for class 'cs_percentage'
summary(object, ...)
```

## Arguments

- object:

  An object of class `cs_percentage`

- ...:

  Additional arguments

## Value

No return value, called for side effects only

## Examples

``` r
cs_results <- claus_2020 |>
  cs_percentage(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    pct_improvement = 0.5
  )

summary(cs_results)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   50.00%
#> Percentage Deterioration: 50.00%
#> Better is:                Lower
#> N (original):             43
#> N (used):                 40
#> Percent used:             93.02%
#> Outcome:                  bdi
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 11 |  27.50%
#> Unchanged    | 29 |  72.50%
#> Deteriorated |  0 |   0.00%
#> 
```
