# Paper B Updated Empirical Results, 1995--2023

## 1. Execution

This report summarizes the output from `paperB_updated_1995_2023_tables.do`
after restricting the main analysis sample to 1995--2023.

Latest verified run:

- Run date: 2026-05-26 16:13:28.
- Output directory: `result/`.
- Log file: `result/paperB_updated_1995_2023_tables.log`.
- The Stata log closed normally and contains no `r(...)` runtime errors.
- All reported regressions use heteroskedasticity-robust standard errors.

Main definitions:

- `G_it`: `governance100`.
- `X_it`: `vulnerability100`.
- `B_it`: debt/GDP.
- Dependent variable in spread regressions: `bond_spreads`.
- Dependent variable in debt-change regressions: `B_{i,t+1} - B_it`.

## 2. Output Inventory

The current do-file writes or overwrites:

```text
result/paperB_updated_1995_2023_tables.log
result/table1_descriptive_stats_compare.csv
result/table1_descriptive_stats_compare.dta
result/table1_descriptive_stats_compare.tex
result/table2_baseline_fe_periods.tex
result/table3_heterogeneity_theta.tex
result/table6_fullinteraction_theta_regression.tex
result/table6_1_theta_region_stats.csv
result/table6_1_theta_region_stats.dta
result/table6_1_theta_region_stats.tex
result/table6_theta_descriptive_stats.csv
result/table6_theta_descriptive_stats.dta
result/table6_theta_descriptive_stats.tex
result/table7_continuous_theta_debt_regression.csv
result/table7_continuous_theta_debt_regression.dta
result/table7_continuous_theta_debt_regression.tex
result/table7_theta_group_heterogeneity.csv
result/table7_theta_group_heterogeneity.dta
result/table7_theta_group_heterogeneity.tex
result/table7_1_censored_theta_debt_regression.csv
result/table7_1_censored_theta_debt_regression.dta
result/table7_1_censored_theta_debt_regression.tex
result/table7_deltaB_rss_cutoff_grid.csv
result/table7_deltaB_rss_cutoff_grid.dta
result/table7_deltaB_rss_selected_cutoff.csv
result/table7_deltaB_rss_selected_cutoff.dta
result/table7_deltaB_rss_cutoff_regression.tex
result/table7_deltaB_marginal_cutoff_selected.csv
result/table7_deltaB_marginal_cutoff_selected.dta
result/table7_deltaB_marginal_cutoff_regression.tex
result/table8_window_scan_rss_cutoff.csv
result/table8_window_scan_rss_cutoff.dta
result/table9_theta_group_window_scan.csv
result/table9_theta_group_window_scan.dta
result/theta_full_empirical_panel.csv
result/theta_full_empirical_panel.dta
```

## 3. Table 1: Descriptive Statistics

The descriptive sample is restricted to non-U.S. country-years in 1995--2023
with nonmissing sovereign spread, governance, vulnerability, and debt/GDP.

| Variable | N | Mean | SD | Median |
| --- | ---: | ---: | ---: | ---: |
| Sovereign spread | 1,250 | 2.320 | 4.345 | 0.708 |
| 10-year sovereign yield | 1,250 | 5.525 | 4.302 | 4.558 |
| G_it | 1,250 | 63.759 | 18.076 | 66.127 |
| X_it | 1,250 | 36.245 | 7.129 | 34.450 |
| B_it | 1,250 | 62.015 | 34.933 | 55.327 |
| Real GDP | 1,250 | 8.061 | 2.829 | 7.618 |
| Real GDP growth | 1,250 | 3.014 | 3.494 | 3.053 |
| CPI inflation | 1,249 | 3.767 | 4.558 | 2.541 |
| Overall balance/GDP | 1,224 | -0.545 | 3.498 | -0.523 |
| International reserves | 1,247 | 6.329 | 14.375 | 2.600 |
| Government effectiveness | 1,168 | 0.833 | 0.863 | 0.922 |
| Regulatory quality | 1,168 | 0.796 | 0.823 | 0.974 |
| Terms of trade | 1,160 | 100.985 | 12.540 | 99.800 |

## 4. Table 2: Baseline Fixed Effects

| Variable | G only | B only | X only | G + controls | B + controls | X + controls | G+B+X + controls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| G_it | -0.162*** |  |  | -0.084* |  |  | -0.097** |
| t-stat. | (-6.055) |  |  | (-1.898) |  |  | (-2.373) |
| B_it |  | 0.041*** |  |  | 0.043*** |  | 0.043*** |
| t-stat. |  | (7.100) |  |  | (6.286) |  | (6.316) |
| X_it |  |  | -0.043 |  |  | -0.153** | -0.030 |
| t-stat. |  |  | (-0.645) |  |  | (-2.079) | (-0.417) |
| Controls | No | No | No | Yes | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Countries | 61 | 62 | 62 | 59 | 60 | 60 | 59 |
| Observations | 1,255 | 1,267 | 1,272 | 1,103 | 1,120 | 1,120 | 1,103 |
| Adjusted R2 | 0.855 | 0.862 | 0.846 | 0.889 | 0.900 | 0.888 | 0.901 |

