# Delta-G/Source-X Combination Report: `social100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `social100`.
- $$X_{it}$$ source: `sensitivity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta `G` is then computed within country from scaled G as `scaled_G_it - scaled_G_i,t-1`; the first country-year observation is missing by construction.
- `X` remains the selected scaled source variable in levels, and `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_deltaG_grid/social100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 1.856 | (0.571) |
| $$B_{it}$$ | 4.351*** | (6.295) |
| $$X_{it}$$ | -5.545 | (-1.006) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 1.449 | -10.434 | -10.236 |
| t-stat. | (0.201) | (-0.967) | (-0.961) |
| $$B_{it}$$ | 4.349*** | 4.350*** | 4.355*** |
| t-stat. | (6.296) | (6.295) | (6.298) |
| $$X_{it}$$ | -5.564 | -5.796 | -5.760 |
| t-stat. | (-1.019) | (-1.049) | (-1.050) |
| $$G_{it}\times B_{it}$$ | 0.781 |  | -2.343 |
| t-stat. | (0.050) |  | (-0.137) |
| $$G_{it}\times X_{it}$$ |  | 50.400 | 54.593 |
| t-stat. |  | (1.238) | (1.064) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.899 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -10.236 | (-0.961) |
| $$B_{it}$$ | 4.355*** | (6.298) |
| $$X_{it}$$ | -5.760 | (-1.050) |
| $$G_{it}\times B_{it}$$ | -2.343 | (-0.137) |
| $$G_{it}\times X_{it}$$ | 54.593 | (1.064) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | -2.308 | 2.629 | -1.677 | -12.554 | 5.484 |
| mG_hat_full | 1120 | -3.834 | 4.005 | -3.334 | -14.462 | 4.645 |
| sg_G_hat_full | 1120 | 3.834 | 4.005 | 3.334 | -4.645 | 14.462 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.167 | 0.190 | 0.185 |
| t-stat. | (0.939) | (0.896) | (0.851) |
| G_it_x_theta_F_it |  | 0.023 | 0.021 |
| t-stat. |  | (0.420) | (0.384) |
| theta_F_it |  |  | 0.003 |
| t-stat. |  |  | (0.573) |
| Real GDP | 8.143*** | 8.158*** | 7.986*** |
| t-stat. | (5.296) | (5.306) | (5.099) |
| Real GDP growth | -0.339*** | -0.338*** | -0.343*** |
| t-stat. | (-3.756) | (-3.749) | (-3.715) |
| CPI inflation | -0.173** | -0.173** | -0.172** |
| t-stat. | (-2.049) | (-2.050) | (-2.094) |
| Overall balance/GDP | -0.478*** | -0.480*** | -0.478*** |
| t-stat. | (-5.969) | (-5.993) | (-5.890) |
| International reserves | 0.022 | 0.022 | 0.020 |
| t-stat. | (1.530) | (1.523) | (1.403) |
| Government effectiveness | -2.059** | -2.020** | -1.838* |
| t-stat. | (-2.137) | (-2.087) | (-1.818) |
| Regulatory quality | 1.592* | 1.579* | 1.406 |
| t-stat. | (1.798) | (1.793) | (1.481) |
| Terms of trade | 0.042*** | 0.042*** | 0.041** |
| t-stat. | (2.705) | (2.703) | (2.566) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.348 | 0.371 | 0.395 |
| p(lambda1=0) |  | 0.674 | 0.701 |
| p(lambda2=0) |  |  | 0.567 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.424 | 0.424 | 0.424 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -1.609 | 0.091 | 0.403 | 0.687 | 530 | 39 | 0.465 |
| Top 50% | -1.609 |  | 0.205 | 0.870 | 0.385 | 530 | 31 | 0.398 |
| 0-20% |  | -4.317 | 0.405 | 1.417 | 0.159 | 212 | 23 | 0.449 |
| 20-40% | -4.317 | -2.814 | 0.150 | 0.209 | 0.835 | 212 | 24 | 0.555 |
| 40-60% | -2.814 | -0.946 | -0.012 | -0.034 | 0.973 | 212 | 24 | 0.555 |
| 60-80% | -0.946 | -0.156 | 0.256 | 0.820 | 0.413 | 212 | 23 | 0.319 |
| 80-100% | -0.156 |  | -0.105 | -0.372 | 0.711 | 212 | 14 | 0.419 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -11.008 |
| RSS | 1.982 |
| Low-theta observations | 6 |
| High-theta observations | 1054 |
| Low share | 0.006 |
| High share | 0.994 |
| $$\lambda_L$$ | -10.390** |
| t-stat. $$\lambda_L$$ | -2.387 |
| $$\lambda_H$$ | 0.171 |
| t-stat. $$\lambda_H$$ | 0.963 |
| $$\lambda_L-\lambda_H$$ | -10.561** |
| p-value $$\lambda_L=\lambda_H$$ | 0.016 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.426 |
