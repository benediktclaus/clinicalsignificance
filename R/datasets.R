#' Placebo Amplification Data
#'
#' A dataset containing the data from Claus et al. (2020). In a routine
#' inpatient setting for unipolar depressive disorders they implemented an
#' intervention that sought to amplify the placebo response of antidepressants.
#' In the study, two groups were compared: treatment as usual (TAU) and placebo
#' amplification (PA). Participants were examined four times during their
#' treatment.
#'
#' @format An object of class `tbl_df` with 172 rows and 9 columns.
#'
#'   \describe{
#'   \item{id}{Participant ID}
#'   \item{age}{Age}
#'   \item{sex}{Sex}
#'   \item{treatment}{Treatment (TAU for treatment as usual and PA for placebo
#'   amplification)}
#'   \item{time}{Measurement}
#'   \item{bdi}{Beck Depression Inventory (2nd Edition) score (lower is better)}
#'   \item{shaps}{Snaith-Hamilton Pleasure Scale score (higher is better)}
#'   \item{who}{WHO-Five Well-Being Index score (higher is better)}
#'   \item{hamd}{Hamilton Rating Scale for Depression score (lower is better)}
#'   }
#'
#' @references
#' - Claus, B. B., Scherbaum, N., & Bonnet, U. (2020). Effectiveness
#'   of an Adjunctive Psychotherapeutic Intervention Developed for Enhancing the
#'   Placebo Effect of Antidepressants Used within an Inpatient-Treatment
#'   Program of Major Depression: A Pragmatic Parallel-Group, Randomized
#'   Controlled Trial. Psychotherapy and Psychosomatics, 89(4), 258-260.
#'   https://doi.org/10.1159/000505855
#'
#' @source \url{https://osf.io/rc754/}
"claus_2020"


#' Marital Therapy Data
#'
#' A dataset containing the data from Jacobson et al. (1989). The purpose of the
#' study was to examine two forms of behavioral marital therapy,
#'
#' @format An object of class `tbl_df` with 60 rows and 4 columns.
#'
#'   \describe{
#'   \item{subject}{Subject ID}
#'   \item{time}{Measurement}
#'   \item{das}{Dyadic Adjustment Scale score (higher is better)}
#'   \item{gds}{Global Distress Scale score (lower is better)}
#'   }
#'
#' @references
#' - Jacobson, N. S., Schmaling, K. B., Holtzworth-Munroe, A., Katt,
#' J. L., Wood, L. F., & Follette, V. M. (1989). Research-structured vs
#' clinically flexible versions of social learning-based marital therapy.
#' Behaviour Research and Therapy, 27(2), 173-180.
#' https://doi.org/10.1016/0005-7967(89)90076-4
#'
#' - Jacobson, N. S., & Truax, P.
#' (1991). Clinical significance: A statistical approach to defining meaningful
#' change in psychotherapy research. Journal of Consulting and Clinical
#' Psychology, 59(1), 12-19. https://doi.org/10.1037//0022-006X.59.1.12
"jacobson_1989"


#'Anxiety Data (Complete)
#'
#'A fictional complete dataset to exemplify the use of HLM method for clinical
#'significance.
#'
#'In a fictional clinical trial, participants were split up to belong to either
#'a medical placebo ("Placebo") or psychotherapeutic intervention
#'("Intervention") group.
#'
#'They underwent outpatient treatment during which they were followed for 5
#'measurements at which a fictional anxiety score was measured. This anxiety
#'score may range from 0 - 60.
#'
#'The functional population (i.e., non-anxious
#'individuals) can be expected to have a mean score of M = 8 points with a
#'standard deviation of SD = 4.
#'
#'@format A data frame with 580 rows and 4 variables:
#'
#' \describe{
#'  \item{\code{subject}}{Participant}
#'  \item{\code{treatment}}{Treatment. Either Placebo or Intervention}
#'  \item{\code{measurement}}{Number of measurement}
#'  \item{\code{anxiety}}{Anxiety score (lower is better)}
#'  }
"anxiety_complete"


