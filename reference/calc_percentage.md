# Calculate Change for the Percentage-Change Approach

This is an internal generic and should not be called directly. Depending
on the different percent change cutoff requested by the user, this
function calculates the relative change according clinical significance
category for each patient.

## Usage

``` r
calc_percentage(data, pct_improvement, pct_deterioration, direction)
```

## Arguments

- data:

  A pre-processed data frame with at least columns `change` and `pre`

- pct_improvement:

  Numeric, the required percent change cutoff to infer an improvement

- pct_deterioration:

  Numeric, the required percent change cutoff to infer a deterioration

## Value

An object of classm `cs_percentage` list with participant-wise info on
clinical significant change catergory
