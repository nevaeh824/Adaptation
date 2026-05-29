# Delta G/X Combination Report: `readiness100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `readiness100`.
- $$X_{it} = \Delta$$ `sensitivity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta variables are then computed within country from the scaled G/X variables as `scaled_source_it - scaled_source_i,t-1`; the first country-year observation is missing by construction.
- `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_delta_grid/readiness100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.876 | (-1.434) |
| $$B_{it}$$ | 4.332*** | (6.297) |
| $$X_{it}$$ | -1.792 | (-0.212) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -2.429 | -2.115 | -2.463 |
| t-stat. | (-0.544) | (-0.906) | (-0.511) |
| $$B_{it}$$ | 4.333*** | 4.340*** | 4.339*** |
| t-stat. | (6.287) | (6.305) | (6.292) |
| $$X_{it}$$ | -1.792 | -1.405 | -1.398 |
| t-stat. | (-0.212) | (-0.167) | (-0.166) |
| $$G_{it}\times B_{it}$$ | -0.939 |  | 0.755 |
| t-stat. | (-0.103) |  | (0.082) |
| $$G_{it}\times X_{it}$$ |  | -864.089 | -877.736 |
| t-stat. |  | (-1.257) | (-1.305) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.899 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.463 | (-0.511) |
| $$B_{it}$$ | 4.339*** | (6.292) |
| $$X_{it}$$ | -1.398 | (-0.166) |
| $$G_{it}\times B_{it}$$ | 0.755 | (0.082) |
| $$G_{it}\times X_{it}$$ | -877.736 | (-1.305) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 1.224 | 2.787 | 0.920 | -11.894 | 33.694 |
| mG_hat_full | 1120 | 2.126 | 4.227 | 1.962 | -16.736 | 31.544 |
| sg_G_hat_full | 1120 | -2.126 | 4.227 | -1.962 | -31.544 | 16.736 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.056 | 0.123 | 0.123 |
| t-stat. | (0.721) | (1.007) | (1.006) |
| G_it_x_theta_F_it |  | -0.044 | -0.044 |
| t-stat. |  | (-0.865) | (-0.863) |
| theta_F_it |  |  | 0.000 |
| t-stat. |  |  | (0.017) |
| Real GDP | 8.279*** | 8.324*** | 8.324*** |
| t-stat. | (5.422) | (5.460) | (5.458) |
| Real GDP growth | -0.337*** | -0.340*** | -0.340*** |
| t-stat. | (-3.737) | (-3.777) | (-3.781) |
| CPI inflation | -0.172** | -0.179** | -0.179** |
| t-stat. | (-2.077) | (-2.071) | (-2.071) |
| Overall balance/GDP | -0.477*** | -0.478*** | -0.478*** |
| t-stat. | (-5.959) | (-5.985) | (-5.986) |
| International reserves | 0.022 | 0.022 | 0.022 |
| t-stat. | (1.583) | (1.602) | (1.601) |
| Government effectiveness | -2.121** | -2.123** | -2.124** |
| t-stat. | (-2.240) | (-2.243) | (-2.234) |
| Regulatory quality | 1.573* | 1.598* | 1.599* |
| t-stat. | (1.784) | (1.804) | (1.800) |
| Terms of trade | 0.043*** | 0.044*** | 0.044*** |
| t-stat. | (2.728) | (2.758) | (2.759) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.471 | 0.314 | 0.315 |
| p(lambda1=0) |  | 0.387 | 0.389 |
| p(lambda2=0) |  |  | 0.986 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.423 | 0.423 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.915 | 0.184 | 1.541 | 0.124 | 530 | 60 | 0.331 |
| Top 50% | 0.915 |  | -0.118 | -1.420 | 0.156 | 530 | 59 | 0.534 |
| 0-20% |  | -0.088 | 0.115 | 0.184 | 0.854 | 212 | 56 | 0.535 |
| 20-40% | -0.088 | 0.597 | 0.407* | 1.941 | 0.054 | 212 | 55 | 0.365 |
| 40-60% | 0.597 | 1.260 | 0.026 | 0.266 | 0.791 | 212 | 51 | 0.354 |
| 60-80% | 1.260 | 2.599 | 0.002 | 0.007 | 0.994 | 212 | 54 | 0.556 |
| 80-100% | 2.599 |  | -0.094 | -0.653 | 0.515 | 212 | 49 | 0.577 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -0.615 |
| RSS | 1.984 |
| Low-theta observations | 146 |
| High-theta observations | 914 |
| Low share | 0.138 |
| High share | 0.862 |
| $$\lambda_L$$ | 1.060 |
| t-stat. $$\lambda_L$$ | 0.898 |
| $$\lambda_H$$ | 0.030 |
| t-stat. $$\lambda_H$$ | 0.422 |
| $$\lambda_L-\lambda_H$$ | 1.030 |
| p-value $$\lambda_L=\lambda_H$$ | 0.381 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.426 |
