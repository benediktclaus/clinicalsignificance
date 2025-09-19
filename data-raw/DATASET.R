library(tidyverse)
library(readxl)
library(janitor)
library(faux)
library(mice)


# Placebo Amplification ---------------------------------------------------
# Dataset from Claus et al., (2020)
# https://osf.io/rc754/
claus_import <- read_excel("data-raw/claus-2020.xlsx") |>
  select(id, age, sex, treatment, matches("(BDI|HAMD|SHAPS|WHO).*total$")) |>
  clean_names()

claus_2020 <- claus_import |>
  pivot_longer(
    cols = bdi1_total:hamd4_total,
    names_to = c(".value", "time"),
    names_pattern = "(^.*)(\\d{1})"
  ) |>
  mutate(
    sex = factor(sex, levels = 0:1, labels = c("Female", "Male")),
    treatment = factor(treatment, levels = 0:1, labels = c("TAU", "PA")),
    time = as.numeric(time)
  ) |>
  as_tibble()

use_data(claus_2020, overwrite = TRUE)


# Marital Therapy ---------------------------------------------------------
# Dataset from Jacobson et al., 1989
jacobson_import <- read_excel("data-raw/jacobson-1989.xlsx")

jacobson_1989 <- jacobson_import |>
  arrange(subject)

use_data(jacobson_1989, overwrite = TRUE)


# Anxiety Dataset ---------------------------------------------------------
# Fictional data set to demonstrate HLM method.
# Intercept
gamma_00 <- 35
u_0j <- 6

# Time
gamma_10 <- -1
u_1j <- 2.5

# Treatment
gamma_20 <- -2
u_2j <- 1

# Interaction
gamma_30 <- 2

set.seed(20220419)
anxiety_complete <- add_random(subject = 116) |>
  add_between(treatment = c("Placebo", "Intervention"), .shuffle = TRUE) |>
  add_within(measurement = 1:5) |>
  add_recode(
    "measurement",
    "code_time",
    "1" = 0,
    "2" = 1,
    "3" = 2,
    "4" = 3,
    "5" = 4
  ) |>
  add_recode(
    "treatment",
    "code_treatment",
    Placebo = 0,
    Intervention = gamma_20
  ) |>
  add_ranef("subject", u_0j = u_0j) |>
  add_ranef("subject", u_1j = u_1j) |>
  add_ranef("subject", u_2j = u_2j) |>
  add_ranef(sigma = 3.5) |>
  mutate(
    outcome = gamma_00 +
      u_0j +
      (gamma_10 + u_1j) * code_time +
      (gamma_20 + u_2j) * code_treatment +
      gamma_30 * code_time * code_treatment +
      sigma,
    outcome = pmax(outcome, 0),
    subject = str_to_title(subject)
  ) |>
  select(subject, treatment, measurement = code_time, anxiety = outcome)

use_data(anxiety_complete, overwrite = TRUE)


# Anxiety dataset with missings
missing_pattern <- rbind(
  c(1, 1, 1, 1, 1, 1, 0),
  c(1, 1, 1, 1, 1, 0, 0),
  c(1, 1, 1, 1, 0, 0, 0),
  c(1, 1, 1, 0, 0, 0, 0)
)

set.seed(20220420)
anxiety <- anxiety |>
  pivot_wider(
    names_from = measurement,
    names_prefix = "t_",
    values_from = anxiety
  ) |>
  ampute(
    prop = 0.25,
    type = "MID",
    mech = "MCAR",
    patterns = missing_pattern,
    freq = c(0.7, 0.2, 0.05, 0.05)
  ) |>
  pluck("amp") |>
  as_tibble() |>
  pivot_longer(
    cols = t_0:t_4,
    names_to = "measurement",
    values_to = "anxiety"
  ) |>
  mutate(measurement = parse_number(measurement))


use_data(anxiety, overwrite = TRUE)


# Visual Checks -----------------------------------------------------------
anxiety |>
  ggplot(aes(measurement, anxiety, color = treatment)) +
  geom_line(aes(group = subject)) +
  facet_wrap(~treatment)


