# Fictional "Trackmania" Racing Data for Interrupted Time-Series

A simulated dataset for an interrupted time-series (ITS) design. The
data follows two groups of race car drivers ("Training" and "Control")
over 10 lap attempts. An intervention occurs after the 5th attempt,
designed to affect both the immediate performance (jump) and the
subsequent learning rate (slope change) of the Training group.

## Usage

``` r
trackmania
```

## Format

A tibble with 400 rows and 4 variables:

- driver_id:

  An integer representing the unique identifier for each driver.

- group:

  A character vector indicating the experimental group (`"Training"` or
  `"Control"`).

- attempt:

  An integer representing the lap attempt number (from 1 to 10).

- lap_time_sec:

  A numeric value for the outcome, the lap time in seconds.

## Source

Simulated data from a time-series model including fixed effects for a
pre-intervention slope, a post-intervention jump, and a
post-intervention slope change, plus random effects for driver talent
(intercept) and learning rate (slope).
