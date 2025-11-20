# Antidepressant Data

A fictional dataset used to showcase group-based clinical significance
analyses and analyses with many participants.

## Usage

``` r
antidepressants
```

## Format

A tibble with 1140 rows and 4 variables:

- `patient`:

  Patient identifier

- `condition`:

  Experimental condition

- `measurement`:

  Indicator of measurement

- `mom_di`:

  Mind over Mood Depression inventory scores (lower is better)

## Details

In a fictional clinical trial, the effectiveness of a new antidepressant
should be examined and depressed patients were randomized to one of four
groups:

- A wait list control group that did not receive a medication

- An inactive placebo group, i.e., a group that received a placebo
  (inert substance without proposed clinical effect) pill

- An active placebo group, i.e., a group that received a placebo that
  evokes side effects like mild nausea or a dry mouth

- The antidepressant group, so the target medication of this trial that
  should have a clinical impact on the patients' depressive symptoms

Suppose they underwent outpatient treatment, depressive symptoms were
measured before and after treatment with the Mind over Mood Depression
Inventory (MoM-DI) by Greenberger & Padesky (2015), and if a patient
received a pill, the clinician and the patient did not know, what type
of medicaction they consumed.

Further, the minimal important difference for an improvement as measured
by this instrument was agreed to be an 8 point decrease. A deterioration
can be assumed if instrument scores increased by 5 points.

The functional population (i.e., non-depressed individuals) can be
expected to have a mean score of M = 8 points with a standard deviation
of SD = 7.

## References

Greenberger, D., & Padesky, C. A. (2015). Mind over mood, second edition
(2nd ed.). New York, NY: Guilford Publications.