# Antidepressants ---------------------------------------------------------
set.seed(20230821)
antidepressants <- sim_design(
  within = list("measurement" = c("Before", "After")),
  between = list(
    "condition" = c(
      "Wait List",
      "Inactive Placebo",
      "Active Placebo",
      "Antidepressant"
    )
  ),
  n = round(runif(4, 120, 160), 0),
  mu = c(35, 36, 34, 25, 35, 19, 34, 19),
  sd = c(rnorm(7, mean = 8, sd = 1), 8),
  long = TRUE,
  dv = "mom_di",
  id = "patient",
  plot = FALSE
) |>
  mutate(
    mom_di = round(mom_di, 0)
  ) |>
  arrange(patient, measurement) |>
  as_tibble()

use_data(antidepressants, overwrite = TRUE)

# Visual checks
antidepressants |>
  summarise(
    mean = mean(mom_di),
    sd = sd(mom_di),
    .by = c(condition, measurement)
  ) |>
  ggplot(aes(measurement, mean, color = condition)) +
  geom_point(position = position_dodge(width = 0.2)) +
  geom_errorbar(
    aes(ymin = mean - sd, ymax = mean + sd),
    width = 0.2,
    position = position_dodge(width = 0.2)
  )


# Treating Children and Adolescents With Chronic Pain ---------------------
hechler_2014 <- read_rds("data-raw/hechler_2014.rds")

use_data(hechler_2014, overwrite = TRUE)


# ==============================================================================
# DATASET 1: GARDEN CLUB (Standard Pre-Post Design)
# ==============================================================================
# This section simulates data from a linear mixed-effects model (LMM) to
# create a realistic dataset for a two-group (CBT vs. Antienvyssant) pre-post
# intervention study. The simulation includes fixed effects for the average
# group trajectories and random effects for individual participant variability.

# Ensure reproducibility of the simulation.
set.seed(1757349950)

# ------------------------------------------------------------------------------
# Define Simulation Parameters
# ------------------------------------------------------------------------------

# A) Sample Size
n_per_group <- 75
n_total <- n_per_group * 2

# B) Fixed Effects (Population Averages)
beta_intercept <- 35 # Intercept: Avg. GEI score for Antienvyssant (reference) at pre-test.
beta_group <- 0 # Group Main Effect: Difference between groups at pre-test (here: none).
beta_time <- -2 # Time Main Effect: Avg. change for the Antienvyssant group.
beta_interaction <- -7 # Interaction: How much *more* the CBT group changes compared to the Antienvyssant group.

# C) Random Effects (Between-Subject Variability)
sd_random_intercept <- 2 # SD of intercepts: Variability in participants' starting scores.
sd_random_slope <- 3 # SD of slopes: Variability in participants' change over time.
cor_intercept_slope <- -0.4 # Correlation: e.g., participants with higher start scores might change more/less.

# D) Residual Variance
sd_residual <- 4 # Unexplained variance or measurement error at the observation level.


# ------------------------------------------------------------------------------
# Generate Data Based on LMM Parameters
# ------------------------------------------------------------------------------

# Create the covariance matrix for the random effects.
cov_matrix <- matrix(
  c(
    sd_random_intercept^2,
    sd_random_intercept * sd_random_slope * cor_intercept_slope,
    sd_random_intercept * sd_random_slope * cor_intercept_slope,
    sd_random_slope^2
  ),
  nrow = 2
)

# Simulate individual-specific random effects (intercepts and slopes).
random_effects <- MASS::mvrnorm(n = n_total, mu = c(0, 0), Sigma = cov_matrix)
colnames(random_effects) <- c("random_intercept", "random_slope")

# Create the basic long-format data structure for participants and time points.
garden_club_setup <- tibble(
  id = rep(1:n_total, each = 2),
  group = rep(rep(c("CBT", "Antienvyssant"), each = n_per_group), each = 2),
  time = rep(0:1, times = n_total) # 0 = pre, 1 = post
) |>
  left_join(
    as_tibble(random_effects) |> mutate(id = 1:n_total),
    by = "id"
  )

