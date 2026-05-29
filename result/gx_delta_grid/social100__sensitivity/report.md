# Delta G/X Combination Report: `social100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `social100`.
- $$X_{it} = \Delta$$ `sensitivity`.
- Delta variables are computed within country as `source_it - source_i,t-1`; the first country-year observation is missing by construction.
- Delta `G`, delta `X`, `B`, and all controls are scaled by 0.01 before estimation.
- Output directory: `result/gx_delta_grid/social100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 2.109 | (0.656) |
| $$B_{it}$$ | 4.315*** | (6.277) |
| $$X_{it}$$ | -1.641 | (-0.195) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 1.956 | 2.107 | 1.950 |
| t-stat. | (0.270) | (0.652) | (0.271) |
| $$B_{it}$$ | 4.315*** | 4.315*** | 4.315*** |
| t-stat. | (6.281) | (6.277) | (6.279) |
| $$X_{it}$$ | -1.643 | -1.623 | -1.617 |
| t-stat. | (-0.195) | (-0.191) | (-0.190) |
| $$G_{it}\times B_{it}$$ | 0.295 |  | 0.301 |
| t-stat. | (0.019) |  | (0.019) |
| $$G_{it}\times X_{it}$$ |  | -5.070 | -7.549 |
| t-stat. |  | (-0.006) | (-0.009) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.899 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 1.950 | (0.271) |
| $$B_{it}$$ | 4.315*** | (6.279) |
| $$X_{it}$$ | -1.617 | (-0.190) |
| $$G_{it}\times B_{it}$$ | 0.301 | (0.019) |
| $$G_{it}\times X_{it}$$ | -7.549 | (-0.009) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | -1.331 | 0.878 | -1.093 | -6.036 | -0.074 |
| mG_hat_full | 1120 | -2.132 | 0.112 | -2.107 | -2.649 | -1.755 |
| sg_G_hat_full | 1120 | 2.132 | 0.112 | 2.107 | 1.755 | 2.649 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.167 | 0.444** | 0.403** |
| t-stat. | (0.939) | (2.049) | (1.981) |
| G_it_x_theta_F_it |  | 0.245 | 0.200 |
| t-stat. |  | (0.989) | (0.848) |
| theta_F_it |  |  | 0.036*** |
| t-stat. |  |  | (3.792) |
| Real GDP | 8.143*** | 8.031*** | 3.823** |
| t-stat. | (5.296) | (5.293) | (2.256) |
| Real GDP growth | -0.339*** | -0.344*** | -0.399*** |
| t-stat. | (-3.756) | (-3.796) | (-4.329) |
| CPI inflation | -0.173** | -0.172** | -0.186** |
| t-stat. | (-2.049) | (-2.033) | (-2.225) |
| Overall balance/GDP | -0.478*** | -0.484*** | -0.501*** |
| t-stat. | (-5.969) | (-6.108) | (-6.069) |
| International reserves | 0.022 | 0.021 | 0.002 |
| t-stat. | (1.530) | (1.440) | (0.168) |
| Government effectiveness | -2.059** | -1.815* | -0.589 |
| t-stat. | (-2.137) | (-1.910) | (-0.583) |
| Regulatory quality | 1.592* | 1.479 | -0.650 |
| t-stat. | (1.798) | (1.629) | (-0.648) |
| Terms of trade | 0.042*** | 0.042*** | 0.036** |
| t-stat. | (2.705) | (2.657) | (2.462) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.348 | 0.041 | 0.048 |
| p(lambda1=0) |  | 0.323 | 0.397 |
| p(lambda2=0) |  |  | 0.000 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.424 | 0.426 | 0.452 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -1.086 | 0.484 | 1.053 | 0.293 | 530 | 47 | 0.469 |
| Top 50% | -1.086 |  | -0.038 | -0.581 | 0.562 | 530 | 40 | 0.484 |
| 0-20% |  | -1.813 | -0.302 | -0.833 | 0.406 | 212 | 23 | 0.620 |
| 20-40% | -1.813 | -1.305 | 1.540** | 2.019 | 0.045 | 212 | 32 | 0.484 |
| 40-60% | -1.305 | -0.925 | 0.062 | 0.263 | 0.793 | 212 | 40 | 0.699 |
| 60-80% | -0.925 | -0.704 | -0.012 | -0.045 | 0.964 | 212 | 35 | 0.463 |
| 80-100% | -0.704 |  | -0.061 | -0.628 | 0.531 | 212 | 28 | 0.464 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -3.586 |
| RSS | 1.942 |
| Low-theta observations | 29 |
| High-theta observations | 1031 |
| Low share | 0.027 |
| High share | 0.973 |
| $$\lambda_L$$ | -4.698*** |
| t-stat. $$\lambda_L$$ | -3.434 |
| $$\lambda_H$$ | 0.216 |
| t-stat. $$\lambda_H$$ | 1.190 |
| $$\lambda_L-\lambda_H$$ | -4.915*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.438 |
