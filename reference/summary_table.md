# Get A Summary Table From A cs_analysis Object

Retrieve the summary table in a tidy tibble format. This is especially
useful to plot the results or conduct sensitivity analyses.

## Usage

``` r
cs_get_summary(x, ...)

# Default S3 method
cs_get_summary(x, which = c("individual", "group"), ...)

# S3 method for class 'cs_anchor_group_within'
cs_get_summary(x, ...)

# S3 method for class 'cs_anchor_group_between'
cs_get_summary(x, ...)
```

## Arguments

- x:

  An object of class `cs_analysis`

- ...:

  Additional arguments passed to the respective method

- which:

  Which level of summary table to return. This is only necessary for
  method `"HA"` since two summary tables are reported. Available are

  - `individual`, the default

  - `group`, group level results according to Hageman & Arrindell (1999)

## Value

A tibble with clinical significance categories

## References

- Hageman, W. J., & Arrindell, W. A. (1999). Establishing clinically
  significant change: increment of precision and the distinction between
  individual and group level analysis. Behaviour Research and Therapy,
  37(12), 1169–1193. https://doi.org/10.1016/S0005-7967(99)00032-7

## See also

Extractor functions
[`cs_get_augmented_data()`](https://benediktclaus.github.io/clinicalsignificance/reference/augmented_data.md),
[`cs_get_data()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_data.md),
[`cs_get_model()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_model.md),
[`cs_get_n()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_n.md),
[`cs_get_reliability()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_reliability.md)

## Examples

``` r
anchor_results <- claus_2020 |>
  cs_anchor(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    mid_improvement = 8
  )

cs_get_summary(anchor_results)
#> # A tibble: 3 × 3
#>   category         n percent
#>   <fct>        <int>   <dbl>
#> 1 Improved        20   0.5  
#> 2 Unchanged       17   0.425
#> 3 Deteriorated     3   0.075


# Get summary table for a group level analysis
anchor_results_grouped <- claus_2020 |>
  cs_anchor(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    mid_improvement = 8,
    target = "group"
  )

cs_get_summary(anchor_results_grouped)
#> # A tibble: 1 × 6
#>   difference lower upper    ci     n category                              
#>        <dbl> <dbl> <dbl> <dbl> <int> <chr>                                 
#> 1      -9.40 -12.8 -5.85  0.95    40 Probably clinically significant effect


# Get group-wise summary table for the Hageman & Arrindell method
combined_results <- claus_2020 |>
  cs_combined(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 8,
    reliability = 0.80,
    rci_method = "HA"
  )

cs_get_summary(combined_results)
#> $individual_level_summary
#> # A tibble: 5 × 3
#>   category         n percent
#>   <fct>        <int>   <dbl>
#> 1 Recovered        7   0.175
#> 2 Improved        18   0.45 
#> 3 Unchanged       15   0.375
#> 4 Deteriorated     0   0    
#> 5 Harmed           0   0    
#> 
#> $group_level_summary
#> # A tibble: 2 × 2
#>   category   percent
#>   <chr>        <dbl>
#> 1 Changed      0.841
#> 2 Functional   0.354
#> 
#> $categories
#> # A tibble: 40 × 12
#>       id   pre  post change cs_indiv clinical_post    rci recovered improved
#>    <dbl> <dbl> <dbl>  <dbl>    <dbl> <lgl>          <dbl> <lgl>     <lgl>   
#>  1     1    33    27     -6    1.72  FALSE         -1.50  FALSE     FALSE   
#>  2     2    26    19     -7   -0.393 FALSE         -1.67  FALSE     TRUE    
#>  3     3    15     5    -10   -4.08  FALSE         -2.18  FALSE     TRUE    
#>  4     5    39    46      7    6.73  FALSE          0.732 FALSE     FALSE   
#>  5     6    22    28      6    1.98  FALSE          0.561 FALSE     FALSE   
#>  6     7    25    18     -7   -0.657 FALSE         -1.67  FALSE     TRUE    
#>  7     8    33    30     -3    2.51  FALSE         -0.981 FALSE     FALSE   
#>  8     9    23     8    -15   -3.29  FALSE         -3.04  TRUE      FALSE   
#>  9    10    47    24    -23    0.925 FALSE         -4.41  FALSE     TRUE    
#> 10    11    43    13    -30   -1.97  FALSE         -5.61  TRUE      FALSE   
#> # ℹ 30 more rows
#> # ℹ 3 more variables: unchanged <lgl>, deteriorated <lgl>, harmed <lgl>
#> 
cs_get_summary(combined_results, which = "group")
#> $individual_level_summary
#> # A tibble: 5 × 3
#>   category         n percent
#>   <fct>        <int>   <dbl>
#> 1 Recovered        7   0.175
#> 2 Improved        18   0.45 
#> 3 Unchanged       15   0.375
#> 4 Deteriorated     0   0    
#> 5 Harmed           0   0    
#> 
#> $group_level_summary
#> # A tibble: 2 × 2
#>   category   percent
#>   <chr>        <dbl>
#> 1 Changed      0.841
#> 2 Functional   0.354
#> 
#> $categories
#> # A tibble: 40 × 12
#>       id   pre  post change cs_indiv clinical_post    rci recovered improved
#>    <dbl> <dbl> <dbl>  <dbl>    <dbl> <lgl>          <dbl> <lgl>     <lgl>   
#>  1     1    33    27     -6    1.72  FALSE         -1.50  FALSE     FALSE   
#>  2     2    26    19     -7   -0.393 FALSE         -1.67  FALSE     TRUE    
#>  3     3    15     5    -10   -4.08  FALSE         -2.18  FALSE     TRUE    
#>  4     5    39    46      7    6.73  FALSE          0.732 FALSE     FALSE   
#>  5     6    22    28      6    1.98  FALSE          0.561 FALSE     FALSE   
#>  6     7    25    18     -7   -0.657 FALSE         -1.67  FALSE     TRUE    
#>  7     8    33    30     -3    2.51  FALSE         -0.981 FALSE     FALSE   
#>  8     9    23     8    -15   -3.29  FALSE         -3.04  TRUE      FALSE   
#>  9    10    47    24    -23    0.925 FALSE         -4.41  FALSE     TRUE    
#> 10    11    43    13    -30   -1.97  FALSE         -5.61  TRUE      FALSE   
#> # ℹ 30 more rows
#> # ℹ 3 more variables: unchanged <lgl>, deteriorated <lgl>, harmed <lgl>
#> 
```
