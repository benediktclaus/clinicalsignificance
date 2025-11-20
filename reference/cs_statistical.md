# Statistical Analysis of Clinical Significance

`cs_statistical()` can be used to determine the clinical significance of
intervention studies employing the statistical approach. For this, it
will be assumed that the functional (non-clinical population) and
patient (clinical population) scores form two distinct distributions on
a continuum. `cs_statistical()` calculates a cutoff point between these
two populations and counts, how many patients changed from the clinical
to the functional population during intervention. Several methods for
calculating this cutoff are available.

## Usage

``` r
cs_statistical(
  data,
  id,
  time,
  outcome,
  group = NULL,
  pre = NULL,
  post = NULL,
  m_functional = NULL,
  sd_functional = NULL,
  reliability = NULL,
  better_is = c("lower", "higher"),
  cutoff_method = c("JT", "HA"),
  cutoff_type = c("a", "b", "c"),
  significance_level = 0.05
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

- m_functional:

  Numeric, mean of functional population.

- sd_functional:

  Numeric, standard deviation of functional population

- reliability:

  The instrument's reliability estimate. If you selected the NK method,
  the here specified reliability will be the instrument's pre
  measurement reliability. Not needed for the HLM method.

- better_is:

  Which direction means a better outcome for the used instrument?
  Available are

  - `"lower"` (lower outcome scores are desirable, the default) and

  - `"higher"` (higher outcome scores are desirable)

- cutoff_method:

  Cutoff method, Available are

  - `"JT"` (Jacobson & Truax, 1991, the default)

  - `"HA"` (Hageman & Arrindell, 1999)

- cutoff_type:

  Cutoff type. Available are `"a"`, `"b"`, and `"c"`. Defaults to `"a"`
  but `"c"` is usually recommended. For `"b"` and `"c"`, summary data
  from a functional population must be given with arguments
  `m_functional` and `sd_functional`.

- significance_level:

  Significance level alpha, defaults to `0.05`. If you choose the `"HA"`
  method, this value corresponds to the maximum risk of
  misclassification

## Value

An S3 object of class `cs_analysis` and `cs_statistical`

## Computational details

There are three available cutoff types, namely a, b, and c which can be
used to "draw a line" or separate the functional and clinical population
on a continuum. a as a cutoff is defined as the mean of the clinical
population minus two times the standard deviation (SD) of the clinical
population. b is defined as the mean of the functional population plus
also two times the SD of the clinical population. This is true for
"negative" outcomes, where a lower instrument score is desirable. For
"positive" outcomes, where higher scores are beneficial, a is the mean
of the clinical population plus 2 \\\cdot\\ SD of the clinical
population and b is mean of the functional population minus 2 \\\cdot\\
SD of the clinical population. The summary statistics for the clinical
population are estimated from the provided data at pre measurement.

c is defined as the midpoint between both populations based on their
respective mean and SD. In order to calculate b and c, descriptive
statistics for the functional population must be provided.

## Categories

Individual patients can be categorized into one of the following groups:

- Improved, i.e., one changed from the clinical to the functional
  population

- Unchanged, i.e., one can be seen as a member of the same population
  pre and post intervention

- Deteriorated, i.e., one changed from the functional to the clinical
  population during intervention

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

- Jacobson, N. S., & Truax, P. (1991). Clinical significance: A
  statistical approach to defining meaningful change in psychotherapy
  research. Journal of Consulting and Clinical Psychology, 59(1), 12–19.
  https://doi.org/10.1037//0022-006X.59.1.12

- Hageman, W. J., & Arrindell, W. A. (1999). Establishing clinically
  significant change: increment of precision and the distinction between
  individual and group level analysis. Behaviour Research and Therapy,
  37(12), 1169–1193. https://doi.org/10.1016/S0005-7967(99)00032-7

## See also

Main clinical signficance functions
[`cs_anchor()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_anchor.md),
[`cs_combined()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_combined.md),
[`cs_distribution()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_distribution.md),
[`cs_percentage()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_percentage.md)

## Examples

``` r
# By default, cutoff type "a" is used
cs_results <- claus_2020 |>
  cs_statistical(id, time, hamd, pre = 1, post = 4)

cs_results
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach: Statistical
#> Method:   JT
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 26 |  65.00%
#> Unchanged    | 13 |  32.50%
#> Deteriorated |  1 |   2.50%
#> 
summary(cs_results)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:     Statistical
#> Method:       JT
#> N (original): 43
#> N (used):     40
#> Percent used: 93.02%
#> Cutoff type:  a
#> Cutoff:       18.17
#> 
#> -- Cutoff Descriptives
#> 
#> M Clinical | SD Clinical | M Functional | SD Functional
#> -------------------------------------------------------
#> 24.85      |        3.34 |          --- |           ---
#> 
#> 
#> -- Results
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 26 |  65.00%
#> Unchanged    | 13 |  32.50%
#> Deteriorated |  1 |   2.50%
#> 
plot(cs_results)
#> Ignoring unknown labels:
#> • colour : "Group"



# You can choose a different cutoff type but need to provide additional
# population summary statistics for the functional population
cs_results_c <- claus_2020 |>
  cs_statistical(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 8,
    cutoff_type = "c"
  )

cs_results_c
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach: Statistical
#> Method:   JT
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 26 |  65.00%
#> Unchanged    | 13 |  32.50%
#> Deteriorated |  1 |   2.50%
#> 
summary(cs_results_c)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:     Statistical
#> Method:       JT
#> N (original): 43
#> N (used):     40
#> Percent used: 93.02%
#> Cutoff type:  c
#> Cutoff:       19.89
#> 
#> -- Cutoff Descriptives
#> 
#> M Clinical | SD Clinical | M Functional | SD Functional
#> -------------------------------------------------------
#> 24.85      |        3.34 |            8 |             8
#> 
#> 
#> -- Results
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 26 |  65.00%
#> Unchanged    | 13 |  32.50%
#> Deteriorated |  1 |   2.50%
#> 
plot(cs_results_c)
#> Ignoring unknown labels:
#> • colour : "Group"



# You can use a different method to calculate the cutoff
cs_results_ha <- claus_2020 |>
  cs_statistical(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 8,
    reliability = 0.80,
    cutoff_type = "c",
    cutoff_method = "HA"
  )

cs_results_ha
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach: Statistical
#> Method:   HA
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 23 |  57.50%
#> Unchanged    | 17 |  42.50%
#> Deteriorated |  0 |   0.00%
#> 
summary(cs_results_ha)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:     Statistical
#> Method:       HA
#> N (original): 43
#> N (used):     40
#> Percent used: 93.02%
#> Cutoff type:  c_true
#> Cutoff:       20.21
#> 
#> -- Cutoff Descriptives
#> 
#> M Clinical | SD Clinical | M Functional | SD Functional
#> -------------------------------------------------------
#> 24.85      |        3.34 |            8 |             8
#> 
#> 
#> -- Results
#> 
#> Category     |  N | Percent
#> ---------------------------
#> Improved     | 23 |  57.50%
#> Unchanged    | 17 |  42.50%
#> Deteriorated |  0 |   0.00%
#> 
plot(cs_results_ha)
#> Ignoring unknown labels:
#> • colour : "Group"



# And you can group the analysis by providing a grouping variable from the data
cs_results_grouped <- claus_2020 |>
  cs_statistical(
    id,
    time,
    hamd,
    pre = 1,
    post = 4,
    m_functional = 8,
    sd_functional = 8,
    cutoff_type = "c",
    group = treatment
  )

cs_results_grouped
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach: Statistical
#> Method:   JT
#> 
#> Group |     Category |  N | Percent | Percent by Group
#> ------------------------------------------------------
#> TAU   |     Improved |  7 |  17.50% |           36.84%
#> TAU   |    Unchanged | 11 |  27.50% |           57.89%
#> TAU   | Deteriorated |  1 |   2.50% |            5.26%
#> PA    |     Improved | 19 |  47.50% |           90.48%
#> PA    |    Unchanged |  2 |   5.00% |            9.52%
#> PA    | Deteriorated |  0 |   0.00% |            0.00%
#> 
summary(cs_results_grouped)
#> 
#> ---- Clinical Significance Results ----
#> 
#> Approach:     Statistical
#> Method:       JT
#> N (original): 43
#> N (used):     40
#> Percent used: 93.02%
#> Cutoff type:  c
#> Cutoff:       19.89
#> 
#> -- Cutoff Descriptives
#> 
#> M Clinical | SD Clinical | M Functional | SD Functional
#> -------------------------------------------------------
#> 24.85      |        3.34 |            8 |             8
#> 
#> 
#> -- Results
#> 
#> Group |     Category |  N | Percent | Percent by Group
#> ------------------------------------------------------
#> TAU   |     Improved |  7 |  17.50% |           36.84%
#> TAU   |    Unchanged | 11 |  27.50% |           57.89%
#> TAU   | Deteriorated |  1 |   2.50% |            5.26%
#> PA    |     Improved | 19 |  47.50% |           90.48%
#> PA    |    Unchanged |  2 |   5.00% |            9.52%
#> PA    | Deteriorated |  0 |   0.00% |            0.00%
#> 
plot(cs_results_grouped)
```
