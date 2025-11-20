# Plot an Object of Class cs_anchor_group_between

This function creates a generic group level clinical significance plot
by plotting the between group change with the associated uncertainty
interval around the estimated change on the y-axis.

## Usage

``` r
# S3 method for class 'cs_anchor_group_between'
plot(
  x,
  x_lab = "Group",
  y_lab = "Mean Intervention Effect\n(with 95%-CI)",
  ...
)
```

## Arguments

- x:

  An object of class `cs_anchor_group_between`

- x_lab:

  String, x axis label, defaults to `"Group"`

- y_lab:

  String, y axis label, defaults to
  `"Mean Intervention Effect (with 95%-CI)"`

- ...:

  Additional arguments

## Value

A ggplot2 plot

## Examples

``` r
cs_results <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    mom_di,
    mid_improvement = 8,
    target = "group",
    group = condition,
    effect = "between",
    post = "After"
  )


# Plot the results "as is"
plot(cs_results)



# Change the axis labels
plot(cs_results, x_lab = "Condition", y_lab = "Treatment Effect")
```
