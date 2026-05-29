# Delta G/X Combination Report: `governance100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `governance100`.
- $$X_{it} = \Delta$$ `sensitivity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta variables are then computed within country from the scaled G/X variables as `scaled_source_it - scaled_source_i,t-1`; the first country-year observation is missing by construction.
- `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_delta_grid/governance100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 3.428 | (0.826) |
| $$B_{it}$$ | 4.291*** | (6.192) |
| $$X_{it}$$ | 0.272 | (0.032) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 16.424 | 3.148 | 14.996 |
| t-stat. | (1.572) | (0.759) | (1.425) |
| $$B_{it}$$ | 4.256*** | 4.270*** | 4.240*** |
| t-stat. | (6.189) | (6.141) | (6.144) |
| $$X_{it}$$ | -0.328 | -2.228 | -2.493 |
| t-stat. | (-0.039) | (-0.263) | (-0.294) |
| $$G_{it}\times B_{it}$$ | -21.615 |  | -19.653 |
| t-stat. | (-1.145) |  | (-1.037) |
| $$G_{it}\times X_{it}$$ |  | -1316.718* | -1168.817* |
| t-stat. |  | (-1.852) | (-1.659) |
| Countries | 59 | 59 | 59 |
| Observations | 1,103 | 1,103 | 1,103 |
| Adjusted $$R^2$$ | 0.900 | 0.900 | 0.901 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 14.996 | (1.425) |
| $$B_{it}$$ | 4.240*** | (6.144) |
| $$X_{it}$$ | -2.493 | (-0.294) |
| $$G_{it}\times B_{it}$$ | -19.653 | (-1.037) |
| $$G_{it}\times X_{it}$$ | -1168.817* | (-1.659) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.901 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1103 | 0.750 | 9.390 | -1.777 | -18.393 | 70.930 |
| mG_hat_full | 1103 | -2.851 | 9.019 | -4.155 | -30.531 | 44.374 |
| sg_G_hat_full | 1103 | 2.851 | 9.019 | 4.155 | -44.374 | 30.531 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.072 | -0.074 | -0.055 |
| t-stat. | (-0.555) | (-0.575) | (-0.425) |
| G_it_x_theta_F_it |  | 0.013 | 0.008 |
| t-stat. |  | (0.682) | (0.435) |
| theta_F_it |  |  | -0.001** |
| t-stat. |  |  | (-2.183) |
| Real GDP | 8.166*** | 8.185*** | 6.732*** |
| t-stat. | (5.343) | (5.379) | (4.536) |
| Real GDP growth | -0.337*** | -0.343*** | -0.350*** |
| t-stat. | (-3.587) | (-3.671) | (-3.770) |
| CPI inflation | -0.176** | -0.166** | -0.159** |
| t-stat. | (-2.074) | (-2.033) | (-2.049) |
| Overall balance/GDP | -0.472*** | -0.473*** | -0.462*** |
| t-stat. | (-5.890) | (-5.897) | (-5.681) |
| International reserves | 0.022 | 0.022 | 0.019 |
| t-stat. | (1.571) | (1.568) | (1.373) |
| Government effectiveness | -2.008** | -1.950* | -1.538 |
| t-stat. | (-2.043) | (-1.949) | (-1.510) |
| Regulatory quality | 1.658* | 1.595* | 1.046 |
| t-stat. | (1.860) | (1.781) | (1.173) |
| Terms of trade | 0.043*** | 0.043*** | 0.040*** |
| t-stat. | (2.735) | (2.736) | (2.594) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.579 | 0.566 | 0.671 |
| p(lambda1=0) |  | 0.495 | 0.664 |
| p(lambda2=0) |  |  | 0.029 |
| Observations | 1044 | 1044 | 1044 |
| Countries | 59 | 59 | 59 |
| Adjusted R2 | 0.420 | 0.420 | 0.425 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -1.784 | -0.188 | -1.451 | 0.148 | 522 | 55 | 0.450 |
| Top 50% | -1.784 |  | -0.005 | -0.018 | 0.986 | 522 | 58 | 0.490 |
| 0-20% |  | -3.365 | -0.268 | -1.172 | 0.243 | 209 | 52 | 0.521 |
| 20-40% | -3.365 | -2.332 | -0.466** | -2.048 | 0.042 | 208 | 45 | 0.533 |
| 40-60% | -2.332 | -1.198 | 0.220 | 1.001 | 0.319 | 209 | 51 | 0.569 |
| 60-80% | -1.198 | 2.353 | 0.399 | 1.284 | 0.201 | 210 | 54 | 0.577 |
| 80-100% | 2.353 |  | -0.174 | -0.393 | 0.695 | 208 | 38 | 0.626 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 63.280 |
| RSS | 1.967 |
| Low-theta observations | 1041 |
| High-theta observations | 3 |
| Low share | 0.997 |
| High share | 0.003 |
| $$\lambda_L$$ | -0.064 |
| t-stat. $$\lambda_L$$ | -0.490 |
| $$\lambda_H$$ | -18.503*** |
| t-stat. $$\lambda_H$$ | -6.591 |
| $$\lambda_L-\lambda_H$$ | 18.439*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1044 |
| Countries | 59 |
| Adjusted $$R^2$$ | 0.426 |
