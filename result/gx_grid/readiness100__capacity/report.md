# G/X Combination Report: `readiness100__capacity`

## 1. Specification

- $$G_{it}$$ source: `readiness100`
- $$X_{it}$$ source: `capacity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/readiness100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -5.503*** | (-3.202) |
| $$B_{it}$$ | 4.531*** | (6.346) |
| $$X_{it}$$ | 1.138 | (0.397) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.901 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 6.904*** | -5.897 | 11.838** |
| t-stat. | (3.249) | (-1.176) | (2.342) |
| $$B_{it}$$ | 19.655*** | 4.532*** | 19.809*** |
| t-stat. | (8.690) | (6.339) | (8.770) |
| $$X_{it}$$ | 3.372 | 0.779 | 7.760 |
| t-stat. | (1.159) | (0.151) | (1.384) |
| $$G_{it}\times B_{it}$$ | -27.621*** |  | -27.926*** |
| t-stat. | (-7.712) |  | (-7.832) |
| $$G_{it}\times X_{it}$$ |  | 0.800 | -9.727 |
| t-stat. |  | (0.086) | (-1.007) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.914 | 0.900 | 0.914 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 11.838** | (2.342) |
| $$B_{it}$$ | 19.809*** | (8.770) |
| $$X_{it}$$ | 7.760 | (1.384) |
| $$G_{it}\times B_{it}$$ | -27.926*** | (-7.832) |
| $$G_{it}\times X_{it}$$ | -9.727 | (-1.007) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.914 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 8.774 | 15.606 | 3.735 | -0.783 | 124.737 |
| mG_hat_full | 1120 | 8.979 | 9.537 | 7.069 | -6.437 | 54.525 |
| sg_G_hat_full | 1120 | -8.979 | 9.537 | -7.069 | -54.525 | 6.437 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.103*** | -0.074* | -0.084** |
| t-stat. | (-2.614) | (-1.858) | (-1.981) |
| G_it_x_theta_F_it |  | -0.003*** | 0.001 |
| t-stat. |  | (-3.661) | (0.160) |
| theta_F_it |  |  | -0.002 |
| t-stat. |  |  | (-0.622) |
| Real GDP | 8.171*** | 4.072*** | 3.793** |
| t-stat. | (5.412) | (2.667) | (2.245) |
| Real GDP growth | -0.326*** | -0.346*** | -0.367*** |
| t-stat. | (-3.610) | (-3.909) | (-3.788) |
| CPI inflation | -0.166** | -0.171** | -0.173** |
| t-stat. | (-1.976) | (-2.054) | (-2.109) |
| Overall balance/GDP | -0.468*** | -0.468*** | -0.455*** |
| t-stat. | (-5.849) | (-5.730) | (-5.392) |
| International reserves | 0.020 | 0.010 | 0.010 |
| t-stat. | (1.465) | (0.777) | (0.742) |
| Government effectiveness | -1.913** | -0.887 | -0.795 |
| t-stat. | (-2.020) | (-0.912) | (-0.789) |
| Regulatory quality | 1.921** | 0.487 | 0.124 |
| t-stat. | (2.155) | (0.529) | (0.113) |
| Terms of trade | 0.044*** | 0.036** | 0.037** |
| t-stat. | (2.774) | (2.389) | (2.559) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.009 | 0.063 | 0.048 |
| p(lambda1=0) |  | 0.000 | 0.873 |
| p(lambda2=0) |  |  | 0.534 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.425 | 0.445 | 0.446 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 3.653 | -0.058 | -1.323 | 0.186 | 530 | 39 | 0.476 |
| Top 50% | 3.653 |  | -0.047 | -0.582 | 0.561 | 530 | 45 | 0.468 |
| 0-20% |  | 0.673 | -0.012 | -0.211 | 0.833 | 212 | 27 | 0.477 |
| 20-40% | 0.673 | 2.001 | -0.136 | -0.962 | 0.338 | 212 | 37 | 0.586 |
| 40-60% | 2.001 | 5.674 | 0.020 | 0.152 | 0.879 | 212 | 41 | 0.646 |
| 60-80% | 5.674 | 12.088 | -0.203** | -1.991 | 0.048 | 212 | 33 | 0.409 |
| 80-100% | 12.088 |  | -0.153 | -0.605 | 0.546 | 212 | 23 | 0.580 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 18.470 |
| RSS | 1.925 |
| Low-theta observations | 931 |
| High-theta observations | 129 |
| Low share | 0.878 |
| High share | 0.122 |
| $$\lambda_L$$ | -0.081** |
| t-stat. $$\lambda_L$$ | -2.043 |
| $$\lambda_H$$ | -0.159*** |
| t-stat. $$\lambda_H$$ | -3.760 |
| $$\lambda_L-\lambda_H$$ | 0.078*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.001 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.443 |
