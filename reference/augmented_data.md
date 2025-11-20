# Extract Augmented Data from a cs_analysis Object

This function returns the patient-wise results, containing the
considered pre and post intervention value, its raw change as well as
all other change estimates calculated during the clinical significance
analysis with the individual's clinical significance category. This
function is only useful for individual level analyses because the group
level analyses only yield group level results.

## Usage

``` r
cs_get_augmented_data(x, ...)

# Default S3 method
cs_get_augmented_data(x, ...)

# S3 method for class 'cs_distribution'
cs_get_augmented_data(x, ...)

# S3 method for class 'cs_statistical'
cs_get_augmented_data(x, ...)

# S3 method for class 'cs_combined'
cs_get_augmented_data(x, ...)

# S3 method for class 'cs_percentage'
cs_get_augmented_data(x, ...)

# S3 method for class 'cs_anchor_individual_within'
cs_get_augmented_data(x, ...)
```

## Arguments

- x:

  A `cs_analysis` object

- ...:

  Additional arguments

## Value

A tibble with augmented data

## See also

Extractor functions
[`cs_get_data()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_data.md),
[`cs_get_model()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_model.md),
[`cs_get_n()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_n.md),
[`cs_get_reliability()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_reliability.md),
[`cs_get_summary()`](https://benediktclaus.github.io/clinicalsignificance/reference/summary_table.md)

## Examples

``` r
# Augmented data can be extracted for every individual approach
anchor_results <- claus_2020 |>
  cs_anchor(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    mid_improvement = 9
  )


distribution_results <- claus_2020 |>
  cs_distribution(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    reliability = 0.80
  )


distribution_results_hlm <- claus_2020 |>
  cs_distribution(
    id,
    time,
    bdi,
    rci_method = "HLM"
  )


statistical_results <- claus_2020 |>
  cs_statistical(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 8
  )


combined_results <- claus_2020 |>
  cs_combined(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 8,
    reliability = 0.80
  )


cs_get_augmented_data(anchor_results)
#> # A tibble: 40 × 8
#>       id   pre  post change improved deteriorated unchanged category 
#>    <dbl> <dbl> <dbl>  <dbl> <lgl>    <lgl>        <lgl>     <fct>    
#>  1     1    33    27     -6 FALSE    FALSE        TRUE      Unchanged
#>  2     2    26    19     -7 FALSE    FALSE        TRUE      Unchanged
#>  3     3    15     5    -10 TRUE     FALSE        FALSE     Improved 
#>  4     5    39    46      7 FALSE    FALSE        TRUE      Unchanged
#>  5     6    22    28      6 FALSE    FALSE        TRUE      Unchanged
#>  6     7    25    18     -7 FALSE    FALSE        TRUE      Unchanged
#>  7     8    33    30     -3 FALSE    FALSE        TRUE      Unchanged
#>  8     9    23     8    -15 TRUE     FALSE        FALSE     Improved 
#>  9    10    47    24    -23 TRUE     FALSE        FALSE     Improved 
#> 10    11    43    13    -30 TRUE     FALSE        FALSE     Improved 
#> # ℹ 30 more rows
cs_get_augmented_data(distribution_results)
#> # A tibble: 40 × 9
#>       id   pre  post change    rci improved deteriorated unchanged category 
#>    <dbl> <dbl> <dbl>  <dbl>  <dbl> <lgl>    <lgl>        <lgl>     <fct>    
#>  1     1    33    27     -6 -1.16  FALSE    FALSE        TRUE      Unchanged
#>  2     2    26    19     -7 -1.36  FALSE    FALSE        TRUE      Unchanged
#>  3     3    15     5    -10 -1.94  FALSE    FALSE        TRUE      Unchanged
#>  4     5    39    46      7  1.36  FALSE    FALSE        TRUE      Unchanged
#>  5     6    22    28      6  1.16  FALSE    FALSE        TRUE      Unchanged
#>  6     7    25    18     -7 -1.36  FALSE    FALSE        TRUE      Unchanged
#>  7     8    33    30     -3 -0.581 FALSE    FALSE        TRUE      Unchanged
#>  8     9    23     8    -15 -2.91  TRUE     FALSE        FALSE     Improved 
#>  9    10    47    24    -23 -4.46  TRUE     FALSE        FALSE     Improved 
#> 10    11    43    13    -30 -5.81  TRUE     FALSE        FALSE     Improved 
#> # ℹ 30 more rows
cs_get_augmented_data(distribution_results_hlm)
#> # A tibble: 40 × 9
#>    id        n   pre  post     rci improved deteriorated unchanged category    
#>    <chr> <int> <dbl> <dbl>   <dbl> <lgl>    <lgl>        <lgl>     <fct>       
#>  1 1         4    33    27  0.422  FALSE    FALSE        TRUE      Unchanged   
#>  2 2         4    26    19 -0.0659 FALSE    FALSE        TRUE      Unchanged   
#>  3 3         4    15     5 -1.46   FALSE    FALSE        TRUE      Unchanged   
#>  4 5         4    39    46  2.61   FALSE    TRUE         FALSE     Deteriorated
#>  5 6         4    22    28  1.13   FALSE    FALSE        TRUE      Unchanged   
#>  6 7         4    25    18 -0.340  FALSE    FALSE        TRUE      Unchanged   
#>  7 8         4    33    30  0.774  FALSE    FALSE        TRUE      Unchanged   
#>  8 9         4    23     8 -1.64   FALSE    FALSE        TRUE      Unchanged   
#>  9 10        4    47    24 -0.572  FALSE    FALSE        TRUE      Unchanged   
#> 10 11        4    43    13 -2.11   TRUE     FALSE        FALSE     Improved    
#> # ℹ 30 more rows
cs_get_augmented_data(statistical_results)
#> # A tibble: 40 × 7
#>       id   pre  post change clinical_pre functional_post category 
#>    <dbl> <dbl> <dbl>  <dbl> <lgl>        <lgl>           <fct>    
#>  1     1    33    27     -6 TRUE         FALSE           Unchanged
#>  2     2    26    19     -7 TRUE         TRUE            Improved 
#>  3     3    15     5    -10 FALSE        TRUE            Unchanged
#>  4     5    39    46      7 TRUE         FALSE           Unchanged
#>  5     6    22    28      6 TRUE         FALSE           Unchanged
#>  6     7    25    18     -7 TRUE         TRUE            Improved 
#>  7     8    33    30     -3 TRUE         FALSE           Unchanged
#>  8     9    23     8    -15 TRUE         TRUE            Improved 
#>  9    10    47    24    -23 TRUE         FALSE           Unchanged
#> 10    11    43    13    -30 TRUE         TRUE            Improved 
#> # ℹ 30 more rows
cs_get_augmented_data(combined_results)
#> # A tibble: 40 × 11
#>       id   pre  post change    rci recovered improved unchanged deteriorated
#>    <dbl> <dbl> <dbl>  <dbl>  <dbl> <lgl>     <lgl>    <lgl>     <lgl>       
#>  1     1    33    27     -6 -1.16  FALSE     FALSE    TRUE      FALSE       
#>  2     2    26    19     -7 -1.36  FALSE     FALSE    TRUE      FALSE       
#>  3     3    15     5    -10 -1.94  FALSE     FALSE    TRUE      FALSE       
#>  4     5    39    46      7  1.36  FALSE     FALSE    TRUE      FALSE       
#>  5     6    22    28      6  1.16  FALSE     FALSE    TRUE      FALSE       
#>  6     7    25    18     -7 -1.36  FALSE     FALSE    TRUE      FALSE       
#>  7     8    33    30     -3 -0.581 FALSE     FALSE    TRUE      FALSE       
#>  8     9    23     8    -15 -2.91  TRUE      FALSE    FALSE     FALSE       
#>  9    10    47    24    -23 -4.46  FALSE     TRUE     FALSE     FALSE       
#> 10    11    43    13    -30 -5.81  TRUE      FALSE    FALSE     FALSE       
#> # ℹ 30 more rows
#> # ℹ 2 more variables: harmed <lgl>, category <fct>
```
