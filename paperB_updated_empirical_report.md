# Paper B Updated Empirical Results, 2013--2023

## 1. Execution

This report summarizes the output from `paperB_updated_1995_2023_tables.do`
after restricting the analysis sample to 2013--2023.

Latest verified run:

- Run date: 2026-05-26 00:54:41.
- Output directory: `result/`.
- Log file: `result/paperB_updated_1995_2023_tables.log`.
- Stata batch run completed with `ExitCode=0`.
- The run log contains no `r(...)` runtime errors.
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

The descriptive sample is restricted to non-U.S. country-years in 2013--2023
with nonmissing sovereign spread, governance, vulnerability, and debt/GDP.

| Variable | N | Mean | SD | Median |
| --- | ---: | ---: | ---: | ---: |
| Sovereign spread | 641 | 2.772 | 5.155 | 0.714 |
| 10-year sovereign yield | 641 | 5.090 | 5.204 | 3.243 |
| G_it | 641 | 60.147 | 17.785 | 61.318 |
| X_it | 641 | 37.135 | 7.371 | 35.703 |
| B_it | 641 | 67.334 | 37.511 | 59.085 |
| Real GDP | 641 | 8.272 | 3.003 | 7.791 |
| Real GDP growth | 641 | 2.928 | 3.656 | 2.976 |
| CPI inflation | 640 | 4.139 | 5.617 | 2.561 |
| Overall balance/GDP | 630 | -1.104 | 2.992 | -0.967 |
| International reserves | 638 | 7.240 | 17.484 | 2.384 |
| Government effectiveness | 641 | 0.680 | 0.841 | 0.737 |
| Regulatory quality | 641 | 0.672 | 0.860 | 0.755 |
| Terms of trade | 641 | 100.991 | 11.794 | 99.600 |

## 4. Table 2: Baseline Fixed Effects

| Variable | G only | B only | X only | G + controls | B + controls | X + controls | G+B+X + controls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| G_it | -0.246*** |  |  | -0.117 |  |  | -0.186*** |
| t-stat. | (-4.232) |  |  | (-1.584) |  |  | (-2.953) |
| B_it |  | 0.059*** |  |  | 0.068*** |  | 0.071*** |
| t-stat. |  | (4.188) |  |  | (5.035) |  | (5.357) |
| X_it |  |  | -0.023 |  |  | -0.190** | 0.039 |
| t-stat. |  |  | (-0.255) |  |  | (-2.058) | (0.437) |
| Controls | No | No | No | Yes | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Countries | 61 | 62 | 62 | 59 | 60 | 60 | 59 |
| Observations | 641 | 652 | 652 | 626 | 637 | 637 | 626 |
| Adjusted R2 | 0.917 | 0.923 | 0.911 | 0.935 | 0.947 | 0.934 | 0.949 |

Interpretation: over 2013--2023, governance is negatively associated with
spreads in the combined controlled specification. Debt/GDP remains positive and
statistically significant.

## 5. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt het. No controls | Debt het. Controls | Climate het. No controls | Climate het. Controls | Full interaction No controls | Full interaction Controls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| G_it | -0.108*** | -0.026 | 0.132 | 0.154 | 0.291* | 0.219* |
| t-stat. | (-2.586) | (-0.563) | (0.731) | (1.080) | (1.788) | (1.673) |
| B_it | 0.212*** | 0.205*** | 0.059*** | 0.070*** | 0.211*** | 0.202*** |
| t-stat. | (6.048) | (6.374) | (4.927) | (5.674) | (6.487) | (6.606) |
| X_it | 0.134 | 0.058 | 0.562* | 0.469* | 0.657** | 0.374* |
| t-stat. | (1.452) | (0.682) | (1.804) | (1.866) | (2.420) | (1.781) |
| G_it x B_it | -0.002*** | -0.002*** |  |  | -0.002*** | -0.002*** |
| t-stat. | (-5.482) | (-5.277) |  |  | (-5.857) | (-5.389) |
| G_it x X_it |  |  | -0.010* | -0.009** | -0.011** | -0.006* |
| t-stat. |  |  | (-1.879) | (-2.046) | (-2.431) | (-1.846) |
| Controls | No | Yes | No | Yes | No | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes |
| Countries | 61 | 59 | 61 | 59 | 61 | 59 |
| Observations | 641 | 626 | 641 | 626 | 641 | 626 |
| Adjusted R2 | 0.939 | 0.954 | 0.930 | 0.949 | 0.940 | 0.955 |

