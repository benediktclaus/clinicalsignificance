# Summary Method for the Combined Approach

Summary Method for the Combined Approach

## Usage

``` r
# S3 method for class 'cs_combined'
summary(object, ...)
```

## Arguments

- object:

  An object of class `cs_combined`

- ...:

  Additional arguments

## Value

No return value, called for side effects only

## Examples

``` r
cs_results <- claus_2020 |>
  cs_combined(id, time, hamd, pre = 1, post = 4, reliability = 0.8)

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
#> Cutoff Type:  a
#> Cutoff:       18.17
#> Outcome:      hamd
#> Reliability:  0.8
#> 
#> -- Cutoff Descriptives
#> 
#> M Clinical | SD Clinical | M Functional | SD Functional
#> -------------------------------------------------------
#> 24.85      |        3.34 |          --- |           ---
#> 
#> 
#> -- Results
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
