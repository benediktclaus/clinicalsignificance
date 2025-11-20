# Anchor Calculations for Group Effect Between

Anchor Calculations for Group Effect Between

## Usage

``` r
# S3 method for class 'cs_anchor_group_between'
calc_anchor(
  data,
  mid_improvement,
  mid_deterioration,
  reference_group,
  post,
  direction,
  ci_level,
  bayesian,
  prior_scale,
  ...
)
```

## Arguments

- reference_group:

  String, the reference group to compare all other groups against

- post:

  The measurement at which groups should be compared, typically a
  measurement after an intervention.
