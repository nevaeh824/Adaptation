# G/X Combination Report: `readiness_delta100__sensitivity`

## 1. Specification

- $$G_{it}$$ source: `readiness_delta100`
- $$X_{it}$$ source: `sensitivity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/readiness_delta100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.589* | (-1.807) |
| $$B_{it}$$ | 4.592*** | (6.425) |
| $$X_{it}$$ | -5.774 | (-1.057) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 6.842*** | -7.868** | -5.384 |
| t-stat. | (3.156) | (-2.458) | (-1.540) |
| $$B_{it}$$ | 6.391*** | 4.575*** | 6.561*** |
| t-stat. | (7.381) | (6.380) | (7.640) |
| $$X_{it}$$ | 0.579 | -6.655 | -0.896 |
| t-stat. | (0.114) | (-1.202) | (-0.173) |
| $$G_{it}\times B_{it}$$ | -21.856*** |  | -24.443*** |
| t-stat. | (-5.099) |  | (-5.572) |
| $$G_{it}\times X_{it}$$ |  | 18.732* | 47.344*** |
| t-stat. |  | (1.700) | (3.673) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.905 | 0.900 | 0.906 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -5.384 | (-1.540) |
| $$B_{it}$$ | 6.561*** | (7.640) |
| $$X_{it}$$ | -0.896 | (-0.173) |
| $$G_{it}\times B_{it}$$ | -24.443*** | (-5.572) |
| $$G_{it}\times X_{it}$$ | 47.344*** | (3.673) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.906 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 6.916 | 13.298 | 2.532 | -2.857 | 103.642 |
| mG_hat_full | 1120 | 6.789 | 8.667 | 5.242 | -11.740 | 45.304 |
| sg_G_hat_full | 1120 | -6.789 | 8.667 | -5.242 | -45.304 | 11.740 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.073 | -0.034 | -0.016 |
| t-stat. | (-1.463) | (-0.641) | (-0.314) |
| G_it_x_theta_F_it |  | -0.009** | 0.001 |
| t-stat. |  | (-2.522) | (0.146) |
| theta_F_it |  |  | -0.002** |
| t-stat. |  |  | (-2.347) |
| Real GDP | 8.143*** | 7.196*** | 3.731** |
| t-stat. | (5.436) | (4.965) | (1.997) |
| Real GDP growth | -0.342*** | -0.350*** | -0.369*** |
| t-stat. | (-3.715) | (-3.826) | (-4.100) |
| CPI inflation | -0.173** | -0.173** | -0.180** |
| t-stat. | (-2.053) | (-2.020) | (-2.170) |
| Overall balance/GDP | -0.480*** | -0.487*** | -0.467*** |
| t-stat. | (-6.090) | (-6.079) | (-5.764) |
| International reserves | 0.018 | 0.016 | 0.011 |
| t-stat. | (1.299) | (1.156) | (0.776) |
| Government effectiveness | -1.777* | -1.382 | -0.923 |
| t-stat. | (-1.895) | (-1.451) | (-0.944) |
| Regulatory quality | 1.637* | 1.072 | -0.072 |
| t-stat. | (1.857) | (1.205) | (-0.078) |
| Terms of trade | 0.044*** | 0.040*** | 0.037** |
| t-stat. | (2.845) | (2.643) | (2.509) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.144 | 0.522 | 0.753 |
| p(lambda1=0) |  | 0.012 | 0.884 |
| p(lambda2=0) |  |  | 0.019 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.425 | 0.432 | 0.445 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 2.485 | -0.081 | -1.442 | 0.150 | 530 | 46 | 0.484 |
| Top 50% | 2.485 |  | -0.095 | -0.986 | 0.325 | 530 | 45 | 0.482 |
| 0-20% |  | 0.031 | -0.075 | -0.842 | 0.401 | 212 | 27 | 0.400 |
| 20-40% | 0.031 | 1.609 | 0.002 | 0.026 | 0.980 | 212 | 35 | 0.599 |
| 40-60% | 1.609 | 3.766 | -0.024 | -0.160 | 0.873 | 212 | 37 | 0.392 |
| 60-80% | 3.766 | 9.666 | 0.085 | 0.635 | 0.526 | 212 | 35 | 0.497 |
| 80-100% | 9.666 |  | -0.385 | -1.337 | 0.183 | 212 | 21 | 0.663 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 8.033 |
| RSS | 1.954 |
| Low-theta observations | 821 |
| High-theta observations | 239 |
| Low share | 0.775 |
| High share | 0.225 |
| $$\lambda_L$$ | -0.046 |
| t-stat. $$\lambda_L$$ | -0.892 |
| $$\lambda_H$$ | -0.250*** |
| t-stat. $$\lambda_H$$ | -3.555 |
| $$\lambda_L-\lambda_H$$ | 0.203*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.003 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.434 |
