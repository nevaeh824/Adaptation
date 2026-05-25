# Paper B Updated Empirical Results, 1995--2023

## 1. Execution

This report summarizes the trimmed output from `paperB_updated_1995_2023_tables.do`
after redefining the empirical `G` variable:

- $$G_{it}$$ is now `readiness100`.
- $$X_{it}$$ remains `vulnerability100`.
- $$B_{it}$$ remains debt/GDP.

Latest verified run:

- Run date: 2026-05-26 00:05:39.
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
- Combined debt-change dynamics table for the former Section 6.2, Section 6.3,
  and Section 7 specifications.
- Theta-grouped Full-theta debt-change heterogeneity regressions.
- Censored-theta debt-change robustness check.
- Full-theta RSS cutoff experiment for the debt-change equation.
- Full-theta marginal-effect cutoff diagnostics.
- Marginal-effect cutoff subsample diagnostics.

Under the `readiness100` specification, the marginal-effect cutoff falls below
the usable theta support, leaving one theta group empty. The do-file therefore
writes diagnostic outputs for that cutoff and skips the regime-split cutoff
regressions instead of carrying forward stale estimates.

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
result/table6_2_debt_level_dynamics_regression.csv
result/table6_2_debt_level_dynamics_regression.dta
result/table6_2_6_3_7_debt_change_regressions.csv
result/table6_2_6_3_7_debt_change_regressions.tex
result/table7_0_baseline_debt_change_regression.csv
result/table7_0_baseline_debt_change_regression.dta
result/table7_continuous_theta_debt_regression.csv
result/table7_continuous_theta_debt_regression.dta
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
result/table7_deltaB_marginal_cutoff_subsample.csv
result/table7_deltaB_marginal_cutoff_subsample.dta
result/table7_deltaB_marginal_cutoff_subsample.tex
result/theta_full_empirical_panel.csv
result/theta_full_empirical_panel.dta
```

## 3. Table 1: Descriptive Statistics

The descriptive sample is restricted to non-U.S. country-years in 1995--2023
with nonmissing sovereign spread, readiness, vulnerability, and debt/GDP.

| Variable | N | Mean | SD | Median |
| --- | ---: | ---: | ---: | ---: |
| Sovereign spread, $$s^g_{it}$$ | 1,267 | 2.333 | 4.321 | 0.721 |
| 10-year sovereign yield | 1,267 | 5.530 | 4.280 | 4.572 |
| $$G_{it}$$ | 1,267 | 53.691 | 13.974 | 53.244 |
| $$X_{it}$$ | 1,267 | 36.320 | 7.110 | 34.566 |
| $$B_{it}$$ | 1,267 | 61.674 | 34.848 | 54.569 |
| Real GDP | 1,267 | 8.045 | 2.813 | 7.594 |
| Real GDP growth | 1,267 | 3.013 | 3.502 | 3.065 |
| CPI inflation | 1,266 | 3.778 | 4.548 | 2.567 |
| Overall balance/GDP | 1,241 | -0.578 | 3.495 | -0.560 |
| International reserves | 1,264 | 6.311 | 14.279 | 2.686 |
| Government effectiveness | 1,185 | 0.819 | 0.865 | 0.917 |
| Regulatory quality | 1,185 | 0.792 | 0.817 | 0.952 |
| Terms of trade | 1,177 | 100.939 | 12.457 | 99.700 |

## 4. Table 2: Baseline Fixed Effects

| Variable | G only | B only | X only | G + controls | B + controls | X + controls | G+B+X + controls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| $$G_{it}$$ | -0.048** |  |  | -0.032* |  |  | -0.055*** |
| t-stat. | (-2.412) |  |  | (-1.790) |  |  | (-3.209) |
| $$B_{it}$$ |  | 0.041*** |  |  | 0.043*** |  | 0.045*** |
| t-stat. |  | (7.100) |  |  | (6.286) |  | (6.480) |
| $$X_{it}$$ |  |  | -0.043 |  |  | -0.153** | 0.005 |
| t-stat. |  |  | (-0.645) |  |  | (-2.079) | (0.073) |
| Controls | No | No | No | Yes | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Countries | 62 | 62 | 62 | 60 | 60 | 60 | 60 |
| Observations | 1,272 | 1,267 | 1,272 | 1,120 | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.847 | 0.862 | 0.846 | 0.888 | 0.900 | 0.888 | 0.901 |

Readiness is negatively associated with sovereign spreads in the controlled
baseline specifications. Debt/GDP remains a stable positive spread predictor.

## 5. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity No controls | Debt heterogeneity Controls | Climate-risk heterogeneity No controls | Climate-risk heterogeneity Controls | Full interaction No controls | Full interaction Controls |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| $$G_{it}$$ | 0.054** | 0.069*** | -0.024 | -0.062 | 0.102 | 0.063 |
| t-stat. | (2.200) | (3.233) | (-0.315) | (-0.803) | (1.381) | (0.815) |
| $$B_{it}$$ | 0.169*** | 0.196*** | 0.041*** | 0.045*** | 0.169*** | 0.196*** |
| t-stat. | (6.956) | (8.760) | (7.165) | (6.469) | (6.946) | (8.749) |
| $$X_{it}$$ | 0.049 | 0.074 | -0.006 | -0.002 | 0.101 | 0.068 |
| t-stat. | (0.730) | (1.067) | (-0.050) | (-0.018) | (0.847) | (0.560) |
| $$G_{it}\times B_{it}$$ | -0.002*** | -0.003*** |  |  | -0.002*** | -0.003*** |
| t-stat. | (-5.986) | (-7.734) |  |  | (-5.989) | (-7.734) |
| $$G_{it}\times X_{it}$$ |  |  | -0.001 | 0.000 | -0.001 | 0.000 |
| t-stat. |  |  | (-0.554) | (0.091) | (-0.650) | (0.074) |
| Controls | No | Yes | No | Yes | No | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes |
| Countries | 62 | 60 | 62 | 60 | 62 | 60 |
| Observations | 1,267 | 1,120 | 1,267 | 1,120 | 1,267 | 1,120 |
| Adjusted $$R^2$$ | 0.877 | 0.914 | 0.863 | 0.900 | 0.877 | 0.914 |

The controlled debt interaction remains negative and significant
(`G_it x B_it = -0.003***`). The climate-risk interaction is essentially zero
in the controlled full-interaction model.

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
| G_it | 0.063 |
| t-stat. | (0.815) |
| B_it | 0.196*** |
| t-stat. | (8.749) |
| X_it | 0.068 |
| t-stat. | (0.560) |
| G_it x B_it | -0.003*** |
| t-stat. | (-7.734) |
| G_it x X_it | 0.000 |
| t-stat. | (0.074) |
| Controls | Yes |
| Country FE | Yes |
| Year FE | Yes |
| Countries | 60 |
| Observations | 1,120 |
| Adjusted R2 | 0.914 |

The saved panel contains 1,798 non-U.S. country-year rows for 1995--2023. The
full-interaction theta is nonmissing for the 1,120 observations in the
controlled full-interaction spread-model estimation sample, covering 60
countries.

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_F_it | 1,120 | 9.493 | 16.254 | 4.003 | -0.440 | 129.077 |
| Marginal spread relief, -d s / d G | 1,120 | 0.100 | 0.097 | 0.077 | -0.057 | 0.564 |
| Marginal spread response, d s / d G | 1,120 | -0.100 | 0.097 | -0.077 | -0.564 | 0.057 |

### 6.1 Full-Theta Region Diagnostics

The region diagnostics group observations into three theta regions:

```text
theta_F_it < 0
0 <= theta_F_it < 1
theta_F_it >= 1
```

For each region, the table reports average debt/GDP, readiness, sovereign
spread, and next-period debt change.

| Theta region | N | Mean B_it | Mean G_it | Mean spread | Mean Delta B_next |
| --- | ---: | ---: | ---: | ---: | ---: |
| theta_F_it < 0 | 92 | 16.172 | 50.579 | 4.667 | 1.561 |
| 0 <= theta_F_it < 1 | 129 | 30.001 | 50.832 | 3.607 | 1.673 |
| theta_F_it >= 1 | 899 | 69.680 | 53.467 | 2.238 | 0.919 |

The region counts use observations with nonmissing `theta_F_it` in the
controlled full-interaction spread-model sample. The mean of
`Delta B_next = B_{i,t+1} - B_it` omits observations without next-period
debt/GDP.

### 6.2 Combined Debt-Change Dynamics Regressions

The do-file now combines the former Section 6.2, Section 6.3, and Section 7
debt-change specifications into one table. The three columns are:

```text
Baseline:
B_{i,t+1} - B_it = alpha_i + tau_t
                 + lambda_0 * G_it
                 + Gamma'Z_it + error

