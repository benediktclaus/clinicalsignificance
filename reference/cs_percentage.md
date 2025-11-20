# Percentage-Change Analysis of Clinical Significance

`cs_percentage()` can be used to determine the clinical significance of
intervention studies employing the percentage-change approach. For this,
each individuals relative change compared to the pre intervention
measurement and if this change exceeds a predefined change in percent
points, this change is then deemed clinically significant.

## Usage

``` r
cs_percentage(
  data,
  id,
  time,
  outcome,
  group = NULL,
  pre = NULL,
  post = NULL,
  pct_improvement = NULL,
  pct_deterioration = NULL,
  better_is = c("lower", "higher")
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

- pct_improvement:

  Numeric, percent change that indicates a clinically significant
  improvement

- pct_deterioration:

  Numeric, percent change that indicates a clinically significant
  deterioration (optional). If this is not set, `pct_deterioration` will
  be assumed to be equal to `pct_improvement`

- better_is:

  Which direction means a better outcome for the used instrument?
  Available are

  - `"lower"` (lower outcome scores are desirable, the default) and

  - `"higher"` (higher outcome scores are desirable)

## Value

An S3 object of class `cs_analysis` and `cs_percentage`

## Computational details

Each participants change is calculated and then divided by the pre
intervention score to estimate the individual's percent change. A
percent change for an improvement as well as a deterioration can be
provided separately and if `pct_deterioration` is not set, it will be
assumed to be the same as `pct_improvement`.

## Categories

Each individual's change may then be categorized into one of the
following three categories:

- Improved, the change is greater than the predefined percent change in
  the beneficial direction

- Unchanged, the change is within the predefined percent change

- Deteriorated, the change is greater than the predefined percent
  change, but in the disadvantageous direction

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

## See also

Main clinical signficance functions
[`cs_anchor()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_anchor.md),
[`cs_combined()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_combined.md),
[`cs_distribution()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_distribution.md),
[`cs_statistical()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_statistical.md)

## Examples

``` r
cs_results <- claus_2020 |>
  cs_percentage(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    pct_improvement = 0.3
  )

cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   30.00%
#> Percentage Deterioration: 30.00%
#> Better is:                Lower
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 25 |  62.50%
#> Unchanged    | 15 |  37.50%
#> Deteriorated |  0 |   0.00%
#> 
summary(cs_results)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   30.00%
#> Percentage Deterioration: 30.00%
#> Better is:                Lower
#> N (original):             43
#> N (used):                 40
#> Percent used:             93.02%
#> Outcome:                  hamd
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 25 |  62.50%
#> Unchanged    | 15 |  37.50%
#> Deteriorated |  0 |   0.00%
#> 
plot(cs_results)
#> Ignoring unknown labels:
#> • colour : "Group"



# You can set different thresholds for improvement and deterioration
cs_results_2 <- claus_2020 |>
  cs_percentage(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    pct_improvement = 0.3,
    pct_deterioration = 0.2
  )

cs_results_2
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   30.00%
#> Percentage Deterioration: 20.00%
#> Better is:                Lower
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 25 |  62.50%
#> Unchanged    | 14 |  35.00%
#> Deteriorated |  1 |   2.50%
#> 
summary(cs_results_2)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   30.00%
#> Percentage Deterioration: 20.00%
#> Better is:                Lower
#> N (original):             43
#> N (used):                 40
#> Percent used:             93.02%
#> Outcome:                  hamd
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 25 |  62.50%
#> Unchanged    | 14 |  35.00%
#> Deteriorated |  1 |   2.50%
#> 
plot(cs_results_2)
#> Ignoring unknown labels:
#> • colour : "Group"



# You can group the analysis by providing a group column from the data
cs_results_grouped <- claus_2020 |>
  cs_percentage(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    pct_improvement = 0.3,
    group = treatment
  )

cs_results_grouped
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   30.00%
#> Percentage Deterioration: 30.00%
#> Better is:                Lower
#> 
#> Group |     Category |  N | Percent | Percent by Group
#> ------------------------------------------------------
#> TAU   |     Improved |  6 |  15.00% |           31.58%
#> TAU   |    Unchanged | 13 |  32.50% |           68.42%
#> TAU   | Deteriorated |  0 |   0.00% |            0.00%
#> PA    |     Improved | 19 |  47.50% |           90.48%
#> PA    |    Unchanged |  2 |   5.00% |            9.52%
#> PA    | Deteriorated |  0 |   0.00% |            0.00%
#> 
summary(cs_results_grouped)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   30.00%
#> Percentage Deterioration: 30.00%
#> Better is:                Lower
#> N (original):             43
#> N (used):                 40
#> Percent used:             93.02%
#> Outcome:                  hamd
#> 
#> Group |     Category |  N | Percent | Percent by Group
#> ------------------------------------------------------
#> TAU   |     Improved |  6 |  15.00% |           31.58%
#> TAU   |    Unchanged | 13 |  32.50% |           68.42%
#> TAU   | Deteriorated |  0 |   0.00% |            0.00%
#> PA    |     Improved | 19 |  47.50% |           90.48%
#> PA    |    Unchanged |  2 |   5.00% |            9.52%
#> PA    | Deteriorated |  0 |   0.00% |            0.00%
#> 
plot(cs_results_grouped)



# The analyses can be performed for positive outcomes as well, i.e., outcomes
# for which a higher value is beneficial
cs_results_who <- claus_2020 |>
  cs_percentage(
    id,
    time,
    who,
    pre = 1,
    post = 4,
    pct_improvement = 0.3,
    better_is = "higher"
  )

cs_results_who
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   30.00%
#> Percentage Deterioration: 30.00%
#> Better is:                Higher
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 28 |  70.00%
#> Unchanged    |  9 |  22.50%
#> Deteriorated |  3 |   7.50%
#> 
summary(cs_results_who)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:                 Percentage-based
#> Percentage Improvement:   30.00%
#> Percentage Deterioration: 30.00%
#> Better is:                Higher
#> N (original):             43
#> N (used):                 40
#> Percent used:             93.02%
#> Outcome:                  who
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 28 |  70.00%
#> Unchanged    |  9 |  22.50%
#> Deteriorated |  3 |   7.50%
#> 
plot(cs_results_who)
#> Ignoring unknown labels:
#> • colour : "Group"

plot(cs_results_who, show = category)
```
