# Paper B Updated Empirical Results, 1995--2023

## 1. Execution

This report summarizes the trimmed output from `paperB_updated_1995_2023_tables.do`
after redefining the empirical governance variable:

- $$G_{it}$$ is now `governance100`.
- $$X_{it}$$ remains `vulnerability100`.
- $$B_{it}$$ remains debt/GDP.

Latest verified run:

- Run date: 2026-05-24 19:24:35.
- Output directory: `result/`.
- Log file: `result/paperB_updated_1995_2023_tables.log`.
- Stata batch run completed with `ExitCode=0`.
- The run log contains no `r(...)` runtime errors.
- All reported regressions use heteroskedasticity-robust standard errors.

Current workflow:

- Table 1: descriptive statistics.
- Table 2: baseline fixed-effects spread regressions.
- Table 3: debt and climate-risk heterogeneity.
- Full-interaction empirical theta construction.
- Full-theta region diagnostics.
- Continuous Full-theta debt-change regression.
- Theta-grouped Full-theta debt-change heterogeneity regressions.
- Censored-theta debt-change robustness check.
- Full-theta RSS cutoff experiment for the debt-change equation.
- Full-theta marginal-effect cutoff experiment for the debt-change equation.

The workflow stops after writing the Table 1--3 outputs, the Section 6 theta
tables, the Section 6.1 region diagnostics, the Full-interaction empirical theta
panel, the continuous Full-theta debt-change regression, the censored-theta
debt-change robustness check, the theta-grouped heterogeneity regressions, the
debt-change RSS cutoff experiment, and the marginal-effect cutoff experiment.

## 2. Current Outputs

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
result/theta_full_empirical_panel.csv
result/theta_full_empirical_panel.dta
```

## 3. Table 1: Descriptive Statistics

The descriptive sample is restricted to non-U.S. country-years in 1995--2023
with nonmissing sovereign spread, governance, vulnerability, and debt/GDP.

| Variable | N | Mean | SD | Median |
| --- | ---: | ---: | ---: | ---: |
| Sovereign spread, $$s^g_{it}$$ | 1,250 | 2.320 | 4.345 | 0.708 |
| 10-year sovereign yield | 1,250 | 5.525 | 4.302 | 4.558 |
| $$G_{it}$$ | 1,250 | 63.759 | 18.076 | 66.127 |
| $$X_{it}$$ | 1,250 | 36.245 | 7.129 | 34.450 |
| $$B_{it}$$ | 1,250 | 62.015 | 34.933 | 55.327 |
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
| $$G_{it}$$ | -0.162*** |  |  | -0.084* |  |  | -0.097** |
| t-stat. | (-6.055) |  |  | (-1.898) |  |  | (-2.373) |
| $$B_{it}$$ |  | 0.041*** |  |  | 0.043*** |  | 0.043*** |
| t-stat. |  | (7.100) |  |  | (6.286) |  | (6.316) |
| $$X_{it}$$ |  |  | -0.043 |  |  | -0.153** | -0.030 |
| t-stat. |  |  | (-0.645) |  |  | (-2.079) | (-0.417) |
| Controls | No | No | No | Yes | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Countries | 61 | 62 | 62 | 59 | 60 | 60 | 59 |
| Observations | 1,255 | 1,267 | 1,272 | 1,103 | 1,120 | 1,120 | 1,103 |
| Adjusted $$R^2$$ | 0.855 | 0.862 | 0.846 | 0.889 | 0.900 | 0.888 | 0.901 |

The governance proxy is negatively associated with sovereign spreads in the
controlled specifications. Debt/GDP remains the most stable positive spread
predictor.

## 5. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity No controls | Debt heterogeneity Controls | Climate-risk heterogeneity No controls | Climate-risk heterogeneity Controls | Full interaction No controls | Full interaction Controls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| $$G_{it}$$ | 0.005 | 0.016 | 0.010 | -0.081 | 0.203** | 0.042 |
| t-stat. | (0.186) | (0.467) | (0.101) | (-0.797) | (2.149) | (0.438) |
| $$B_{it}$$ | 0.161*** | 0.179*** | 0.035*** | 0.043*** | 0.163*** | 0.179*** |
| t-stat. | (6.811) | (8.012) | (6.692) | (6.352) | (6.963) | (8.025) |
| $$X_{it}$$ | -0.070 | 0.023 | 0.030 | -0.009 | 0.207 | 0.056 |
| t-stat. | (-1.029) | (0.324) | (0.187) | (-0.057) | (1.305) | (0.378) |
| $$G_{it}\times B_{it}$$ | -0.002*** | -0.002*** |  |  | -0.002*** | -0.002*** |
| t-stat. | (-6.128) | (-7.076) |  |  | (-6.287) | (-7.084) |
| $$G_{it}\times X_{it}$$ |  |  | -0.004 | -0.000 | -0.005** | -0.001 |
| t-stat. |  |  | (-1.495) | (-0.170) | (-2.267) | (-0.298) |
| Controls | No | Yes | No | Yes | No | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes |
| Countries | 61 | 59 | 61 | 59 | 61 | 59 |
| Observations | 1,250 | 1,103 | 1,250 | 1,103 | 1,250 | 1,103 |
| Adjusted $$R^2$$ | 0.880 | 0.913 | 0.867 | 0.901 | 0.880 | 0.913 |

The controlled debt interaction remains negative and significant
(`G_it x B_it = -0.002***`). The climate-risk interaction is negative but not
statistically significant in the controlled full-interaction model.

## 6. Full-Interaction Empirical Theta

The retained theta code estimates the controlled full-interaction spread model:

```text
s_it = alpha_i + tau_t
     + beta_G  * G_it
     + beta_B  * B_it
     + beta_X  * X_it
     + beta_GB * G_it * B_it
     + beta_GX * G_it * X_it
     + Gamma'Z_it + u_it
