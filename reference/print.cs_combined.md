# Print Method for the Combined Approach

Print Method for the Combined Approach

## Usage

``` r
# S3 method for class 'cs_combined'
print(x, ...)
```

## Arguments

- x:

  An object of class `cs_combined`

- ...:

  Additional arguments

## Value

No return value, called for side effects

## Examples

``` r
cs_results <- claus_2020 |>
  cs_combined(id, time, hamd, pre = 1, post = 4, reliability = 0.8)

cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:  Combined
#> Method:    JT
#> Better is: Lower
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Recovered    | 26 |  65.00%
#> Improved     |  3 |   7.50%
#> Unchanged    | 10 |  25.00%
#> Deteriorated |  1 |   2.50%
#> Harmed       |  0 |   0.00%
#> 
```
