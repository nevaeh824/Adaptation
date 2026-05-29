# Paper B Delta G/X Grid Empirical Report

This report summarizes the retained Paper B workflow for all 20 requested delta G/X source combinations.

## 1. Design

- G sources: `readiness100`, `EcoReadiness100`, `governance100`, `social100`, `readiness_delta100`.
- X sources: `vulnerability100`, `vulnerability_delta100`, `capacity`, `sensitivity`.
- For each source pair, source `G`, source `X`, and all controls are first multiplied by 0.01.
- `G` and `X` are then replaced by within-country first differences of those scaled source variables: `scaled_source_it - scaled_source_i,t-1`.
- Each combination uses the same retained workflow as `WORKFLOW.md`: Table 2, Table 3, full-interaction theta, combined debt-change dynamics, theta-grouped heterogeneity, and RSS cutoff.
- `B` is also scaled by 0.01 as in the retained workflow.
- Detailed per-combination reports are written to `result/gx_delta_grid/<G>__<X>/report.md`.

## 2. Output Inventory

- Batch runner: `paperB_gx_delta_grid_1995_2023_tables.do`.
- Single-combination engine: `paperB_gx_delta_one_1995_2023_tables.do`.
- Grid runner log: `result/gx_delta_grid/paperB_gx_delta_grid_1995_2023_tables.log`.
- Machine-readable summary: `result/gx_delta_grid/gx_delta_grid_summary.csv`.

## 3. Cross-Combination Summary

| G source | X source | Table 2 $$G$$ | Full $$G\times B$$ | Full $$G\times X$$ | Mean theta | Debt baseline $$G$$ | Debt continuous $$G\times\theta$$ | RSS cutoff | $$\lambda_L$$ | $$\lambda_H$$ | p equal | Detail |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| readiness100 | vulnerability100 | -2.877 | -1.431 | 411.616 | 1.866 | 0.056 | -0.089 | 10.417 | 0.066 | -10.028*** | 0.001 | [report](result/gx_delta_grid/readiness100__vulnerability100/report.md) |
| readiness100 | vulnerability_delta100 | -2.854 | -1.384 | 395.039 | 1.396 | 0.056 | -0.052 | 13.413 | 0.064 | -8.756*** | 0.000 | [report](result/gx_delta_grid/readiness100__vulnerability_delta100/report.md) |
| readiness100 | capacity | -2.868 | -2.180 | 708.058 | 0.892 | 0.056 | -0.080** | 21.743 | 0.064 | -6.889*** | 0.001 | [report](result/gx_delta_grid/readiness100__capacity/report.md) |
| readiness100 | sensitivity | -2.876 | 0.755 | -877.736 | 1.224 | 0.056 | -0.044 | -0.615 | 1.060 | 0.030 | 0.381 | [report](result/gx_delta_grid/readiness100__sensitivity/report.md) |
| EcoReadiness100 | vulnerability100 | -1.494** | 0.973 | -92.306 | 0.751 | 0.014 | -0.207*** | 0.700 | 0.084** | -0.056* | 0.001 | [report](result/gx_delta_grid/EcoReadiness100__vulnerability100/report.md) |
| EcoReadiness100 | vulnerability_delta100 | -1.488** | 0.502 | 234.353 | 0.364 | 0.014 | -0.021 | 4.086 | 0.012 | 3.799* | 0.095 | [report](result/gx_delta_grid/EcoReadiness100__vulnerability_delta100/report.md) |
| EcoReadiness100 | capacity | -1.489** | 0.685 | 78.408 | 0.592 | 0.014 | -0.212*** | 1.215 | 0.026 | -1.105* | 0.062 | [report](result/gx_delta_grid/EcoReadiness100__capacity/report.md) |
| EcoReadiness100 | sensitivity | -1.496** | 1.100 | -109.376 | 0.619 | 0.014 | -0.184*** | 0.545 | 0.107** | -0.052** | 0.002 | [report](result/gx_delta_grid/EcoReadiness100__sensitivity/report.md) |
| governance100 | vulnerability100 | 3.429 | -22.369 | 779.016 | 0.679 | -0.072 | -0.007 | 76.846 | -0.073 | -19.052*** | 0.000 | [report](result/gx_delta_grid/governance100__vulnerability100/report.md) |
| governance100 | vulnerability_delta100 | 3.460 | -21.992 | -286.707 | 0.881 | -0.072 | 0.009 | 13.897 | -0.128 | 1.292 | 0.236 | [report](result/gx_delta_grid/governance100__vulnerability_delta100/report.md) |
| governance100 | capacity | 3.437 | -21.920 | 817.246** | 0.480 | -0.072 | -0.018 | 70.389 | -0.064 | -18.503*** | 0.000 | [report](result/gx_delta_grid/governance100__capacity/report.md) |
| governance100 | sensitivity | 3.428 | -19.653 | -1168.817* | 0.750 | -0.072 | 0.013 | 63.280 | -0.064 | -18.503*** | 0.000 | [report](result/gx_delta_grid/governance100__sensitivity/report.md) |
| social100 | vulnerability100 | 2.085 | 0.207 | -686.735 | -1.490 | 0.167 | 0.159 | -3.143 | -1.535*** | 0.270 | 0.000 | [report](result/gx_delta_grid/social100__vulnerability100/report.md) |
| social100 | vulnerability_delta100 | 2.121 | -0.775 | -295.516 | -1.503 | 0.167 | 0.058 | -7.914 | -16.426*** | 0.179 | 0.000 | [report](result/gx_delta_grid/social100__vulnerability_delta100/report.md) |
| social100 | capacity | 2.064 | 0.037 | -213.678 | -1.511 | 0.167 | 0.184 | -2.272 | -0.791 | 0.313* | 0.036 | [report](result/gx_delta_grid/social100__capacity/report.md) |
| social100 | sensitivity | 2.109 | 0.301 | -7.549 | -1.331 | 0.167 | 0.245 | -3.517 | -4.801*** | 0.217 | 0.000 | [report](result/gx_delta_grid/social100__sensitivity/report.md) |
| readiness_delta100 | vulnerability100 | -2.807 | 4.853 | 823.363 | 0.465 | 0.011 | -0.073 | -14.069 | 8.971*** | 0.011 | 0.000 | [report](result/gx_delta_grid/readiness_delta100__vulnerability100/report.md) |
| readiness_delta100 | vulnerability_delta100 | -2.964 | 5.289 | -100.784* | 0.767 | 0.011 | -0.051 | 3.707 | 0.060 | -0.719** | 0.013 | [report](result/gx_delta_grid/readiness_delta100__vulnerability_delta100/report.md) |
| readiness_delta100 | capacity | -2.801 | 5.103 | 663.084** | -0.252 | 0.011 | -0.055** | -2.795 | 0.644 | -0.024 | 0.075 | [report](result/gx_delta_grid/readiness_delta100__capacity/report.md) |
| readiness_delta100 | sensitivity | -2.806 | 6.770 | -594.151 | 0.082 | 0.011 | -0.021 | -21.606 | 8.965*** | 0.014 | 0.007 | [report](result/gx_delta_grid/readiness_delta100__sensitivity/report.md) |

## 4. Verification

All 20 single-combination Stata logs were checked for `r(...)` runtime errors after the grid run. No runtime errors were found.