Continuous Full-theta:
B_{i,t+1} - B_it = alpha_i + tau_t
                 + lambda_0 * G_it
                 + lambda_1 * (G_it * theta_F_it)
                 + Gamma'Z_it + error

Full-theta dynamics:
B_{i,t+1} - B_it = alpha_i + tau_t
                 + lambda_0 * G_it
                 + lambda_1 * (G_it * theta_F_it)
                 + lambda_2 * theta_F_it
                 + Gamma'Z_it + error
```

The continuous Full-theta column keeps only the `Z controls` specification.
The former `Debt only`, `Debt + Z`, and `No B, No Z` columns are no longer
estimated or reported.

| Variable | Baseline | Continuous Full-theta | Full-theta dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.103*** | -0.073* | -0.083* |
| t-stat. | (-2.614) | (-1.843) | (-1.959) |
| G_it x theta_F_it |  | -0.003*** | 0.001 |
| t-stat. |  | (-3.772) | (0.136) |
| theta_F_it |  |  | -0.209 |
| t-stat. |  |  | (-0.605) |
| Real GDP | 8.171*** | 3.989*** | 3.746** |
| t-stat. | (5.412) | (2.636) | (2.272) |
| Real GDP growth | -0.326*** | -0.344*** | -0.365*** |
| t-stat. | (-3.610) | (-3.895) | (-3.775) |
| CPI inflation | -0.166** | -0.172** | -0.173** |
| t-stat. | (-1.976) | (-2.052) | (-2.103) |
| Overall balance/GDP | -0.468*** | -0.470*** | -0.456*** |
| t-stat. | (-5.849) | (-5.743) | (-5.396) |
| International reserves | 0.020 | 0.010 | 0.010 |
| t-stat. | (1.465) | (0.773) | (0.737) |
| Government effectiveness | -1.913** | -0.868 | -0.766 |
| t-stat. | (-2.020) | (-0.894) | (-0.757) |
| Regulatory quality | 1.921** | 0.481 | 0.118 |
| t-stat. | (2.155) | (0.524) | (0.107) |
| Terms of trade | 0.044*** | 0.035** | 0.037** |
| t-stat. | (2.774) | (2.382) | (2.544) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p-value: lambda_0 = 0 | 0.009 | 0.066 | 0.050 |
| p-value: lambda_1 = 0 |  | 0.000 | 0.892 |
| p-value: lambda_2 = 0 |  |  | 0.545 |
| Observations | 1,060 | 1,060 | 1,060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.425 | 0.445 | 0.446 |

Interpretation: baseline readiness is negative and statistically significant at
the 1 percent level. In the Full-theta dynamics specification, readiness is
negative and marginally significant, while the readiness-theta interaction and
theta main effect are not statistically significant. In the continuous
Full-theta specification with Z controls, the readiness-theta interaction is
negative and statistically significant.

The combined table output files are:

```text
result/table6_2_6_3_7_debt_change_regressions.csv
result/table6_2_6_3_7_debt_change_regressions.tex
```

The single-specification CSV/DTA files for the three component regressions are
retained for auditability and for downstream cutoff calculations.

## 7. Additional Full-Theta Debt-Change Diagnostics

### 7.1 Theta-Grouped Heterogeneity Regressions

This diagnostic splits the continuous Full-theta estimation sample by empirical
theta size and runs subsample regressions of next-period debt change on current
readiness and the control vector.

| Variable | Bottom 50% | Top 50% | Bottom 80% | Top 20% |
| --- | ---: | ---: | ---: | ---: |
| G_it | -0.062 | -0.072 | -0.064* | -0.604** |
| t-stat. | (-1.442) | (-0.908) | (-1.738) | (-2.443) |
| Real GDP | 6.252*** | 9.786*** | 5.995*** | 11.642** |
| t-stat. | (3.658) | (3.190) | (4.365) | (2.140) |
| Real GDP growth | -0.286*** | -0.314* | -0.346*** | -0.652 |
| t-stat. | (-4.016) | (-1.779) | (-4.845) | (-1.605) |
| CPI inflation | 0.006 | -0.497*** | -0.020 | -0.734*** |
| t-stat. | (0.203) | (-3.751) | (-0.516) | (-3.280) |
| Overall balance/GDP | -0.376*** | -0.570*** | -0.462*** | -0.889*** |
| t-stat. | (-3.260) | (-5.220) | (-5.096) | (-5.402) |
| International reserves | 0.006 | 0.035 | 0.018 | -0.174 |
| t-stat. | (0.495) | (0.266) | (1.509) | (-0.685) |
| Government effectiveness | -1.559* | -2.027 | -0.840 | -3.152 |
| t-stat. | (-1.693) | (-1.093) | (-0.881) | (-0.946) |
| Regulatory quality | 1.551* | 0.504 | 1.039 | -1.470 |
| t-stat. | (1.702) | (0.301) | (1.281) | (-0.369) |
| Terms of trade | 0.040*** | 0.089 | 0.048*** | 0.106 |
| t-stat. | (2.876) | (1.535) | (3.157) | (1.199) |
| Controls | Yes | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes |
| Observations | 530 | 530 | 848 | 212 |
| Countries | 40 | 47 | 56 | 22 |
| Adjusted R2 | 0.489 | 0.466 | 0.455 | 0.629 |

Cutoffs:

| Split | Cutoff |
| --- | ---: |
| 50/50 split median | 3.876 |
| Bottom 80% / Top 20% cutoff | 13.084 |

Interpretation: the Bottom 80% readiness coefficient is negative and marginally
significant at the 10 percent level, while the Top 20% coefficient is more
negative and significant at the 5 percent level. The Bottom 50% and Top 50%
coefficients are not statistically significant.

### 7.2 Censored Full-Theta Robustness Check

The robustness check imposes the theoretical monotonicity restriction that
readiness should weakly reduce sovereign spreads:

```text
theta_plus_it = max(theta_F_it, 0)
```

The debt-change regression then uses `G_it x theta_plus_it`.

| Variable | Debt-change regression |
| --- | ---: |
| G_it | -0.073* |
| t-stat. | (-1.840) |
| G_it x theta_plus_it | -0.003*** |
| t-stat. | (-3.767) |
| Real GDP | 4.001*** |
| t-stat. | (2.645) |
| Real GDP growth | -0.344*** |
| t-stat. | (-3.892) |
| CPI inflation | -0.172** |
| t-stat. | (-2.053) |
| Overall balance/GDP | -0.470*** |
| t-stat. | (-5.742) |
| International reserves | 0.010 |
| t-stat. | (0.782) |
| Government effectiveness | -0.872 |
| t-stat. | (-0.898) |
| Regulatory quality | 0.479 |
| t-stat. | (0.522) |
| Terms of trade | 0.035** |
| t-stat. | (2.382) |

Additional statistics:

| Item | Value |
| --- | ---: |
| p(lambda_0) | 0.066 |
| p(lambda_1) | 0.000 |
| Observations | 1,060 |
| Countries | 60 |
| Adjusted R2 | 0.445 |

Interpretation: censoring negative theta values does not materially change the
continuous debt-change result. The interaction between current readiness and
censored Full theta remains negative and statistically significant.

## 8. Full-Theta RSS Cutoff for Debt-Change Dynamics

This experiment uses the Full-interaction theta index from Section 6. For each
empirical cutoff `c`, the RSS search estimates:

```text
B_{i,t+1} - B_it = alpha_i + tau_t
                 + lambda_L * G_it * 1(theta_F_it < c)
                 + lambda_H * G_it * 1(theta_F_it >= c)
                 + Gamma'Z_it
                 + error