#'Anxiety Data
#'
#'A fictional dataset with missings to exemplify the use of HLM method for
#'clinical significance.
#'
#'In a fictional clinical trial, participants were split up to belong to either
#'a medical placebo ("Placebo") or psychotherapeutic intervention
#'("Intervention") group.
#'
#'They underwent outpatient treatment during which they were followed for 5
#'measurements at which a fictional anxiety score was measured. This anxiety
#'score may range from 0 - 60.
#'
#'The functional population (i.e., non-anxious individuals) can be expected to
#'have a mean score of M = 8 points with a standard deviation of SD = 4.
#'
#'@format A data frame with 580 rows and 4 variables:
#'
#'  \describe{
#'  \item{\code{subject}}{Participant}
#'  \item{\code{treatment}}{Treatment. Either Placebo or Intervention}
#'  \item{\code{measurement}}{Number of measurement}
#'  \item{\code{anxiety}}{Anxiety score (lower is better)}
#'  }
"anxiety"


#'Antidepressant Data
#'
#'A fictional dataset used to showcase group-based clinical significance
#'analyses and analyses with many participants.
#'
#'In a fictional clinical trial, the effectiveness of a new antidepressant
#'should be examined and depressed patients were randomized to one of four
#'groups:
#'- A wait list control group that did not receive a medication
#'- An inactive placebo group, i.e., a group that received a placebo
#'(inert substance without proposed clinical effect) pill
#'- An active placebo group, i.e., a group that received a placebo that evokes
#'side effects like mild nausea or a dry mouth
#'- The antidepressant group, so the target medication of this trial that should
#'have a clinical impact on the patients' depressive symptoms
#'
#'Suppose they underwent outpatient treatment, depressive symptoms were measured
#'before and after treatment with the Mind over Mood Depression Inventory
#'(MoM-DI) by Greenberger & Padesky (2015), and if a patient received a pill,
#'the clinician and the patient did not know, what type of medicaction they
#'consumed.
#'
#'Further, the minimal important difference for an improvement as measured by
#'this instrument was agreed to be an 8 point decrease. A deterioration can be
#'assumed if instrument scores increased by 5 points.
#'
#'The functional population (i.e., non-depressed individuals) can be expected to
#'have a mean score of M = 8 points with a standard deviation of SD = 7.
#'
#'@format A tibble with 1140 rows and 4 variables:
#'
#'  \describe{
#'  \item{\code{patient}}{Patient identifier}
#'  \item{\code{condition}}{Experimental condition}
#'  \item{\code{measurement}}{Indicator of measurement}
#'  \item{\code{mom_di}}{Mind over Mood Depression inventory scores
#'  (lower is better)
#'  }
#'}
#'
#'@references Greenberger, D., & Padesky, C. A. (2015). Mind over mood, second
#'  edition (2nd ed.). New York, NY: Guilford Publications.
"antidepressants"


#'Chronic Pain Data
#'
#'A reduced version of the data collected by Hechler et al. (2014)
#'
#'@format A tibble with 208 rows and 3 variables:
#'
#'  \describe{
#'  \item{\code{patient}}{Patient identifier}
#'  \item{\code{measurement}}{Indicator of measurement}
#'  \item{\code{disability}}{Pain-related disability as measured with the PPDI
#'  (lower is better)
#'  }
#'}
#'
#'@references Hechler, T., Ruhe, A.‑K., Schmidt, P., Hirsch, J., Wager, J.,
#'  Dobe, M., Krummenauer, F., & Zernikow, B. (2014). Inpatient Based Intensive
#'  Interdisciplinary Pain Treatment for Highly Impaired Children with Severe
#'  Chronic Pain: Randomized Controlled Trial of Efficacy and Economic Effects.
#'  Pain, 155(1), 118–128. https://doi.org/10.1016/j.pain.2013.09.015
"hechler_2014"


