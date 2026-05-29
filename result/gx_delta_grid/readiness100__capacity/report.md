# Delta G/X Combination Report: `readiness100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `readiness100`.
- $$X_{it} = \Delta$$ `capacity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta variables are then computed within country from the scaled G/X variables as `scaled_source_it - scaled_source_i,t-1`; the first country-year observation is missing by construction.
- `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_delta_grid/readiness100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.868 | (-1.439) |
| $$B_{it}$$ | 4.331*** | (6.296) |
| $$X_{it}$$ | -1.850 | (-0.355) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -2.414 | 0.842 | 1.969 |
| t-stat. | (-0.541) | (0.287) | (0.377) |
| $$B_{it}$$ | 4.332*** | 4.319*** | 4.321*** |
| t-stat. | (6.286) | (6.281) | (6.274) |
| $$X_{it}$$ | -1.854 | -3.832 | -3.888 |
| t-stat. | (-0.356) | (-0.771) | (-0.789) |
| $$G_{it}\times B_{it}$$ | -0.952 |  | -2.180 |
| t-stat. | (-0.105) |  | (-0.242) |
| $$G_{it}\times X_{it}$$ |  | 691.786 | 708.058 |
| t-stat. |  | (1.606) | (1.623) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.900 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 1.969 | (0.377) |
| $$B_{it}$$ | 4.321*** | (6.274) |
| $$X_{it}$$ | -3.888 | (-0.789) |
| $$G_{it}\times B_{it}$$ | -2.180 | (-0.242) |
| $$G_{it}\times X_{it}$$ | 708.058 | (1.623) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.892 | 3.770 | 0.220 | -19.737 | 52.819 |
| mG_hat_full | 1120 | 1.070 | 5.739 | 0.434 | -55.421 | 58.870 |
| sg_G_hat_full | 1120 | -1.070 | 5.739 | -0.434 | -58.870 | 55.421 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.056 | 0.174** | 0.154* |
| t-stat. | (0.721) | (1.972) | (1.753) |
| G_it_x_theta_F_it |  | -0.080** | -0.065* |
| t-stat. |  | (-2.219) | (-1.843) |
| theta_F_it |  |  | -0.001 |
| t-stat. |  |  | (-1.462) |
| Real GDP | 8.279*** | 8.356*** | 8.195*** |
| t-stat. | (5.422) | (5.508) | (5.437) |
| Real GDP growth | -0.337*** | -0.356*** | -0.361*** |
| t-stat. | (-3.737) | (-3.946) | (-3.974) |
| CPI inflation | -0.172** | -0.177** | -0.178** |
| t-stat. | (-2.077) | (-2.104) | (-2.078) |
| Overall balance/GDP | -0.477*** | -0.479*** | -0.483*** |
| t-stat. | (-5.959) | (-6.090) | (-6.074) |
| International reserves | 0.022 | 0.021 | 0.021 |
| t-stat. | (1.583) | (1.466) | (1.514) |
| Government effectiveness | -2.121** | -2.227** | -2.064** |
| t-stat. | (-2.240) | (-2.342) | (-2.161) |
| Regulatory quality | 1.573* | 1.632* | 1.561* |
| t-stat. | (1.784) | (1.854) | (1.779) |
| Terms of trade | 0.043*** | 0.046*** | 0.046*** |
| t-stat. | (2.728) | (2.867) | (2.904) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.471 | 0.049 | 0.080 |
| p(lambda1=0) |  | 0.027 | 0.066 |
| p(lambda2=0) |  |  | 0.144 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.427 | 0.428 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.270 | 0.143 | 1.338 | 0.181 | 530 | 60 | 0.559 |
| Top 50% | 0.270 |  | -0.001 | -0.008 | 0.993 | 530 | 59 | 0.354 |
| 0-20% |  | -0.610 | 0.374 | 1.066 | 0.289 | 212 | 59 | 0.607 |
| 20-40% | -0.610 | 0.001 | 0.078 | 0.394 | 0.694 | 212 | 53 | 0.609 |
| 40-60% | 0.001 | 0.631 | 0.119 | 1.005 | 0.317 | 212 | 52 | 0.640 |
| 60-80% | 0.631 | 1.921 | 0.005 | 0.028 | 0.978 | 212 | 55 | 0.412 |
| 80-100% | 1.921 |  | -0.293** | -2.025 | 0.045 | 212 | 47 | 0.420 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 21.743 |
| RSS | 1.975 |
| Low-theta observations | 1055 |
| High-theta observations | 5 |
| Low share | 0.995 |
| High share | 0.005 |
| $$\lambda_L$$ | 0.064 |
| t-stat. $$\lambda_L$$ | 0.816 |
| $$\lambda_H$$ | -6.889*** |
| t-stat. $$\lambda_H$$ | -3.382 |
| $$\lambda_L-\lambda_H$$ | 6.953*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.001 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.428 |
