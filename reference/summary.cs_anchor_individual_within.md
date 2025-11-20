# Summary Method for the Anchor-Based Approach

Summary Method for the Anchor-Based Approach

## Usage

``` r
# S3 method for class 'cs_anchor_individual_within'
summary(object, ...)
```

## Arguments

- object:

  An object of class `cs_anchor_individual_within`

- ...:

  Additional arguments

## Value

No return value, called for side effects only

## Examples

``` r
cs_results <- claus_2020 |>
  cs_anchor(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    mid_improvement = 7
  )

cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based
#> MID Improvement:   7
#> MID Deterioration: 7
#> Better is:         Lower
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 25 |  62.50%
#> Unchanged    | 11 |  27.50%
#> Deteriorated |  4 |  10.00%
#> 
```
