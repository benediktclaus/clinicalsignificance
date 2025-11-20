# Get Used Cutoff And Type From A cs_analysis Object

Get Used Cutoff And Type From A cs_analysis Object

## Usage

``` r
cs_get_cutoff(x, with_descriptives = FALSE)
```

## Arguments

- x:

  A cs_analysis object

- with_descriptives:

  Logical indicating whether you want to retrieve only the cutoff type
  and value or the summary statistics on which it is based on. The
  default is `FALSE`.

## Value

A tibble with cutoff information

## Examples

``` r
cs_results <- claus_2020 |>
  cs_statistical(
    id,
    time,
    bdi,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 8,
    cutoff_type = "c"
  )

cs_get_cutoff(cs_results)
#> # A tibble: 1 × 2
#>   type  value
#>   <chr> <dbl>
#> 1 c      21.6
cs_get_cutoff(cs_results, with_descriptives = TRUE)
#> # A tibble: 1 × 6
#>   m_clinical sd_clinical m_functional sd_functional type  value
#>        <dbl>       <dbl>        <dbl>         <dbl> <chr> <dbl>
#> 1       35.5        8.16            8             8 c      21.6
```