```

The empirical theta index is:

```text
theta_F_it = B_it * -(beta_G + beta_GB * B_it + beta_GX * X_it)
```

The coefficient table for the controlled full-interaction spread model follows
the same coefficient/t-statistic layout as Table 3.

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

The saved panel contains 1,798 non-U.S. country-year rows for 1995--2023. The
full-interaction theta is nonmissing for the 1,103 observations in the
controlled full-interaction spread-model estimation sample, covering 59
countries.

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_F_it | 1,103 | 9.481 | 13.666 | 5.053 | -0.039 | 107.253 |
| Marginal spread relief, -d s / d G | 1,103 | 0.112 | 0.075 | 0.096 | -0.010 | 0.469 |
| Marginal spread response, d s / d G | 1,103 | -0.112 | 0.075 | -0.096 | -0.469 | 0.010 |

The theta output files are:

```text
result/table6_fullinteraction_theta_regression.tex
result/table6_theta_descriptive_stats.csv
result/table6_theta_descriptive_stats.dta
result/table6_theta_descriptive_stats.tex
result/theta_full_empirical_panel.csv
result/theta_full_empirical_panel.dta
```

### 6.1 Full-Theta Region Diagnostics

The region diagnostics group observations into three theta regions:

```text
theta_F_it < 0
0 <= theta_F_it < 1
theta_F_it >= 1
```

For each region, the table reports average debt/GDP, governance, sovereign
spread, and next-period debt change.

| Theta region | N | Mean B_it | Mean G_it | Mean spread | Mean Delta B_next |
| --- | ---: | ---: | ---: | ---: | ---: |
| theta_F_it < 0 | 6 | 6.458 | 60.337 | 2.653 | 1.519 |
| 0 <= theta_F_it < 1 | 96 | 18.194 | 55.523 | 4.014 | 1.317 |
| theta_F_it >= 1 | 1,001 | 65.528 | 62.374 | 2.448 | 1.010 |

The region counts use observations with nonmissing `theta_F_it` in the
controlled full-interaction spread-model sample. The mean of
`Delta B_next = B_{i,t+1} - B_it` omits observations without next-period
debt/GDP.

The region diagnostic output files are:

```text
result/table6_1_theta_region_stats.csv
result/table6_1_theta_region_stats.dta
result/table6_1_theta_region_stats.tex
```

## 7. Continuous Full-Theta Test for Debt-Change Dynamics

Before imposing a discrete theta cutoff, the code estimates:

```text
B_{i,t+1} - B_it = alpha_i + tau_t
                 + lambda_0 * G_it
                 + lambda_1 * (G_it * theta_F_it)
                 + Gamma'Z_it + error
