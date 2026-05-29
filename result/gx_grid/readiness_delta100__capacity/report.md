# G/X Combination Report: `readiness_delta100__capacity`

## 1. Specification

- $$G_{it}$$ source: `readiness_delta100`
- $$X_{it}$$ source: `capacity`
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Output directory: `result/gx_grid/readiness_delta100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -2.584* | (-1.814) |
| $$B_{it}$$ | 4.555*** | (6.226) |
| $$X_{it}$$ | -0.023 | (-0.008) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 6.864*** | 0.553 | 11.634*** |
| t-stat. | (3.111) | (0.169) | (3.282) |
| $$B_{it}$$ | 6.413*** | 4.508*** | 6.370*** |
| t-stat. | (7.205) | (6.110) | (7.123) |
| $$X_{it}$$ | 0.793 | 0.978 | 2.286 |
| t-stat. | (0.280) | (0.326) | (0.758) |
| $$G_{it}\times B_{it}$$ | -21.829*** |  | -22.125*** |
| t-stat. | (-5.025) |  | (-5.127) |
| $$G_{it}\times X_{it}$$ |  | -7.317 | -10.828 |
| t-stat. |  | (-1.001) | (-1.428) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.905 | 0.900 | 0.905 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 11.634*** | (3.282) |
| $$B_{it}$$ | 6.370*** | (7.123) |
| $$X_{it}$$ | 2.286 | (0.758) |
| $$G_{it}\times B_{it}$$ | -22.125*** | (-5.127) |
| $$G_{it}\times X_{it}$$ | -10.828 | (-1.428) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.905 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | 6.291 | 11.900 | 2.460 | -0.932 | 95.482 |
| mG_hat_full | 1120 | 6.098 | 7.505 | 4.661 | -6.096 | 41.737 |
| sg_G_hat_full | 1120 | -6.098 | 7.505 | -4.661 | -41.737 | 6.096 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.073 | -0.035 | -0.016 |
| t-stat. | (-1.463) | (-0.641) | (-0.299) |
| G_it_x_theta_F_it |  | -0.009** | 0.001 |
| t-stat. |  | (-2.254) | (0.162) |
| theta_F_it |  |  | -0.002** |
| t-stat. |  |  | (-2.186) |
| Real GDP | 8.143*** | 7.201*** | 3.795** |
| t-stat. | (5.436) | (4.975) | (1.966) |
| Real GDP growth | -0.342*** | -0.349*** | -0.372*** |
| t-stat. | (-3.715) | (-3.814) | (-4.101) |
| CPI inflation | -0.173** | -0.172** | -0.178** |
| t-stat. | (-2.053) | (-2.012) | (-2.183) |
| Overall balance/GDP | -0.480*** | -0.481*** | -0.462*** |
| t-stat. | (-6.090) | (-5.980) | (-5.699) |
| International reserves | 0.018 | 0.017 | 0.010 |
| t-stat. | (1.299) | (1.220) | (0.755) |
| Government effectiveness | -1.777* | -1.431 | -0.890 |
| t-stat. | (-1.895) | (-1.508) | (-0.899) |
| Regulatory quality | 1.637* | 1.157 | -0.088 |
| t-stat. | (1.857) | (1.296) | (-0.092) |
| Terms of trade | 0.044*** | 0.040*** | 0.037** |
| t-stat. | (2.845) | (2.600) | (2.469) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.144 | 0.522 | 0.765 |
| p(lambda1=0) |  | 0.024 | 0.871 |
| p(lambda2=0) |  |  | 0.029 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.425 | 0.430 | 0.444 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | 2.392 | 0.013 | 0.233 | 0.816 | 530 | 40 | 0.486 |
| Top 50% | 2.392 |  | -0.066 | -0.741 | 0.459 | 530 | 45 | 0.467 |
| 0-20% |  | 0.131 | -0.055 | -0.687 | 0.493 | 212 | 25 | 0.417 |
| 20-40% | 0.131 | 1.231 | 0.089 | 0.999 | 0.320 | 212 | 37 | 0.600 |
| 40-60% | 1.231 | 3.770 | 0.268** | 2.011 | 0.046 | 212 | 39 | 0.646 |
| 60-80% | 3.770 | 8.639 | -0.007 | -0.064 | 0.949 | 212 | 33 | 0.432 |
| 80-100% | 8.639 |  | -0.183 | -0.680 | 0.498 | 212 | 23 | 0.565 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 5.654 |
| RSS | 1.950 |
| Low-theta observations | 740 |
| High-theta observations | 320 |
| Low share | 0.698 |
| High share | 0.302 |
| $$\lambda_L$$ | -0.031 |
| t-stat. $$\lambda_L$$ | -0.581 |
| $$\lambda_H$$ | -0.232*** |
| t-stat. $$\lambda_H$$ | -3.764 |
| $$\lambda_L-\lambda_H$$ | 0.201*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.001 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.435 |
