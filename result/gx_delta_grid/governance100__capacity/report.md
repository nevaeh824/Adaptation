# Delta G/X Combination Report: `governance100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `governance100`.
- $$X_{it} = \Delta$$ `capacity`.
- Delta variables are computed within country as `source_it - source_i,t-1`; the first country-year observation is missing by construction.
- Delta `G`, delta `X`, `B`, and all controls are scaled by 0.01 before estimation.
- Output directory: `result/gx_delta_grid/governance100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 3.437 | (0.827) |
| $$B_{it}$$ | 4.289*** | (6.187) |
| $$X_{it}$$ | -2.113 | (-0.396) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 16.705 | 5.830 | 18.995* |
| t-stat. | (1.607) | (1.409) | (1.824) |
| $$B_{it}$$ | 4.252*** | 4.287*** | 4.250*** |
| t-stat. | (6.184) | (6.199) | (6.197) |
| $$X_{it}$$ | -3.075 | -3.379 | -4.326 |
| t-stat. | (-0.607) | (-0.729) | (-0.967) |
| $$G_{it}\times B_{it}$$ | -22.063 |  | -21.920 |
| t-stat. | (-1.174) |  | (-1.171) |
| $$G_{it}\times X_{it}$$ |  | 823.122** | 817.246** |
| t-stat. |  | (2.390) | (2.488) |
| Countries | 59 | 59 | 59 |
| Observations | 1,103 | 1,103 | 1,103 |
| Adjusted $$R^2$$ | 0.900 | 0.900 | 0.901 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 18.995* | (1.824) |
| $$B_{it}$$ | 4.250*** | (6.197) |
| $$X_{it}$$ | -4.326 | (-0.967) |
| $$G_{it}\times B_{it}$$ | -21.920 | (-1.171) |
| $$G_{it}\times X_{it}$$ | 817.246** | (2.488) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.901 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1103 | 0.480 | 9.976 | -2.338 | -26.276 | 75.500 |
| mG_hat_full | 1103 | -3.638 | 10.123 | -5.177 | -73.779 | 67.448 |
| sg_G_hat_full | 1103 | 3.638 | 10.123 | 5.177 | -67.448 | 73.779 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.072 | -0.066 | -0.036 |
| t-stat. | (-0.555) | (-0.518) | (-0.290) |
| G_it_x_theta_F_it |  | -0.018 | -0.004 |
| t-stat. |  | (-0.877) | (-0.201) |
| theta_F_it |  |  | -0.001*** |
| t-stat. |  |  | (-2.954) |
| Real GDP | 8.166*** | 8.069*** | 6.229*** |
| t-stat. | (5.343) | (5.421) | (4.113) |
| Real GDP growth | -0.337*** | -0.339*** | -0.365*** |
| t-stat. | (-3.587) | (-3.636) | (-3.934) |
| CPI inflation | -0.176** | -0.176** | -0.181** |
| t-stat. | (-2.074) | (-2.075) | (-2.053) |
| Overall balance/GDP | -0.472*** | -0.471*** | -0.470*** |
| t-stat. | (-5.890) | (-5.887) | (-5.753) |
| International reserves | 0.022 | 0.021 | 0.020 |
| t-stat. | (1.571) | (1.530) | (1.436) |
| Government effectiveness | -2.008** | -2.047** | -1.338 |
| t-stat. | (-2.043) | (-2.074) | (-1.302) |
| Regulatory quality | 1.658* | 1.726* | 1.016 |
| t-stat. | (1.860) | (1.940) | (1.150) |
| Terms of trade | 0.043*** | 0.043*** | 0.043*** |
| t-stat. | (2.735) | (2.748) | (2.748) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.579 | 0.605 | 0.772 |
| p(lambda1=0) |  | 0.381 | 0.841 |
| p(lambda2=0) |  |  | 0.003 |
| Observations | 1044 | 1044 | 1044 |
| Countries | 59 | 59 | 59 |
| Adjusted R2 | 0.420 | 0.421 | 0.431 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -2.296 | -0.077 | -0.601 | 0.548 | 522 | 56 | 0.524 |
| Top 50% | -2.296 |  | -0.026 | -0.108 | 0.914 | 522 | 56 | 0.404 |
| 0-20% |  | -3.741 | 0.299 | 1.517 | 0.132 | 209 | 51 | 0.563 |
| 20-40% | -3.741 | -2.800 | 0.054 | 0.306 | 0.760 | 209 | 49 | 0.613 |
| 40-60% | -2.800 | -1.623 | -0.344 | -1.162 | 0.247 | 208 | 47 | 0.409 |
| 60-80% | -1.623 | 1.656 | -0.076 | -0.294 | 0.769 | 209 | 50 | 0.477 |
| 80-100% | 1.656 |  | 0.307 | 0.524 | 0.601 | 209 | 37 | 0.565 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 70.389 |
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
