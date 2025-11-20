# Summary Method for the Statistical Approach

Summary Method for the Statistical Approach

## Usage

``` r
# S3 method for class 'cs_statistical'
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
  cs_statistical(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 7
  )

summary(cs_results)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:     Statistical
#> Method:       JT
#> N (original): 43
#> N (used):     40
#> Percent used: 93.02%
#> Cutoff type:  a
#> Cutoff:       18.17
#> 
#> -- Cutoff Descriptives
#> 
#> M Clinical | SD Clinical | M Functional | SD Functional
#> -------------------------------------------------------
#> 24.85      |        3.34 |            8 |             7
#> 
#> 
#> -- Results
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 26 |  65.00%
#> Unchanged    | 13 |  32.50%
#> Deteriorated |  1 |   2.50%
#> 
```
