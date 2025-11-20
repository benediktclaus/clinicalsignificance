# Get Reliability Of A cs_analysis Object

Get Reliability Of A cs_analysis Object

## Usage

``` r
cs_get_reliability(x)
```

## Arguments

- x:

  A cs_analysis object

## Value

A tibble showing the reliability

## See also

Extractor functions
[`cs_get_augmented_data()`](https://benediktclaus.github.io/clinicalsignificance/reference/augmented_data.md),
[`cs_get_data()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_data.md),
[`cs_get_model()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_model.md),
[`cs_get_n()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_n.md),
[`cs_get_summary()`](https://benediktclaus.github.io/clinicalsignificance/reference/summary_table.md)

## Examples

``` r
cs_results <- claus_2020 |>
  cs_distribution(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    reliability = 0.80
  )


cs_get_reliability(cs_results)
#> # A tibble: 1 × 1
#>   reliability
#>         <dbl>
#> 1         0.8
```