Interpretation: over 1995--2023, governance is negatively associated with
spreads in the combined controlled specification. Debt/GDP remains positive and
statistically significant.

## 5. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt het. No controls | Debt het. Controls | Climate het. No controls | Climate het. Controls | Full interaction No controls | Full interaction Controls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| G_it | 0.005 | 0.016 | 0.010 | -0.081 | 0.203** | 0.042 |
| t-stat. | (0.186) | (0.467) | (0.101) | (-0.797) | (2.149) | (0.438) |
| B_it | 0.161*** | 0.179*** | 0.035*** | 0.043*** | 0.163*** | 0.179*** |
| t-stat. | (6.811) | (8.012) | (6.692) | (6.352) | (6.963) | (8.025) |
| X_it | -0.070 | 0.023 | 0.030 | -0.009 | 0.207 | 0.056 |
| t-stat. | (-1.029) | (0.324) | (0.187) | (-0.057) | (1.305) | (0.378) |
| G_it x B_it | -0.002*** | -0.002*** |  |  | -0.002*** | -0.002*** |
| t-stat. | (-6.128) | (-7.076) |  |  | (-6.287) | (-7.084) |
| G_it x X_it |  |  | -0.004 | -0.000 | -0.005** | -0.001 |
| t-stat. |  |  | (-1.495) | (-0.170) | (-2.267) | (-0.298) |
| Controls | No | Yes | No | Yes | No | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes |
| Countries | 61 | 59 | 61 | 59 | 61 | 59 |
| Observations | 1,250 | 1,103 | 1,250 | 1,103 | 1,250 | 1,103 |
| Adjusted R2 | 0.880 | 0.913 | 0.867 | 0.901 | 0.880 | 0.913 |

The debt interaction remains negative and significant. The climate-risk
interaction is negative in the full-interaction specification, but it is not
statistically significant once controls are included.

## 6. Full-Interaction Empirical Theta

The controlled full-interaction spread model produces:

| Variable | Full interaction Controls |
| --- | ---: |
| G_it | 0.042 |
| t-stat. | (0.438) |
| B_it | 0.179*** |
| t-stat. | (8.025) |
| X_it | 0.056 |
| t-stat. | (0.378) |
| G_it x B_it | -0.002*** |
| t-stat. | (-7.084) |
| G_it x X_it | -0.001 |
| t-stat. | (-0.298) |
| Controls | Yes |
| Country FE | Yes |
| Year FE | Yes |
| Countries | 59 |
| Observations | 1,103 |
| Adjusted R2 | 0.913 |

The saved theta panel contains 1,798 non-U.S. country-year rows for 1995--2023.
Full-theta is nonmissing for 1,103 observations in the controlled spread-model
sample.

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_F_it | 1,103 | 9.481 | 13.666 | 5.053 | -0.039 | 107.253 |
| Marginal spread relief, -d s / d G | 1,103 | 0.112 | 0.075 | 0.096 | -0.010 | 0.469 |
| Marginal spread response, d s / d G | 1,103 | -0.112 | 0.075 | -0.096 | -0.469 | 0.010 |

### 6.1 Full-Theta Region Diagnostics

| Theta region | N | Mean B_it | Mean G_it | Mean spread | Mean Delta B_next |
| --- | ---: | ---: | ---: | ---: | ---: |
| theta_F_it < 0 | 6 | 6.458 | 60.337 | 2.653 | 1.519 |
| 0 <= theta_F_it < 1 | 96 | 18.194 | 55.523 | 4.014 | 1.317 |
| theta_F_it >= 1 | 1,001 | 65.528 | 62.374 | 2.448 | 1.010 |

## 7. Continuous Full-Theta Test for Debt-Change Dynamics

The continuous debt-change equation estimates the marginal effect:

```text
d(Delta B_next) / dG = lambda_0 + lambda_1 * theta_F_it
```

| Variable | Z controls | theta_F_it + Z | Debt only | Debt + Z | No B, No Z |
| --- | ---: | ---: | ---: | ---: | ---: |
| G_it | 0.047 | 0.026 | 0.083 | 0.038 | 0.090 |
| t-stat. | (0.378) | (0.227) | (1.207) | (0.317) | (1.295) |
| G_it x theta_F_it | -0.003*** | -0.001 | -0.003** | -0.001 | -0.003*** |
| t-stat. | (-3.949) | (-0.337) | (-2.402) | (-1.063) | (-4.719) |
| theta_F_it |  | -0.120 |  |  |  |
| t-stat. |  | (-0.402) |  |  |  |
| B_it |  |  | -0.011 | -0.061 |  |
| t-stat. |  |  | (-0.296) | (-1.541) |  |
| Observations | 1,044 | 1,044 | 1,044 | 1,044 | 1,044 |
| Countries | 59 | 59 | 59 | 59 | 59 |
| Adjusted R2 | 0.443 | 0.443 | 0.364 | 0.447 | 0.364 |