```

The table reports four specifications: the original `Z controls` column, a
`Debt only` column, a `Debt + Z` column, and a `No B, No Z` column.

| Variable | Z controls | Debt only | Debt + Z | No B, No Z |
| --- | ---: | ---: | ---: | ---: |
| G_it | 0.047 | 0.083 | 0.038 | 0.090 |
| t-stat. | (0.378) | (1.207) | (0.317) | (1.295) |
| G_it x theta_F_it | -0.003*** | -0.003** | -0.001 | -0.003*** |
| t-stat. | (-3.949) | (-2.402) | (-1.063) | (-4.719) |
| B_it |  | -0.011 | -0.061 |  |
| t-stat. |  | (-0.296) | (-1.541) |  |
| Real GDP | 3.660** |  | 3.627** |  |
| t-stat. | (2.182) |  | (2.176) |  |
| Real GDP growth | -0.364*** |  | -0.391*** |  |
| t-stat. | (-3.977) |  | (-4.053) |  |
| CPI inflation | -0.176** |  | -0.183** |  |
| t-stat. | (-2.109) |  | (-2.225) |  |
| Overall balance/GDP | -0.479*** |  | -0.491*** |  |
| t-stat. | (-5.826) |  | (-5.887) |  |
| International reserves | 0.010 |  | 0.004 |  |
| t-stat. | (0.713) |  | (0.275) |  |
| Government effectiveness | -1.008 |  | -0.889 |  |
| t-stat. | (-0.952) |  | (-0.842) |  |
| Regulatory quality | -0.037 |  | -0.715 |  |
| t-stat. | (-0.027) |  | (-0.466) |  |
| Terms of trade | 0.037** |  | 0.037** |  |
| t-stat. | (2.444) |  | (2.526) |  |
| Debt control | No | Yes | Yes | No |
| Controls | Yes | No | Yes | No |
| Country FE | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes |
| Observations | 1,044 | 1,044 | 1,044 | 1,044 |
| Countries | 59 | 59 | 59 | 59 |
| Adjusted R2 | 0.443 | 0.364 | 0.447 | 0.364 |

Interpretation: the continuous interaction is negative and statistically
significant in the original `Z controls`, `Debt only`, and `No B, No Z`
specifications. Once both current debt and the full control vector enter
together, the interaction remains negative but is no longer statistically
significant. The level governance coefficient is positive but not statistically
significant in all four specifications.

The output files are:

```text
result/table7_continuous_theta_debt_regression.csv
result/table7_continuous_theta_debt_regression.dta
result/table7_continuous_theta_debt_regression.tex
```

### 7.1 Theta-Grouped Heterogeneity Regressions

This diagnostic splits the continuous Full-theta estimation sample by empirical
theta size and runs subsample regressions of next-period debt change on current
governance and the control vector:

```text
B_{i,t+1} - B_it = alpha_i + tau_t
                 + lambda_0 * G_it
                 + Gamma'Z_it + error
