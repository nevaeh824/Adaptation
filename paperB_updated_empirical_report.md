# Paper B Updated Empirical Results, 1995--2023

## 1. Execution

This report summarizes the retained output from
`paperB_updated_1995_2023_tables.do` after narrowing the reported tables and
removing the retired diagnostics.

- $$G_{it}$$ is `readiness100`.
- $$X_{it}$$ is `vulnerability100`.
- $$B_{it}$$ is debt/GDP.
- In the Stata code, $$G_{it}$$, $$X_{it}$$, $$B_{it}$$, and every control
  variable are multiplied by 0.01 before interactions and debt-change variables
  are constructed.

Latest verified run:

- Run completed: 2026-05-30 00:20:15 local Stata log time.
- Output directory: `result/`.
- Log file: `result/paperB_updated_1995_2023_tables.log`.
- Stata batch run completed with `ExitCode=0`.
- The run log contains no `r(...)` runtime errors.
- All reported regressions use heteroskedasticity-robust standard errors.

Current retained workflow:

- Table 2: baseline fixed-effects spread regression, retaining only
  `G+B+X + controls`.
- Table 3: heterogeneity in spread estimates, retaining only the three
  controlled columns.
- Full-interaction empirical theta construction.
- Combined debt-change dynamics table.
- Theta-grouped Full-theta debt-change heterogeneity regressions with a 50/50
  split and 20% quantile groups.
- Full-theta RSS cutoff experiment for the debt-change equation.

Removed from the workflow and cleaned from `result/`:

- Table 1 descriptive statistics.
- Full-Theta Region Diagnostics.
- Censored Full-Theta Robustness Check.
- Marginal-Effect Cutoff Diagnostics and marginal-effect subsample diagnostics.

## 2. Current Outputs

The current do-file writes or overwrites:

```text
result/paperB_updated_1995_2023_tables.log
result/table2_baseline_fe_periods.tex
result/table3_heterogeneity_theta.tex
result/table6_fullinteraction_theta_regression.tex
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
result/table7_deltaB_rss_cutoff_grid.csv
result/table7_deltaB_rss_cutoff_grid.dta
result/table7_deltaB_rss_selected_cutoff.csv
result/table7_deltaB_rss_selected_cutoff.dta
result/table7_deltaB_rss_cutoff_regression.tex
result/theta_full_empirical_panel.csv
result/theta_full_empirical_panel.dta
```

## 3. Table 2: Baseline Fixed Effects

Only the controlled joint specification is retained.

| Variable | G+B+X + controls |
| --- | ---: |
| $$G_{it}$$ | -5.485*** |
| t-stat. | (-3.209) |
| $$B_{it}$$ | 4.499*** |
| t-stat. | (6.480) |
| $$X_{it}$$ | 0.505 |
| t-stat. | (0.073) |
| Controls | Yes |
| Country FE | Yes |
| Year FE | Yes |
| Sample period | 1995--2023 |
| Countries | 60 |
| Observations | 1,120 |
| Adjusted $$R^2$$ | 0.901 |

Readiness is negatively associated with sovereign spreads in the retained
controlled baseline specification. Debt/GDP remains positive and significant.

## 4. Table 3: Heterogeneity in Spread Estimates

Only the controlled heterogeneity specifications are retained.

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 6.852*** | -6.157 | 6.277 |
| t-stat. | (3.233) | (-0.803) | (0.815) |
| $$B_{it}$$ | 19.617*** | 4.502*** | 19.619*** |
| t-stat. | (8.760) | (6.469) | (8.749) |
| $$X_{it}$$ | 7.386 | -0.204 | 6.778 |
| t-stat. | (1.067) | (-0.018) | (0.560) |
| $$G_{it}\times B_{it}$$ | -27.632*** |  | -27.632*** |
| t-stat. | (-7.734) |  | (-7.734) |
| $$G_{it}\times X_{it}$$ |  | 1.623 | 1.391 |
| t-stat. |  | (0.091) | (0.074) |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.914 | 0.900 | 0.914 |

The controlled debt interaction remains negative and significant. The
climate-risk interaction remains close to zero in the controlled models.

