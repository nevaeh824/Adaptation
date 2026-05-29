# G/X Combination Report: `social100__sensitivity`

## 1. Specification

- $$G_{it}$$ source: `social100`
- $$X_{it}$$ source: `sensitivity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/social100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 0.310 | (0.189) |
| $$B_{it}$$ | 4.333*** | (6.033) |
| $$X_{it}$$ | -5.786 | (-1.066) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 10.252*** | -9.136* | -4.990 |
| t-stat. | (5.793) | (-1.941) | (-1.128) |
| $$B_{it}$$ | 12.509*** | 4.354*** | 12.879*** |
| t-stat. | (8.443) | (6.073) | (8.879) |
| $$X_{it}$$ | -1.477 | -22.420** | -28.859*** |
| t-stat. | (-0.301) | (-2.105) | (-2.879) |
| $$G_{it}\times B_{it}$$ | -17.630*** |  | -18.353*** |
| t-stat. | (-6.937) |  | (-7.399) |
| $$G_{it}\times X_{it}$$ |  | 37.733** | 62.517*** |
| t-stat. |  | (2.223) | (3.856) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.910 | 0.900 | 0.911 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -4.990 | (-1.128) |
| $$B_{it}$$ | 12.879*** | (8.879) |
| $$X_{it}$$ | -28.859*** | (-2.879) |
| $$G_{it}\times B_{it}$$ | -18.353*** | (-7.399) |
| $$G_{it}\times X_{it}$$ | 62.517*** | (3.856) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.911 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 0.988 | 7.935 | -0.733 | -8.573 | 59.141 |
| mG_hat_full | 1120 | -1.607 | 7.225 | -1.987 | -20.177 | 25.920 |
| sg_G_hat_full | 1120 | 1.607 | 7.225 | 1.987 | -25.920 | 20.177 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.020 | 0.049 | 0.091 |
| t-stat. | (-0.296) | (0.687) | (1.184) |
| G_it_x_theta_F_it |  | -0.004*** | 0.015 |
| t-stat. |  | (-3.234) | (1.462) |
| theta_F_it |  |  | -0.012* |
| t-stat. |  |  | (-1.900) |
| Real GDP | 8.375*** | 4.606*** | 3.419* |
| t-stat. | (5.067) | (2.658) | (1.800) |
| Real GDP growth | -0.338*** | -0.338*** | -0.374*** |
| t-stat. | (-3.558) | (-3.667) | (-4.014) |
| CPI inflation | -0.172** | -0.180** | -0.180** |
| t-stat. | (-2.068) | (-2.164) | (-2.301) |
| Overall balance/GDP | -0.474*** | -0.473*** | -0.456*** |
| t-stat. | (-5.934) | (-5.947) | (-5.551) |
| International reserves | 0.022 | 0.017 | 0.015 |
| t-stat. | (1.543) | (1.211) | (1.127) |
| Government effectiveness | -2.007** | -1.556* | -1.243 |
| t-stat. | (-2.221) | (-1.710) | (-1.310) |
| Regulatory quality | 1.453 | 0.932 | -0.167 |
| t-stat. | (1.506) | (1.006) | (-0.160) |
| Terms of trade | 0.043*** | 0.039** | 0.041*** |
| t-stat. | (2.638) | (2.550) | (2.737) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.768 | 0.492 | 0.237 |
| p(lambda1=0) |  | 0.001 | 0.144 |
| p(lambda2=0) |  |  | 0.058 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.423 | 0.436 | 0.452 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -0.728 | -0.007 | -0.131 | 0.896 | 530 | 42 | 0.511 |
| Top 50% | -0.728 |  | -0.025 | -0.183 | 0.855 | 530 | 38 | 0.452 |
| 0-20% |  | -2.824 | -0.217 | -1.164 | 0.246 | 212 | 18 | 0.390 |
| 20-40% | -2.824 | -1.325 | 0.055 | 0.557 | 0.578 | 212 | 24 | 0.627 |
| 40-60% | -1.325 | -0.278 | -0.189*** | -3.474 | 0.001 | 212 | 29 | 0.668 |
| 60-80% | -0.278 | 2.233 | 0.810** | 2.220 | 0.028 | 212 | 30 | 0.586 |
| 80-100% | 2.233 |  | -0.335** | -2.025 | 0.045 | 212 | 22 | 0.669 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 5.112 |
| RSS | 1.940 |
| Low-theta observations | 917 |
| High-theta observations | 143 |
| Low share | 0.865 |
| High share | 0.135 |
| $$\lambda_L$$ | 0.030 |
| t-stat. $$\lambda_L$$ | 0.416 |
| $$\lambda_H$$ | -0.055 |
| t-stat. $$\lambda_H$$ | -0.891 |
| $$\lambda_L-\lambda_H$$ | 0.085*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.001 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.439 |
