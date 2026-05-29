# Delta G/X Combination Report: `social100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `social100`.
- $$X_{it} = \Delta$$ `capacity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta variables are then computed within country from the scaled G/X variables as `scaled_source_it - scaled_source_i,t-1`; the first country-year observation is missing by construction.
- `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_delta_grid/social100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 2.064 | (0.643) |
| $$B_{it}$$ | 4.314*** | (6.277) |
| $$X_{it}$$ | -1.717 | (-0.330) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 1.858 | 1.974 | 1.955 |
| t-stat. | (0.255) | (0.616) | (0.266) |
| $$B_{it}$$ | 4.313*** | 4.317*** | 4.317*** |
| t-stat. | (6.279) | (6.278) | (6.281) |
| $$X_{it}$$ | -1.726 | -0.604 | -0.605 |
| t-stat. | (-0.329) | (-0.112) | (-0.110) |
| $$G_{it}\times B_{it}$$ | 0.397 |  | 0.037 |
| t-stat. | (0.025) |  | (0.002) |
| $$G_{it}\times X_{it}$$ |  | -213.877 | -213.678 |
| t-stat. |  | (-0.610) | (-0.608) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.899 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 1.955 | (0.266) |
| $$B_{it}$$ | 4.317*** | (6.281) |
| $$X_{it}$$ | -0.605 | (-0.110) |
| $$G_{it}\times B_{it}$$ | 0.037 | (0.002) |
| $$G_{it}\times X_{it}$$ | -213.678 | (-0.608) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | -1.511 | 1.375 | -1.234 | -17.757 | 5.127 |
| mG_hat_full | 1120 | -2.495 | 1.720 | -2.301 | -20.125 | 14.397 |
| sg_G_hat_full | 1120 | 2.495 | 1.720 | 2.301 | -14.397 | 20.125 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.167 | 0.375** | 0.293** |
| t-stat. | (0.939) | (2.222) | (2.101) |
| G_it_x_theta_F_it |  | 0.184 | 0.107 |
| t-stat. |  | (1.229) | (0.740) |
| theta_F_it |  |  | 0.004** |
| t-stat. |  |  | (2.360) |
| Real GDP | 8.143*** | 8.123*** | 7.719*** |
| t-stat. | (5.296) | (5.349) | (5.142) |
| Real GDP growth | -0.339*** | -0.350*** | -0.364*** |
| t-stat. | (-3.756) | (-3.830) | (-3.964) |
| CPI inflation | -0.173** | -0.175** | -0.179** |
| t-stat. | (-2.049) | (-2.050) | (-2.032) |
| Overall balance/GDP | -0.478*** | -0.481*** | -0.489*** |
| t-stat. | (-5.969) | (-6.073) | (-6.064) |
| International reserves | 0.022 | 0.019 | 0.019 |
| t-stat. | (1.530) | (1.284) | (1.307) |
| Government effectiveness | -2.059** | -1.906** | -1.665* |
| t-stat. | (-2.137) | (-2.016) | (-1.744) |
| Regulatory quality | 1.592* | 1.504* | 1.303 |
| t-stat. | (1.798) | (1.670) | (1.466) |
| Terms of trade | 0.042*** | 0.043*** | 0.044*** |
| t-stat. | (2.705) | (2.727) | (2.826) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.348 | 0.027 | 0.036 |
| p(lambda1=0) |  | 0.220 | 0.460 |
| p(lambda2=0) |  |  | 0.018 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.424 | 0.426 | 0.430 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -1.234 | 0.467 | 0.913 | 0.362 | 530 | 56 | 0.435 |
| Top 50% | -1.234 |  | -0.006 | -0.076 | 0.940 | 530 | 59 | 0.519 |
| 0-20% |  | -2.091 | -0.533 | -0.948 | 0.345 | 212 | 41 | 0.454 |
| 20-40% | -2.091 | -1.439 | 1.437** | 2.463 | 0.015 | 212 | 46 | 0.486 |
| 40-60% | -1.439 | -1.062 | 0.753* | 1.928 | 0.056 | 212 | 55 | 0.609 |
| 60-80% | -1.062 | -0.645 | 0.203 | 0.889 | 0.375 | 212 | 49 | 0.527 |
| 80-100% | -0.645 |  | -0.080 | -0.925 | 0.357 | 212 | 45 | 0.613 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -2.272 |
| RSS | 1.965 |
| Low-theta observations | 179 |
| High-theta observations | 881 |
| Low share | 0.169 |
| High share | 0.831 |
| $$\lambda_L$$ | -0.791 |
| t-stat. $$\lambda_L$$ | -1.557 |
| $$\lambda_H$$ | 0.313* |
| t-stat. $$\lambda_H$$ | 1.671 |
| $$\lambda_L-\lambda_H$$ | -1.104** |
| p-value $$\lambda_L=\lambda_H$$ | 0.036 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.431 |
