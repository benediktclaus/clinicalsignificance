# Get Data From A cs_analysis Object

Get Data From A cs_analysis Object

## Usage

``` r
cs_get_data(x, dataset = "data")
```

## Arguments

- x:

  A cs_analysis object.

- dataset:

  The dataset you wish to retrieve. Available options are

  - `"original"` (the raw original dataset)

  - `"wide"` (the original dataset in wide format)

  - `"data"` (the dataset which is used in the calculations). The
    default is `"data"`

## Value

A tibble

## See also

Extractor functions
[`cs_get_augmented_data()`](https://benediktclaus.github.io/clinicalsignificance/reference/augmented_data.md),
[`cs_get_model()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_model.md),
[`cs_get_n()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_n.md),
[`cs_get_reliability()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_reliability.md),
[`cs_get_summary()`](https://benediktclaus.github.io/clinicalsignificance/reference/summary_table.md)

## Examples

``` r
cs_results <- claus_2020 |>
  cs_anchor(id, time, bdi, mid_improvement = 9, pre = 1, post = 4)

cs_get_data(cs_results)
#> # A tibble: 40 × 4
#>       id   pre  post change
#>    <dbl> <dbl> <dbl>  <dbl>
#>  1     1    33    27     -6
#>  2     2    26    19     -7
#>  3     3    15     5    -10
#>  4     5    39    46      7
#>  5     6    22    28      6
#>  6     7    25    18     -7
#>  7     8    33    30     -3
#>  8     9    23     8    -15
#>  9    10    47    24    -23
#> 10    11    43    13    -30
#> # ℹ 30 more rows
cs_get_data(cs_results, dataset = "wide")
#> # A tibble: 43 × 3
#>       id   pre  post
#>    <dbl> <dbl> <dbl>
#>  1     1    33    27
#>  2     2    26    19
#>  3     3    15     5
#>  4     4    20    NA
#>  5     5    39    46
#>  6     6    22    28
#>  7     7    25    18
#>  8     8    33    30
#>  9     9    23     8
#> 10    10    47    24
#> # ℹ 33 more rows
cs_get_data(cs_results, dataset = "original")
#> # A tibble: 172 × 9
#>       id   age sex    treatment  time   bdi shaps   who  hamd
#>    <dbl> <dbl> <fct>  <fct>     <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1     1    54 Male   TAU           1    33     9     0    25
#>  2     1    54 Male   TAU           2    28     6     3    17
#>  3     1    54 Male   TAU           3    28     9     7    13
#>  4     1    54 Male   TAU           4    27     8     3    13
#>  5     2    52 Female PA            1    26    11     2    15
#>  6     2    52 Female PA            2    26    10     0    16
#>  7     2    52 Female PA            3    25    10     0     7
#>  8     2    52 Female PA            4    19     9     3    11
#>  9     3    54 Male   PA            1    15     2     0    28
#> 10     3    54 Male   PA            2    13     5     9    17
#> # ℹ 162 more rows
```