## 5. Full-Interaction Empirical Theta

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

Here $$G_{it}$$, $$B_{it}$$, $$X_{it}$$, and $$Z_{it}$$ are the scaled
regressors used by the Stata code.

| Variable | Full interaction Controls |
| --- | ---: |
| $$G_{it}$$ | 6.277 |
| t-stat. | (0.815) |
| $$B_{it}$$ | 19.619*** |
| t-stat. | (8.749) |
| $$X_{it}$$ | 6.778 |
| t-stat. | (0.560) |
| $$G_{it}\times B_{it}$$ | -27.632*** |
| t-stat. | (-7.734) |
| $$G_{it}\times X_{it}$$ | 1.391 |
| t-stat. | (0.074) |
| Controls | Yes |
| Country FE | Yes |
| Year FE | Yes |
| Countries | 60 |
| Observations | 1,120 |
| Adjusted $$R^2$$ | 0.914 |

The saved panel contains the observation-level theta variables in
`result/theta_full_empirical_panel.csv` and `.dta`.

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| $$\theta^F_{it}$$ | 1,120 | 9.493 | 16.254 | 4.003 | -0.440 | 129.077 |
| Marginal spread relief, $$-\partial s^g/\partial G$$ | 1,120 | 9.990 | 9.742 | 7.676 | -5.694 | 56.422 |
| Marginal spread response, $$\partial s^g/\partial G$$ | 1,120 | -9.990 | 9.742 | -7.676 | -56.422 | 5.694 |

## 6. Combined Debt-Change Dynamics Regressions

The combined table keeps three debt-change specifications:

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

| Variable | Baseline | Continuous Full-theta | Full-theta dynamics |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -0.103*** | -0.073* | -0.083* |
| t-stat. | (-2.614) | (-1.843) | (-1.959) |
| $$G_{it}\times\theta^F_{it}$$ |  | -0.003*** | 0.001 |
| t-stat. |  | (-3.772) | (0.136) |
| $$\theta^F_{it}$$ |  |  | -0.002 |
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
| p-value: $$\lambda_0=0$$ | 0.009 | 0.066 | 0.050 |
| p-value: $$\lambda_1=0$$ |  | 0.000 | 0.892 |
| p-value: $$\lambda_2=0$$ |  |  | 0.545 |
| Observations | 1,060 | 1,060 | 1,060 |
| Countries | 60 | 60 | 60 |
| Adjusted $$R^2$$ | 0.425 | 0.445 | 0.446 |

The continuous Full-theta interaction remains negative and statistically
significant in the Z-controls specification.

## 7. Additional Full-Theta Debt-Change Diagnostics

### 7.1 Theta-Grouped Heterogeneity Regressions

This diagnostic now reports a 50/50 median split and five 20% quantile groups:
0--20%, 20--40%, 40--60%, 60--80%, and 80--100%.

