# Summary Method for the Anchor-Based Approach for Groups (Between)

Summary Method for the Anchor-Based Approach for Groups (Between)

## Usage

``` r
# S3 method for class 'cs_anchor_group_between'
summary(object, ...)
```

## Arguments

- object:

  An object of class `cs_anchor_group_between`

- ...:

  Additional arguments

## Value

No return value, called for side effects only

## Examples

``` r
cs_results <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    post = "After",
    mom_di,
    mid_improvement = 8,
    target = "group",
    effect = "between",
    group = condition
  )

summary(cs_results)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based (between groups)
#> MID (Improvement): 8
#> Better is:         Lower
#> Outcome:           mom_di
#> 
#> Group 1   |          Group 2 | Median Difference |  Lower |  Upper | Ci Level
#> -----------------------------------------------------------------------------
#> Wait List | Inactive Placebo |            -11.69 | -13.43 | -10.09 |     0.95
#> Wait List |   Active Placebo |            -17.73 | -19.52 | -16.00 |     0.95
#> Wait List |   Antidepressant |            -18.46 | -20.20 | -16.73 |     0.95
#> 
#> Group 1   | N 1 | N 2 |                            Category
#> -----------------------------------------------------------
#> Wait List | 152 | 130 | Large clinically significant effect
#> Wait List | 152 | 121 | Large clinically significant effect
#> Wait List | 152 | 152 | Large clinically significant effect
#> 
```
