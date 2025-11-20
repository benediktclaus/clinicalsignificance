# Print Method for the Statistical Approach

Print Method for the Statistical Approach

## Usage

``` r
# S3 method for class 'cs_statistical'
print(x, ...)
```

## Arguments

- x:

  An object of class `cs_distribution`

- ...:

  Additional arguments

## Value

No return value, called for side effects

## Examples

``` r
cs_results <- claus_2020 |>
  cs_statistical(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 7
  )

cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach: Statistical
#> Method:   JT
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 26 |  65.00%
#> Unchanged    | 13 |  32.50%
#> Deteriorated |  1 |   2.50%
#> 
```
