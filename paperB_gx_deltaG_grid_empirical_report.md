# Paper B Delta-G/Source-X Grid Empirical Report

This report summarizes the retained Paper B workflow for all 20 requested delta-G/source-X combinations.

## 1. Design

- G sources: `readiness100`, `EcoReadiness100`, `governance100`, `social100`, `readiness_delta100`.
- X sources: `vulnerability100`, `vulnerability_delta100`, `capacity`, `sensitivity`.
- For each source pair, `G` is replaced by its within-country first difference: `G_it - G_i,t-1`.
- `X` remains the selected source variable in levels.
- Each combination uses the same retained workflow as `WORKFLOW.md`: Table 2, Table 3, full-interaction theta, combined debt-change dynamics, theta-grouped heterogeneity, and RSS cutoff.
- Delta `G`, source `X`, `B`, and all controls are scaled by 0.01 before estimation.
- Detailed per-combination reports are written to `result/gx_deltaG_grid/<G>__<X>/report.md`.

## 2. Output Inventory

- Batch runner: `paperB_gx_deltaG_grid_1995_2023_tables.do`.
- Single-combination engine: `paperB_gx_deltaG_one_1995_2023_tables.do`.
- Grid runner log: `result/gx_deltaG_grid/paperB_gx_deltaG_grid_1995_2023_tables.log`.
- Machine-readable summary: `result/gx_deltaG_grid/gx_deltaG_grid_summary.csv`.

## 3. Cross-Combination Summary

| G source | X source | Table 2 $$G$$ | Full $$G\times B$$ | Full $$G\times X$$ | Mean theta | Debt baseline $$G$$ | Debt continuous $$G\times\theta$$ | RSS cutoff | $$\lambda_L$$ | $$\lambda_H$$ | p equal | Detail |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| readiness100 | vulnerability100 | -2.877 | -1.221 | -48.531** | 0.155 | 0.056 | -0.002 | 9.982 | 0.045 | 64.856*** | 0.000 | [report](result/gx_deltaG_grid/readiness100__vulnerability100/report.md) |
| readiness100 | vulnerability_delta100 | -3.047 | -0.124 | -23.668 | 1.593 | 0.056 | -0.029 | 4.804 | 0.041 | 1.724** | 0.020 | [report](result/gx_deltaG_grid/readiness100__vulnerability_delta100/report.md) |
| readiness100 | capacity | -2.880 | -4.523 | -27.844** | 0.277 | 0.056 | -0.004 | 13.032 | 0.045 | 64.856*** | 0.000 | [report](result/gx_deltaG_grid/readiness100__capacity/report.md) |
| readiness100 | sensitivity | -3.101 | 0.074 | -11.235 | 1.851 | 0.056 | -0.055 | 2.272 | 0.153* | -0.139 | 0.047 | [report](result/gx_deltaG_grid/readiness100__sensitivity/report.md) |
| EcoReadiness100 | vulnerability100 | -1.494** | 0.791 | -13.295 | 0.137 | 0.014 | -0.008 | -2.107 | -13.309*** | 0.015 | 0.000 | [report](result/gx_deltaG_grid/EcoReadiness100__vulnerability100/report.md) |
| EcoReadiness100 | vulnerability_delta100 | -1.519** | 1.098 | -6.568 | 0.597 | 0.014 | -0.102** | -0.886 | -13.309*** | 0.015 | 0.000 | [report](result/gx_deltaG_grid/EcoReadiness100__vulnerability_delta100/report.md) |
| EcoReadiness100 | capacity | -1.496** | -0.268 | -7.916* | 0.164 | 0.014 | -0.001 | 2.522 | 0.012 | 63.921*** | 0.000 | [report](result/gx_deltaG_grid/EcoReadiness100__capacity/report.md) |
| EcoReadiness100 | sensitivity | -1.565** | 1.234 | -4.523 | 0.667 | 0.014 | -0.114** | 0.146 | 0.338*** | 0.006 | 0.001 | [report](result/gx_deltaG_grid/EcoReadiness100__sensitivity/report.md) |
| governance100 | vulnerability100 | 3.467 | -21.891 | -33.593 | 0.450 | -0.072 | 0.010 | -4.844 | -16.688*** | -0.054 | 0.000 | [report](result/gx_deltaG_grid/governance100__vulnerability100/report.md) |
| governance100 | vulnerability_delta100 | 3.240 | -22.320 | 10.922 | 0.932 | -0.072 | 0.006 | -3.601 | -4.774*** | -0.044 | 0.002 | [report](result/gx_deltaG_grid/governance100__vulnerability_delta100/report.md) |
| governance100 | capacity | 3.412 | -23.605 | -27.022 | 0.290 | -0.072 | 0.011 | 21.576 | -0.120 | 2.277 | 0.257 | [report](result/gx_deltaG_grid/governance100__capacity/report.md) |
| governance100 | sensitivity | 3.441 | -22.775 | 24.189 | 0.847 | -0.072 | 0.002 | 76.762 | -0.073 | -19.052*** | 0.000 | [report](result/gx_deltaG_grid/governance100__sensitivity/report.md) |
| social100 | vulnerability100 | 2.061 | -0.165 | 99.486 | -3.341 | 0.167 | 0.087 | -19.732 | -68.837*** | 0.171 | 0.000 | [report](result/gx_deltaG_grid/social100__vulnerability100/report.md) |
| social100 | vulnerability_delta100 | 1.731 | -0.897 | 110.101 | -2.093 | 0.167 | -0.031 | -8.616 | -5.543** | 0.185 | 0.009 | [report](result/gx_deltaG_grid/social100__vulnerability_delta100/report.md) |
| social100 | capacity | 2.117 | 0.628 | 55.700 | -3.559 | 0.167 | -0.005 | -21.338 | -86.650*** | 0.172 | 0.000 | [report](result/gx_deltaG_grid/social100__capacity/report.md) |
| social100 | sensitivity | 1.856 | -2.343 | 54.593 | -2.308 | 0.167 | 0.023 | -11.008 | -10.390** | 0.171 | 0.016 | [report](result/gx_deltaG_grid/social100__sensitivity/report.md) |
| readiness_delta100 | vulnerability100 | -2.818 | 5.837 | -28.465 | -0.171 | 0.011 | -0.004 | -19.649 | 9.802*** | 0.012 | 0.000 | [report](result/gx_deltaG_grid/readiness_delta100__vulnerability100/report.md) |
| readiness_delta100 | vulnerability_delta100 | -3.363* | 6.632 | -55.167** | -0.391 | 0.011 | -0.011 | -19.067 | -6.313*** | 0.013 | 0.000 | [report](result/gx_deltaG_grid/readiness_delta100__vulnerability_delta100/report.md) |
| readiness_delta100 | capacity | -2.804 | 4.294 | -12.987 | 0.070 | 0.011 | -0.003 | -16.729 | 9.802*** | 0.012 | 0.000 | [report](result/gx_deltaG_grid/readiness_delta100__capacity/report.md) |
| readiness_delta100 | sensitivity | -3.015 | 6.798 | -12.432 | 0.498 | 0.011 | -0.017 | -19.660 | 9.802*** | 0.012 | 0.000 | [report](result/gx_deltaG_grid/readiness_delta100__sensitivity/report.md) |

## 4. Verification

All 20 single-combination Stata logs were checked for `r(...)` runtime errors after the grid run. No runtime errors were found.