# Generate the final outcome score based on the full LMM equation.
garden_club <- garden_club_setup |>
  mutate(
    group_numeric = if_else(group == "Antienvyssant", 0, 1),

    gei_score = (beta_intercept + random_intercept) +
      (beta_time + random_slope) * time +
      beta_group * group_numeric +
      beta_interaction * time * group_numeric +
      rnorm(n(), mean = 0, sd = sd_residual),

    gei_score = round(pmax(0, pmin(50, gei_score)))
  ) |>
  group_by(id) |>
  mutate(
    age = round(runif(1, 35, 75)),
    gender = sample(c("m", "f", "d"), 1, prob = c(0.48, 0.48, 0.04))
  ) |>
  ungroup() |>
  select(id, group, age, gender, time, gei_score)

# Save the generated dataset.
use_data(garden_club, overwrite = TRUE)


# ==============================================================================
# DATASET 2: GARDEN CLUB SENSITIVE (For MID Sensitivity Analysis)
# ==============================================================================
# This section generates a dataset specifically designed to be "sensitive" to
# the choice of the Minimal Important Difference (MID). The mean change score
# is deliberately set to be near the MID thresholds tested in the analysis
# script, with a small standard deviation to ensure most participants' change
# scores fall within the ambiguous range.

set.seed(1757182800)

num_participants <- 100
pre_mean <- 40
pre_sd <- 3
change_mean <- -8 # A mean change that sits right between MID values of 6, 7, 8, 9.
change_sd <- 1.5 # Very low SD to cluster most changes in the sensitive region.

pre_scores <- rnorm(num_participants, mean = pre_mean, sd = pre_sd)
individual_changes <- rnorm(
  num_participants,
  mean = change_mean,
  sd = change_sd
)
post_scores <- pre_scores + individual_changes

# Combine and reshape the data into a long format.
garden_club_sensitive <- tibble(
  id = 1:num_participants,
  pre = pre_scores,
  post = post_scores
) |>
  pivot_longer(
    cols = -id,
    names_to = "time",
    values_to = "gei_score"
  ) |>
  mutate(
    time = if_else(time == "pre", 1, 2)
  )

# Save the generated dataset.
use_data(garden_club_sensitive, overwrite = TRUE)


# ==============================================================================
# DATASET 3: RACING (Interrupted Time-Series Design)
# ==============================================================================
# This section simulates data for a more complex design: an interrupted time
# series with repeated measures before and after an intervention. The simulation
# models distinct group-level effects for an immediate "jump" and a sustained
# "slope change" and includes individual variability in talent and learning rate.

set.seed(1756794770)

# ------------------------------------------------------------------------------
# Define Simulation Parameters
# ------------------------------------------------------------------------------

# Control Group "true" effects
intercept_control <- 60 # Avg. lap time at the intervention midpoint.
slope_pre_control <- -0.3 # Pre-intervention trend (slight improvement from practice).
jump_control <- 0 # No immediate effect of intervention.
slope_change_control <- 0 # No change in the learning trend.

# Training Group "true" effects
intercept_training <- 60 # Same baseline performance.
slope_pre_training <- -0.3 # Same initial learning trend.
jump_training <- -5 # A 5-second immediate improvement post-intervention.
slope_change_training <- -1 # An accelerated learning trend post-intervention.

# General parameters
n_drivers_per_group <- 20
n_attempts <- 10
intervention_point <- 5
sigma_residual <- 1.5 # Random noise in each lap time.

# ------------------------------------------------------------------------------
# Generate Data Based on Time-Series Model
# ------------------------------------------------------------------------------

# Create the base data structure with effect-coded time predictors.
# This coding scheme is identical to the one used in the brms analysis script.
racing_data <- crossing(
  group = c("Control", "Training"),
  driver_id_ingroup = 1:n_drivers_per_group,
  attempt = 1:n_attempts
) |>
  group_by(group, driver_id_ingroup) |>
  mutate(
    driver_id = cur_group_id(),
    time_centered = attempt - intervention_point - 0.5,
    intervention_code = if_else(attempt <= intervention_point, -0.5, 0.5)
  ) |>
  ungroup()

# Simulate random effects for each driver (talent and learning rate).
driver_effects <- tibble(
  driver_id = unique(racing_data$driver_id),
  driver_intercept_effect = rnorm(n_distinct(driver_id), mean = 0, sd = 2.5),
  driver_slope_effect = rnorm(n_distinct(driver_id), mean = 0, sd = 0.2)
)

