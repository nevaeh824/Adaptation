# Delta-G/Source-X Combination Report: `governance100__sensitivity`

## 1. Specification

- $$G_{it} = \Delta$$ `governance100`.
- $$X_{it}$$ source: `sensitivity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta `G` is then computed within country from scaled G as `scaled_G_it - scaled_G_i,t-1`; the first country-year observation is missing by construction.
- `X` remains the selected scaled source variable in levels, and `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_deltaG_grid/governance100__sensitivity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 3.441 | (0.827) |
| $$B_{it}$$ | 4.324*** | (6.204) |
| $$X_{it}$$ | -5.250 | (-0.942) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.900 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 16.435 | 3.078 | 10.115 |
| t-stat. | (1.578) | (0.230) | (0.727) |
| $$B_{it}$$ | 4.288*** | 4.324*** | 4.295*** |
| t-stat. | (6.205) | (6.211) | (6.209) |
| $$X_{it}$$ | -5.261 | -5.244 | -5.140 |
| t-stat. | (-0.941) | (-0.939) | (-0.919) |
| $$G_{it}\times B_{it}$$ | -21.614 |  | -22.775 |
| t-stat. | (-1.149) |  | (-1.151) |
| $$G_{it}\times X_{it}$$ |  | 1.250 | 24.189 |
| t-stat. |  | (0.025) | (0.438) |
| Countries | 59 | 59 | 59 |
| Observations | 1,103 | 1,103 | 1,103 |
| Adjusted $$R^2$$ | 0.901 | 0.900 | 0.900 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 10.115 | (0.727) |
| $$B_{it}$$ | 4.295*** | (6.209) |
| $$X_{it}$$ | -5.140 | (-0.919) |
| $$G_{it}\times B_{it}$$ | -22.775 | (-1.151) |
| $$G_{it}\times X_{it}$$ | 24.189 | (0.438) |
| Countries | 59 |  |
| Observations | 1,103 |  |
| Adjusted $$R^2$$ | 0.900 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1103 | 0.847 | 9.638 | -2.168 | -5.100 | 77.356 |
| mG_hat_full | 1103 | -3.060 | 7.901 | -4.804 | -17.035 | 33.814 |
| sg_G_hat_full | 1103 | 3.060 | 7.901 | 4.804 | -33.814 | 17.035 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | -0.072 | -0.073 | -0.036 |
| t-stat. | (-0.555) | (-0.568) | (-0.283) |
| G_it_x_theta_F_it |  | 0.002 | 0.012 |
| t-stat. |  | (0.081) | (0.506) |
| theta_F_it |  |  | -0.002*** |
| t-stat. |  |  | (-3.190) |
| Real GDP | 8.166*** | 8.178*** | 4.192** |
| t-stat. | (5.343) | (5.521) | (2.537) |
| Real GDP growth | -0.337*** | -0.338*** | -0.368*** |
| t-stat. | (-3.587) | (-3.654) | (-4.058) |
| CPI inflation | -0.176** | -0.175** | -0.177** |
| t-stat. | (-2.074) | (-2.079) | (-2.133) |
| Overall balance/GDP | -0.472*** | -0.472*** | -0.455*** |
| t-stat. | (-5.890) | (-5.891) | (-5.595) |
| International reserves | 0.022 | 0.022 | 0.015 |
| t-stat. | (1.571) | (1.574) | (1.132) |
| Government effectiveness | -2.008** | -2.004** | -0.976 |
| t-stat. | (-2.043) | (-2.019) | (-0.939) |
| Regulatory quality | 1.658* | 1.651* | 0.253 |
| t-stat. | (1.860) | (1.852) | (0.277) |
| Terms of trade | 0.043*** | 0.043*** | 0.037** |
| t-stat. | (2.735) | (2.734) | (2.479) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.579 | 0.570 | 0.777 |
| p(lambda1=0) |  | 0.935 | 0.613 |
| p(lambda2=0) |  |  | 0.001 |
| Observations | 1044 | 1044 | 1044 |
| Countries | 59 | 59 | 59 |
| Adjusted R2 | 0.420 | 0.420 | 0.438 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -2.185 | -0.035 | -0.286 | 0.775 | 522 | 47 | 0.481 |
| Top 50% | -2.185 |  | -0.414* | -1.946 | 0.052 | 522 | 47 | 0.480 |
| 0-20% |  | -3.031 | 0.058 | 0.263 | 0.793 | 209 | 24 | 0.533 |
| 20-40% | -3.031 | -2.418 | 0.088 | 0.449 | 0.654 | 209 | 37 | 0.503 |
| 40-60% | -2.418 | -1.680 | -0.169 | -0.829 | 0.409 | 209 | 39 | 0.479 |
| 60-80% | -1.680 | 1.341 | -0.645** | -2.125 | 0.035 | 209 | 34 | 0.448 |
| 80-100% | 1.341 |  | -0.208 | -0.460 | 0.646 | 208 | 21 | 0.663 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | 76.762 |
| RSS | 1.979 |
| Low-theta observations | 1042 |
| High-theta observations | 2 |
| Low share | 0.998 |
| High share | 0.002 |
| $$\lambda_L$$ | -0.073 |
| t-stat. $$\lambda_L$$ | -0.562 |
| $$\lambda_H$$ | -19.052*** |
| t-stat. $$\lambda_H$$ | -5.525 |
| $$\lambda_L-\lambda_H$$ | 18.978*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1044 |
| Countries | 59 |
| Adjusted $$R^2$$ | 0.423 |
