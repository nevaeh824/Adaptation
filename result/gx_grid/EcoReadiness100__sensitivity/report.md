# G/X Combination Report: `EcoReadiness100__sensitivity`

## 1. Specification

- $$G_{it}$$ source: `EcoReadiness100`
- $$X_{it}$$ source: `sensitivity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/EcoReadiness100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -1.808*** | (-3.205) |
| $$B_{it}$$ | 4.393*** | (6.319) |
| $$X_{it}$$ | -3.810 | (-0.693) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 2.153 | -3.312** | -0.860 |
| t-stat. | (1.601) | (-2.367) | (-0.563) |
| $$B_{it}$$ | 8.966*** | 4.398*** | 9.217*** |
| t-stat. | (5.449) | (6.327) | (5.428) |
| $$X_{it}$$ | -3.443 | -5.933 | -7.972 |
| t-stat. | (-0.644) | (-0.979) | (-1.274) |
| $$G_{it}\times B_{it}$$ | -8.714*** |  | -9.171*** |
| t-stat. | (-3.516) |  | (-3.540) |
| $$G_{it}\times X_{it}$$ |  | 5.039 | 10.797** |
| t-stat. |  | (1.074) | (1.989) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.903 | 0.900 | 0.904 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -0.860 | (-0.563) |
| $$B_{it}$$ | 9.217*** | (5.428) |
| $$X_{it}$$ | -7.972 | (-1.274) |
| $$G_{it}\times B_{it}$$ | -9.171*** | (-3.540) |
| $$G_{it}\times X_{it}$$ | 10.797** | (1.989) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.904 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 3.125 | 5.298 | 1.350 | -0.438 | 41.617 |
| mG_hat_full | 1120 | 3.364 | 3.178 | 2.656 | -2.385 | 18.192 |
| sg_G_hat_full | 1120 | -3.364 | 3.178 | -2.656 | -18.192 | 2.385 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.037*** | -0.027* | -0.033** |
| t-stat. | (-2.639) | (-1.914) | (-2.064) |
| G_it_x_theta_F_it |  | -0.010*** | -0.006 |
| t-stat. |  | (-3.968) | (-1.042) |
| theta_F_it |  |  | -0.002 |
| t-stat. |  |  | (-0.552) |
| Real GDP | 7.852*** | 3.575** | 3.275* |
| t-stat. | (5.133) | (2.282) | (1.889) |
| Real GDP growth | -0.320*** | -0.339*** | -0.345*** |
| t-stat. | (-3.505) | (-3.784) | (-3.810) |
| CPI inflation | -0.166** | -0.171** | -0.172** |
| t-stat. | (-1.997) | (-2.088) | (-2.092) |
| Overall balance/GDP | -0.467*** | -0.472*** | -0.467*** |
| t-stat. | (-5.837) | (-5.781) | (-5.667) |
| International reserves | 0.021 | 0.010 | 0.010 |
| t-stat. | (1.504) | (0.780) | (0.724) |
| Government effectiveness | -2.207** | -1.101 | -1.041 |
| t-stat. | (-2.323) | (-1.124) | (-1.046) |
| Regulatory quality | 1.826** | 0.093 | 0.045 |
| t-stat. | (2.046) | (0.101) | (0.049) |
| Terms of trade | 0.045*** | 0.035** | 0.036** |
| t-stat. | (2.818) | (2.375) | (2.455) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.008 | 0.056 | 0.039 |
| p(lambda1=0) |  | 0.000 | 0.298 |
| p(lambda2=0) |  |  | 0.581 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.425 | 0.450 | 0.450 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 1.328 | -0.033* | -1.964 | 0.050 | 530 | 43 | 0.483 |
| Top 50% | 1.328 |  | -0.053 | -1.600 | 0.110 | 530 | 48 | 0.479 |
| 0-20% |  | 0.329 | -0.002 | -0.070 | 0.944 | 212 | 29 | 0.469 |
| 20-40% | 0.329 | 0.903 | -0.026 | -0.876 | 0.382 | 212 | 35 | 0.601 |
| 40-60% | 0.903 | 1.937 | -0.039 | -1.244 | 0.216 | 212 | 39 | 0.507 |
| 60-80% | 1.937 | 4.242 | -0.123** | -2.141 | 0.034 | 212 | 35 | 0.469 |
| 80-100% | 4.242 |  | -0.116 | -1.198 | 0.233 | 212 | 21 | 0.638 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 7.181 |
| RSS | 1.906 |
| Low-theta observations | 951 |
| High-theta observations | 109 |
| Low share | 0.897 |
| High share | 0.103 |
| $$\lambda_L$$ | -0.032** |
| t-stat. $$\lambda_L$$ | -2.306 |
| $$\lambda_H$$ | -0.124*** |
| t-stat. $$\lambda_H$$ | -4.286 |
| $$\lambda_L-\lambda_H$$ | 0.093*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.448 |
