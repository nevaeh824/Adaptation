# Delta-G/Source-X Combination Report: `readiness_delta100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `readiness_delta100`.
- $$X_{it}$$ source: `capacity`.
- Delta `G` is computed within country as `G_it - G_i,t-1`; the first country-year observation is missing by construction.
- Delta `G`, source `X`, `B`, and all controls are scaled by 0.01 before estimation.
- Output directory: `result/gx_deltaG_grid/readiness_delta100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.804 | (-1.423) |
| $$B_{it}$$ | 4.355*** | (6.106) |
| $$X_{it}$$ | 0.655 | (0.224) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -5.417 | 3.863 | 1.256 |
| t-stat. | (-1.495) | (0.737) | (0.199) |
| $$B_{it}$$ | 4.371*** | 4.345*** | 4.359*** |
| t-stat. | (6.106) | (6.094) | (6.091) |
| $$X_{it}$$ | 0.599 | 0.948 | 0.879 |
| t-stat. | (0.204) | (0.322) | (0.298) |
| $$G_{it}\times B_{it}$$ | 5.560 |  | 4.294 |
| t-stat. | (0.727) |  | (0.571) |
| $$G_{it}\times X_{it}$$ |  | -14.244 | -12.987 |
| t-stat. |  | (-1.504) | (-1.364) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.900 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 1.256 | (0.199) |
| $$B_{it}$$ | 4.359*** | (6.091) |
| $$X_{it}$$ | 0.879 | (0.298) |
| $$G_{it}\times B_{it}$$ | 4.294 | (0.571) |
| $$G_{it}\times X_{it}$$ | -12.987 | (-1.364) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.070 | 2.467 | 0.462 | -17.785 | 3.748 |
| mG_hat_full | 1120 | 1.293 | 2.703 | 1.182 | -7.774 | 8.285 |
| sg_G_hat_full | 1120 | -1.293 | 2.703 | -1.182 | -8.285 | 7.774 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.011 | 0.014 | 0.008 |
| t-stat. | (0.125) | (0.122) | (0.072) |
| G_it_x_theta_F_it |  | -0.003 | 0.017 |
| t-stat. |  | (-0.058) | (0.353) |
| theta_F_it |  |  | 0.010*** |
| t-stat. |  |  | (3.764) |
| Real GDP | 8.266*** | 8.250*** | 4.907*** |
| t-stat. | (5.416) | (5.370) | (3.464) |
| Real GDP growth | -0.334*** | -0.334*** | -0.336*** |
| t-stat. | (-3.606) | (-3.551) | (-3.669) |
| CPI inflation | -0.173** | -0.172** | -0.177** |
| t-stat. | (-2.077) | (-2.068) | (-2.082) |
| Overall balance/GDP | -0.475*** | -0.475*** | -0.461*** |
| t-stat. | (-5.944) | (-5.937) | (-5.684) |
| International reserves | 0.022 | 0.022 | 0.019 |
| t-stat. | (1.566) | (1.565) | (1.367) |
| Government effectiveness | -2.081** | -2.074** | -1.208 |
| t-stat. | (-2.194) | (-2.171) | (-1.258) |
| Regulatory quality | 1.557* | 1.558* | 0.639 |
| t-stat. | (1.758) | (1.754) | (0.731) |
| Terms of trade | 0.043*** | 0.043*** | 0.037** |
| t-stat. | (2.737) | (2.733) | (2.462) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.901 | 0.903 | 0.942 |
| p(lambda1=0) |  | 0.954 | 0.724 |
| p(lambda2=0) |  |  | 0.000 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.422 | 0.437 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.459 | 0.045 | 0.197 | 0.844 | 530 | 35 | 0.473 |
| Top 50% | 0.459 |  | 0.084 | 1.071 | 0.285 | 530 | 43 | 0.386 |
| 0-20% |  | -0.623 | 0.013 | 0.031 | 0.975 | 212 | 17 | 0.691 |
| 20-40% | -0.623 | 0.291 | 0.172 | 0.533 | 0.594 | 212 | 27 | 0.406 |
| 40-60% | 0.291 | 0.677 | 0.001 | 0.010 | 0.992 | 212 | 25 | 0.675 |
| 60-80% | 0.677 | 1.464 | 0.006 | 0.066 | 0.948 | 212 | 24 | 0.560 |
| 80-100% | 1.464 |  | 0.184 | 1.559 | 0.121 | 212 | 18 | 0.484 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -16.729 |
| RSS | 1.987 |
| Low-theta observations | 2 |
| High-theta observations | 1058 |
| Low share | 0.002 |
| High share | 0.998 |
| $$\lambda_L$$ | 9.802*** |
| t-stat. $$\lambda_L$$ | 5.751 |
| $$\lambda_H$$ | 0.012 |
| t-stat. $$\lambda_H$$ | 0.136 |
| $$\lambda_L-\lambda_H$$ | 9.790*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.425 |
