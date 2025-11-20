# Print Method for the Anchor-Based Approach for Groups (Between)

Print Method for the Anchor-Based Approach for Groups (Between)

## Usage

``` r
# S3 method for class 'cs_anchor_group_between'
print(x, ...)
```

## Arguments

- x:

  An object of class `cs_anchor_group_between`

- ...:

  Additional arguments

## Value

No return value, called for side effects

## Examples

``` r
cs_results <- claus_2020 |>
  cs_anchor(
    id,
    time,
    bdi,
    post = 4,
    mid_improvement = 7,
    group = treatment,
    target = "group",
    effect = "between"
  )

cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based (between groups)
#> MID (Improvement): 7
#> Better is:         Lower
#> 
#> Group 1 | Group 2 | Median Difference |  Lower | Upper | Ci Level | N 1 | N 2 |                               Category
#> ----------------------------------------------------------------------------------------------------------------------
#> TAU     |      PA |            -10.14 | -17.93 | -2.60 |     0.95 |  19 |  21 | Probably clinically significant effect
#> 
```
