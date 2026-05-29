# G/X Combination Report: `social100__capacity`

## 1. Specification

- $$G_{it}$$ source: `social100`
- $$X_{it}$$ source: `capacity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/social100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 0.267 | (0.158) |
| $$B_{it}$$ | 4.321*** | (5.894) |
| $$X_{it}$$ | 0.699 | (0.235) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 10.698*** | -9.624** | 8.654** |
| t-stat. | (5.730) | (-2.405) | (2.011) |
| $$B_{it}$$ | 12.739*** | 4.212*** | 12.620*** |
| t-stat. | (8.402) | (5.760) | (7.931) |
| $$X_{it}$$ | 4.331 | -7.357* | 2.723 |
| t-stat. | (1.368) | (-1.687) | (0.569) |
| $$G_{it}\times B_{it}$$ | -17.902*** |  | -17.693*** |
| t-stat. | (-6.970) |  | (-6.588) |
| $$G_{it}\times X_{it}$$ |  | 29.247*** | 5.683 |
| t-stat. |  | (2.780) | (0.541) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.910 | 0.900 | 0.910 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 8.654** | (2.011) |
| $$B_{it}$$ | 12.620*** | (7.931) |
| $$X_{it}$$ | 2.723 | (0.569) |
| $$G_{it}\times B_{it}$$ | -17.693*** | (-6.588) |
| $$G_{it}\times X_{it}$$ | 5.683 | (0.541) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.910 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 2.170 | 8.594 | -0.796 | -2.295 | 69.494 |
| mG_hat_full | 1120 | -0.168 | 6.506 | -1.629 | -12.004 | 30.377 |
| sg_G_hat_full | 1120 | 0.168 | 6.506 | 1.629 | -30.377 | 12.004 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.020 | 0.052 | 0.087 |
| t-stat. | (-0.296) | (0.722) | (1.147) |
| G_it_x_theta_F_it |  | -0.004*** | 0.014 |
| t-stat. |  | (-3.090) | (1.531) |
| theta_F_it |  |  | -0.011** |
| t-stat. |  |  | (-1.972) |
| Real GDP | 8.375*** | 4.507*** | 3.470* |
| t-stat. | (5.067) | (2.594) | (1.864) |
| Real GDP growth | -0.338*** | -0.335*** | -0.384*** |
| t-stat. | (-3.558) | (-3.617) | (-4.032) |
| CPI inflation | -0.172** | -0.180** | -0.174** |
| t-stat. | (-2.068) | (-2.174) | (-2.352) |
| Overall balance/GDP | -0.474*** | -0.468*** | -0.453*** |
| t-stat. | (-5.934) | (-5.836) | (-5.462) |
| International reserves | 0.022 | 0.016 | 0.014 |
| t-stat. | (1.543) | (1.191) | (1.064) |
| Government effectiveness | -2.007** | -1.443 | -0.950 |
| t-stat. | (-2.221) | (-1.577) | (-0.963) |
| Regulatory quality | 1.453 | 0.896 | -0.266 |
| t-stat. | (1.506) | (0.961) | (-0.248) |
| Terms of trade | 0.043*** | 0.038** | 0.041*** |
| t-stat. | (2.638) | (2.448) | (2.741) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.768 | 0.471 | 0.252 |
| p(lambda1=0) |  | 0.002 | 0.126 |
| p(lambda2=0) |  |  | 0.049 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.435 | 0.453 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -0.819 | -0.086* | -1.954 | 0.051 | 530 | 42 | 0.521 |
| Top 50% | -0.819 |  | 0.156 | 0.882 | 0.378 | 530 | 50 | 0.469 |
| 0-20% |  | -1.598 | -0.078 | -0.699 | 0.486 | 212 | 26 | 0.491 |
| 20-40% | -1.598 | -1.176 | -0.033 | -0.490 | 0.625 | 212 | 36 | 0.591 |
| 40-60% | -1.176 | -0.136 | 0.225 | 1.175 | 0.242 | 212 | 38 | 0.449 |
| 60-80% | -0.136 | 2.991 | 1.017** | 2.355 | 0.020 | 212 | 32 | 0.561 |
| 80-100% | 2.991 |  | -0.348** | -2.009 | 0.046 | 212 | 23 | 0.658 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 7.334 |
| RSS | 1.927 |
| Low-theta observations | 941 |
| High-theta observations | 119 |
| Low share | 0.888 |
| High share | 0.112 |
| $$\lambda_L$$ | 0.034 |
| t-stat. $$\lambda_L$$ | 0.485 |
| $$\lambda_H$$ | -0.063 |
| t-stat. $$\lambda_H$$ | -0.994 |
| $$\lambda_L-\lambda_H$$ | 0.097*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.442 |
