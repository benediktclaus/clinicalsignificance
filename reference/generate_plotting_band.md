# Generic to Calculate RCI Band Data for Plotting

This is an internal generic to generate data for the RCI band in
clinical significance plots. This should not be called directly.

## Usage

``` r
generate_plotting_band(x, lower_limit, upper_limit, ...)
```

## Arguments

- x:

  An object of respective class

- lower_limit:

  Lower plotting limit

- upper_limit:

  Upper plotting limit

- ...:

  Additional arguments

## Value

A tibble with data for the ribbon indicating unchanged patients
