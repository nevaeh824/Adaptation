# Delta-G/Source-X Combination Report: `governance100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `governance100`.
- $$X_{it}$$ source: `capacity`.
- Delta `G` is computed within country as `G_it - G_i,t-1`; the first country-year observation is missing by construction.
- Delta `G`, source `X`, `B`, and all controls are scaled by 0.01 before estimation.
- Output directory: `result/gx_deltaG_grid/governance100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 3.412 | (0.818) |
| $$B_{it}$$ | 4.303*** | (5.975) |
| $$X_{it}$$ | 0.368 | (0.124) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 16.401 | 10.329 | 28.835* |
| t-stat. | (1.579) | (0.826) | (1.648) |
| $$B_{it}$$ | 4.260*** | 4.291*** | 4.237*** |
| t-stat. | (5.971) | (5.978) | (5.969) |
| $$X_{it}$$ | 0.137 | 0.501 | 0.330 |
| t-stat. | (0.047) | (0.167) | (0.111) |
| $$G_{it}\times B_{it}$$ | -21.588 |  | -23.605 |
| t-stat. | (-1.149) |  | (-1.236) |
| $$G_{it}\times X_{it}$$ |  | -16.658 | -27.022 |
| t-stat. |  | (-0.496) | (-0.784) |
| Countries | 59 | 59 | 59 |
| Observations | 1,103 | 1,103 | 1,103 |
| Adjusted $$R^2$$ | 0.900 | 0.900 | 0.900 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 28.835* | (1.648) |
| $$B_{it}$$ | 4.237*** | (5.969) |
| $$X_{it}$$ | 0.330 | (0.111) |
| $$G_{it}\times B_{it}$$ | -23.605 | (-1.236) |
| $$G_{it}\times X_{it}$$ | -27.022 | (-0.784) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.900 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1103 | 0.290 | 9.035 | -1.904 | -5.964 | 73.308 |
| mG_hat_full | 1103 | -3.725 | 8.169 | -4.608 | -18.084 | 32.044 |
| sg_G_hat_full | 1103 | 3.725 | 8.169 | 4.608 | -32.044 | 18.084 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.072 | -0.075 | -0.035 |
| t-stat. | (-0.555) | (-0.585) | (-0.270) |
| G_it_x_theta_F_it |  | 0.011 | 0.019 |
| t-stat. |  | (0.376) | (0.664) |
| theta_F_it |  |  | -0.002*** |
| t-stat. |  |  | (-2.724) |
| Real GDP | 8.166*** | 8.203*** | 4.420** |
| t-stat. | (5.343) | (5.458) | (2.471) |
| Real GDP growth | -0.337*** | -0.341*** | -0.376*** |
| t-stat. | (-3.587) | (-3.653) | (-4.070) |
| CPI inflation | -0.176** | -0.173** | -0.172** |
| t-stat. | (-2.074) | (-2.084) | (-2.147) |
| Overall balance/GDP | -0.472*** | -0.473*** | -0.451*** |
| t-stat. | (-5.890) | (-5.908) | (-5.560) |
| International reserves | 0.022 | 0.022 | 0.015 |
| t-stat. | (1.571) | (1.572) | (1.101) |
| Government effectiveness | -2.008** | -1.987** | -1.042 |
| t-stat. | (-2.043) | (-1.995) | (-0.985) |
| Regulatory quality | 1.658* | 1.638* | 0.281 |
| t-stat. | (1.860) | (1.839) | (0.296) |
| Terms of trade | 0.043*** | 0.043*** | 0.038** |
| t-stat. | (2.735) | (2.741) | (2.485) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.579 | 0.559 | 0.787 |
| p(lambda1=0) |  | 0.707 | 0.507 |
| p(lambda2=0) |  |  | 0.007 |
| Observations | 1044 | 1044 | 1044 |
| Countries | 59 | 59 | 59 |
| Adjusted R2 | 0.420 | 0.420 | 0.437 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -1.916 | 0.011 | 0.089 | 0.929 | 522 | 38 | 0.455 |
| Top 50% | -1.916 |  | -0.194 | -0.892 | 0.373 | 522 | 44 | 0.453 |
| 0-20% |  | -4.158 | -0.056 | -0.196 | 0.844 | 209 | 17 | 0.464 |
| 20-40% | -4.158 | -2.555 | -0.120 | -0.478 | 0.633 | 208 | 30 | 0.442 |
| 40-60% | -2.555 | -1.328 | -0.197 | -0.973 | 0.332 | 210 | 28 | 0.575 |
| 60-80% | -1.328 | 1.445 | -0.077 | -0.290 | 0.772 | 208 | 35 | 0.571 |
| 80-100% | 1.445 |  | -0.300 | -0.680 | 0.498 | 209 | 24 | 0.481 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 21.576 |
| RSS | 1.972 |
| Low-theta observations | 1015 |
| High-theta observations | 29 |
| Low share | 0.972 |
| High share | 0.028 |
| $$\lambda_L$$ | -0.120 |
| t-stat. $$\lambda_L$$ | -0.940 |
| $$\lambda_H$$ | 2.277 |
| t-stat. $$\lambda_H$$ | 1.082 |
| $$\lambda_L-\lambda_H$$ | -2.396 |
| p-value $$\lambda_L=\lambda_H$$ | 0.257 |
| Observations | 1044 |
| Countries | 59 |
| Adjusted $$R^2$$ | 0.425 |
