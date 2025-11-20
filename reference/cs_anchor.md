# Anchor-Based Analysis of Clinical Significance

`cs_anchor()` can be used to determine the clinical significance of
intervention studies employing the anchor-based approach. For this, a
predefined minimally important difference (MID) for an instrument is
known that corresponds to an important symptom improvement for patients.
The data can then be analyzed on the individual as well as the group
level to estimate, if the change because of an intervention is
clinically significant.

## Usage

``` r
cs_anchor(
  data,
  id,
  time,
  outcome,
  group,
  pre = NULL,
  post = NULL,
  mid_improvement = NULL,
  mid_deterioration = NULL,
  better_is = c("lower", "higher"),
  target = c("individual", "group"),
  effect = c("within", "between"),
  bayesian = TRUE,
  prior_scale = "medium",
  reference_group = NULL,
  ci_level = 0.95
)
```

## Arguments

- data:

  A tidy data frame

- id:

  Participant ID

- time:

  Time variable

- outcome:

  Outcome variable

- group:

  Grouping variable (optional)

- pre:

  Pre measurement (only needed if the time variable contains more than
  two measurements)

- post:

  Post measurement (only needed if the time variable contains more than
  two measurements)

- mid_improvement:

  Numeric, change that indicates a clinically significant improvement

- mid_deterioration:

  Numeric, change that indicates a clinically significant deterioration
  (optional). If `mid_deterioration` is not provided, it will be assumed
  to be equal to `mid_improvement`

- better_is:

  Which direction means a better outcome for the used instrument?
  Available are

  - `"lower"` (lower outcome scores are desirable, the default) and

  - `"higher"` (higher outcome scores are desirable)

- target:

  String, whether an individual or group analysis should be calculated.
  Available are

  - `"individual"` (the default) for which every individual participant
    is evaluated

  - `"group"` for which only the group wise effect is evaluated

- effect:

  String, if `target = "group"`, specify which effect should be
  calculated. Available are

  - `"within"` (the default), which yields the mean pre-post
    intervention difference with associated confidence intervals

  - `"between"`, which estimates the group wise mean difference and
    confidence intervals between two or more groups specified with the
    `group` argument at the specified measurement supplied with the
    `post`- argument The reference group may be supplied with
    `reference_group`

- bayesian:

  Logical, only relevant if `target = "group"`. Indicates if a Bayesian
  estimate (i.e., the median) of group differences with a credible
  interval should be calculated (if set to `TRUE`, the default) or a
  frequentist mean difference with confidence interval (if set to
  `FALSE`)

