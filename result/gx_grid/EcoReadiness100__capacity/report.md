# G/X Combination Report: `EcoReadiness100__capacity`

## 1. Specification

- $$G_{it}$$ source: `EcoReadiness100`
- $$X_{it}$$ source: `capacity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/EcoReadiness100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -1.891*** | (-3.319) |
| $$B_{it}$$ | 4.427*** | (6.194) |
| $$X_{it}$$ | 1.827 | (0.631) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 2.081 | -1.017 | 6.523*** |
| t-stat. | (1.578) | (-0.533) | (2.904) |
| $$B_{it}$$ | 9.001*** | 4.426*** | 9.525*** |
| t-stat. | (5.414) | (6.184) | (5.767) |
| $$X_{it}$$ | 1.678 | 2.631 | 5.327 |
| t-stat. | (0.588) | (0.764) | (1.471) |
| $$G_{it}\times B_{it}$$ | -8.720*** |  | -9.727*** |
| t-stat. | (-3.513) |  | (-4.029) |
| $$G_{it}\times X_{it}$$ |  | -1.632 | -7.438** |
| t-stat. |  | (-0.456) | (-2.016) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.903 | 0.900 | 0.904 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 6.523*** | (2.904) |
| $$B_{it}$$ | 9.525*** | (5.767) |
| $$X_{it}$$ | 5.327 | (1.471) |
| $$G_{it}\times B_{it}$$ | -9.727*** | (-4.029) |
| $$G_{it}\times X_{it}$$ | -7.438** | (-2.016) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.904 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 2.519 | 5.012 | 0.937 | -0.671 | 40.317 |
| mG_hat_full | 1120 | 2.337 | 3.289 | 1.804 | -3.126 | 17.623 |
| sg_G_hat_full | 1120 | -2.337 | 3.289 | -1.804 | -17.623 | 3.126 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.037*** | -0.027* | -0.034** |
| t-stat. | (-2.639) | (-1.903) | (-2.072) |
| G_it_x_theta_F_it |  | -0.010*** | -0.005 |
| t-stat. |  | (-3.530) | (-0.872) |
| theta_F_it |  |  | -0.002 |
| t-stat. |  |  | (-0.612) |
| Real GDP | 7.852*** | 3.821** | 3.467* |
| t-stat. | (5.133) | (2.372) | (1.895) |
| Real GDP growth | -0.320*** | -0.342*** | -0.349*** |
| t-stat. | (-3.505) | (-3.809) | (-3.846) |
| CPI inflation | -0.166** | -0.169** | -0.169** |
| t-stat. | (-1.997) | (-2.087) | (-2.090) |
| Overall balance/GDP | -0.467*** | -0.465*** | -0.459*** |
| t-stat. | (-5.837) | (-5.695) | (-5.574) |
| International reserves | 0.021 | 0.011 | 0.010 |
| t-stat. | (1.504) | (0.843) | (0.773) |
| Government effectiveness | -2.207** | -1.123 | -1.070 |
| t-stat. | (-2.323) | (-1.136) | (-1.065) |
| Regulatory quality | 1.826** | 0.094 | 0.077 |
| t-stat. | (2.046) | (0.100) | (0.081) |
| Terms of trade | 0.045*** | 0.035** | 0.036** |
| t-stat. | (2.818) | (2.336) | (2.447) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.008 | 0.057 | 0.039 |
| p(lambda1=0) |  | 0.000 | 0.383 |
| p(lambda2=0) |  |  | 0.541 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.425 | 0.448 | 0.448 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 0.870 | -0.019 | -1.152 | 0.250 | 530 | 43 | 0.497 |
| Top 50% | 0.870 |  | -0.037 | -1.230 | 0.219 | 530 | 46 | 0.460 |
| 0-20% |  | -0.109 | -0.030 | -0.625 | 0.533 | 212 | 23 | 0.360 |
| 20-40% | -0.109 | 0.460 | 0.002 | 0.091 | 0.928 | 212 | 36 | 0.646 |
| 40-60% | 0.460 | 1.407 | -0.012 | -0.207 | 0.836 | 212 | 39 | 0.658 |
| 60-80% | 1.407 | 3.491 | -0.065* | -1.947 | 0.053 | 212 | 35 | 0.452 |
| 80-100% | 3.491 |  | -0.087 | -1.197 | 0.233 | 212 | 24 | 0.551 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 4.932 |
| RSS | 1.918 |
| Low-theta observations | 913 |
| High-theta observations | 147 |
| Low share | 0.861 |
| High share | 0.139 |
| $$\lambda_L$$ | -0.033** |
| t-stat. $$\lambda_L$$ | -2.378 |
| $$\lambda_H$$ | -0.114*** |
| t-stat. $$\lambda_H$$ | -3.956 |
| $$\lambda_L-\lambda_H$$ | 0.081*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.001 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.445 |
