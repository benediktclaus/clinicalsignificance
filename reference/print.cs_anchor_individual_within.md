# Print Method for the Anchor-Based Approach for Individuals

Print Method for the Anchor-Based Approach for Individuals

## Usage

``` r
# S3 method for class 'cs_anchor_individual_within'
print(x, ...)
```

## Arguments

- x:

  An object of class `cs_anchor_individual_within`

- ...:

  Additional arguments

## Value

No return value, called for side effects

## Examples

``` r
cs_results <- claus_2020 |>
  cs_distribution(id, time, hamd, pre = 1, post = 4, reliability = 0.8)
cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:   Distribution-based
#> RCI Method: JT
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 29 |  72.50%
#> Unchanged    | 10 |  25.00%
#> Deteriorated |  1 |   2.50%
#> 
```
