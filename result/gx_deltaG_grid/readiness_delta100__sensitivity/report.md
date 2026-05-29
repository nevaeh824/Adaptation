# Delta-G/Source-X Combination Report: `readiness_delta100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `readiness_delta100`.
- $$X_{it}$$ source: `sensitivity`.
- Delta `G` is computed within country as `G_it - G_i,t-1`; the first country-year observation is missing by construction.
- Delta `G`, source `X`, `B`, and all controls are scaled by 0.01 before estimation.
- Output directory: `result/gx_deltaG_grid/readiness_delta100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -3.015 | (-1.516) |
| $$B_{it}$$ | 4.376*** | (6.327) |
| $$X_{it}$$ | -6.257 | (-1.135) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -5.855 | -1.157 | -2.705 |
| t-stat. | (-1.615) | (-0.199) | (-0.460) |
| $$B_{it}$$ | 4.397*** | 4.376*** | 4.400*** |
| t-stat. | (6.328) | (6.325) | (6.322) |
| $$X_{it}$$ | -6.470 | -6.295 | -6.569 |
| t-stat. | (-1.177) | (-1.140) | (-1.193) |
| $$G_{it}\times B_{it}$$ | 6.026 |  | 6.798 |
| t-stat. | (0.793) |  | (0.874) |
| $$G_{it}\times X_{it}$$ |  | -6.572 | -12.432 |
| t-stat. |  | (-0.327) | (-0.616) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.900 | 0.900 | 0.900 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.705 | (-0.460) |
| $$B_{it}$$ | 4.400*** | (6.322) |
| $$X_{it}$$ | -6.569 | (-1.193) |
| $$G_{it}\times B_{it}$$ | 6.798 | (0.874) |
| $$G_{it}\times X_{it}$$ | -12.432 | (-0.616) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.498 | 2.502 | 1.051 | -19.778 | 2.667 |
| mG_hat_full | 1120 | 2.106 | 2.399 | 2.530 | -8.645 | 7.132 |
| sg_G_hat_full | 1120 | -2.106 | 2.399 | -2.530 | -7.132 | 8.645 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.011 | 0.027 | 0.014 |
| t-stat. | (0.125) | (0.243) | (0.126) |
| G_it_x_theta_F_it |  | -0.017 | 0.013 |
| t-stat. |  | (-0.328) | (0.262) |
| theta_F_it |  |  | 0.008*** |
| t-stat. |  |  | (3.196) |
| Real GDP | 8.266*** | 8.193*** | 4.741*** |
| t-stat. | (5.416) | (5.375) | (2.977) |
| Real GDP growth | -0.334*** | -0.332*** | -0.350*** |
| t-stat. | (-3.606) | (-3.582) | (-3.876) |
| CPI inflation | -0.173** | -0.171** | -0.176** |
| t-stat. | (-2.077) | (-2.066) | (-2.100) |
| Overall balance/GDP | -0.475*** | -0.476*** | -0.456*** |
| t-stat. | (-5.944) | (-5.950) | (-5.657) |
| International reserves | 0.022 | 0.022 | 0.017 |
| t-stat. | (1.566) | (1.547) | (1.280) |
| Government effectiveness | -2.081** | -2.033** | -1.341 |
| t-stat. | (-2.194) | (-2.133) | (-1.374) |
| Regulatory quality | 1.557* | 1.549* | 0.515 |
| t-stat. | (1.758) | (1.755) | (0.585) |
| Terms of trade | 0.043*** | 0.043*** | 0.038** |
| t-stat. | (2.737) | (2.734) | (2.517) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.901 | 0.808 | 0.900 |
| p(lambda1=0) |  | 0.743 | 0.793 |
| p(lambda2=0) |  |  | 0.001 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.423 | 0.438 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 1.050 | -0.091 | -0.546 | 0.585 | 530 | 42 | 0.433 |
| Top 50% | 1.050 |  | 0.060 | 0.905 | 0.366 | 530 | 45 | 0.532 |
| 0-20% |  | 0.396 | 0.472 | 0.953 | 0.342 | 212 | 22 | 0.647 |
| 20-40% | 0.396 | 0.944 | 0.068 | 0.367 | 0.714 | 212 | 33 | 0.331 |
| 40-60% | 0.944 | 1.155 | 0.004 | 0.039 | 0.969 | 212 | 33 | 0.629 |
| 60-80% | 1.155 | 1.579 | 0.046 | 0.397 | 0.692 | 212 | 27 | 0.648 |
| 80-100% | 1.579 |  | 0.059 | 0.475 | 0.636 | 212 | 19 | 0.395 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -19.660 |
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
