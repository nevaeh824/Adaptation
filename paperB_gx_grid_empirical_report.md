# Paper B G/X Grid Empirical Report

This report summarizes the retained Paper B workflow for all 20 requested G/X source combinations.

## 1. Design

- G sources: `readiness100`, `EcoReadiness100`, `governance100`, `social100`, `readiness_delta100`.
- X sources: `vulnerability100`, `vulnerability_delta100`, `capacity`, `sensitivity`.
- Each combination uses the same retained workflow as `WORKFLOW.md`: Table 2, Table 3, full-interaction theta, combined debt-change dynamics, theta-grouped heterogeneity, and RSS cutoff.
- `G`, `X`, `B`, and all controls are scaled to 0.01 times their source panel values before estimation.
- Detailed per-combination reports are written to `result/gx_grid/<G>__<X>/report.md`.

## 2. Output Inventory

- Batch runner: `paperB_gx_grid_1995_2023_tables.do`.
- Single-combination engine: `paperB_gx_one_1995_2023_tables.do`.
- Grid runner log: `result/gx_grid/paperB_gx_grid_1995_2023_tables.log`.
- Machine-readable summary: `result/gx_grid/gx_grid_summary.csv`.

## 3. Cross-Combination Summary

| G source | X source | Table 2 $$G$$ | Full $$G\times B$$ | Full $$G\times X$$ | Mean theta | Debt baseline $$G$$ | Debt continuous $$G\times\theta$$ | RSS cutoff | $$\lambda_L$$ | $$\lambda_H$$ | p equal | Detail |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| readiness100 | vulnerability100 | -5.485*** | -27.632*** | 1.391 | 9.493 | -0.103*** | -0.003*** | 21.182 | -0.077* | -0.159*** | 0.000 | [report](result/gx_grid/readiness100__vulnerability100/report.md) |
| readiness100 | vulnerability_delta100 | -5.258*** | -27.659*** | 50.014*** | 9.589 | -0.103*** | -0.003*** | 20.398 | -0.080** | -0.159*** | 0.000 | [report](result/gx_grid/readiness100__vulnerability_delta100/report.md) |
| readiness100 | capacity | -5.503*** | -27.926*** | -9.727 | 8.774 | -0.103*** | -0.003*** | 18.470 | -0.081** | -0.159*** | 0.001 | [report](result/gx_grid/readiness100__capacity/report.md) |
| readiness100 | sensitivity | -5.342*** | -28.078*** | 35.924*** | 9.438 | -0.103*** | -0.003*** | 21.805 | -0.077* | -0.165*** | 0.000 | [report](result/gx_grid/readiness100__sensitivity/report.md) |
| EcoReadiness100 | vulnerability100 | -1.869*** | -8.758*** | -2.094 | 2.935 | -0.037*** | -0.010*** | 8.021 | -0.036** | -0.132*** | 0.000 | [report](result/gx_grid/EcoReadiness100__vulnerability100/report.md) |
| EcoReadiness100 | vulnerability_delta100 | -1.761*** | -8.930*** | 25.324*** | 3.389 | -0.037*** | -0.009*** | 7.130 | -0.032** | -0.118*** | 0.000 | [report](result/gx_grid/EcoReadiness100__vulnerability_delta100/report.md) |
| EcoReadiness100 | capacity | -1.891*** | -9.727*** | -7.438** | 2.519 | -0.037*** | -0.010*** | 4.932 | -0.033** | -0.114*** | 0.001 | [report](result/gx_grid/EcoReadiness100__capacity/report.md) |
| EcoReadiness100 | sensitivity | -1.808*** | -9.171*** | 10.797** | 3.125 | -0.037*** | -0.010*** | 7.181 | -0.032** | -0.124*** | 0.000 | [report](result/gx_grid/EcoReadiness100__sensitivity/report.md) |
| governance100 | vulnerability100 | -9.714** | -21.252*** | -6.575 | 9.481 | 0.021 | -0.003*** | 19.374 | 0.036 | -0.029 | 0.001 | [report](result/gx_grid/governance100__vulnerability100/report.md) |
| governance100 | vulnerability_delta100 | -10.556** | -21.164*** | 24.176 | 9.166 | 0.021 | -0.003*** | 19.123 | 0.034 | -0.038 | 0.000 | [report](result/gx_grid/governance100__vulnerability_delta100/report.md) |
| governance100 | capacity | -9.678** | -21.391*** | -3.184 | 9.417 | 0.021 | -0.003*** | 19.275 | 0.038 | -0.029 | 0.001 | [report](result/gx_grid/governance100__capacity/report.md) |
| governance100 | sensitivity | -9.657** | -22.168*** | 52.742** | 10.045 | 0.021 | -0.003*** | 21.504 | 0.039 | -0.032 | 0.000 | [report](result/gx_grid/governance100__sensitivity/report.md) |
| social100 | vulnerability100 | 0.182 | -17.656*** | 42.520* | 1.755 | -0.020 | -0.004*** | 8.293 | 0.022 | -0.052 | 0.001 | [report](result/gx_grid/social100__vulnerability100/report.md) |
| social100 | vulnerability_delta100 | 0.034 | -17.879*** | 69.240*** | 0.727 | -0.020 | -0.004*** | 6.881 | 0.016 | -0.073 | 0.001 | [report](result/gx_grid/social100__vulnerability_delta100/report.md) |
| social100 | capacity | 0.267 | -17.693*** | 5.683 | 2.170 | -0.020 | -0.004*** | 7.334 | 0.034 | -0.063 | 0.000 | [report](result/gx_grid/social100__capacity/report.md) |
| social100 | sensitivity | 0.310 | -18.353*** | 62.517*** | 0.988 | -0.020 | -0.004*** | 5.112 | 0.030 | -0.055 | 0.001 | [report](result/gx_grid/social100__sensitivity/report.md) |
| readiness_delta100 | vulnerability100 | -2.622* | -21.800*** | -8.271 | 6.481 | -0.073 | -0.009** | 11.693 | -0.050 | -0.324*** | 0.018 | [report](result/gx_grid/readiness_delta100__vulnerability100/report.md) |
| readiness_delta100 | vulnerability_delta100 | -4.634*** | -22.070*** | 26.799** | 8.014 | -0.073 | -0.009** | 9.356 | -0.047 | -0.243*** | 0.001 | [report](result/gx_grid/readiness_delta100__vulnerability_delta100/report.md) |
| readiness_delta100 | capacity | -2.584* | -22.125*** | -10.828 | 6.291 | -0.073 | -0.009** | 5.654 | -0.031 | -0.232*** | 0.001 | [report](result/gx_grid/readiness_delta100__capacity/report.md) |
| readiness_delta100 | sensitivity | -2.589* | -24.443*** | 47.344*** | 6.916 | -0.073 | -0.009** | 8.033 | -0.046 | -0.250*** | 0.003 | [report](result/gx_grid/readiness_delta100__sensitivity/report.md) |

## 4. Verification

All 20 single-combination Stata logs were checked for `r(...)` runtime errors after the grid run. No runtime errors were found.