- prior_scale:

  String or numeric, can be adjusted to change the Bayesian prior
  distribution. See the documentation for `rscale` in
  [`BayesFactor::ttestBF()`](https://rdrr.io/pkg/BayesFactor/man/ttestBF.html)
  for details.

- reference_group:

  Specify the reference group to which all subsequent groups are
  compared against if `target = "group"` and `effect = "within"`
  (optional). Otherwise, the first distinct group is chosen based on
  alphabetical, numerical or factor ordering.

- ci_level:

  Numeric, define the credible or confidence interval level. The default
  is 0.95 for a 95%-CI.

## Value

An S3 object of class `cs_analysis` and `cs_anchor`

## Computational details

For the individual-level analyses, the analysis is straight forward. An
MID can be specified for an improvement as well as a deterioration
(because these must not necessarily be identical) and the function
basically counts how many patients fall within the MID range for both,
improvement and deterioration, or how many patients exceed the limits of
this range in either direction. A patient may than be categorized as:

- Improved, the patient demonstrated a change that is equal or greater
  then the MID for an improvement

- Unchanged, the patient demonstrated a change that is less than both
  MIDs

- Deteriorated, the patient demonstrated a change that is equal or
  greater then the MID for a deterioration

For group-level analyses, the whole sample is either treated as a single
group or is split up by grouping presented in the data. For within group
analyses, the function calculates the median change from pre to post
intervention with the associated credible interval (CI). Based on the
median change and the limits of this CI, a group change can be
categorized in 5 distinctive categories:

- Statistically not significant, the CI contains 0

- Statistically significant but not clinically relevant, the CI does not
  contain 0, but the median and both CI limits are beneath the MID
  threshold

- Not significantly less than the threshold, the MID threshold falls
  within the CI but the median is still below that threshold

- Probably clinically significant effect, the median crossed the MID
  threshold but the threshold is still inside the CI

- Large clinically significant effect, the median crossed the MID
  threshold and the CI does not contain the threshold

If a between group comparison is desired, a reference group can be
defined with the `reference_group` argument to which all subsequent
groups are compared. This is usually an inactive comparator such as a
placebo or wait-list control group. The difference between the pairwise
compared groups is categorized just as the within group difference
above, so the same categories apply.

The approach can be changed to a classical frequentist framework for
which the point estimate then represents the mean difference and the CI
a confidence interval. For an extensive overview over the differences
between a Bayesian and frequentist CI, refer to Hespanhol et al. (2019).

## Data preparation

The data set must be tidy, which corresponds to a long data frame in
general. It must contain a patient identifier which must be unique per
patient. Also, a column containing the different measurements and the
outcome must be supplied. Each participant-measurement combination must
be unique, so for instance, the data must not contain two "After"
measurements for the same patient.

Additionally, if the measurement column contains only two values, the
first value based on alphabetical, numerical or factor ordering will be
used as the `pre` measurement. For instance, if the column contains the
measurements identifiers `"pre"` and `"post"` as strings, then `"post"`
will be sorted before `"pre"` and thus be used as the `"pre"`
measurement. The function will throw a warning but generally you may
want to explicitly define the `"pre"` and `"post"` measurement with
arguments `pre` and `post`. In case of more than two measurement
identifiers, you have to define `pre` and `post` manually since the
function does not know what your pre and post intervention measurements
are.

If your data is grouped, you can specify the group by referencing the
grouping variable (see examples below). The analysis is then run for
every group to compare group differences.

## References

Hespanhol, L., Vallio, C. S., Costa, L. M., & Saragiotto, B. T. (2019).
Understanding and interpreting confidence and credible intervals around
effect estimates. Brazilian Journal of Physical Therapy, 23(4), 290–301.
https://doi.org/10.1016/j.bjpt.2018.12.006

## See also

Main clinical signficance functions
[`cs_combined()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_combined.md),
[`cs_distribution()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_distribution.md),
[`cs_percentage()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_percentage.md),
[`cs_statistical()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_statistical.md)

## Examples

``` r
cs_results <- antidepressants |>
  cs_anchor(patient, measurement, mom_di, mid_improvement = 8)
#> ℹ Your "Before" was set as pre measurement and and your "After" as post.
#> • If that is not correct, please specify the pre measurement with the argument
#>   "pre".

cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based
#> MID Improvement:   8
#> MID Deterioration: 8
#> Better is:         Lower
#> 
#> Category     |   N | Percent
#> ----------------------------
#> Improved     | 316 |  56.94%
#> Unchanged    | 175 |  31.53%
#> Deteriorated |  64 |  11.53%
#> 
plot(cs_results)
#> Ignoring unknown labels:
#> • colour : "Group"


# Set argument "pre" to avoid a warning
cs_results <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    mom_di,
    pre = "Before",
    mid_improvement = 8
  )


# Inlcude the MID for deterioration
cs_results_with_deterioration <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    mom_di,
    pre = "Before",
    mid_improvement = 8,
    mid_deterioration = 5
  )

cs_results_with_deterioration
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based
#> MID Improvement:   8
#> MID Deterioration: 5
#> Better is:         Lower
#> 
#> Category     |   N | Percent
#> ----------------------------
#> Improved     | 316 |  56.94%
#> Unchanged    | 152 |  27.39%
#> Deteriorated |  87 |  15.68%
#> 
summary(cs_results_with_deterioration)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based
#> MID Improvement:   8
#> MID Deterioration: 5
#> N (original):      555
#> N (used):          555
#> Percent (used):    100.00%
#> Better is:         Lower
#> Outcome:           mom_di
#> 
#> Category     |   N | Percent
#> ----------------------------
#> Improved     | 316 |  56.94%
#> Unchanged    | 152 |  27.39%
#> Deteriorated |  87 |  15.68%
#> 
plot(cs_results_with_deterioration)
#> Ignoring unknown labels:
#> • colour : "Group"



# Group the results by experimental condition
cs_results_grouped <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    mom_di,
    pre = "Before",
    group = condition,
    mid_improvement = 8,
    mid_deterioration = 5
  )

cs_results_grouped
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based
#> MID Improvement:   8
#> MID Deterioration: 5
#> Better is:         Lower
#> 
#> Group            |     Category |   N | Percent | Percent by Group
#> ------------------------------------------------------------------
#> Wait List        |     Improved |  27 |   4.86% |           17.76%
#> Wait List        |    Unchanged |  65 |  11.71% |           42.76%
#> Wait List        | Deteriorated |  60 |  10.81% |           39.47%
#> Inactive Placebo |     Improved |  71 |  12.79% |           54.62%
#> Inactive Placebo |    Unchanged |  41 |   7.39% |           31.54%
#> Inactive Placebo | Deteriorated |  18 |   3.24% |           13.85%
#> Active Placebo   |     Improved |  98 |  17.66% |           80.99%
#> Active Placebo   |    Unchanged |  20 |   3.60% |           16.53%
#> Active Placebo   | Deteriorated |   3 |   0.54% |            2.48%
#> Antidepressant   |     Improved | 120 |  21.62% |           78.95%
#> Antidepressant   |    Unchanged |  26 |   4.68% |           17.11%
#> Antidepressant   | Deteriorated |   6 |   1.08% |            3.95%
#> 
summary(cs_results_grouped)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based
#> MID Improvement:   8
#> MID Deterioration: 5
#> N (original):      555
#> N (used):          555
#> Percent (used):    100.00%
#> Better is:         Lower
#> Outcome:           mom_di
#> 
#> Group            |     Category |   N | Percent | Percent by Group
#> ------------------------------------------------------------------
#> Wait List        |     Improved |  27 |   4.86% |           17.76%
#> Wait List        |    Unchanged |  65 |  11.71% |           42.76%
#> Wait List        | Deteriorated |  60 |  10.81% |           39.47%
#> Inactive Placebo |     Improved |  71 |  12.79% |           54.62%
#> Inactive Placebo |    Unchanged |  41 |   7.39% |           31.54%
#> Inactive Placebo | Deteriorated |  18 |   3.24% |           13.85%
#> Active Placebo   |     Improved |  98 |  17.66% |           80.99%
#> Active Placebo   |    Unchanged |  20 |   3.60% |           16.53%
#> Active Placebo   | Deteriorated |   3 |   0.54% |            2.48%
#> Antidepressant   |     Improved | 120 |  21.62% |           78.95%
#> Antidepressant   |    Unchanged |  26 |   4.68% |           17.11%
#> Antidepressant   | Deteriorated |   6 |   1.08% |            3.95%
#> 
plot(cs_results_grouped)


# The plot method always returns a ggplot2 object, so the plot may be further
# modified with ggplot2 code, e.g., facetting to avoid overplotting of groups
plot(cs_results_grouped) +
  ggplot2::facet_wrap(~ group)



# Compute group wise results
cs_results_groupwise <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    mom_di,
    pre = "Before",
    mid_improvement = 8,
    target = "group"
  )

cs_results_groupwise
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:        Anchor-based (within groups)
#> MID Improvement: 8
#> Better is:       Lower
#> 
#> Median Difference |  Lower | Upper | Ci Level |   N |                            Category
#> -----------------------------------------------------------------------------------------
#> -9.78             | -10.88 | -8.63 |     0.95 | 555 | Large clinically significant effect
#> 
summary(cs_results_groupwise)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:        Anchor-based (between groups)
#> MID Improvement: 8
#> N (original):    555
#> N (used):        555
#> Percent used:    100.00%
#> Better is:       Lower
#> Outcome:         mom_di
#> 
#> Difference |  Lower | Upper | Ci Level |   N |                            Category
#> ----------------------------------------------------------------------------------
#> -9.78      | -10.88 | -8.63 |     0.95 | 555 | Large clinically significant effect
#> 
plot(cs_results_groupwise)



# Group wise analysis, but split by experimentawl condition
cs_results_groupwise_condition <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    mom_di,
    pre = "Before",
    group = condition,
    mid_improvement = 8,
    target = "group"
  )

cs_results_groupwise_condition
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:        Anchor-based (within groups)
#> MID Improvement: 8
#> Better is:       Lower
#> 
#> Group            | Median Difference |  Lower |  Upper | Ci Level |   N |                                              Category
#> -------------------------------------------------------------------------------------------------------------------------------
#> Wait List        |              1.81 |   0.19 |   3.42 |     0.95 | 152 | Statistically significant but not clinically relevant
#> Inactive Placebo |             -9.37 | -11.48 |  -7.22 |     0.95 | 130 |                Probably clinically significant effect
#> Active Placebo   |            -17.01 | -18.95 | -15.02 |     0.95 | 121 |                   Large clinically significant effect
#> Antidepressant   |            -15.82 | -17.64 | -14.03 |     0.95 | 152 |                   Large clinically significant effect
#> 
summary(cs_results_groupwise_condition)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:        Anchor-based (between groups)
#> MID Improvement: 8
#> N (original):    555
#> N (used):        555
#> Percent used:    100.00%
#> Better is:       Lower
#> Outcome:         mom_di
#> 
#> Group            | Difference |  Lower |  Upper | Ci Level |   N |                                              Category
#> ------------------------------------------------------------------------------------------------------------------------
#> Wait List        |       1.81 |   0.19 |   3.42 |     0.95 | 152 | Statistically significant but not clinically relevant
#> Inactive Placebo |      -9.37 | -11.48 |  -7.22 |     0.95 | 130 |                Probably clinically significant effect
#> Active Placebo   |     -17.01 | -18.95 | -15.02 |     0.95 | 121 |                   Large clinically significant effect
#> Antidepressant   |     -15.82 | -17.64 | -14.03 |     0.95 | 152 |                   Large clinically significant effect
#> 
plot(cs_results_groupwise_condition)



# Compare all groups to a predefined reference group at a predefined measurement
cs_results_groupwise_between <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    mom_di,
    post = "After",
    group = condition,
    mid_improvement = 8,
    target = "group",
    effect = "between"
  )

cs_results_groupwise_between
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based (between groups)
#> MID (Improvement): 8
#> Better is:         Lower
#> 
#> Group 1   |          Group 2 | Median Difference |  Lower |  Upper | Ci Level
#> -----------------------------------------------------------------------------
#> Wait List | Inactive Placebo |            -11.71 | -13.37 | -10.17 |     0.95
#> Wait List |   Active Placebo |            -17.72 | -19.46 | -15.91 |     0.95
#> Wait List |   Antidepressant |            -18.43 | -20.18 | -16.71 |     0.95
#> 
#> Group 1   | N 1 | N 2 |                            Category
#> -----------------------------------------------------------
#> Wait List | 152 | 130 | Large clinically significant effect
#> Wait List | 152 | 121 | Large clinically significant effect
#> Wait List | 152 | 152 | Large clinically significant effect
#> 
summary(cs_results_groupwise_between)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based (between groups)
#> MID (Improvement): 8
#> Better is:         Lower
#> Outcome:           mom_di
#> 
#> Group 1   |          Group 2 | Median Difference |  Lower |  Upper | Ci Level
#> -----------------------------------------------------------------------------
#> Wait List | Inactive Placebo |            -11.71 | -13.37 | -10.17 |     0.95
#> Wait List |   Active Placebo |            -17.72 | -19.46 | -15.91 |     0.95
#> Wait List |   Antidepressant |            -18.43 | -20.18 | -16.71 |     0.95
#> 
#> Group 1   | N 1 | N 2 |                            Category
#> -----------------------------------------------------------
#> Wait List | 152 | 130 | Large clinically significant effect
#> Wait List | 152 | 121 | Large clinically significant effect
#> Wait List | 152 | 152 | Large clinically significant effect
#> 
plot(cs_results_groupwise_between)



# Compare all groups to a predefined reference group with frequentist appraoch
cs_results_groupwise_between_freq <- antidepressants |>
  cs_anchor(
    patient,
    measurement,
    mom_di,
    post = "After",
    group = condition,
    mid_improvement = 8,
    target = "group",
    effect = "between",
    bayesian = FALSE
  )

cs_results_groupwise_between_freq
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based (between groups)
#> MID (Improvement): 8
#> Better is:         Lower
#> 
#> Group 1   |          Group 2 | Mean Difference |  Lower |  Upper | Ci Level
#> ---------------------------------------------------------------------------
#> Wait List | Inactive Placebo |          -11.81 | -13.44 | -10.18 |     0.95
#> Wait List |   Active Placebo |          -17.79 | -19.54 | -16.05 |     0.95
#> Wait List |   Antidepressant |          -18.52 | -20.25 | -16.79 |     0.95
#> 
#> Group 1   | N 1 | N 2 |                            Category
#> -----------------------------------------------------------
#> Wait List | 152 | 130 | Large clinically significant effect
#> Wait List | 152 | 121 | Large clinically significant effect
#> Wait List | 152 | 152 | Large clinically significant effect
#> 
summary(cs_results_groupwise_between_freq)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:          Anchor-based (between groups)
#> MID (Improvement): 8
#> Better is:         Lower
#> Outcome:           mom_di
#> 
#> Group 1   |          Group 2 | Mean Difference |  Lower |  Upper | Ci Level
#> ---------------------------------------------------------------------------
#> Wait List | Inactive Placebo |          -11.81 | -13.44 | -10.18 |     0.95
#> Wait List |   Active Placebo |          -17.79 | -19.54 | -16.05 |     0.95
#> Wait List |   Antidepressant |          -18.52 | -20.25 | -16.79 |     0.95
#> 
#> Group 1   | N 1 | N 2 |                            Category
#> -----------------------------------------------------------
#> Wait List | 152 | 130 | Large clinically significant effect
#> Wait List | 152 | 121 | Large clinically significant effect
#> Wait List | 152 | 152 | Large clinically significant effect
#> 
plot(cs_results_groupwise_between_freq)
```
