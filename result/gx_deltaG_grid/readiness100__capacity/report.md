# Delta-G/Source-X Combination Report: `readiness100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `readiness100`.
- $$X_{it}$$ source: `capacity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta `G` is then computed within country from scaled G as `scaled_G_it - scaled_G_i,t-1`; the first country-year observation is missing by construction.
- `X` remains the selected scaled source variable in levels, and `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_deltaG_grid/readiness100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.880 | (-1.435) |
| $$B_{it}$$ | 4.354*** | (6.101) |
| $$X_{it}$$ | 0.714 | (0.243) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -2.434 | 10.159 | 13.620 |
| t-stat. | (-0.545) | (1.503) | (1.468) |
| $$B_{it}$$ | 4.356*** | 4.338*** | 4.342*** |
| t-stat. | (6.090) | (6.086) | (6.083) |
| $$X_{it}$$ | 0.714 | 1.076 | 1.108 |
| t-stat. | (0.243) | (0.366) | (0.376) |
| $$G_{it}\times B_{it}$$ | -0.935 |  | -4.523 |
| t-stat. | (-0.103) |  | (-0.493) |
| $$G_{it}\times X_{it}$$ |  | -25.314** | -27.844** |
| t-stat. |  | (-2.161) | (-2.244) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.900 | 0.900 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 13.620 | (1.468) |
| $$B_{it}$$ | 4.342*** | (6.083) |
| $$X_{it}$$ | 1.108 | (0.376) |
| $$G_{it}\times B_{it}$$ | -4.523 | (-0.493) |
| $$G_{it}\times X_{it}$$ | -27.844** | (-2.244) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.277 | 2.315 | -0.028 | -3.623 | 13.032 |
| mG_hat_full | 1120 | 0.181 | 3.847 | -0.053 | -7.108 | 10.181 |
| sg_G_hat_full | 1120 | -0.181 | 3.847 | 0.053 | -10.181 | 7.108 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.056 | 0.061 | 0.075 |
| t-stat. | (0.721) | (0.644) | (0.794) |
| G_it_x_theta_F_it |  | -0.004 | -0.005 |
| t-stat. |  | (-0.106) | (-0.162) |
| theta_F_it |  |  | -0.008 |
| t-stat. |  |  | (-1.558) |
| Real GDP | 8.279*** | 8.265*** | 6.348*** |
| t-stat. | (5.422) | (5.390) | (3.353) |
| Real GDP growth | -0.337*** | -0.337*** | -0.383*** |
| t-stat. | (-3.737) | (-3.742) | (-4.073) |
| CPI inflation | -0.172** | -0.173** | -0.172** |
| t-stat. | (-2.077) | (-2.079) | (-2.190) |
| Overall balance/GDP | -0.477*** | -0.477*** | -0.460*** |
| t-stat. | (-5.959) | (-5.954) | (-5.692) |
| International reserves | 0.022 | 0.022 | 0.015 |
| t-stat. | (1.583) | (1.587) | (1.084) |
| Government effectiveness | -2.121** | -2.119** | -1.799* |
| t-stat. | (-2.240) | (-2.231) | (-1.824) |
| Regulatory quality | 1.573* | 1.580* | 0.649 |
| t-stat. | (1.784) | (1.783) | (0.631) |
| Terms of trade | 0.043*** | 0.043*** | 0.042*** |
| t-stat. | (2.728) | (2.725) | (2.653) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.471 | 0.520 | 0.428 |
| p(lambda1=0) |  | 0.915 | 0.871 |
| p(lambda2=0) |  |  | 0.120 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.423 | 0.432 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -0.039 | 0.285 | 1.513 | 0.131 | 530 | 32 | 0.474 |
| Top 50% | -0.039 |  | 0.032 | 0.354 | 0.724 | 530 | 36 | 0.394 |
| 0-20% |  | -1.722 | 0.427 | 1.545 | 0.124 | 212 | 13 | 0.538 |
| 20-40% | -1.722 | -0.646 | 0.490 | 1.093 | 0.276 | 212 | 19 | 0.461 |
| 40-60% | -0.646 | 0.652 | 0.023 | 0.172 | 0.863 | 212 | 26 | 0.623 |
| 60-80% | 0.652 | 1.709 | -0.150 | -1.614 | 0.108 | 212 | 26 | 0.530 |
| 80-100% | 1.709 |  | 0.240 | 1.196 | 0.234 | 212 | 25 | 0.378 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 13.032 |
| RSS | 1.862 |
| Low-theta observations | 1059 |
| High-theta observations | 1 |
| Low share | 0.999 |
| High share | 0.001 |
| $$\lambda_L$$ | 0.045 |
| t-stat. $$\lambda_L$$ | 0.591 |
| $$\lambda_H$$ | 64.856*** |
| t-stat. $$\lambda_H$$ | 9.235 |
| $$\lambda_L-\lambda_H$$ | -64.811*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.461 |