#' Fictional "Garden Club" Pre-Post Intervention Data
#'
#' A simulated dataset from a linear mixed-effects model (LMM) representing a
#' standard two-group (CBT vs. Antienvyssant) pre-post intervention study. The
#' data is ideal for demonstrating the analysis of longitudinal data with
#' repeated measures.
#'
#' @format
#' A tibble with 150 rows and 6 variables:
#' \describe{
#'   \item{id}{An integer representing the unique participant identifier.}
#'   \item{group}{A character vector indicating the treatment group (`"CBT"` or `"Antienvyssant"`).}
#'   \item{age}{An integer representing the participant's age.}
#'   \item{gender}{A character vector for the participant's gender (`"m"`, `"f"`, or `"d"`).}
#'   \item{time}{An integer for the measurement occasion (`0` = pre-test, `1` = post-test).}
#'   \item{gei_score}{A numeric value for the outcome, the score on the fictional Gardener Envy Inventory (GEI), ranging from 0 to 50.}
#' }
#'
#' @source
#' Simulated data based on a linear mixed-effects model (LMM) with fixed
#' effects for group and time, and random intercepts and slopes for participants.
#'
#' @seealso
#' \code{\link{garden_club_sensitive}} for a dataset designed for sensitivity analysis.
#'
#' @keywords datasets
"garden_club"


#' Fictional "Garden Club" Data for MID Sensitivity Analysis
#'
#' A simulated dataset specifically designed to be "sensitive" to the choice
#' of a Minimal Important Difference (MID). The mean change score is
#' deliberately set to be near common MID thresholds, with a small standard
#' deviation, making it perfect for demonstrating MID-based sensitivity analyses.
#'
#' @format
#' A tibble with 200 rows and 3 variables:
#' \describe{
#'   \item{id}{An integer representing the unique participant identifier.}
#'   \item{time}{A numeric value for the measurement occasion (`1` = pre, `2` = post).}
#'   \item{gei_score}{A numeric value for the outcome, the score on the fictional Gardener Envy Inventory (GEI).}
#' }
#'
#' @source
#' Simulated data where the mean change score is precisely calibrated to fall
#' within a range of plausible Minimal Important Difference (MID) values.
#'
#' @seealso
#' \code{\link{garden_club}} for a more standard pre-post dataset.
#'
#' @keywords datasets
"garden_club_sensitive"


#' Fictional "Trackmania" Racing Data for Interrupted Time-Series
#'
#' A simulated dataset for an interrupted time-series (ITS) design. The data
#' follows two groups of race car drivers ("Training" and "Control") over 10
#' lap attempts. An intervention occurs after the 5th attempt, designed to
#' affect both the immediate performance (jump) and the subsequent learning
#' rate (slope change) of the Training group.
#'
#' @format
#' A tibble with 400 rows and 4 variables:
#' \describe{
#'   \item{driver_id}{An integer representing the unique identifier for each driver.}
#'   \item{group}{A character vector indicating the experimental group (`"Training"` or `"Control"`).}
#'   \item{attempt}{An integer representing the lap attempt number (from 1 to 10).}
#'   \item{lap_time_sec}{A numeric value for the outcome, the lap time in seconds.}
#' }
#'
#' @source
#' Simulated data from a time-series model including fixed effects for a
#' pre-intervention slope, a post-intervention jump, and a post-intervention
#' slope change, plus random effects for driver talent (intercept) and
#' learning rate (slope).
#'
#' @keywords datasets
"trackmania"


#' Fictional "Columbo's Detectives" Data with Missing Values
#'
#' A simulated dataset from a fictional study evaluating a special training
#' program by Lieutenant Columbo for detectives. This dataset is specifically
#' designed to demonstrate the handling of missing data. Missing values were
#' introduced into the post-intervention outcome using a Missing At Random
#' (MAR) mechanism.
#'
#' @format
#' A tibble with 160 rows and 7 variables:
#' \describe{
#'   \item{detective_id}{An integer representing the unique identifier for each detective.}
#'   \item{group}{A factor indicating the training group (`"Columbo's Training"` or `"Control"`).}
#'   \item{age}{An integer representing the detective's age.}
#'   \item{gender}{A factor for the detective's gender (`"m"`, `"f"`, or `"d"`).}
#'   \item{job_frustration}{A numeric score from 0-10 indicating job frustration.}
#'   \item{time}{A factor for the measurement occasion (`"pre"` or `"post"`).}
#'   \item{clearance}{A numeric value for the outcome, the Case Clearance Rate (in %). This variable contains `NA` values.}
#' }
#'
#' @source
#' Simulated data where missing values in the post-intervention outcome were
#' introduced via a Missing At Random (MAR) mechanism. The probability of
#' missingness depends on observed variables (higher `job_frustration` and
#' lower post-intervention scores increase the likelihood of data being missing).
#'
#' @keywords datasets
"columbo"
