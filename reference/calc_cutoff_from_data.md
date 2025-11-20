# Generic for Statistical Approach

This is an internal generic and should not be called directly. Depending
on the different cutoff method requested by the user, the appropriate
method is called. It calculates the cutoff and according clinical
significance category for each participant.

## Usage

``` r
calc_cutoff_from_data(data, ...)
```

## Arguments

- data:

  A pre-processed wide data frame with at least column `id`, `pre` and
  `post` and class `cs_*`

- ...:

  Additional arguments for the respective cutoff method

## Value

A list with cutoff info and participant wise info on cutoff
categorization
