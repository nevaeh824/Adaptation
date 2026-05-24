# Paper B Updated Empirical Results, 1995--2023

## 1. Execution

This report summarizes the trimmed output from `paperB_updated_1995_2023_tables.do`.

Latest verified run:

- Run date: 2026-05-24 15:53:44.
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
- Censored-theta debt-change robustness check.
- Full-theta RSS cutoff experiment for the debt-change equation.

The workflow stops after writing the Table 1--3 outputs, the Section 6 theta tables, the Section 6.1 region diagnostics, the Full-interaction empirical theta panel, the continuous Full-theta debt-change regression, the censored-theta debt-change robustness check, and the debt-change RSS cutoff experiment.

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
result/table7_1_censored_theta_debt_regression.csv
result/table7_1_censored_theta_debt_regression.dta
result/table7_1_censored_theta_debt_regression.tex
result/table7_deltaB_rss_cutoff_grid.csv
result/table7_deltaB_rss_cutoff_grid.dta
result/table7_deltaB_rss_selected_cutoff.csv
result/table7_deltaB_rss_selected_cutoff.dta
result/table7_deltaB_rss_cutoff_regression.tex
result/theta_full_empirical_panel.csv
result/theta_full_empirical_panel.dta
```

## 3. Table 1: Descriptive Statistics

The descriptive sample is restricted to non-U.S. country-years in 1995--2023 with nonmissing sovereign spread, readiness, vulnerability, and debt/GDP.

| Variable | N | Mean | SD | Median |
| --- | ---: | ---: | ---: | ---: |
| Sovereign spread, $$s^g_{it}$$ | 1,267 | 2.333 | 4.321 | 0.721 |
| 10-year sovereign yield | 1,267 | 5.530 | 4.280 | 4.572 |
| $$G_{it}$$ | 1,267 | 53.691 | 13.974 | 53.244 |
| $$X_{it}$$ | 1,267 | 36.319 | 7.110 | 34.566 |
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

The readiness proxy is negatively associated with sovereign spreads in the controlled specifications. Debt/GDP remains the most stable positive spread predictor.

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

The controlled debt interaction remains negative and significant: $$G_{it}\times B_{it}=-0.003^{***}$$. The climate-risk interaction is not statistically significant in the controlled full-interaction model.

## 6. Full-Interaction Empirical Theta

The retained theta code estimates the controlled full-interaction spread model:

$$
s^g_{it}
=\alpha_i+\tau_t+\beta_GG_{it}+\beta_BB_{it}
+\beta_X X_{it}
+\beta_{GB}G_{it}B_{it}
+\beta_{GX}G_{it}X_{it}
+\Gamma'Z_{it}+u_{it}.
$$

The empirical theta index is:

$$
\widehat{\theta}^{F}_{it}
=B_{it}\left[-\left(\widehat\beta_G+\widehat\beta_{GB}B_{it}+\widehat\beta_{GX}X_{it}\right)\right].
$$

The coefficient table for the controlled full-interaction spread model follows the same coefficient/t-statistic layout as Table 3.

| Variable | Full interaction Controls |
| --- | ---: |
| $$G_{it}$$ | 0.063 |
| t-stat. | (0.815) |
| $$B_{it}$$ | 0.196*** |
| t-stat. | (8.749) |
| $$X_{it}$$ | 0.068 |
| t-stat. | (0.560) |
| $$G_{it}\times B_{it}$$ | -0.003*** |
| t-stat. | (-7.734) |
| $$G_{it}\times X_{it}$$ | 0.000 |
| t-stat. | (0.074) |
| Controls | Yes |
| Country FE | Yes |
| Year FE | Yes |
| Countries | 60 |
| Observations | 1,120 |
| Adjusted $$R^2$$ | 0.914 |

The saved panel contains 1,798 non-U.S. country-year rows for 1995--2023. The full-interaction theta is nonmissing for the 1,120 observations in the controlled full-interaction spread-model estimation sample, covering 60 countries.

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| $$\widehat{\theta}^{F}_{it}$$ | 1,120 | 9.493 | 16.254 | 4.003 | -0.440 | 129.077 |
| Marginal spread relief, $$-\partial s^g/\partial G$$ | 1,120 | 0.100 | 0.097 | 0.077 | -0.057 | 0.564 |
| Marginal spread response, $$\partial s^g/\partial G$$ | 1,120 | -0.100 | 0.097 | -0.077 | -0.564 | 0.057 |

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

To assess whether these observations are economically meaningful or merely reflect first-stage estimation noise, we report the distribution of observations across three theta regions:

$$
N(\widehat{\theta}^{F}_{it}<0),
\qquad
N(0\leq \widehat{\theta}^{F}_{it}<1),
\qquad
N(\widehat{\theta}^{F}_{it}\geq 1).
$$

For each region, we also report the average debt-to-GDP ratio, readiness, sovereign spread, and next-period debt change:

$$
\overline{B}_{it},
\qquad
\overline{G}_{it},
\qquad
\overline{s^g}_{it},
\qquad
\overline{\Delta B}_{i,t+1}.
$$

| Theta region | N | Mean $$B_{it}$$ | Mean $$G_{it}$$ | Mean $$s^g_{it}$$ | Mean $$\Delta B_{i,t+1}$$ |
| --- | ---: | ---: | ---: | ---: | ---: |
| $$\widehat{\theta}^{F}_{it}<0$$ | 92 | 16.172 | 50.579 | 4.667 | 1.561 |
| $$0\leq\widehat{\theta}^{F}_{it}<1$$ | 129 | 30.001 | 50.832 | 3.607 | 1.673 |
| $$\widehat{\theta}^{F}_{it}\geq 1$$ | 899 | 69.680 | 53.467 | 2.238 | 0.919 |

The region counts use observations with nonmissing $$\widehat{\theta}^{F}_{it}$$ in the controlled full-interaction spread-model sample. The mean of $$\Delta B_{i,t+1}=B_{i,t+1}-B_{it}$$ omits observations without next-period debt/GDP.

The region diagnostic output files are:

```text
result/table6_1_theta_region_stats.csv
result/table6_1_theta_region_stats.dta
result/table6_1_theta_region_stats.tex
```

## 7. Continuous Full-Theta Test for Debt-Change Dynamics

Before imposing a discrete theta cutoff, the code estimates the continuous Full-theta debt-change specification:

$$
\begin{aligned}
B_{i,t+1}-B_{it}
&=\ \alpha_i+\tau_t \\
&+\lambda_0G_{it} \\
&+\lambda_1(G_{it}\times\widehat{\theta}^{F}_{it}) \\
&+\Gamma'Z_{it}+\varepsilon_{i,t+1}.
\end{aligned}
$$

The table reports four specifications: the original `Z controls` column, a `Debt only` column, a `Debt + Z` column, and a `No B, No Z` column.

| Variable | Z controls | Debt only | Debt + Z | No B, No Z |
| --- | ---: | ---: | ---: | ---: |
| $$G_{it}$$ | -0.073* | -0.125*** | -0.060 | -0.126*** |
| t-stat. | (-1.843) | (-2.967) | (-1.506) | (-2.982) |
| $$G_{it}\times\widehat{\theta}^{F}_{it}$$ | -0.003*** | -0.003** | -0.001 | -0.003*** |
| t-stat. | (-3.772) | (-2.426) | (-0.961) | (-5.004) |
| $$B_{it}$$ |  | -0.019 | -0.064* |  |
| t-stat. |  | (-0.523) | (-1.698) |  |
| Real GDP | 3.989*** |  | 3.839** |  |
| t-stat. | (2.636) |  | (2.517) |  |
| Real GDP growth | -0.344*** |  | -0.377*** |  |
| t-stat. | (-3.895) |  | (-4.045) |  |
| CPI inflation | -0.172** |  | -0.179** |  |
| t-stat. | (-2.052) |  | (-2.180) |  |
| Overall balance/GDP | -0.470*** |  | -0.488*** |  |
| t-stat. | (-5.743) |  | (-5.816) |  |
| International reserves | 0.010 |  | 0.003 |  |
| t-stat. | (0.773) |  | (0.218) |  |
| Government effectiveness | -0.868 |  | -0.686 |  |
| t-stat. | (-0.894) |  | (-0.689) |  |
| Regulatory quality | 0.481 |  | -0.289 |  |
| t-stat. | (0.524) |  | (-0.279) |  |
| Terms of trade | 0.035** |  | 0.037** |  |
| t-stat. | (2.382) |  | (2.526) |  |
| Debt control | No | Yes | Yes | No |
| Controls | Yes | No | Yes | No |
| Country FE | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes |
| Observations | 1,060 | 1,060 | 1,060 | 1,060 |
| Countries | 60 | 60 | 60 | 60 |
| Adjusted $$R^2$$ | 0.445 | 0.371 | 0.450 | 0.371 |

Interpretation: the continuous interaction is negative and statistically significant in the original `Z controls`, `Debt only`, and `No B, No Z` specifications. Once both current debt and the full control vector enter together, the interaction remains negative but is no longer statistically significant.

The output files are:

```text
result/table7_continuous_theta_debt_regression.csv
result/table7_continuous_theta_debt_regression.dta
result/table7_continuous_theta_debt_regression.tex
```

### 7.1 Censored Full-Theta Robustness Check

This diagnostic table helps distinguish whether negative-theta observations are rare cases likely driven by estimation noise, or whether they correspond to a systematic subset of countries or macro-financial states.

As an additional robustness check, we impose the theoretical monotonicity restriction that adaptation should weakly reduce sovereign spreads. Specifically, we construct a censored theta index:

$$
\widehat{\theta}^{+}_{it}
=
\max\left\{
\widehat{\theta}^{F}_{it},0
\right\}.
$$

We then re-estimate the continuous theta specification using the censored theta index:

$$
\begin{aligned}
\Delta B_{i,t+1}
=&\ \alpha_i+\tau_t \\
&+\lambda_0 G_{it} \\
&+\lambda_1
\left(
G_{it}\times \widehat{\theta}^{+}_{it}
\right) \\
&+\Gamma'Z_{it}+\varepsilon_{i,t+1}.
\end{aligned}
$$

| Variable | Debt-change regression |
| --- | ---: |
| $$G_{it}$$ | -0.073* |
| t-stat. | (-1.840) |
| $$G_{it}\times\widehat{\theta}^{+}_{it}$$ | -0.003*** |
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
| $$p_{\lambda_0}$$ | 0.066 |
| $$p_{\lambda_1}$$ | 0.000 |
| Observations | 1,060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.445 |

Interpretation: censoring negative theta values does not materially change the continuous debt-change result. The interaction between current readiness and censored Full theta remains negative and statistically significant.

The censored-theta output files are:

```text
result/table7_1_censored_theta_debt_regression.csv
result/table7_1_censored_theta_debt_regression.dta
result/table7_1_censored_theta_debt_regression.tex
```

## 8. Full-Theta RSS Cutoff for Debt-Change Dynamics

This experiment uses the Full-interaction theta index from Section 6. For each empirical cutoff $$c$$, the RSS search estimates:

$$
\begin{aligned}
B_{i,t+1}-B_{it}
=&\ \alpha_i+\tau_t \\
&+\lambda_L (G_{it})\mathbf{1}\{\widehat{\theta}^{F}_{it}<c\} \\
&+\lambda_H (G_{it})\mathbf{1}\{\widehat{\theta}^{F}_{it}\geq c\}
&+\Gamma'Z_{it}+\varepsilon_{i,t+1}.
\end{aligned}
$$

The cutoff is selected by minimizing RSS over the empirical values of $$\widehat{\theta}^{F}_{it}$$ that leave nonempty low- and high-theta groups. The RSS-selected cutoff is then used in the same equation to report the regression coefficients.

| Item | Value |
| --- | ---: |
| Candidate empirical cutoffs retained | 1,060 |
| RSS cutoff $$\widehat c$$ | 21.182 |
| Empirical percentile of $$\widehat c$$ | 88.68 |
| RSS at $$\widehat c$$ | 19,175.576 |
| Low-theta observations | 940 |
| High-theta observations | 120 |

The coefficient table follows the Table 3 coefficient/t-statistic layout.

| Variable | Debt-change regression |
| --- | ---: |
| $$G_{it}\mathbf{1}\{\widehat{\theta}^{F}_{it}<\widehat c\}$$ | -0.077* |
| t-stat. | (-1.945) |
| $$G_{it}\mathbf{1}\{\widehat{\theta}^{F}_{it}\geq\widehat c\}$$ | -0.159*** |
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
| $$\lambda_L-\lambda_H$$ | 0.082*** |
| t-stat. | (3.670) |

Additional statistics:

| Item | Value |
| --- | ---: |
| $$p_L$$ at RSS cutoff | 0.052 |
| $$p_H$$ at RSS cutoff | 0.000 |
| $$p$$-value for $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1,060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.445 |

Interpretation: under the revised debt-change specification, both regime-specific current-readiness slopes are negative. The high-theta slope is more negative, and the equality test rejects $$\lambda_L=\lambda_H$$ at conventional levels.

The output files are:

```text
result/table7_deltaB_rss_cutoff_grid.csv
result/table7_deltaB_rss_cutoff_grid.dta
result/table7_deltaB_rss_selected_cutoff.csv
result/table7_deltaB_rss_selected_cutoff.dta
result/table7_deltaB_rss_cutoff_regression.tex
```

The `table7_deltaB_*` filenames now correspond directly to the debt-change equation shown above.

## 9. Summary

The updated code and report retain Table 1, Table 2, Table 3, the Section 6 theta tables, the Section 6.1 region diagnostics, the Full-interaction empirical theta construction, the continuous Full-theta debt-change test, the censored-theta robustness check, and the Full-theta debt-change RSS cutoff experiment.
