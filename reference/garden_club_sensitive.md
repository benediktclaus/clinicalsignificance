# Fictional "Garden Club" Data for MID Sensitivity Analysis

A simulated dataset specifically designed to be "sensitive" to the
choice of a Minimal Important Difference (MID). The mean change score is
deliberately set to be near common MID thresholds, with a small standard
deviation, making it perfect for demonstrating MID-based sensitivity
analyses.

## Usage

``` r
garden_club_sensitive
```

## Format

A tibble with 200 rows and 3 variables:

- id:

  An integer representing the unique participant identifier.

- time:

  A numeric value for the measurement occasion (`1` = pre, `2` = post).

- gei_score:

  A numeric value for the outcome, the score on the fictional Gardener
  Envy Inventory (GEI).

## Source

Simulated data where the mean change score is precisely calibrated to
fall within a range of plausible Minimal Important Difference (MID)
values.

## See also

[`garden_club`](https://benediktclaus.github.io/clinicalsignificance/reference/garden_club.md)
for a more standard pre-post dataset.
