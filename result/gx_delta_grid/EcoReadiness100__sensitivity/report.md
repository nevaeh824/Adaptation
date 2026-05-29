# Delta G/X Combination Report: `EcoReadiness100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `EcoReadiness100`.
- $$X_{it} = \Delta$$ `sensitivity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta variables are then computed within country from the scaled G/X variables as `scaled_source_it - scaled_source_i,t-1`; the first country-year observation is missing by construction.
- `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_delta_grid/EcoReadiness100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -1.496** | (-2.459) |
| $$B_{it}$$ | 4.333*** | (6.305) |
| $$X_{it}$$ | -2.004 | (-0.237) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -1.895 | -1.398* | -1.891 |
| t-stat. | (-1.565) | (-1.949) | (-1.515) |
| $$B_{it}$$ | 4.331*** | 4.335*** | 4.333*** |
| t-stat. | (6.295) | (6.302) | (6.293) |
| $$X_{it}$$ | -2.018 | -2.015 | -2.037 |
| t-stat. | (-0.239) | (-0.238) | (-0.241) |
| $$G_{it}\times B_{it}$$ | 0.842 |  | 1.100 |
| t-stat. | (0.357) |  | (0.464) |
| $$G_{it}\times X_{it}$$ |  | -84.376 | -109.376 |
| t-stat. |  | (-0.385) | (-0.506) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.900 | 0.900 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -1.891 | (-1.515) |
| $$B_{it}$$ | 4.333*** | (6.293) |
| $$X_{it}$$ | -2.037 | (-0.241) |
| $$G_{it}\times B_{it}$$ | 1.100 | (0.464) |
| $$G_{it}\times X_{it}$$ | -109.376 | (-0.506) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.619 | 0.413 | 0.616 | -1.830 | 4.683 |
| mG_hat_full | 1120 | 1.238 | 0.648 | 1.266 | -1.217 | 5.134 |
| sg_G_hat_full | 1120 | -1.238 | 0.648 | -1.266 | -5.134 | 1.217 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.014 | 0.132*** | 0.131*** |
| t-stat. | (0.600) | (2.747) | (2.734) |
| G_it_x_theta_F_it |  | -0.184*** | -0.183*** |
| t-stat. |  | (-3.056) | (-3.031) |
| theta_F_it |  |  | 0.003 |
| t-stat. |  |  | (0.543) |
| Real GDP | 8.278*** | 8.295*** | 8.187*** |
| t-stat. | (5.421) | (5.445) | (5.411) |
| Real GDP growth | -0.336*** | -0.339*** | -0.338*** |
| t-stat. | (-3.703) | (-3.764) | (-3.772) |
| CPI inflation | -0.173** | -0.171** | -0.174** |
| t-stat. | (-2.082) | (-2.058) | (-2.040) |
| Overall balance/GDP | -0.476*** | -0.479*** | -0.478*** |
| t-stat. | (-5.948) | (-6.048) | (-6.038) |
| International reserves | 0.022 | 0.021 | 0.022 |
| t-stat. | (1.578) | (1.516) | (1.538) |
| Government effectiveness | -2.099** | -1.954** | -1.950** |
| t-stat. | (-2.202) | (-2.056) | (-2.057) |
| Regulatory quality | 1.576* | 1.582* | 1.601* |
| t-stat. | (1.788) | (1.807) | (1.824) |
| Terms of trade | 0.043*** | 0.046*** | 0.046*** |
| t-stat. | (2.734) | (2.882) | (2.879) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.549 | 0.006 | 0.006 |
| p(lambda1=0) |  | 0.002 | 0.003 |
| p(lambda2=0) |  |  | 0.587 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.426 | 0.425 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.615 | 0.070* | 1.803 | 0.072 | 530 | 59 | 0.299 |
| Top 50% | 0.615 |  | -0.063** | -2.190 | 0.029 | 530 | 57 | 0.563 |
| 0-20% |  | 0.371 | 0.030 | 0.500 | 0.618 | 212 | 50 | 0.363 |
| 20-40% | 0.371 | 0.550 | 0.080 | 1.411 | 0.161 | 212 | 50 | 0.416 |
| 40-60% | 0.550 | 0.681 | 0.021 | 0.422 | 0.674 | 212 | 53 | 0.604 |
| 60-80% | 0.681 | 0.864 | 0.082 | 0.612 | 0.542 | 212 | 55 | 0.559 |
| 80-100% | 0.864 |  | -0.084* | -1.793 | 0.075 | 212 | 48 | 0.557 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 0.545 |
| RSS | 1.978 |
| Low-theta observations | 420 |
| High-theta observations | 640 |
| Low share | 0.396 |
| High share | 0.604 |
| $$\lambda_L$$ | 0.107** |
| t-stat. $$\lambda_L$$ | 2.292 |
| $$\lambda_H$$ | -0.052** |
| t-stat. $$\lambda_H$$ | -1.981 |
| $$\lambda_L-\lambda_H$$ | 0.159*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.002 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.427 |