```

The cutoff is selected by minimizing RSS over empirical values of `theta_F_it`
that leave nonempty low- and high-theta groups. The RSS search and the final
reported regression both include the same common control vector, country fixed
effects, and year fixed effects.

| Item | Value |
| --- | ---: |
| Candidate empirical cutoffs retained | 1,060 |
| RSS cutoff c_hat | 21.182 |
| Empirical percentile of c_hat | 88.68 |
| RSS at c_hat | 19,175.576 |
| Low-theta observations | 940 |
| High-theta observations | 120 |

The coefficient table follows the Table 3 coefficient/t-statistic layout.

| Variable | Debt-change regression |
| --- | ---: |
| G_it x 1(theta_F_it < c_hat) | -0.077* |
| t-stat. | (-1.945) |
| G_it x 1(theta_F_it >= c_hat) | -0.159*** |
| t-stat. | (-3.818) |
| Real GDP | 6.561*** |
| t-stat. | (4.257) |
| Real GDP growth | -0.329*** |
| t-stat. | (-3.699) |
| CPI inflation | -0.152** |
| t-stat. | (-1.966) |
| Overall balance/GDP | -0.501*** |
| t-stat. | (-6.230) |
| International reserves | 0.020 |
| t-stat. | (1.510) |
| Government effectiveness | -1.292 |
| t-stat. | (-1.312) |
| Regulatory quality | 0.797 |
| t-stat. | (0.891) |
| Terms of trade | 0.041*** |
| t-stat. | (2.662) |
| lambda_L - lambda_H | 0.082*** |
| t-stat. | (3.670) |

Additional statistics:

| Item | Value |
| --- | ---: |
| p_L at RSS cutoff | 0.052 |
| p_H at RSS cutoff | 0.000 |
| p-value for lambda_L = lambda_H | 0.000 |
| Observations | 1,060 |
| Countries | 60 |
| Adjusted R2 | 0.445 |

Interpretation: under the common-control RSS specification, both
regime-specific readiness slopes are negative at the selected cutoff, with the
high-theta slope more negative in magnitude. The equality test rejects
`lambda_L = lambda_H`.

### 8.1 Marginal-Effect Cutoff Diagnostics

This cutoff comes from the continuous Full-theta column in Section 6.2. The
marginal effect of current readiness on next-period debt change is:

```text
d(Delta B_next) / dG = lambda_0 + lambda_1 * theta_F_it
```

Setting this marginal effect equal to zero gives:

```text
c_ME = lambda_0 / (-lambda_1)
```

Using the `Z controls` continuous model, `lambda_0 = -0.073274` and
`lambda_1 = -0.002705`, so the implied marginal-effect cutoff is `-27.093`.

| Item | Value |
| --- | ---: |
| Marginal-effect cutoff c_ME | -27.093 |
| lambda_0 from continuous model | -0.073274 |
| lambda_1 from continuous model | -0.002705 |
| Empirical percentile of c_ME | 0.00 |
| Grid observations | 1,060 |
| Low-theta observations | 0 |
| High-theta observations | 1,060 |
| Regression status | Not estimated |

Interpretation: the marginal-effect cutoff falls below the usable theta support
under the `readiness100` specification. Because the split leaves the low-theta
group empty, the regime-split marginal-effect cutoff regression and its
subsample regressions are not estimated.

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
result/table7_deltaB_marginal_cutoff_subsample.csv
result/table7_deltaB_marginal_cutoff_subsample.dta
result/table7_deltaB_marginal_cutoff_subsample.tex
```

The `table7_deltaB_*` filenames correspond directly to the debt-change equation
shown above.

## 9. Summary

The updated code and report retain Table 1, Table 2, Table 3, the Section 6
theta tables, the Section 6.1 region diagnostics, the combined debt-change
dynamics table, the Full-interaction empirical theta construction, the
censored-theta robustness check, the theta-grouped debt-change heterogeneity
regressions, and the Full-theta debt-change RSS cutoff experiment.

The main specification change is that `G_it` now uses `readiness100` instead of
`governance100`. With this change, the baseline debt-change readiness
coefficient is negative and statistically significant. The continuous
Full-theta interaction is negative and statistically significant in the
Z-controls specification; debt-control variants are no longer reported. The
marginal-effect cutoff is not an admissible sample split because it leaves one
theta group empty. In the Full-theta dynamics column, `G_it` is negative and
marginally significant, while `G_it x theta_F_it` and `theta_F_it` are not
statistically significant. The RSS cutoff experiment now selects the cutoff and
estimates the final regime-slope regression using the common control vector,
country fixed effects, and year fixed effects.
