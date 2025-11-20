# Calculate the categories based on the cutoff

Calculate the categories based on the cutoff

## Usage

``` r
# Default S3 method
calc_cutoff_from_data(
  data,
  m_clinical,
  sd_clinical,
  m_functional,
  sd_functional,
  type = "a",
  direction = 1,
  ...
)
```

## Arguments

- data:

  Prepped data with class `cs_*`

- m_functional:

  Mean of functional population

- sd_functional:

  SD of functional population

- type:

  Cutoff type, available are `"a"`, `"b"`, and `"c"`

- ...:

  Additional arguments for the specific RCI method
