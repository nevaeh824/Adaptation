# Delta-G/Source-X Combination Report: `readiness100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `readiness100`.
- $$X_{it}$$ source: `sensitivity`.
- Delta `G` is computed within country as `G_it - G_i,t-1`; the first country-year observation is missing by construction.
- Delta `G`, source `X`, `B`, and all controls are scaled by 0.01 before estimation.
- Output directory: `result/gx_deltaG_grid/readiness100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -3.101 | (-1.536) |
| $$B_{it}$$ | 4.373*** | (6.320) |
| $$X_{it}$$ | -6.227 | (-1.130) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -2.813 | 0.185 | 0.171 |
| t-stat. | (-0.636) | (0.028) | (0.026) |
| $$B_{it}$$ | 4.374*** | 4.370*** | 4.370*** |
| t-stat. | (6.310) | (6.319) | (6.307) |
| $$X_{it}$$ | -6.211 | -6.215 | -6.217 |
| t-stat. | (-1.136) | (-1.128) | (-1.137) |
| $$G_{it}\times B_{it}$$ | -0.603 |  | 0.074 |
| t-stat. | (-0.067) |  | (0.008) |
| $$G_{it}\times X_{it}$$ |  | -11.164 | -11.235 |
| t-stat. |  | (-0.514) | (-0.479) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.900 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 0.171 | (0.026) |
| $$B_{it}$$ | 4.370*** | (6.307) |
| $$X_{it}$$ | -6.217 | (-1.137) |
| $$G_{it}\times B_{it}$$ | 0.074 | (0.008) |
| $$G_{it}\times X_{it}$$ | -11.235 | (-0.479) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 1.851 | 1.250 | 1.588 | 0.098 | 7.908 |
| mG_hat_full | 1120 | 2.972 | 0.835 | 2.943 | 1.368 | 5.220 |
| sg_G_hat_full | 1120 | -2.972 | 0.835 | -2.943 | -5.220 | -1.368 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.056 | 0.140 | 0.155 |
| t-stat. | (0.721) | (1.296) | (1.428) |
| G_it_x_theta_F_it |  | -0.055 | -0.055 |
| t-stat. |  | (-0.812) | (-0.788) |
| theta_F_it |  |  | -0.026*** |
| t-stat. |  |  | (-3.146) |
| Real GDP | 8.279*** | 8.329*** | 4.698*** |
| t-stat. | (5.422) | (5.438) | (2.665) |
| Real GDP growth | -0.337*** | -0.337*** | -0.389*** |
| t-stat. | (-3.737) | (-3.734) | (-4.157) |
| CPI inflation | -0.172** | -0.174** | -0.181** |
| t-stat. | (-2.077) | (-2.084) | (-2.307) |
| Overall balance/GDP | -0.477*** | -0.479*** | -0.487*** |
| t-stat. | (-5.959) | (-5.995) | (-5.809) |
| International reserves | 0.022 | 0.022 | 0.005 |
| t-stat. | (1.583) | (1.583) | (0.340) |
| Government effectiveness | -2.121** | -2.116** | -0.786 |
| t-stat. | (-2.240) | (-2.234) | (-0.753) |
| Regulatory quality | 1.573* | 1.576* | -0.409 |
| t-stat. | (1.784) | (1.784) | (-0.391) |
| Terms of trade | 0.043*** | 0.044*** | 0.037** |
| t-stat. | (2.728) | (2.768) | (2.443) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.471 | 0.195 | 0.154 |
| p(lambda1=0) |  | 0.417 | 0.431 |
| p(lambda2=0) |  |  | 0.002 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.423 | 0.445 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 1.548 | 0.084 | 1.235 | 0.218 | 530 | 41 | 0.508 |
| Top 50% | 1.548 |  | -0.038 | -0.282 | 0.778 | 530 | 43 | 0.457 |
| 0-20% |  | 0.835 | 0.086 | 0.970 | 0.334 | 212 | 24 | 0.321 |
| 20-40% | 0.835 | 1.234 | 0.026 | 0.230 | 0.818 | 212 | 30 | 0.614 |
| 40-60% | 1.234 | 1.813 | -0.083 | -0.234 | 0.815 | 212 | 35 | 0.470 |
| 60-80% | 1.813 | 2.655 | -0.068 | -0.431 | 0.667 | 212 | 29 | 0.624 |
| 80-100% | 2.655 |  | -0.067 | -0.341 | 0.734 | 212 | 22 | 0.539 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 2.272 |
| RSS | 1.988 |
| Low-theta observations | 747 |
| High-theta observations | 313 |
| Low share | 0.705 |
| High share | 0.295 |
| $$\lambda_L$$ | 0.153* |
| t-stat. $$\lambda_L$$ | 1.661 |
| $$\lambda_H$$ | -0.139 |
| t-stat. $$\lambda_H$$ | -1.121 |
| $$\lambda_L-\lambda_H$$ | 0.291** |
| p-value $$\lambda_L=\lambda_H$$ | 0.047 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.425 |
