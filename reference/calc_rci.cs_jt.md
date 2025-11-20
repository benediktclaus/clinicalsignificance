# RCI for the Jacobson & Truax method

RCI for the Jacobson & Truax method

## Usage

``` r
# S3 method for class 'cs_jt'
calc_rci(data, sd_pre, reliability, direction = 1, critical_value = 1.96, ...)
```

## Arguments

- sd_pre:

  Pre measurement SD

- reliability:

  Instrument reliability

- direction:

  Beneficial intervention effect for given instrument. 1 = higher is
  better, -1 = lower is better

- critical_value:

  Critical RCI value, typically 1.96
