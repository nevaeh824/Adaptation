# Delta G/X Combination Report: `readiness_delta100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `readiness_delta100`.
- $$X_{it} = \Delta$$ `sensitivity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta variables are then computed within country from the scaled G/X variables as `scaled_source_it - scaled_source_i,t-1`; the first country-year observation is missing by construction.
- `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_delta_grid/readiness_delta100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.806 | (-1.424) |
| $$B_{it}$$ | 4.334*** | (6.304) |
| $$X_{it}$$ | -1.738 | (-0.206) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -5.427 | -2.402 | -5.515 |
| t-stat. | (-1.498) | (-1.157) | (-1.462) |
| $$B_{it}$$ | 4.353*** | 4.347*** | 4.372*** |
| t-stat. | (6.301) | (6.314) | (6.316) |
| $$X_{it}$$ | -1.652 | -4.660 | -5.054 |
| t-stat. | (-0.196) | (-0.488) | (-0.533) |
| $$G_{it}\times B_{it}$$ | 5.575 |  | 6.770 |
| t-stat. | (0.729) |  | (0.893) |
| $$G_{it}\times X_{it}$$ |  | -507.579 | -594.151 |
| t-stat. |  | (-0.983) | (-1.201) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.899 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -5.515 | (-1.462) |
| $$B_{it}$$ | 4.372*** | (6.316) |
| $$X_{it}$$ | -5.054 | (-0.533) |
| $$G_{it}\times B_{it}$$ | 6.770 | (0.893) |
| $$G_{it}\times X_{it}$$ | -594.151 | (-1.201) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.082 | 3.237 | 0.741 | -24.899 | 18.855 |
| mG_hat_full | 1120 | 1.486 | 3.689 | 1.736 | -11.930 | 22.961 |
| sg_G_hat_full | 1120 | -1.486 | 3.689 | -1.736 | -22.961 | 11.930 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.011 | 0.030 | 0.014 |
| t-stat. | (0.125) | (0.286) | (0.134) |
| G_it_x_theta_F_it |  | -0.021 | 0.004 |
| t-stat. |  | (-0.582) | (0.100) |
| theta_F_it |  |  | 0.002** |
| t-stat. |  |  | (2.005) |
| Real GDP | 8.266*** | 8.185*** | 7.271*** |
| t-stat. | (5.416) | (5.387) | (4.765) |
| Real GDP growth | -0.334*** | -0.333*** | -0.338*** |
| t-stat. | (-3.606) | (-3.597) | (-3.665) |
| CPI inflation | -0.173** | -0.173** | -0.184** |
| t-stat. | (-2.077) | (-2.064) | (-2.032) |
| Overall balance/GDP | -0.475*** | -0.476*** | -0.473*** |
| t-stat. | (-5.944) | (-5.937) | (-5.941) |
| International reserves | 0.022 | 0.022 | 0.021 |
| t-stat. | (1.566) | (1.535) | (1.516) |
| Government effectiveness | -2.081** | -2.022** | -1.904** |
| t-stat. | (-2.194) | (-2.125) | (-2.010) |
| Regulatory quality | 1.557* | 1.564* | 1.337 |
| t-stat. | (1.758) | (1.767) | (1.514) |
| Terms of trade | 0.043*** | 0.043*** | 0.043*** |
| t-stat. | (2.737) | (2.733) | (2.702) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.901 | 0.775 | 0.893 |
| p(lambda1=0) |  | 0.561 | 0.921 |
| p(lambda2=0) |  |  | 0.045 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.423 | 0.427 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.744 | 0.123 | 0.639 | 0.523 | 530 | 60 | 0.429 |
| Top 50% | 0.744 |  | 0.064 | 1.076 | 0.282 | 530 | 59 | 0.461 |
| 0-20% |  | -0.753 | -0.128 | -0.259 | 0.796 | 212 | 41 | 0.470 |
| 20-40% | -0.753 | 0.475 | 0.388** | 2.117 | 0.036 | 212 | 53 | 0.501 |
| 40-60% | 0.475 | 0.951 | 0.020 | 0.089 | 0.929 | 212 | 51 | 0.365 |
| 60-80% | 0.951 | 1.600 | 0.196 | 1.286 | 0.201 | 212 | 50 | 0.537 |
| 80-100% | 1.600 |  | -0.063 | -0.677 | 0.499 | 212 | 51 | 0.581 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -21.606 |
| RSS | 1.977 |
| Low-theta observations | 4 |
| High-theta observations | 1056 |
| Low share | 0.004 |
| High share | 0.996 |
| $$\lambda_L$$ | 8.965*** |
| t-stat. $$\lambda_L$$ | 2.689 |
| $$\lambda_H$$ | 0.014 |
| t-stat. $$\lambda_H$$ | 0.151 |
| $$\lambda_L-\lambda_H$$ | 8.952*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.007 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.428 |