```

The first split uses the bottom 50 percent and top 50 percent of empirical
theta. The second split uses only the bottom 20 percent and top 20 percent.

| Variable | Bottom 50% | Top 50% | Bottom 20% | Top 20% |
| --- | ---: | ---: | ---: | ---: |
| G_it | 0.021 | 0.025 | 0.011 | -0.008 |
| t-stat. | (0.165) | (0.121) | (0.046) | (-0.019) |
| Real GDP | 4.813*** | 10.711*** | 8.966*** | 9.386 |
| t-stat. | (2.807) | (3.229) | (3.254) | (1.567) |
| Real GDP growth | -0.330*** | -0.347* | -0.340*** | -0.719* |
| t-stat. | (-3.990) | (-1.948) | (-3.546) | (-1.698) |
| CPI inflation | -0.001 | -0.513*** | -0.073* | -0.759*** |
| t-stat. | (-0.030) | (-3.899) | (-1.677) | (-3.275) |
| Overall balance/GDP | -0.399*** | -0.586*** | -0.299*** | -0.878*** |
| t-stat. | (-3.642) | (-5.314) | (-2.831) | (-5.083) |
| International reserves | 0.008 | 0.027 | -0.462* | -0.210 |
| t-stat. | (0.626) | (0.206) | (-1.730) | (-0.778) |
| Government effectiveness | -1.112 | -2.584 | -0.673 | -3.004 |
| t-stat. | (-0.923) | (-1.342) | (-0.312) | (-0.815) |
| Regulatory quality | 0.851 | 0.315 | 2.997 | -0.120 |
| t-stat. | (0.679) | (0.142) | (1.260) | (-0.023) |
| Terms of trade | 0.042*** | 0.095 | 0.041*** | 0.082 |
| t-stat. | (3.101) | (1.628) | (3.277) | (0.911) |
| Controls | Yes | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes |
| Observations | 522 | 522 | 209 | 208 |
| Countries | 39 | 46 | 29 | 23 |
| Adjusted R2 | 0.481 | 0.465 | 0.457 | 0.624 |

Cutoffs:

| Split | Cutoff |
| --- | ---: |
| 50/50 split median | 4.964 |
| Bottom 20% cutoff | 1.971 |
| Top 20% cutoff | 13.044 |

Interpretation: after splitting by empirical theta, the current-governance
coefficient is not statistically significant in any of the four subsamples.
The top-20-percent coefficient is negative, but its t-statistic is close to
zero.

The theta-grouped heterogeneity output files are:

```text
result/table7_theta_group_heterogeneity.csv
result/table7_theta_group_heterogeneity.dta
result/table7_theta_group_heterogeneity.tex
```

### 7.2 Censored Full-Theta Robustness Check

This diagnostic table helps distinguish whether negative-theta observations are
rare cases likely driven by estimation noise, or whether they correspond to a
systematic subset of countries or macro-financial states.

The robustness check imposes the theoretical monotonicity restriction that
governance should weakly reduce sovereign spreads:

```text
theta_plus_it = max(theta_F_it, 0)
```

The debt-change regression then uses `G_it x theta_plus_it`.

| Variable | Debt-change regression |
| --- | ---: |
| G_it | 0.047 |
| t-stat. | (0.378) |
| G_it x theta_plus_it | -0.003*** |
| t-stat. | (-3.949) |
| Real GDP | 3.659** |
| t-stat. | (2.182) |
| Real GDP growth | -0.364*** |
| t-stat. | (-3.977) |
| CPI inflation | -0.176** |
| t-stat. | (-2.109) |
| Overall balance/GDP | -0.479*** |
| t-stat. | (-5.826) |
| International reserves | 0.010 |
| t-stat. | (0.713) |
| Government effectiveness | -1.008 |
| t-stat. | (-0.951) |
| Regulatory quality | -0.037 |
| t-stat. | (-0.027) |
| Terms of trade | 0.037** |
| t-stat. | (2.444) |

Additional statistics:

| Item | Value |
| --- | ---: |
| p(lambda_0) | 0.705 |
| p(lambda_1) | 0.000 |
| Observations | 1,044 |
| Countries | 59 |
| Adjusted R2 | 0.443 |

Interpretation: censoring negative theta values does not materially change the
continuous debt-change result. The interaction between current governance and
censored Full theta remains negative and statistically significant, while the
level governance coefficient remains statistically insignificant.

The censored-theta output files are:

```text
result/table7_1_censored_theta_debt_regression.csv
result/table7_1_censored_theta_debt_regression.dta
result/table7_1_censored_theta_debt_regression.tex
```

## 8. Full-Theta RSS Cutoff for Debt-Change Dynamics

This experiment uses the Full-interaction theta index from Section 6. For each
empirical cutoff `c`, the RSS search estimates:

```text
B_{i,t+1} - B_it = alpha_i + tau_t
                 + lambda_L * G_it * 1(theta_F_it < c)
                 + lambda_H * G_it * 1(theta_F_it >= c)
                 + Gamma'Z_it + error
