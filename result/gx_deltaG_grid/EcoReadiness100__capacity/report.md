# Delta-G/Source-X Combination Report: `EcoReadiness100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `EcoReadiness100`.
- $$X_{it}$$ source: `capacity`.
- Delta `G` is computed within country as `G_it - G_i,t-1`; the first country-year observation is missing by construction.
- Delta `G`, source `X`, `B`, and all controls are scaled by 0.01 before estimation.
- Output directory: `result/gx_deltaG_grid/EcoReadiness100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -1.496** | (-2.461) |
| $$B_{it}$$ | 4.357*** | (6.112) |
| $$X_{it}$$ | 0.759 | (0.259) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | -1.895 | 2.684 | 2.906 |
| t-stat. | (-1.563) | (1.075) | (0.896) |
| $$B_{it}$$ | 4.355*** | 4.351*** | 4.352*** |
| t-stat. | (6.102) | (6.108) | (6.101) |
| $$X_{it}$$ | 0.763 | 0.966 | 0.969 |
| t-stat. | (0.260) | (0.329) | (0.330) |
| $$G_{it}\times B_{it}$$ | 0.841 |  | -0.268 |
| t-stat. | (0.357) |  | (-0.110) |
| $$G_{it}\times X_{it}$$ |  | -7.741* | -7.916* |
| t-stat. |  | (-1.814) | (-1.736) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.900 | 0.900 | 0.900 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 2.906 | (0.896) |
| $$B_{it}$$ | 4.352*** | (6.101) |
| $$X_{it}$$ | 0.969 | (0.330) |
| $$G_{it}\times B_{it}$$ | -0.268 | (-0.110) |
| $$G_{it}\times X_{it}$$ | -7.916* | (-1.736) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.164 | 0.624 | 0.001 | -0.835 | 3.063 |
| mG_hat_full | 1120 | 0.400 | 1.108 | -0.001 | -1.348 | 3.076 |
| sg_G_hat_full | 1120 | -0.400 | 1.108 | 0.001 | -3.076 | 1.348 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.014 | 0.015 | 0.015 |
| t-stat. | (0.600) | (0.465) | (0.465) |
| G_it_x_theta_F_it |  | -0.001 | 0.000 |
| t-stat. |  | (-0.037) | (0.007) |
| theta_F_it |  |  | -0.008 |
| t-stat. |  |  | (-0.277) |
| Real GDP | 8.278*** | 8.273*** | 8.299*** |
| t-stat. | (5.421) | (5.352) | (5.380) |
| Real GDP growth | -0.336*** | -0.336*** | -0.345*** |
| t-stat. | (-3.703) | (-3.704) | (-3.532) |
| CPI inflation | -0.173** | -0.173** | -0.173** |
| t-stat. | (-2.082) | (-2.078) | (-2.108) |
| Overall balance/GDP | -0.476*** | -0.476*** | -0.475*** |
| t-stat. | (-5.948) | (-5.941) | (-5.918) |
| International reserves | 0.022 | 0.022 | 0.021 |
| t-stat. | (1.578) | (1.579) | (1.479) |
| Government effectiveness | -2.099** | -2.097** | -2.140** |
| t-stat. | (-2.202) | (-2.187) | (-2.244) |
| Regulatory quality | 1.576* | 1.578* | 1.482 |
| t-stat. | (1.788) | (1.780) | (1.582) |
| Terms of trade | 0.043*** | 0.043*** | 0.044*** |
| t-stat. | (2.734) | (2.732) | (2.755) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.549 | 0.642 | 0.642 |
| p(lambda1=0) |  | 0.971 | 0.994 |
| p(lambda2=0) |  |  | 0.782 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.423 | 0.422 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -0.003 | 0.078 | 1.240 | 0.216 | 530 | 28 | 0.473 |
| Top 50% | -0.003 |  | 0.033 | 1.233 | 0.218 | 530 | 37 | 0.381 |
| 0-20% |  | -0.369 | 0.057 | 0.411 | 0.682 | 212 | 16 | 0.582 |
| 20-40% | -0.369 | -0.108 | 0.161 | 1.067 | 0.288 | 212 | 19 | 0.487 |
| 40-60% | -0.108 | 0.246 | 0.047 | 0.973 | 0.332 | 212 | 21 | 0.505 |
| 60-80% | 0.246 | 0.612 | -0.012 | -0.387 | 0.699 | 212 | 23 | 0.519 |
| 80-100% | 0.612 |  | 0.081* | 1.747 | 0.083 | 212 | 22 | 0.396 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 2.522 |
| RSS | 1.862 |
| Low-theta observations | 1057 |
| High-theta observations | 3 |
| Low share | 0.997 |
| High share | 0.003 |
| $$\lambda_L$$ | 0.012 |
| t-stat. $$\lambda_L$$ | 0.490 |
| $$\lambda_H$$ | 63.921*** |
| t-stat. $$\lambda_H$$ | 9.235 |
| $$\lambda_L-\lambda_H$$ | -63.909*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.461 |