Interpretation: the interaction between governance and Full-theta is negative
and statistically significant in the Z-controls, debt-only, and no-control
specifications. It becomes statistically insignificant when `theta_F_it` is
included directly and when both debt and controls enter the regression.

### 7.1 Theta-Grouped Heterogeneity Regressions

| Variable | Bottom 50% | Top 50% | Bottom 20% | Top 20% |
| --- | ---: | ---: | ---: | ---: |
| G_it | 0.021 | 0.025 | 0.011 | -0.008 |
| t-stat. | (0.165) | (0.121) | (0.046) | (-0.019) |
| Observations | 522 | 522 | 209 | 208 |
| Countries | 39 | 46 | 29 | 23 |
| Adjusted R2 | 0.481 | 0.465 | 0.457 | 0.624 |

Cutoffs:

| Split | Cutoff |
| --- | ---: |
| 50/50 split median | 4.964 |
| Bottom 20% cutoff | 1.971 |
| Top 20% cutoff | 13.044 |

Interpretation: the governance coefficient is not statistically significant in
any theta subsample.

### 7.2 Start-Year Window Scan for Theta-Grouped Heterogeneity

Holding the end year fixed at 2023, the theta-grouped heterogeneity regressions
were rerun for start years from 1995 to 2017. For each window, Full-theta was
re-estimated, the theta groups were rebuilt within the window, and the
debt-change regression was estimated separately for bottom and top theta groups.

The following windows satisfy the requested sign condition: bottom coefficient
positive and top coefficient negative. Reported values are governance
coefficients with p-values in parentheses.

| Window | Split | Bottom coefficient | Top coefficient | Bottom N | Top N |
| --- | ---: | ---: | ---: | ---: | ---: |
| 1995--2023 | 20/20 | 0.011 (0.964) | -0.008 (0.985) | 209 | 208 |
| 1996--2023 | 20/20 | 0.011 (0.964) | -0.008 (0.985) | 209 | 208 |
| 1997--2023 | 20/20 | 0.011 (0.964) | -0.008 (0.985) | 209 | 208 |
| 1998--2023 | 20/20 | 0.011 (0.964) | -0.008 (0.985) | 209 | 208 |
| 1999--2023 | 20/20 | 0.011 (0.964) | -0.008 (0.985) | 209 | 208 |
| 2000--2023 | 20/20 | 0.011 (0.964) | -0.008 (0.985) | 209 | 208 |
| 2001--2023 | 20/20 | 0.180 (0.426) | -0.032 (0.940) | 203 | 203 |
| 2002--2023 | 20/20 | 0.180 (0.426) | -0.032 (0.940) | 203 | 203 |
| 2003--2023 | 20/20 | 0.097 (0.668) | -0.020 (0.963) | 198 | 198 |
| 2004--2023 | 20/20 | 0.092 (0.684) | -0.054 (0.901) | 191 | 191 |
| 2007--2023 | 50/50 | 0.063 (0.709) | -0.028 (0.916) | 426 | 425 |
| 2008--2023 | 50/50 | 0.020 (0.899) | -0.038 (0.891) | 404 | 404 |
| 2014--2023 | 50/50 | 0.054 (0.767) | -0.333 (0.500) | 258 | 257 |
| 2015--2023 | 50/50 | 0.114 (0.581) | -0.388 (0.477) | 231 | 231 |

None of the matching-window bottom or top coefficients is statistically
significant at the 10 percent level.

### 7.3 Censored Full-Theta Robustness Check

| Variable | Debt-change regression |
| --- | ---: |
| G_it | 0.047 |
| t-stat. | (0.378) |
| G_it x theta_plus_it | -0.003*** |
| t-stat. | (-3.949) |
| Observations | 1,044 |
| Countries | 59 |
| Adjusted R2 | 0.443 |

The censored-theta result is nearly identical to the uncensored Z-controls
continuous model; only six Full-theta observations are negative in this sample.

## 8. Full-Theta RSS Cutoff for Debt-Change Dynamics

| Item | Value |
| --- | ---: |
| Candidate empirical cutoffs retained | 1,044 |
| RSS cutoff c_hat | 19.374 |
| Empirical percentile of c_hat | 88.22 |
| RSS at c_hat | 19,260.021 |
| Low-theta observations | 921 |
| High-theta observations | 123 |

