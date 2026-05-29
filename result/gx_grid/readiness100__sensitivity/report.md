# G/X Combination Report: `readiness100__sensitivity`

## 1. Specification

- $$G_{it}$$ source: `readiness100`
- $$X_{it}$$ source: `sensitivity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/readiness100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -5.342*** | (-3.147) |
| $$B_{it}$$ | 4.512*** | (6.524) |
| $$X_{it}$$ | -3.423 | (-0.632) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.901 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 6.908*** | -9.986** | -3.255 |
| t-stat. | (3.224) | (-2.448) | (-0.821) |
| $$B_{it}$$ | 19.476*** | 4.540*** | 19.858*** |
| t-stat. | (8.789) | (6.555) | (8.945) |
| $$X_{it}$$ | 0.366 | -11.083 | -16.751* |
| t-stat. | (0.076) | (-1.180) | (-1.816) |
| $$G_{it}\times B_{it}$$ | -27.489*** |  | -28.078*** |
| t-stat. | (-7.759) |  | (-7.902) |
| $$G_{it}\times X_{it}$$ |  | 16.003 | 35.924*** |
| t-stat. |  | (1.222) | (2.662) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.914 | 0.901 | 0.915 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -3.255 | (-0.821) |
| $$B_{it}$$ | 19.858*** | (8.945) |
| $$X_{it}$$ | -16.751* | (-1.816) |
| $$G_{it}\times B_{it}$$ | -28.078*** | (-7.902) |
| $$G_{it}\times X_{it}$$ | 35.924*** | (2.662) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.915 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 9.438 | 16.136 | 4.054 | -1.485 | 126.627 |
| mG_hat_full | 1120 | 10.109 | 9.745 | 7.985 | -7.989 | 55.351 |
| sg_G_hat_full | 1120 | -10.109 | 9.745 | -7.985 | -55.351 | 7.989 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.103*** | -0.075* | -0.085** |
| t-stat. | (-2.614) | (-1.892) | (-1.990) |
| G_it_x_theta_F_it |  | -0.003*** | 0.001 |
| t-stat. |  | (-3.901) | (0.107) |
| theta_F_it |  |  | -0.002 |
| t-stat. |  |  | (-0.584) |
| Real GDP | 8.171*** | 3.980*** | 3.708** |
| t-stat. | (5.412) | (2.650) | (2.226) |
| Real GDP growth | -0.326*** | -0.345*** | -0.364*** |
| t-stat. | (-3.610) | (-3.906) | (-3.775) |
| CPI inflation | -0.166** | -0.172** | -0.174** |
| t-stat. | (-1.976) | (-2.050) | (-2.093) |
| Overall balance/GDP | -0.468*** | -0.472*** | -0.459*** |
| t-stat. | (-5.849) | (-5.790) | (-5.427) |
| International reserves | 0.020 | 0.010 | 0.010 |
| t-stat. | (1.465) | (0.759) | (0.726) |
| Government effectiveness | -1.913** | -0.899 | -0.798 |
| t-stat. | (-2.020) | (-0.929) | (-0.792) |
| Regulatory quality | 1.921** | 0.487 | 0.122 |
| t-stat. | (2.155) | (0.535) | (0.110) |
| Terms of trade | 0.044*** | 0.036** | 0.037** |
| t-stat. | (2.774) | (2.428) | (2.567) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.009 | 0.059 | 0.047 |
| p(lambda1=0) |  | 0.000 | 0.915 |
| p(lambda2=0) |  |  | 0.559 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.425 | 0.446 | 0.447 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 3.987 | -0.098** | -2.189 | 0.029 | 530 | 43 | 0.487 |
| Top 50% | 3.987 |  | -0.075 | -0.938 | 0.349 | 530 | 48 | 0.476 |
| 0-20% |  | 0.889 | -0.005 | -0.060 | 0.952 | 212 | 28 | 0.468 |
| 20-40% | 0.889 | 2.717 | -0.081 | -1.005 | 0.317 | 212 | 35 | 0.580 |
| 40-60% | 2.717 | 5.795 | -0.133 | -1.375 | 0.171 | 212 | 39 | 0.495 |
| 60-80% | 5.795 | 12.779 | -0.082 | -0.639 | 0.524 | 212 | 35 | 0.451 |
| 80-100% | 12.779 |  | -0.612*** | -2.648 | 0.009 | 212 | 21 | 0.644 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 21.805 |
| RSS | 1.907 |
| Low-theta observations | 950 |
| High-theta observations | 110 |
| Low share | 0.896 |
| High share | 0.104 |
| $$\lambda_L$$ | -0.077* |
| t-stat. $$\lambda_L$$ | -1.959 |
| $$\lambda_H$$ | -0.165*** |
| t-stat. $$\lambda_H$$ | -3.974 |
| $$\lambda_L-\lambda_H$$ | 0.087*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.448 |
