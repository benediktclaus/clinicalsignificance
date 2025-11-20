# Package index

## Core Analysis Functions

The starting point for your workflow. Use these functions to perform the
core analyses of clinical significance.

- [`cs_anchor()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_anchor.md)
  : Anchor-Based Analysis of Clinical Significance
- [`cs_percentage()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_percentage.md)
  : Percentage-Change Analysis of Clinical Significance
- [`cs_distribution()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_distribution.md)
  : Distribution-Based Analysis of Clinical Significance
- [`cs_statistical()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_statistical.md)
  : Statistical Analysis of Clinical Significance
- [`cs_combined()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_combined.md)
  : Combined Analysis of Clinical Significance

## Visualize and Summarize Results

Methods to visualize and summarize the results of your analyses.

- [`plot(`*`<cs_anchor_group_between>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/plot.cs_anchor_group_between.md)
  : Plot an Object of Class cs_anchor_group_between
- [`plot(`*`<cs_anchor_group_within>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/plot.cs_anchor_group_within.md)
  : Plot an Object of Class cs_anchor_group_within
- [`plot(`*`<cs_anchor_individual_within>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/plot.cs_anchor_individual_within.md)
  : Plot an Object of Class cs_anchor_individual_within
- [`plot(`*`<cs_combined>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/plot.cs_combined.md)
  : Plot an Object of Class cs_combined
- [`plot(`*`<cs_distribution>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/plot.cs_distribution.md)
  : Plot an Object of Class cs_distribution
- [`plot(`*`<cs_percentage>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/plot.cs_percentage.md)
  : Plot an Object of Class cs_percentage
- [`plot(`*`<cs_statistical>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/plot.cs_statistical.md)
  : Plot an Object of Class cs_statistical
- [`summary(`*`<cs_anchor_group_between>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/summary.cs_anchor_group_between.md)
  : Summary Method for the Anchor-Based Approach for Groups (Between)
- [`summary(`*`<cs_anchor_group_within>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/summary.cs_anchor_group_within.md)
  : Summary Method for the Anchor-Based Approach for Groups (Within)
- [`summary(`*`<cs_anchor_individual_within>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/summary.cs_anchor_individual_within.md)
  : Summary Method for the Anchor-Based Approach
- [`summary(`*`<cs_combined>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/summary.cs_combined.md)
  : Summary Method for the Combined Approach
- [`summary(`*`<cs_distribution>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/summary.cs_distribution.md)
  : Summary Method for the Distribution-Based Approach
- [`summary(`*`<cs_percentage>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/summary.cs_percentage.md)
  : Summary Method for the Percentage-Change Approach
- [`summary(`*`<cs_statistical>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/summary.cs_statistical.md)
  : Summary Method for the Statistical Approach
- [`print(`*`<cs_anchor_group_between>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/print.cs_anchor_group_between.md)
  : Print Method for the Anchor-Based Approach for Groups (Between)
- [`print(`*`<cs_anchor_group_within>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/print.cs_anchor_group_within.md)
  : Print Method for the Anchor-Based Approach for Groups (Within)
- [`print(`*`<cs_anchor_individual_within>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/print.cs_anchor_individual_within.md)
  : Print Method for the Anchor-Based Approach for Individuals
- [`print(`*`<cs_combined>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/print.cs_combined.md)
  : Print Method for the Combined Approach
- [`print(`*`<cs_distribution>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/print.cs_distribution.md)
  : Print Method for the Distribution-Based Approach
- [`print(`*`<cs_percentage>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/print.cs_percentage.md)
  : Print Method for the Percentange-Change Approach
- [`print(`*`<cs_statistical>`*`)`](https://benediktclaus.github.io/clinicalsignificance/reference/print.cs_statistical.md)
  : Print Method for the Statistical Approach

## Extractor Functions

Helper functions to extract specific information and data from the
analysis objects.

- [`cs_get_augmented_data()`](https://benediktclaus.github.io/clinicalsignificance/reference/augmented_data.md)
  : Extract Augmented Data from a cs_analysis Object
- [`cs_get_cutoff()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_cutoff.md)
  : Get Used Cutoff And Type From A cs_analysis Object
- [`cs_get_cutoff_descriptives()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_cutoff_descriptives.md)
  : Get Descriptives Used In The Cutoff Calculation
- [`cs_get_data()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_data.md)
  : Get Data From A cs_analysis Object
- [`cs_get_model()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_model.md)
  : Get The HLM Model From A cs_analysis Object
- [`cs_get_n()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_n.md)
  : Get Number Of Participants From A cs_analysis Object
- [`cs_get_reliability()`](https://benediktclaus.github.io/clinicalsignificance/reference/cs_get_reliability.md)
  : Get Reliability Of A cs_analysis Object
- [`cs_get_summary()`](https://benediktclaus.github.io/clinicalsignificance/reference/summary_table.md)
  : Get A Summary Table From A cs_analysis Object

## Included Datasets

Example datasets for demonstrating and testing the package functions.

- [`jacobson_1989`](https://benediktclaus.github.io/clinicalsignificance/reference/jacobson_1989.md)
  : Marital Therapy Data
- [`claus_2020`](https://benediktclaus.github.io/clinicalsignificance/reference/claus_2020.md)
  : Placebo Amplification Data
- [`anxiety`](https://benediktclaus.github.io/clinicalsignificance/reference/anxiety.md)
  : Anxiety Data
- [`anxiety_complete`](https://benediktclaus.github.io/clinicalsignificance/reference/anxiety_complete.md)
  : Anxiety Data (Complete)
- [`antidepressants`](https://benediktclaus.github.io/clinicalsignificance/reference/antidepressants.md)
  : Antidepressant Data
- [`hechler_2014`](https://benediktclaus.github.io/clinicalsignificance/reference/hechler_2014.md)
  : Chronic Pain Data
- [`columbo`](https://benediktclaus.github.io/clinicalsignificance/reference/columbo.md)
  : Fictional "Columbo's Detectives" Data with Missing Values
- [`garden_club`](https://benediktclaus.github.io/clinicalsignificance/reference/garden_club.md)
  : Fictional "Garden Club" Pre-Post Intervention Data
- [`garden_club_sensitive`](https://benediktclaus.github.io/clinicalsignificance/reference/garden_club_sensitive.md)
  : Fictional "Garden Club" Data for MID Sensitivity Analysis
- [`trackmania`](https://benediktclaus.github.io/clinicalsignificance/reference/trackmania.md)
  : Fictional "Trackmania" Racing Data for Interrupted Time-Series
