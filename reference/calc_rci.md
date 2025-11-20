# Generic to Calculate RCI and Associated Change

This is an internal generic and should not be called directly. Depending
on the different RCI method requested by the user, the appropriate
method is called. It calculates the RCI and according clinical
significance category for each participant.

## Usage

``` r
calc_rci(data, ...)
```

## Arguments

- data:

  Prepped data with class `cs_*`

- ...:

  Additional arguments for the specific RCI method

## Value

RCI result object with class `cs_distribution`
