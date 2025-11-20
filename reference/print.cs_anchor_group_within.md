# Print Method for the Anchor-Based Approach for Groups (Within)

Print Method for the Anchor-Based Approach for Groups (Within)

## Usage

``` r
# S3 method for class 'cs_anchor_group_within'
print(x, ...)
```

## Arguments

- x:

  An object of class `cs_anchor_group_within`

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
    pre = 1,
    post = 4,
    mid_improvement = 7,
    target = "group"
  )

cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:        Anchor-based (within groups)
#> MID Improvement: 7
#> Better is:       Lower
#> 
#> Median Difference |  Lower | Upper | Ci Level |  N |                               Category
#> -------------------------------------------------------------------------------------------
#> -9.40             | -12.90 | -5.89 |     0.95 | 40 | Probably clinically significant effect
#> 
```