The controlled debt interaction remains negative and significant. In the
2013--2023 sample, the controlled climate-risk interaction is also negative and
statistically significant in the climate heterogeneity specification, and weakly
significant in the controlled full-interaction model.

## 6. Full-Interaction Empirical Theta

The controlled full-interaction spread model produces:

| Variable | Full interaction Controls |
| --- | ---: |
| G_it | 0.219* |
| t-stat. | (1.673) |
| B_it | 0.202*** |
| t-stat. | (6.606) |
| X_it | 0.374* |
| t-stat. | (1.781) |
| G_it x B_it | -0.002*** |
| t-stat. | (-5.389) |
| G_it x X_it | -0.006* |
| t-stat. | (-1.846) |
| Controls | Yes |
| Country FE | Yes |
| Year FE | Yes |
| Countries | 59 |
| Observations | 626 |
| Adjusted R2 | 0.955 |

The saved theta panel contains 682 non-U.S. country-year rows for 2013--2023.
Full-theta is nonmissing for 626 observations in the controlled spread-model
sample.

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_F_it | 626 | 14.488 | 18.128 | 8.954 | 0.263 | 125.769 |
| Marginal spread relief, -d s / d G | 626 | 0.174 | 0.092 | 0.163 | 0.012 | 0.550 |
| Marginal spread response, d s / d G | 626 | -0.174 | 0.092 | -0.163 | -0.550 | -0.012 |

### 6.1 Full-Theta Region Diagnostics

| Theta region | N | Mean B_it | Mean G_it | Mean spread | Mean Delta B_next |
| --- | ---: | ---: | ---: | ---: | ---: |
| theta_F_it < 0 | 0 |  |  |  |  |
| 0 <= theta_F_it < 1 | 25 | 21.410 | 54.402 | 3.874 | 1.530 |
| theta_F_it >= 1 | 601 | 68.307 | 59.957 | 2.777 | 0.624 |

## 7. Continuous Full-Theta Test for Debt-Change Dynamics

The continuous debt-change equation estimates the marginal effect:

```text
d(Delta B_next) / dG = lambda_0 + lambda_1 * theta_F_it
```

| Variable | Z controls | theta_F_it + Z | Debt only | Debt + Z | No B, No Z |
| --- | ---: | ---: | ---: | ---: | ---: |
| G_it | 0.178 | 0.028 | 0.145 | 0.160 | 0.180 |
| t-stat. | (0.661) | (0.148) | (1.003) | (0.628) | (1.101) |
| G_it x theta_F_it | -0.007*** | 0.002 | -0.005** | -0.004** | -0.007*** |
| t-stat. | (-3.676) | (0.297) | (-2.385) | (-2.077) | (-4.253) |
| theta_F_it |  | -0.589 |  |  |  |
| t-stat. |  | (-1.281) |  |  |  |
| B_it |  |  | -0.080 | -0.105 |  |
| t-stat. |  |  | (-1.001) | (-1.226) |  |
| Observations | 567 | 567 | 567 | 567 | 567 |
| Countries | 59 | 59 | 59 | 59 | 59 |
| Adjusted R2 | 0.540 | 0.552 | 0.525 | 0.545 | 0.523 |

Interpretation: the interaction between governance and Full-theta is negative
and statistically significant in the original four specifications. When
`theta_F_it` is added directly alongside the macro controls, the interaction
coefficient becomes positive and statistically insignificant; the `theta_F_it`
main effect is also not statistically significant.

### 7.1 Theta-Grouped Heterogeneity Regressions

| Variable | Bottom 50% | Top 50% | Bottom 20% | Top 20% |
| --- | ---: | ---: | ---: | ---: |
| G_it | -0.142 | -0.248 | 0.154 | 1.040 |
| t-stat. | (-0.709) | (-0.570) | (0.499) | (1.208) |
| Observations | 284 | 283 | 114 | 113 |
| Countries | 38 | 43 | 18 | 19 |
| Adjusted R2 | 0.589 | 0.523 | 0.598 | 0.617 |

