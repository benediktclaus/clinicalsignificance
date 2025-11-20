# Fictional "Columbo's Detectives" Data with Missing Values

A simulated dataset from a fictional study evaluating a special training
program by Lieutenant Columbo for detectives. This dataset is
specifically designed to demonstrate the handling of missing data.
Missing values were introduced into the post-intervention outcome using
a Missing At Random (MAR) mechanism.

## Usage

``` r
columbo
```

## Format

A tibble with 160 rows and 7 variables:

- detective_id:

  An integer representing the unique identifier for each detective.

- group:

  A factor indicating the training group (`"Columbo's Training"` or
  `"Control"`).

- age:

  An integer representing the detective's age.

- gender:

  A factor for the detective's gender (`"m"`, `"f"`, or `"d"`).

- job_frustration:

  A numeric score from 0-10 indicating job frustration.

- time:

  A factor for the measurement occasion (`"pre"` or `"post"`).

- clearance:

  A numeric value for the outcome, the Case Clearance Rate (in %). This
  variable contains `NA` values.

## Source

Simulated data where missing values in the post-intervention outcome
were introduced via a Missing At Random (MAR) mechanism. The probability
of missingness depends on observed variables (higher `job_frustration`
and lower post-intervention scores increase the likelihood of data being
missing).
