# G/X Combination Report: `governance100__capacity`

## 1. Specification

- $$G_{it}$$ source: `governance100`
- $$X_{it}$$ source: `capacity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/governance100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -9.678** | (-2.377) |
| $$B_{it}$$ | 4.349*** | (6.192) |
| $$X_{it}$$ | 0.094 | (0.032) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.901 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 1.653 | -16.038** | 3.204 |
| t-stat. | (0.496) | (-2.557) | (0.548) |
| $$B_{it}$$ | 17.978*** | 4.357*** | 18.042*** |
| t-stat. | (7.964) | (6.176) | (7.888) |
| $$X_{it}$$ | 2.159 | -6.696 | 3.765 |
| t-stat. | (0.725) | (-1.181) | (0.617) |
| $$G_{it}\times B_{it}$$ | -21.288*** |  | -21.391*** |
| t-stat. | (-7.066) |  | (-7.012) |
| $$G_{it}\times X_{it}$$ |  | 13.540 | -3.184 |
| t-stat. |  | (1.396) | (-0.329) |
| Countries | 59 | 59 | 59 |
| Observations | 1,103 | 1,103 | 1,103 |
| Adjusted $$R^2$$ | 0.913 | 0.901 | 0.913 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 3.204 | (0.548) |
| $$B_{it}$$ | 18.042*** | (7.888) |
| $$X_{it}$$ | 3.765 | (0.617) |
| $$G_{it}\times B_{it}$$ | -21.391*** | (-7.012) |
| $$G_{it}\times X_{it}$$ | -3.184 | (-0.329) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.913 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1103 | 9.417 | 13.588 | 5.002 | -0.037 | 106.478 |
| mG_hat_full | 1103 | 11.123 | 7.444 | 9.544 | -0.958 | 46.544 |
| sg_G_hat_full | 1103 | -11.123 | 7.444 | -9.544 | -46.544 | 0.958 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.021 | 0.046 | 0.026 |
| t-stat. | (0.169) | (0.376) | (0.225) |
| G_it_x_theta_F_it |  | -0.003*** | -0.001 |
| t-stat. |  | (-3.956) | (-0.337) |
| theta_F_it |  |  | -0.001 |
| t-stat. |  |  | (-0.400) |
| Real GDP | 8.157*** | 3.653** | 3.482* |
| t-stat. | (5.053) | (2.178) | (1.912) |
| Real GDP growth | -0.341*** | -0.365*** | -0.375*** |
| t-stat. | (-3.642) | (-3.979) | (-3.840) |
| CPI inflation | -0.174** | -0.176** | -0.179** |
| t-stat. | (-2.076) | (-2.109) | (-2.123) |
| Overall balance/GDP | -0.473*** | -0.479*** | -0.470*** |
| t-stat. | (-5.926) | (-5.826) | (-5.519) |
| International reserves | 0.022 | 0.010 | 0.009 |
| t-stat. | (1.595) | (0.711) | (0.707) |
| Government effectiveness | -2.180** | -1.009 | -0.877 |
| t-stat. | (-2.066) | (-0.952) | (-0.812) |
| Regulatory quality | 1.420 | -0.042 | -0.226 |
| t-stat. | (1.079) | (-0.031) | (-0.148) |
| Terms of trade | 0.043*** | 0.037** | 0.036** |
| t-stat. | (2.737) | (2.445) | (2.431) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.866 | 0.707 | 0.822 |
| p(lambda1=0) |  | 0.000 | 0.736 |
| p(lambda2=0) |  |  | 0.689 |
| Observations | 1044 | 1044 | 1044 |
| Countries | 59 | 59 | 59 |
| Adjusted R2 | 0.420 | 0.443 | 0.443 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 4.904 | 0.040 | 0.312 | 0.755 | 522 | 39 | 0.482 |
| Top 50% | 4.904 |  | 0.027 | 0.132 | 0.895 | 522 | 45 | 0.467 |
| 0-20% |  | 1.960 | 0.030 | 0.126 | 0.900 | 209 | 29 | 0.458 |
| 20-40% | 1.960 | 3.461 | -0.027 | -0.127 | 0.899 | 209 | 35 | 0.591 |
| 40-60% | 3.461 | 6.979 | 0.078 | 0.287 | 0.775 | 209 | 40 | 0.643 |
| 60-80% | 6.979 | 13.012 | 0.166 | 0.519 | 0.605 | 208 | 32 | 0.364 |
| 80-100% | 13.012 |  | -0.060 | -0.152 | 0.880 | 209 | 22 | 0.622 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 19.275 |
| RSS | 1.923 |
| Low-theta observations | 920 |
| High-theta observations | 124 |
| Low share | 0.881 |
| High share | 0.119 |
| $$\lambda_L$$ | 0.038 |
| t-stat. $$\lambda_L$$ | 0.304 |
| $$\lambda_H$$ | -0.029 |
| t-stat. $$\lambda_H$$ | -0.238 |
| $$\lambda_L-\lambda_H$$ | 0.066*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.001 |
| Observations | 1044 |
| Countries | 59 |
| Adjusted $$R^2$$ | 0.439 |