Cutoffs:

| Split | Cutoff |
| --- | ---: |
| 50/50 split median | 8.877 |
| Bottom 20% cutoff | 4.067 |
| Top 20% cutoff | 19.991 |

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
| G_it | 0.178 |
| t-stat. | (0.661) |
| G_it x theta_plus_it | -0.007*** |
| t-stat. | (-3.676) |
| Observations | 567 |
| Countries | 59 |
| Adjusted R2 | 0.540 |

The censored-theta result is the same in this sample because the estimated
Full-theta values are all nonnegative.

## 8. Full-Theta RSS Cutoff for Debt-Change Dynamics

| Item | Value |
| --- | ---: |
| Candidate empirical cutoffs retained | 567 |
| RSS cutoff c_hat | 40.878 |
| Empirical percentile of c_hat | 94.36 |
| RSS at c_hat | 9,652.263 |
| Low-theta observations | 535 |
| High-theta observations | 32 |

| Variable | Debt-change regression |
| --- | ---: |
| G_it x 1(theta_F_it < c_hat) | -0.179 |
| t-stat. | (-0.871) |
| G_it x 1(theta_F_it >= c_hat) | -0.795** |
| t-stat. | (-2.138) |
| lambda_L - lambda_H | 0.616** |
| t-stat. | (2.039) |
| Observations | 567 |
| Countries | 59 |
| Adjusted R2 | 0.522 |

Interpretation: at the RSS-selected cutoff, the high-theta governance slope is
negative and statistically significant. The equality test rejects
`lambda_L = lambda_H` at the 5 percent level.

### 8.1 Marginal-Effect Cutoff

The marginal-effect cutoff is:

```text
c_ME = lambda_0 / (-lambda_1)
```

Using the `Z controls` continuous model, `lambda_0 = 0.177560` and
`lambda_1 = -0.007292`, so `c_ME = 24.350`.

| Item | Value |
| --- | ---: |
| Marginal-effect cutoff c_ME | 24.350 |
| Empirical percentile of c_ME | 87.13 |
| RSS at c_ME | 10,348.416 |
| Low-theta observations | 494 |
| High-theta observations | 73 |

| Variable | Debt-change regression |
| --- | ---: |
| G_it x 1(theta_F_it < c_ME) | -0.047 |
| t-stat. | (-0.185) |
| G_it x 1(theta_F_it >= c_ME) | -0.103 |
| t-stat. | (-0.418) |
| lambda_L - lambda_H | 0.056** |
| t-stat. | (2.381) |
| Observations | 567 |
| Countries | 59 |
| Adjusted R2 | 0.488 |

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
| 1995--2023 | 19.374 | 0.036 | -0.029 | 1044 | 921 | 123 |
| 1996--2023 | 19.374 | 0.036 | -0.029 | 1044 | 921 | 123 |
| 1997--2023 | 19.374 | 0.036 | -0.029 | 1044 | 921 | 123 |
| 1998--2023 | 19.374 | 0.036 | -0.029 | 1044 | 921 | 123 |
| 1999--2023 | 19.374 | 0.036 | -0.029 | 1043 | 920 | 123 |
| 2000--2023 | 19.374 | 0.036 | -0.029 | 1043 | 920 | 123 |
| 2001--2023 | 18.637 | 0.054 | -0.012 | 1019 | 894 | 125 |
| 2002--2023 | 18.637 | 0.054 | -0.012 | 1019 | 894 | 125 |
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

Restricting the sample to 2013--2023 leaves the main spread regressions with
higher adjusted R2 and smaller debt-change samples. The continuous Full-theta
interaction remains negative and statistically significant. In the RSS cutoff
experiment, only the high-theta governance slope is individually significant.
The start-year window scan shows that 15 of the 23 fixed-end windows satisfy
the positive low-theta and negative high-theta slope sign pattern. For
theta-grouped heterogeneity, 10 windows satisfy the bottom-positive/top-negative
pattern under the 20/20 split and 4 windows satisfy it under the 50/50 split,
but none of those matching-window coefficients is significant at the 10 percent
level.