# Generate the final outcome (lap time) based on the full model formula.
trackmania <- racing_data |>
  left_join(driver_effects, by = "driver_id") |>
  mutate(
    fixed_effects = case_when(
      group == "Control" ~
        intercept_control +
          slope_pre_control * time_centered +
          jump_control * intervention_code +
          slope_change_control * time_centered * intervention_code,

      group == "Training" ~
        intercept_training +
          slope_pre_training * time_centered +
          jump_training * intervention_code +
          slope_change_training * time_centered * intervention_code
    ),

    random_effects = driver_intercept_effect +
      driver_slope_effect * time_centered,

    lap_time_sec = fixed_effects +
      random_effects +
      rnorm(n(), mean = 0, sd = sigma_residual)
  ) |>
  select(driver_id, group, attempt, lap_time_sec)

# Save the generated dataset.
use_data(trackmania, overwrite = TRUE)


# ==============================================================================
# DATASET 4: COLUMBO'S DETECTIVES (Data with Missing Values)
# ==============================================================================
# This section simulates data for a fictional study evaluating the effectiveness
# of a special training program designed by Lieutenant Columbo. It first
# generates a complete dataset and then uses the `mice::ampute()` function to
# introduce missing values under a Missing At Random (MAR) mechanism, creating
# a realistic scenario for demonstrating multiple imputation.

set.seed(1756809648)

# ------------------------------------------------------------------------------
# Generate Complete Data
# ------------------------------------------------------------------------------
# Define the number of detectives participating in the study.
n_detectives <- 80

# Define the "true" parameters for the training effect. After Columbo's
# training, the mean case clearance rate is expected to be around 75%.
norm_mean <- 75
norm_sd <- 7


# Create the complete dataset before introducing any missing values.
detective_data_complete <- tibble(
  detective_id = 1:n_detectives,
  group = as_factor(rep(
    c("Columbo's Training", "Control"),
    each = n_detectives / 2
  )),
  age = round(runif(n_detectives, 25, 65)),
  gender = as_factor(sample(
    c("m", "f", "d"),
    n_detectives,
    replace = TRUE,
    prob = c(0.48, 0.48, 0.04)
  )),
  # A measure of job frustration, which will later predict missing data.
  job_frustration = round(runif(n_detectives, 0, 10), 2)
) |>
  mutate(
    # Simulate the pre-training case clearance rate (in percent).
    clearance_rate_pre = rnorm(n(), mean = 50, sd = 7),

    # Simulate the post-training clearance rate, where the training group shows improvement.
    clearance_rate_post = case_when(
      group == "Columbo's Training" ~
        rnorm(n(), mean = norm_mean, sd = norm_sd + 2),
      group == "Control" ~ clearance_rate_pre + rnorm(n(), mean = -4, sd = 10)
    )
  ) |>
  # Ensure the clearance rates are within a plausible 0-100% range.
  mutate(
    across(starts_with("clearance_rate"), ~ pmax(0, pmin(100, .x)))
  )

# ------------------------------------------------------------------------------
# Introduce Missing Data (MAR Mechanism)
# ------------------------------------------------------------------------------
# The probability of a missing 'clearance_rate_post' will depend on observed
# data. Specifically, detectives with higher job frustration are more likely
# to have their post-training data missing. A lower post-score itself also
# increases the likelihood of missingness.

amputed_data <- ampute(
  data = detective_data_complete,
  prop = 0.30, # Target ~30% missing values in the specified variable.
  patterns = matrix(c(1, 1, 1, 1, 1, 1, 0), nrow = 1), # Missingness only in 'clearance_rate_post'.
  weights = c(0, 0, 0, 0, 1, 0, -1), # Defines the MAR mechanism:
  # detective_id, group, age, gender: 0 (no influence)
  # job_frustration: 1 (higher frustration -> higher missingness prob.)
  # clearance_rate_pre: 0 (no influence)
  # clearance_rate_post: -1 (lower post-score -> higher missingness prob.)
  bycases = TRUE
)

# Extract the amputed dataset and pivot to the long format required for analysis.
columbo <- amputed_data$amp |>
  pivot_longer(
    cols = starts_with("clearance_rate"),
    names_to = c(".value", "time"),
    names_pattern = "(.*)_(pre|post)"
  ) |>
  mutate(
    time = as_factor(time)
  )


# Save the final dataset with missing values.
use_data(columbo, overwrite = TRUE)
