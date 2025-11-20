# Anchor Calculations for Group Effect Within

This is an internal function and should never be called directly.

## Usage

``` r
# S3 method for class 'cs_anchor_group_within'
calc_anchor(
  data,
  mid_improvement,
  mid_deterioration,
  direction,
  ci_level,
  bayesian,
  prior_scale,
  ...
)
```

## Arguments

- bayesian:

  Logical, if Bayesian tests and uncertainty intervals should be used,
  defaults to `TRUE`.

- prior_scale:

  String or numeric, can be adjusted to change the Bayesian prior
  distribution. See the documentation for `rscale` in
  [`BayesFactor::ttestBF()`](https://rdrr.io/pkg/BayesFactor/man/ttestBF.html)
  for details