```

The cutoff is selected by minimizing RSS over empirical values of `theta_F_it`
that leave nonempty low- and high-theta groups. The RSS-selected cutoff is then
used in the same equation to report the regression coefficients.

| Item | Value |
| --- | ---: |
| Candidate empirical cutoffs retained | 1,044 |
| RSS cutoff c_hat | 19.374 |
| Empirical percentile of c_hat | 88.22 |
| RSS at c_hat | 19,260.021 |
| Low-theta observations | 921 |
| High-theta observations | 123 |

The coefficient table follows the Table 3 coefficient/t-statistic layout.

| Variable | Debt-change regression |
| --- | ---: |
| G_it x 1(theta_F_it < c_hat) | 0.036 |
| t-stat. | (0.288) |
| G_it x 1(theta_F_it >= c_hat) | -0.029 |
| t-stat. | (-0.241) |
| Real GDP | 6.692*** |
| t-stat. | (4.034) |
| Real GDP growth | -0.342*** |
| t-stat. | (-3.701) |
| CPI inflation | -0.159** |
| t-stat. | (-2.019) |
| Overall balance/GDP | -0.501*** |
| t-stat. | (-6.272) |
| International reserves | 0.022 |
| t-stat. | (1.607) |
| Government effectiveness | -1.590 |
| t-stat. | (-1.499) |
| Regulatory quality | 0.414 |
| t-stat. | (0.299) |
| Terms of trade | 0.042*** |
| t-stat. | (2.674) |
| lambda_L - lambda_H | 0.065*** |
| t-stat. | (3.429) |

Additional statistics:

| Item | Value |
| --- | ---: |
| p_L at RSS cutoff | 0.773 |
| p_H at RSS cutoff | 0.810 |
| p-value for lambda_L = lambda_H | 0.001 |
| Observations | 1,044 |
| Countries | 59 |
| Adjusted R2 | 0.438 |

Interpretation: under the revised debt-change specification, neither
regime-specific current-governance slope is statistically significant at the RSS
cutoff. The high-theta slope is lower than the low-theta slope, and the equality
test rejects `lambda_L = lambda_H` at conventional levels.

### 8.1 Marginal-Effect Cutoff

This cutoff comes from the continuous Full-theta equation in Section 7. The
marginal effect of current governance on next-period debt change is:

```text
d(Delta B_next) / dG = lambda_0 + lambda_1 * theta_F_it
```

Setting this marginal effect equal to zero gives the cutoff:

```text
c_ME = lambda_0 / (-lambda_1)
```

Using the `Z controls` continuous model, `lambda_0 = 0.046762` and
`lambda_1 = -0.003138`, so the implied marginal-effect cutoff is `14.903`.

| Item | Value |
| --- | ---: |
| Marginal-effect cutoff c_ME | 14.903 |
| lambda_0 from continuous model | 0.046762 |
| lambda_1 from continuous model | -0.003138 |
| Empirical percentile of c_ME | 84.29 |
| RSS at c_ME | 19,614.255 |
| Low-theta observations | 880 |
| High-theta observations | 164 |

The coefficient table follows the Table 3 coefficient/t-statistic layout.

| Variable | Debt-change regression |
| --- | ---: |
| G_it x 1(theta_F_it < c_ME) | 0.034 |
| t-stat. | (0.275) |
| G_it x 1(theta_F_it >= c_ME) | -0.006 |
| t-stat. | (-0.046) |
| Real GDP | 7.048*** |
| t-stat. | (4.257) |
| Real GDP growth | -0.350*** |
| t-stat. | (-3.817) |
| CPI inflation | -0.164** |
| t-stat. | (-2.042) |
| Overall balance/GDP | -0.488*** |
| t-stat. | (-6.095) |
| International reserves | 0.021 |
| t-stat. | (1.546) |
| Government effectiveness | -1.895* |
| t-stat. | (-1.786) |
| Regulatory quality | 0.763 |
| t-stat. | (0.549) |
| Terms of trade | 0.042*** |
| t-stat. | (2.654) |
| lambda_L - lambda_H | 0.040** |
| t-stat. | (2.272) |

Additional statistics:

| Item | Value |
| --- | ---: |
| p_L at marginal-effect cutoff | 0.784 |
| p_H at marginal-effect cutoff | 0.963 |
| p-value for lambda_L = lambda_H | 0.023 |
| Observations | 1,044 |
| Countries | 59 |
| Adjusted R2 | 0.428 |

Interpretation: the marginal-effect cutoff is below the RSS-selected cutoff and
places more observations into the high-theta group. Neither regime-specific
governance slope is individually significant, but the equality test rejects
`lambda_L = lambda_H` at the 5 percent level.

The output files are:

```text
result/table7_deltaB_rss_cutoff_grid.csv
result/table7_deltaB_rss_cutoff_grid.dta
result/table7_deltaB_rss_selected_cutoff.csv
result/table7_deltaB_rss_selected_cutoff.dta
result/table7_deltaB_rss_cutoff_regression.tex
result/table7_deltaB_marginal_cutoff_selected.csv
result/table7_deltaB_marginal_cutoff_selected.dta
result/table7_deltaB_marginal_cutoff_regression.tex
```

The `table7_deltaB_*` filenames correspond directly to the debt-change equation
shown above.

## 9. Summary

The updated code and report retain Table 1, Table 2, Table 3, the Section 6
theta tables, the Section 6.1 region diagnostics, the Full-interaction empirical
theta construction, the continuous Full-theta debt-change test, the
censored-theta robustness check, the theta-grouped debt-change heterogeneity
regressions, the Full-theta debt-change RSS cutoff experiment, and the
Full-theta marginal-effect cutoff experiment. The key specification change is
that `G_it` now uses
`governance100` instead of `readiness100`.
