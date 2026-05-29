# Delta G/X Combination Report: `readiness_delta100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `readiness_delta100`.
- $$X_{it} = \Delta$$ `capacity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta variables are then computed within country from the scaled G/X variables as `scaled_source_it - scaled_source_i,t-1`; the first country-year observation is missing by construction.
- `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_delta_grid/readiness_delta100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.801 | (-1.428) |
| $$B_{it}$$ | 4.333*** | (6.303) |
| $$X_{it}$$ | -1.844 | (-0.353) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -5.431 | 0.281 | -2.162 |
| t-stat. | (-1.499) | (0.125) | (-0.545) |
| $$B_{it}$$ | 4.351*** | 4.318*** | 4.336*** |
| t-stat. | (6.301) | (6.293) | (6.289) |
| $$X_{it}$$ | -1.853 | -2.348 | -2.350 |
| t-stat. | (-0.353) | (-0.505) | (-0.504) |
| $$G_{it}\times B_{it}$$ | 5.596 |  | 5.103 |
| t-stat. | (0.733) |  | (0.682) |
| $$G_{it}\times X_{it}$$ |  | 672.637** | 663.084** |
| t-stat. |  | (2.378) | (2.306) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.900 | 0.900 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.162 | (-0.545) |
| $$B_{it}$$ | 4.336*** | (6.289) |
| $$X_{it}$$ | -2.350 | (-0.504) |
| $$G_{it}\times B_{it}$$ | 5.103 | (0.682) |
| $$G_{it}\times X_{it}$$ | 663.084** | (2.306) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | -0.252 | 4.114 | 0.160 | -21.654 | 47.111 |
| mG_hat_full | 1120 | 0.670 | 5.655 | 0.385 | -50.439 | 56.952 |
| sg_G_hat_full | 1120 | -0.670 | 5.655 | -0.385 | -56.952 | 50.439 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.011 | 0.060 | 0.060 |
| t-stat. | (0.125) | (0.601) | (0.597) |
| G_it_x_theta_F_it |  | -0.055** | -0.055** |
| t-stat. |  | (-2.025) | (-1.978) |
| theta_F_it |  |  | -0.000 |
| t-stat. |  |  | (-0.024) |
| Real GDP | 8.266*** | 8.097*** | 8.103*** |
| t-stat. | (5.416) | (5.349) | (5.288) |
| Real GDP growth | -0.334*** | -0.335*** | -0.335*** |
| t-stat. | (-3.606) | (-3.691) | (-3.680) |
| CPI inflation | -0.173** | -0.169** | -0.169** |
| t-stat. | (-2.077) | (-2.066) | (-2.066) |
| Overall balance/GDP | -0.475*** | -0.470*** | -0.470*** |
| t-stat. | (-5.944) | (-5.871) | (-5.862) |
| International reserves | 0.022 | 0.020 | 0.020 |
| t-stat. | (1.566) | (1.387) | (1.387) |
| Government effectiveness | -2.081** | -2.076** | -2.075** |
| t-stat. | (-2.194) | (-2.195) | (-2.194) |
| Regulatory quality | 1.557* | 1.624* | 1.626* |
| t-stat. | (1.758) | (1.843) | (1.856) |
| Terms of trade | 0.043*** | 0.043*** | 0.043*** |
| t-stat. | (2.737) | (2.738) | (2.748) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.901 | 0.548 | 0.551 |
| p(lambda1=0) |  | 0.043 | 0.048 |
| p(lambda2=0) |  |  | 0.981 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.426 | 0.426 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.203 | 0.621* | 1.837 | 0.067 | 530 | 60 | 0.467 |
| Top 50% | 0.203 |  | -0.088 | -0.969 | 0.333 | 530 | 55 | 0.445 |
| 0-20% |  | -1.399 | 0.355 | 0.766 | 0.445 | 212 | 45 | 0.500 |
| 20-40% | -1.399 | -0.153 | -0.026 | -0.107 | 0.915 | 212 | 52 | 0.662 |
| 40-60% | -0.153 | 0.451 | -0.084 | -0.585 | 0.559 | 212 | 50 | 0.708 |
| 60-80% | 0.451 | 1.294 | 0.056 | 0.575 | 0.566 | 212 | 46 | 0.538 |
| 80-100% | 1.294 |  | -0.105 | -0.711 | 0.478 | 212 | 51 | 0.459 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -2.795 |
| RSS | 1.982 |
| Low-theta observations | 137 |
| High-theta observations | 923 |
| Low share | 0.129 |
| High share | 0.871 |
| $$\lambda_L$$ | 0.644 |
| t-stat. $$\lambda_L$$ | 1.642 |
| $$\lambda_H$$ | -0.024 |
| t-stat. $$\lambda_H$$ | -0.276 |
| $$\lambda_L-\lambda_H$$ | 0.668* |
| p-value $$\lambda_L=\lambda_H$$ | 0.075 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.426 |