| Variable | Bottom 50% | Top 50% | 0--20% | 20--40% | 40--60% | 60--80% | 80--100% |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| $$G_{it}$$ | -0.062 | -0.072 | 0.022 | -0.169 | -0.156** | -0.167 | -0.604** |
| t-stat. | (-1.442) | (-0.908) | (0.350) | (-1.323) | (-2.154) | (-1.328) | (-2.443) |
| Real GDP | 6.252*** | 9.786*** | 7.297*** | 2.718 | 9.824*** | 3.111 | 11.642** |
| t-stat. | (3.658) | (3.190) | (2.975) | (0.567) | (2.935) | (0.600) | (2.140) |
| Real GDP growth | -0.286*** | -0.314* | -0.282*** | -0.292** | -0.161 | -0.251 | -0.652 |
| t-stat. | (-4.016) | (-1.779) | (-2.881) | (-2.027) | (-1.156) | (-1.181) | (-1.605) |
| CPI inflation | 0.006 | -0.497*** | -0.031 | 0.049 | 0.064 | -0.209 | -0.734*** |
| t-stat. | (0.203) | (-3.751) | (-0.777) | (0.427) | (0.563) | (-0.785) | (-3.280) |
| Overall balance/GDP | -0.376*** | -0.570*** | -0.444*** | -0.466*** | -0.356** | -0.561*** | -0.889*** |
| t-stat. | (-3.260) | (-5.220) | (-3.765) | (-2.753) | (-2.457) | (-2.848) | (-5.402) |
| International reserves | 0.006 | 0.035 | -0.408 | -0.005 | -0.002 | 0.185 | -0.174 |
| t-stat. | (0.495) | (0.266) | (-1.440) | (-0.198) | (-0.012) | (0.705) | (-0.685) |
| Government effectiveness | -1.559* | -2.027 | -0.708 | -3.312 | -0.953 | 0.627 | -3.152 |
| t-stat. | (-1.693) | (-1.093) | (-0.426) | (-1.621) | (-0.511) | (0.162) | (-0.946) |
| Regulatory quality | 1.551* | 0.504 | 1.452 | 3.387 | -1.435 | -1.639 | -1.470 |
| t-stat. | (1.702) | (0.301) | (0.620) | (1.630) | (-0.670) | (-0.507) | (-0.369) |
| Terms of trade | 0.040*** | 0.089 | 0.027** | 0.101** | 0.066** | 0.182* | 0.106 |
| t-stat. | (2.876) | (1.535) | (2.096) | (2.157) | (2.024) | (1.669) | (1.199) |
| Controls | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes | Yes | Yes | Yes | Yes |
| Observations | 530 | 530 | 212 | 212 | 212 | 212 | 212 |
| Countries | 40 | 47 | 29 | 35 | 41 | 32 | 22 |
| Adjusted $$R^2$$ | 0.489 | 0.466 | 0.457 | 0.486 | 0.708 | 0.397 | 0.629 |

Cutoffs:

| Split | Cutoff |
| --- | ---: |
| 50/50 split median | 3.876 |
| 20th percentile | 0.972 |
| 40th percentile | 2.476 |
| 60th percentile | 6.166 |
| 80th percentile | 13.084 |

The 40--60% and 80--100% groups have negative readiness coefficients that are
statistically significant at the 5 percent level.

## 8. Full-Theta RSS Cutoff for Debt-Change Dynamics

For each empirical cutoff `c`, the RSS search estimates:

```text
B_{i,t+1} - B_it = alpha_i + tau_t
                 + lambda_L * G_it * 1(theta_F_it < c)
                 + lambda_H * G_it * 1(theta_F_it >= c)
                 + Gamma'Z_it
                 + error
```

The cutoff is selected by minimizing RSS over empirical values of
`theta_F_it` that leave nonempty low- and high-theta groups.

| Item | Value |
| --- | ---: |
| Candidate empirical cutoffs retained | 1,060 |
| RSS cutoff $$\widehat{c}$$ | 20.983 |
| Empirical percentile of $$\widehat{c}$$ | 88.68 |
| RSS at $$\widehat{c}$$ | 1.918 |
| Low-theta observations | 940 |
| High-theta observations | 120 |

| Variable | Debt-change regression |
| --- | ---: |
| $$G_{it}\times 1\{\theta^F_{it}<\widehat{c}\}$$ | -0.077* |
| t-stat. | (-1.945) |
| $$G_{it}\times 1\{\theta^F_{it}\geq\widehat{c}\}$$ | -0.159*** |
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
| p-value for $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1,060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.445 |

Under the common-control RSS specification, both regime-specific readiness
slopes are negative at the selected cutoff, with the high-theta slope more
negative in magnitude. The equality test rejects
$$\lambda_L=\lambda_H$$.

## 9. Summary

The updated code now scales $$G$$, $$X$$, $$B$$, and all controls to 0.01 times
their source panel values before estimation. The report no longer includes
Table 1, Full-Theta Region Diagnostics, the Censored Full-Theta robustness
check, or marginal-effect cutoff diagnostics. Table 2 reports only
`G+B+X + controls`; Table 3 reports only the controlled debt, climate-risk, and
full-interaction heterogeneity columns. The theta-grouped debt-change table
includes both the median split and the five 20% quantile groups.
