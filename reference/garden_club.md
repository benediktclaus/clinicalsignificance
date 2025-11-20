# Fictional "Garden Club" Pre-Post Intervention Data

A simulated dataset from a linear mixed-effects model (LMM) representing
a standard two-group (CBT vs. Antienvyssant) pre-post intervention
study. The data is ideal for demonstrating the analysis of longitudinal
data with repeated measures.

## Usage

``` r
garden_club
```

## Format

A tibble with 150 rows and 6 variables:

- id:

  An integer representing the unique participant identifier.

- group:

  A character vector indicating the treatment group (`"CBT"` or
  `"Antienvyssant"`).

- age:

  An integer representing the participant's age.

- gender:

  A character vector for the participant's gender (`"m"`, `"f"`, or
  `"d"`).

- time:

  An integer for the measurement occasion (`0` = pre-test, `1` =
  post-test).

- gei_score:

  A numeric value for the outcome, the score on the fictional Gardener
  Envy Inventory (GEI), ranging from 0 to 50.

## Source

Simulated data based on a linear mixed-effects model (LMM) with fixed
effects for group and time, and random intercepts and slopes for
participants.

## See also

[`garden_club_sensitive`](https://benediktclaus.github.io/clinicalsignificance/reference/garden_club_sensitive.md)
for a dataset designed for sensitivity analysis.
