# Delta G/X Combination Report: `EcoReadiness100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `EcoReadiness100`.
- $$X_{it} = \Delta$$ `capacity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta variables are then computed within country from the scaled G/X variables as `scaled_source_it - scaled_source_i,t-1`; the first country-year observation is missing by construction.
- `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_delta_grid/EcoReadiness100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -1.489** | (-2.466) |
| $$B_{it}$$ | 4.332*** | (6.304) |
| $$X_{it}$$ | -1.795 | (-0.343) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -1.889 | -0.963 | -1.345 |
| t-stat. | (-1.557) | (-0.727) | (-0.710) |
| $$B_{it}$$ | 4.330*** | 4.329*** | 4.328*** |
| t-stat. | (6.295) | (6.297) | (6.289) |
| $$X_{it}$$ | -1.804 | -1.980 | -1.967 |
| t-stat. | (-0.344) | (-0.383) | (-0.380) |
| $$G_{it}\times B_{it}$$ | 0.843 |  | 0.685 |
| t-stat. | (0.357) |  | (0.285) |
| $$G_{it}\times X_{it}$$ |  | 88.017 | 78.408 |
| t-stat. |  | (0.448) | (0.391) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.900 | 0.900 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -1.345 | (-0.710) |
| $$B_{it}$$ | 4.328*** | (6.289) |
| $$X_{it}$$ | -1.967 | (-0.380) |
| $$G_{it}\times B_{it}$$ | 0.685 | (0.285) |
| $$G_{it}\times X_{it}$$ | 78.408 | (0.391) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.592 | 0.440 | 0.550 | -1.746 | 6.503 |
| mG_hat_full | 1120 | 1.119 | 0.679 | 1.091 | -4.904 | 7.799 |
| sg_G_hat_full | 1120 | -1.119 | 0.679 | -1.091 | -7.799 | 4.904 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.014 | 0.147*** | 0.139*** |
| t-stat. | (0.600) | (3.123) | (3.082) |
| G_it_x_theta_F_it |  | -0.212*** | -0.197*** |
| t-stat. |  | (-3.190) | (-3.163) |
| theta_F_it |  |  | -0.007 |
| t-stat. |  |  | (-1.511) |
| Real GDP | 8.278*** | 8.384*** | 8.451*** |
| t-stat. | (5.421) | (5.505) | (5.560) |
| Real GDP growth | -0.336*** | -0.341*** | -0.351*** |
| t-stat. | (-3.703) | (-3.785) | (-3.867) |
| CPI inflation | -0.173** | -0.175** | -0.178** |
| t-stat. | (-2.082) | (-2.080) | (-2.066) |
| Overall balance/GDP | -0.476*** | -0.481*** | -0.488*** |
| t-stat. | (-5.948) | (-6.097) | (-6.131) |
| International reserves | 0.022 | 0.021 | 0.021 |
| t-stat. | (1.578) | (1.508) | (1.502) |
| Government effectiveness | -2.099** | -2.039** | -1.931** |
| t-stat. | (-2.202) | (-2.149) | (-2.029) |
| Regulatory quality | 1.576* | 1.592* | 1.540* |
| t-stat. | (1.788) | (1.812) | (1.754) |
| Terms of trade | 0.043*** | 0.046*** | 0.048*** |
| t-stat. | (2.734) | (2.916) | (3.000) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.549 | 0.002 | 0.002 |
| p(lambda1=0) |  | 0.001 | 0.002 |
| p(lambda2=0) |  |  | 0.131 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.426 | 0.427 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.549 | 0.055* | 1.820 | 0.069 | 530 | 60 | 0.489 |
| Top 50% | 0.549 |  | -0.047 | -1.455 | 0.147 | 530 | 57 | 0.419 |
| 0-20% |  | 0.346 | 0.084** | 2.097 | 0.038 | 212 | 50 | 0.518 |
| 20-40% | 0.346 | 0.491 | -0.015 | -0.375 | 0.709 | 212 | 51 | 0.528 |
| 40-60% | 0.491 | 0.614 | 0.035 | 0.605 | 0.546 | 212 | 52 | 0.633 |
| 60-80% | 0.614 | 0.773 | -0.337** | -2.426 | 0.017 | 212 | 51 | 0.399 |
| 80-100% | 0.773 |  | -0.072 | -1.626 | 0.106 | 212 | 45 | 0.399 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 1.215 |
| RSS | 1.971 |
| Low-theta observations | 1009 |
| High-theta observations | 51 |
| Low share | 0.952 |
| High share | 0.048 |
| $$\lambda_L$$ | 0.026 |
| t-stat. $$\lambda_L$$ | 1.120 |
| $$\lambda_H$$ | -1.105* |
| t-stat. $$\lambda_H$$ | -1.823 |
| $$\lambda_L-\lambda_H$$ | 1.132* |
| p-value $$\lambda_L=\lambda_H$$ | 0.062 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.429 |
