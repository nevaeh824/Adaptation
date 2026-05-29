# Delta-G/Source-X Combination Report: `EcoReadiness100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `EcoReadiness100`.
- $$X_{it}$$ source: `sensitivity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta `G` is then computed within country from scaled G as `scaled_G_it - scaled_G_i,t-1`; the first country-year observation is missing by construction.
- `X` remains the selected scaled source variable in levels, and `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_deltaG_grid/EcoReadiness100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -1.565** | (-2.560) |
| $$B_{it}$$ | 4.375*** | (6.331) |
| $$X_{it}$$ | -6.341 | (-1.152) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -2.012* | -0.559 | -0.779 |
| t-stat. | (-1.666) | (-0.268) | (-0.379) |
| $$B_{it}$$ | 4.373*** | 4.373*** | 4.370*** |
| t-stat. | (6.322) | (6.328) | (6.317) |
| $$X_{it}$$ | -6.396 | -6.335 | -6.406 |
| t-stat. | (-1.165) | (-1.150) | (-1.166) |
| $$G_{it}\times B_{it}$$ | 0.942 |  | 1.234 |
| t-stat. | (0.405) |  | (0.512) |
| $$G_{it}\times X_{it}$$ |  | -3.317 | -4.523 |
| t-stat. |  | (-0.504) | (-0.665) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.900 | 0.900 | 0.900 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -0.779 | (-0.379) |
| $$B_{it}$$ | 4.370*** | (6.317) |
| $$X_{it}$$ | -6.406 | (-1.166) |
| $$G_{it}\times B_{it}$$ | 1.234 | (0.512) |
| $$G_{it}\times X_{it}$$ | -4.523 | (-0.665) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.667 | 0.328 | 0.646 | -1.188 | 1.637 |
| mG_hat_full | 1120 | 1.313 | 0.498 | 1.328 | -0.521 | 2.617 |
| sg_G_hat_full | 1120 | -1.313 | 0.498 | -1.328 | -2.617 | 0.521 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.014 | 0.089** | 0.089** |
| t-stat. | (0.600) | (2.062) | (2.051) |
| G_it_x_theta_F_it |  | -0.114** | -0.116** |
| t-stat. |  | (-2.162) | (-2.194) |
| theta_F_it |  |  | 0.016 |
| t-stat. |  |  | (1.049) |
| Real GDP | 8.278*** | 8.290*** | 7.694*** |
| t-stat. | (5.421) | (5.441) | (5.231) |
| Real GDP growth | -0.336*** | -0.337*** | -0.332*** |
| t-stat. | (-3.703) | (-3.725) | (-3.699) |
| CPI inflation | -0.173** | -0.171** | -0.171** |
| t-stat. | (-2.082) | (-2.062) | (-2.031) |
| Overall balance/GDP | -0.476*** | -0.480*** | -0.471*** |
| t-stat. | (-5.948) | (-6.013) | (-5.906) |
| International reserves | 0.022 | 0.022 | 0.023 |
| t-stat. | (1.578) | (1.545) | (1.643) |
| Government effectiveness | -2.099** | -2.013** | -1.967** |
| t-stat. | (-2.202) | (-2.122) | (-2.083) |
| Regulatory quality | 1.576* | 1.596* | 1.595* |
| t-stat. | (1.788) | (1.814) | (1.815) |
| Terms of trade | 0.043*** | 0.045*** | 0.044*** |
| t-stat. | (2.734) | (2.805) | (2.784) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.549 | 0.040 | 0.041 |
| p(lambda1=0) |  | 0.031 | 0.028 |
| p(lambda2=0) |  |  | 0.294 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.424 | 0.425 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.643 | 0.030 | 1.040 | 0.299 | 530 | 38 | 0.450 |
| Top 50% | 0.643 |  | -0.022 | -0.757 | 0.449 | 530 | 44 | 0.462 |
| 0-20% |  | 0.444 | 0.046 | 1.146 | 0.254 | 212 | 26 | 0.398 |
| 20-40% | 0.444 | 0.576 | 0.010 | 0.214 | 0.831 | 212 | 32 | 0.465 |
| 40-60% | 0.576 | 0.729 | -0.105 | -0.833 | 0.406 | 212 | 32 | 0.608 |
| 60-80% | 0.729 | 0.918 | -0.273** | -2.057 | 0.041 | 212 | 26 | 0.609 |
| 80-100% | 0.918 |  | -0.017 | -0.560 | 0.577 | 212 | 24 | 0.530 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 0.149 |
| RSS | 1.986 |
| Low-theta observations | 42 |
| High-theta observations | 1018 |
| Low share | 0.040 |
| High share | 0.960 |
| $$\lambda_L$$ | 0.338*** |
| t-stat. $$\lambda_L$$ | 3.568 |
| $$\lambda_H$$ | 0.006 |
| t-stat. $$\lambda_H$$ | 0.249 |
| $$\lambda_L-\lambda_H$$ | 0.332*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.001 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.425 |
