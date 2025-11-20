# Generic to Calculate Anchor-Based Results

This is an internal generic and should not be called directly. Depending
on the different anchor method requested by the user, the appropriate
method is called. It calculates the change and according clinical
significance category for each participant.

## Usage

``` r
calc_anchor(data, ...)
```

## Arguments

- data:

  A data set object of class `cs_*`

- ...:

  Additional arguments

## Value

An object of class `cs_anchor_*`
