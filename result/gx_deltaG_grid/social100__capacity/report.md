# Delta-G/Source-X Combination Report: `social100__capacity`

## 1. Specification

- $$G_{it} = \Delta$$ `social100`.
- $$X_{it}$$ source: `capacity`.
- Source `G`, source `X`, and all controls are first multiplied by 0.01.
- Delta `G` is then computed within country from scaled G as `scaled_G_it - scaled_G_i,t-1`; the first country-year observation is missing by construction.
- `X` remains the selected scaled source variable in levels, and `B` is also scaled by 0.01 as in the retained workflow.
- Output directory: `result/gx_deltaG_grid/social100__capacity`

## 2. Table 2: Baseline Fixed Effects

| Variable | Coefficient | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | 2.117 | (0.658) |
| $$B_{it}$$ | 4.336*** | (6.082) |
| $$X_{it}$$ | 0.665 | (0.227) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

## 3. Table 3: Heterogeneity in Spread Estimates

| Variable | Debt heterogeneity Controls | Climate-risk heterogeneity Controls | Full interaction Controls |
| --- | ---: | ---: | ---: |
| $$G_{it}$$ | 2.001 | -15.119 | -15.467 |
| t-stat. | (0.275) | (-1.264) | (-1.140) |
| $$B_{it}$$ | 4.336*** | 4.359*** | 4.357*** |
| t-stat. | (6.082) | (6.103) | (6.101) |
| $$X_{it}$$ | 0.663 | 0.430 | 0.424 |
| t-stat. | (0.226) | (0.148) | (0.146) |
| $$G_{it}\times B_{it}$$ | 0.222 |  | 0.628 |
| t-stat. | (0.014) |  | (0.039) |
| $$G_{it}\times X_{it}$$ |  | 55.631 | 55.700 |
| t-stat. |  | (1.467) | (1.466) |
| Countries | 60 | 60 | 60 |
| Observations | 1,120 | 1,120 | 1,120 |
| Adjusted $$R^2$$ | 0.899 | 0.899 | 0.899 |

## 4. Full-Interaction Empirical Theta

| Variable | Full interaction Controls | t-stat. |
| --- | ---: | ---: |
| $$G_{it}$$ | -15.467 | (-1.140) |
| $$B_{it}$$ | 4.357*** | (6.101) |
| $$X_{it}$$ | 0.424 | (0.146) |
| $$G_{it}\times B_{it}$$ | 0.628 | (0.039) |
| $$G_{it}\times X_{it}$$ | 55.700 | (1.466) |
| Countries | 60 |  |
| Observations | 1,120 |  |
| Adjusted $$R^2$$ | 0.899 |  |

| Variable | N | Mean | SD | Median | Min. | Max. |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| theta_hat_full | 1120 | -3.559 | 4.390 | -2.429 | -26.055 | 3.144 |
| mG_hat_full | 1120 | -7.029 | 7.898 | -4.484 | -26.553 | 4.871 |
| sg_G_hat_full | 1120 | 7.029 | 7.898 | 4.484 | -4.871 | 26.553 |

## 5. Combined Debt-Change Dynamics

| row | baseline | continuous_z_controls | full_theta_dynamics |
| --- | ---: | ---: | ---: |
| G_it | 0.167 | 0.161 | 0.142 |
| t-stat. | (0.939) | (1.047) | (0.941) |
| G_it_x_theta_F_it |  | -0.005 | -0.014 |
| t-stat. |  | (-0.078) | (-0.240) |
| theta_F_it |  |  | 0.003 |
| t-stat. |  |  | (0.812) |
| Real GDP | 8.143*** | 8.147*** | 7.995*** |
| t-stat. | (5.296) | (5.274) | (5.023) |
| Real GDP growth | -0.339*** | -0.339*** | -0.369*** |
| t-stat. | (-3.756) | (-3.752) | (-3.736) |
| CPI inflation | -0.173** | -0.173** | -0.174** |
| t-stat. | (-2.049) | (-2.064) | (-2.139) |
| Overall balance/GDP | -0.478*** | -0.478*** | -0.478*** |
| t-stat. | (-5.969) | (-5.913) | (-5.903) |
| International reserves | 0.022 | 0.022 | 0.017 |
| t-stat. | (1.530) | (1.534) | (1.141) |
| Government effectiveness | -2.059** | -2.064** | -2.088** |
| t-stat. | (-2.137) | (-2.128) | (-2.153) |
| Regulatory quality | 1.592* | 1.589* | 1.159 |
| t-stat. | (1.798) | (1.794) | (1.151) |
| Terms of trade | 0.042*** | 0.042*** | 0.043*** |
| t-stat. | (2.705) | (2.707) | (2.763) |
| Theta main effect | No | No | Yes |
| Debt control | No | No | No |
| Controls | Yes | Yes | Yes |
| Country FE | Yes | Yes | Yes |
| Year FE | Yes | Yes | Yes |
| p(lambda0=0) | 0.348 | 0.295 | 0.347 |
| p(lambda1=0) |  | 0.938 | 0.810 |
| p(lambda2=0) |  |  | 0.417 |
| Observations | 1060 | 1060 | 1060 |
| Countries | 60 | 60 | 60 |
| Adjusted R2 | 0.424 | 0.424 | 0.426 |

## 6. Theta-Grouped Heterogeneity

| Group | Cutoff low | Cutoff high | $$G_{it}$$ | t-stat. | p-value | N | Countries | Adj. $$R^2$$ |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Bottom 50% |  | -2.422 | 0.043 | 0.134 | 0.894 | 530 | 37 | 0.396 |
| Top 50% | -2.422 |  | 0.228 | 1.129 | 0.259 | 530 | 32 | 0.488 |
| 0-20% |  | -6.358 | 1.421* | 1.925 | 0.056 | 212 | 25 | 0.369 |
| 20-40% | -6.358 | -3.921 | -0.083 | -0.262 | 0.794 | 212 | 24 | 0.469 |
| 40-60% | -3.921 | -1.235 | 0.333 | 0.535 | 0.593 | 212 | 24 | 0.412 |
| 60-80% | -1.235 | -0.062 | 0.035 | 0.124 | 0.901 | 212 | 19 | 0.487 |
| 80-100% | -0.062 |  | 0.153 | 1.212 | 0.227 | 212 | 14 | 0.564 |

## 7. RSS Cutoff

| Item | Value |
| --- | ---: |
| RSS cutoff | -21.338 |
| RSS | 1.857 |
| Low-theta observations | 1 |
| High-theta observations | 1059 |
| Low share | 0.001 |
| High share | 0.999 |
| $$\lambda_L$$ | -86.650*** |
| t-stat. $$\lambda_L$$ | -9.225 |
| $$\lambda_H$$ | 0.172 |
| t-stat. $$\lambda_H$$ | 0.967 |
| $$\lambda_L-\lambda_H$$ | -86.823*** |
| p-value $$\lambda_L=\lambda_H$$ | 0.000 |
| Observations | 1060 |
| Countries | 60 |
| Adjusted $$R^2$$ | 0.462 |
