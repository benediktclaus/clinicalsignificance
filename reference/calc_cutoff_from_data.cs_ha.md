# Calculate cs_indiv

Calculate cs_indiv

## Usage

``` r
# S3 method for class 'cs_ha'
calc_cutoff_from_data(
  data,
  m_clinical,
  sd_clinical,
  m_functional,
  sd_functional,
  m_post,
  sd_post,
  reliability,
  type = "a",
  direction = 1,
  critical_value = 1.65,
  ...
)
```

## Arguments

- m_clinical:

  Mean of clinical population

- sd_clinical:

  SD of clinical population

- m_post:

  Mean of post measurement

- sd_post:

  SD of post measurement

- reliability:

  Instrument's reliability

- critical_value:

  The critical value for the RCI decision, should be 1.65 if
  significance_level = 0.05
