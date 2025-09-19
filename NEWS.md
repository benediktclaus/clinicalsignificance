# clinicalsignificance (development version)
## Breaking changes
- All `print()` and `summary()` methods have been updated to be much simpler and more maintainable. The printout no longer utilizes the `cli` package which is now only used for special messages during argument validation and calculation, i.e. warning and messages. The results are unaffected by this change. This is purely cosmetic and improves code readability.

## Features
- Calculate group-wise percentages in `cs_anchor()`, `cs_percentage()`, `cs_distribution()`, `cs_statistical()`, `cs_combined()` if the argument `group` is given
- Include new datasets to showcase the various methods (`garden_club`, `trackmania`, `columbo`)

## Minor fixes
- The formatting of percentages for summary tables via `print()` or `summary()` was moved to the respective print and summary functions. Thusly, `cs_get_summary()` now returns raw numbers, which is useful for further analyses and plotting, e.g., in sensitivity analyses
- Display correct summary table for combined approaches
- All vignettes are updated

# clinicalsignificance 2.1.0
- I included the JSS article <doi:10.18637/jss.v111.i01> as a reference.

# clinicalsignificance 2.0.0

## Breaking changes

-   The former main function `clinical_significance()` is deprecated. The package now offers several different approaches to clinical significance analyses, namely:
    -   `cs_anchor()` (Anchor-based approaches)
    -   `cs_percentage()`(Percentage-change approaches)
    -   `cs_distribution()`(Distribution-based approaches)
    -   `cs_statistical()`(Statistical approaches)
    -   `cs_combined()`(Combined approaches)

The function `clinical_significance()` used the combined approach (distribution-based and statistical). So the identical analysis can be carried out with `cs_combined()`.

-  The function `check_cutoff()` is deprecated.

-   When `method = "HLM`, participants with three or more data points will be used. Before, participants with at least three data points (i.e., 4 or more) were used.


## New features

-   You can now specify a significance level at which you want the analysis to be based on with the `significance_level` argument. The default is `significance_level = 0.05`. Note that for this is the Phi max level when you set `method = "HA"` as outlined in their article.

-   The package now offers to combined approaches: The classic combination of statistical and distribution-based approaches but also the combination of statistical and anchor-based approaches

-  We included the function `cs_get_model()` to retrieve the hierarchical linear model that is fit during the distribution-based approach if the HLM method is requested.

- The `hechler_2014` dataset was included to ensure reproducibility of the JSS article.


## Minor improvements and fixes

-   Change the whole package to use R's native pipe operator `|>`
-   Remove unnecessary dependency on `magrittr`
-   Include new vignettes replacing the old ones
-   Display correct percentages in summary tables
-   Update package vignettes

# clinicalsignificance 1.2.1

## Breaking changes

-   Remove default theming from `check_cutoff()` as in other plot functions


## Minor improvements and fixes

-   Improve documentation of datasets
-   Include examples for `summary()` and `plot()` method

# clinicalsignificance 1.2.0

## Breaking changes

-   Remove default theming from `plot()` to give the user more control over the overall appearance

## Minor improvements and fixes

-   Further implementation of tidyeval principles since `aes_()` was deprecated
-   Small improvements in vignettes
-   Better documentation for some functions

# clinicalsignificance 1.1.0

-   Fix HLM method empirical bayes estimation (#2). This now relies on the lme4 package
-   Consider the instrument direction for group level summaries in the HA method (#1) which was not done in the initial release

# clinicalsignificance 1.0.1

-   Added a `NEWS.md` file to track changes to the package.
-   Added package URLs to DESCRIPTION, including one for bug reports
-   New package logo
