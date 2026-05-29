# G/X Combination Report: `governance100__sensitivity`

## 1. Specification

- $$G_{it}$$ source: `governance100`
- $$X_{it}$$ source: `sensitivity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/governance100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -9.657** | (-2.362) |
| $$B_{it}$$ | 4.378*** | (6.413) |
| $$X_{it}$$ | -5.119 | (-0.921) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.901 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 1.511 | -10.975 | -13.769* |
| t-stat. | (0.451) | (-1.383) | (-1.841) |
| $$B_{it}$$ | 17.856*** | 4.383*** | 18.557*** |
| t-stat. | (8.089) | (6.451) | (8.313) |
| $$X_{it}$$ | -2.886 | -7.660 | -33.254** |
| t-stat. | (-0.560) | (-0.493) | (-2.282) |
| $$G_{it}\times B_{it}$$ | -21.172*** |  | -22.168*** |
| t-stat. | (-7.116) |  | (-7.355) |
| $$G_{it}\times X_{it}$$ |  | 4.398 | 52.742** |
| t-stat. |  | (0.193) | (2.571) |
| Countries | 59 | 59 | 59 |
| Observations | 1,103 | 1,103 | 1,103 |
| Adjusted $$R^2$$ | 0.913 | 0.901 | 0.913 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -13.769* | (-1.841) |
| $$B_{it}$$ | 18.557*** | (8.313) |
| $$X_{it}$$ | -33.254** | (-2.282) |
| $$G_{it}\times B_{it}$$ | -22.168*** | (-7.355) |
| $$G_{it}\times X_{it}$$ | 52.742** | (2.571) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.913 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1103 | 10.045 | 14.055 | 5.607 | -1.145 | 106.749 |
| mG_hat_full | 1103 | 12.358 | 8.073 | 11.308 | -6.236 | 46.662 |
| sg_G_hat_full | 1103 | -12.358 | 8.073 | -11.308 | -46.662 | 6.236 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.021 | 0.038 | 0.020 |
| t-stat. | (0.169) | (0.306) | (0.169) |
| G_it_x_theta_F_it |  | -0.003*** | -0.002 |
| t-stat. |  | (-4.255) | (-0.434) |
| theta_F_it |  |  | -0.001 |
| t-stat. |  |  | (-0.340) |
| Real GDP | 8.157*** | 3.668** | 3.506* |
| t-stat. | (5.053) | (2.235) | (1.953) |
| Real GDP growth | -0.341*** | -0.365*** | -0.373*** |
| t-stat. | (-3.642) | (-3.989) | (-3.836) |
| CPI inflation | -0.174** | -0.177** | -0.180** |
| t-stat. | (-2.076) | (-2.104) | (-2.096) |
| Overall balance/GDP | -0.473*** | -0.486*** | -0.479*** |
| t-stat. | (-5.926) | (-5.938) | (-5.632) |
| International reserves | 0.022 | 0.009 | 0.009 |
| t-stat. | (1.595) | (0.683) | (0.677) |
| Government effectiveness | -2.180** | -1.029 | -0.908 |
| t-stat. | (-2.066) | (-0.974) | (-0.843) |
| Regulatory quality | 1.420 | 0.033 | -0.120 |
| t-stat. | (1.079) | (0.024) | (-0.080) |
| Terms of trade | 0.043*** | 0.037** | 0.037** |
| t-stat. | (2.737) | (2.524) | (2.487) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.866 | 0.760 | 0.866 |
| p(lambda1=0) |  | 0.000 | 0.664 |
| p(lambda2=0) |  |  | 0.734 |
| Observations | 1044 | 1044 | 1044 |
| Countries | 59 | 59 | 59 |
| Adjusted R2 | 0.420 | 0.445 | 0.445 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 5.486 | 0.020 | 0.152 | 0.879 | 522 | 45 | 0.481 |
| Top 50% | 5.486 |  | -0.073 | -0.359 | 0.720 | 522 | 46 | 0.472 |
| 0-20% |  | 1.888 | 0.243 | 1.008 | 0.315 | 208 | 27 | 0.423 |
| 20-40% | 1.888 | 4.209 | -0.102 | -0.398 | 0.691 | 210 | 37 | 0.545 |
| 40-60% | 4.209 | 7.141 | -0.108 | -0.465 | 0.642 | 209 | 38 | 0.428 |
| 60-80% | 7.141 | 14.044 | 0.333 | 0.866 | 0.388 | 209 | 34 | 0.474 |
| 80-100% | 14.044 |  | 0.050 | 0.141 | 0.888 | 208 | 20 | 0.671 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 21.504 |
| RSS | 1.908 |
| Low-theta observations | 928 |
| High-theta observations | 116 |
| Low share | 0.889 |
| High share | 0.111 |
| $$\lambda_L$$ | 0.039 |
| t-stat. $$\lambda_L$$ | 0.313 |
| $$\lambda_H$$ | -0.032 |
| t-stat. $$\lambda_H$$ | -0.271 |
| $$\lambda_L-\lambda_H$$ | 0.071*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1044 |
| Countries | 59 |
| Adjusted $$R^2$$ | 0.443 |