| Variable | Debt-change regression |
| --- | ---: |
| G_it x 1(theta_F_it < c_hat) | 0.036 |
| t-stat. | (0.288) |
| G_it x 1(theta_F_it >= c_hat) | -0.029 |
| t-stat. | (-0.241) |
| lambda_L - lambda_H | 0.065*** |
| t-stat. | (3.429) |
| Observations | 1,044 |
| Countries | 59 |
| Adjusted R2 | 0.438 |

Interpretation: at the RSS-selected cutoff, the low-theta governance slope is
positive and the high-theta governance slope is negative, but neither
regime-specific slope is individually significant. The equality test rejects
`lambda_L = lambda_H` at the 1 percent level.

### 8.1 Marginal-Effect Cutoff

The marginal-effect cutoff is:

```text
c_ME = lambda_0 / (-lambda_1)
```

Using the `Z controls` continuous model, `lambda_0 = 0.046762` and
`lambda_1 = -0.003138`, so `c_ME = 14.903`.

| Item | Value |
| --- | ---: |
| Marginal-effect cutoff c_ME | 14.903 |
| Empirical percentile of c_ME | 84.29 |
| RSS at c_ME | 19,614.256 |
| Low-theta observations | 880 |
| High-theta observations | 164 |

| Variable | Debt-change regression |
| --- | ---: |
| G_it x 1(theta_F_it < c_ME) | 0.034 |
| t-stat. | (0.275) |
| G_it x 1(theta_F_it >= c_ME) | -0.006 |
| t-stat. | (-0.046) |
| lambda_L - lambda_H | 0.040** |
| t-stat. | (2.272) |
| Observations | 1,044 |
| Countries | 59 |
| Adjusted R2 | 0.428 |

Interpretation: neither regime-specific governance slope is individually
significant at the marginal-effect cutoff, but the equality test rejects
`lambda_L = lambda_H` at the 5 percent level.

### 8.2 Start-Year Window Scan

Holding the end year fixed at 2023, the RSS cutoff exercise was rerun for
rolling start-year windows from 1995 to 2017. The table below reports windows
where the RSS-selected low-theta governance slope is positive and the
high-theta governance slope is negative. This is a sign-condition screen, not a
statistical-significance screen.

| Window | RSS cutoff | Low-theta slope | High-theta slope | Observations | Low N | High N |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 1995--2023 | 19.374 | 0.036 | -0.029 | 1,044 | 921 | 123 |
| 1996--2023 | 19.374 | 0.036 | -0.029 | 1,044 | 921 | 123 |
| 1997--2023 | 19.374 | 0.036 | -0.029 | 1,044 | 921 | 123 |
| 1998--2023 | 19.374 | 0.036 | -0.029 | 1,044 | 921 | 123 |
| 1999--2023 | 19.374 | 0.036 | -0.029 | 1,043 | 920 | 123 |
| 2000--2023 | 19.374 | 0.036 | -0.029 | 1,043 | 920 | 123 |
| 2001--2023 | 18.637 | 0.054 | -0.012 | 1,019 | 894 | 125 |
| 2002--2023 | 18.637 | 0.054 | -0.012 | 1,019 | 894 | 125 |
| 2004--2023 | 22.709 | 0.007 | -0.072 | 957 | 878 | 79 |
| 2006--2023 | 17.840 | 0.059 | -0.014 | 889 | 774 | 115 |
| 2008--2023 | 25.263 | 0.045 | -0.046 | 808 | 732 | 76 |
| 2009--2023 | 22.097 | 0.019 | -0.062 | 763 | 669 | 94 |
| 2011--2023 | 45.458 | 0.029 | -0.262 | 667 | 640 | 27 |
| 2016--2023 | 42.686 | 0.037 | -1.036 | 407 | 385 | 22 |
| 2017--2023 | 54.205 | 0.023 | -0.730 | 351 | 330 | 21 |

The windows that do not satisfy this sign pattern are 2003--2023,
2005--2023, 2007--2023, 2010--2023, and 2012--2023 through 2015--2023.

## 9. Summary

Using the 1995--2023 sample, the main spread regressions continue to show a
negative governance association and a positive debt/GDP association in the
combined controlled specification. The controlled debt interaction is negative
and significant, while the controlled climate-risk interaction is not
statistically significant. The continuous Full-theta interaction is negative
and significant in three of five debt-change specifications.

The RSS and marginal-effect cutoff exercises both produce positive low-theta
and negative high-theta governance slopes, but the regime-specific slopes are
not individually significant. Their equality tests remain significant. The
start-year window scan shows that 15 of the 23 fixed-end RSS windows satisfy
the positive low-theta and negative high-theta slope sign pattern. For
theta-grouped heterogeneity, 10 windows satisfy the bottom-positive/top-negative
pattern under the 20/20 split and 4 windows satisfy it under the 50/50 split,
but none of those matching-window coefficients is significant at the 10 percent
level.
