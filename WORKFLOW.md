# Empirical Workflow

This workflow documents how `paperB_updated_1995_2023_tables.do` reproduces the
retained Paper B empirical outputs summarized in
`paperB_updated_empirical_report.md`.

## Scope

The workflow uses the 1995--2023 country-year panel in
`cleaned_imf_like_panel_1995_2023.csv` and writes all Stata logs, tables, and
intermediate theta outputs to `result/`.

The current do-file produces:

- Table 2 baseline fixed-effects sovereign spread regression, retaining only
  the `G+B+X + controls` column.
- Table 3 debt and climate-risk heterogeneity regressions, retaining only:
  Debt heterogeneity Controls, Climate-risk heterogeneity Controls, and Full
  interaction Controls.
- Full-interaction empirical theta estimates.
- Combined debt-change dynamics table.
- Theta-grouped Full-theta debt-change heterogeneity regressions using both a
  50/50 median split and 20% quantile groups: 0--20%, 20--40%, 40--60%,
  60--80%, and 80--100%.
- Full-theta RSS cutoff experiment for debt-change dynamics.

The workflow explicitly removes stale outputs for deleted sections:

- Table 1 descriptive statistics.
- Full-Theta Region Diagnostics.
- Censored Full-Theta Robustness Check.
- Marginal-Effect Cutoff Diagnostics and marginal-effect subsample diagnostics.

## Inputs

Primary input:

- `cleaned_imf_like_panel_1995_2023.csv`

The Stata workflow consumes these panel columns directly:

- `bond_spreads`: sovereign spread dependent variable.
- `readiness100`: readiness proxy, denoted as `G`.
- `vulnerability100`: vulnerability proxy, denoted as `X`.
- `debt_gdp`: debt/GDP source variable, converted to `debt_ratio`.
- `lnrgdp`, `growth`, `inflation_cpi`, `OB_gdp`, `reserves`, `gee`, `rqe`, `tt`:
  control vector.

Inside `prep_panel`, the workflow multiplies `readiness100`,
`vulnerability100`, the generated `debt_ratio`, and every control variable by
0.01 before estimating regressions. The source CSV is not overwritten by this
scaling step.

## Environment

Required software:

- Stata 18 or compatible.
- A shell capable of running Stata in batch mode.

The do-file accepts an optional project root argument. If omitted, it uses the
current working directory. The script first checks
`<root>/empirical/cleaned_imf_like_panel_1995_2023.csv`; if that file does not
exist, it uses `<root>/cleaned_imf_like_panel_1995_2023.csv`.

Generic command:

```powershell
stata-mp -b do paperB_updated_1995_2023_tables.do "C:/Users/chenyu/Desktop/emoirical0524"
```

Verified command on this Windows machine:

```powershell
$p = Start-Process -FilePath 'C:\environment_tools\Stata18\StataMP-64.exe' -ArgumentList @('/e','do','paperB_updated_1995_2023_tables.do','C:/Users/chenyu/Desktop/emoirical0524') -Wait -PassThru -WindowStyle Hidden
$p.ExitCode
```

Latest verified run returned `ExitCode=0` and closed
`result/paperB_updated_1995_2023_tables.log` on 2026-05-30 00:20:15 local
Stata log time.

## Execution Steps

1. Resolve paths.

   The do-file sets `root`, `empirical_dir`, `newdata`, and `out`, creates
   `result/` if needed, opens `result/paperB_updated_1995_2023_tables.log`, and
   confirms that the panel CSV exists.

2. Clean stale deleted-section outputs.

   Before estimating models, the do-file erases old result files for Table 1,
   Full-Theta Region Diagnostics, Censored Full-Theta robustness, and
   marginal-effect cutoff diagnostics. This prevents removed sections from
   remaining in `result/` after a new run.

3. Define shared model settings.

   The script maps the empirical notation to Stata variables:

   ```text
   G = readiness100
   X = vulnerability100
   B = debt_ratio
   controls = lnrgdp growth inflation_cpi OB_gdp reserves gee rqe tt
   ```

4. Prepare the panel and scale regressors.

   The helper program `prep_panel` encodes `iso3` into a numeric country id,
   declares the panel with `xtset id year`, flags U.S. observations, scales
   `readiness100`, `vulnerability100`, generated `debt_ratio`, and all controls
   to 0.01 times their source values, and then constructs:

   ```text
   debt_ratio = debt_gdp * 0.01
   G_B = scaled readiness100 * scaled debt_ratio
   G_X = scaled readiness100 * scaled vulnerability100
   ```

5. Generate Table 2.

   The retained Table 2 output estimates only the controlled joint fixed-effects
   spread regression:

   ```text
   bond_spreads = alpha_i + tau_t
                + beta_G * scaled readiness100
                + beta_B * scaled debt_ratio
                + beta_X * scaled vulnerability100
                + Gamma'Z_it + error
   ```

   The table is written to `result/table2_baseline_fe_periods.tex`.

6. Generate Table 3.

   The retained Table 3 output estimates only the controlled heterogeneity
   specifications:

   - Debt heterogeneity Controls: includes `G_B`.
   - Climate-risk heterogeneity Controls: includes `G_X`.
   - Full interaction Controls: includes both `G_B` and `G_X`.

   The table is written to `result/table3_heterogeneity_theta.tex`.

7. Construct Full-interaction empirical theta.

   The controlled full-interaction spread model is estimated on non-U.S.
   observations. The saved theta panel computes:

   ```text
   theta_hat_full = B_it * -d s_it / d G_it
                  = B_it * -(beta_G + beta_GB * B_it + beta_GX * X_it)
   ```

   In this formula, `B_it`, `G_it`, `X_it`, and `Z_it` are the scaled variables
   used in the regressions.

   Outputs:

   ```text
   result/table6_fullinteraction_theta_regression.tex
   result/table6_theta_descriptive_stats.csv
   result/table6_theta_descriptive_stats.dta
   result/table6_theta_descriptive_stats.tex
   result/theta_full_empirical_panel.csv
   result/theta_full_empirical_panel.dta
   ```

8. Estimate and export the combined debt-change dynamics table.

   The dependent variable is `B_{i,t+1} - B_it`, where `B` is the scaled
   `debt_ratio`. The combined table contains:

   - Baseline readiness with controls.
   - Continuous Full-theta with controls.
   - Full-theta dynamics with controls and the theta main effect.

   The combined outputs are:

   ```text
   result/table6_2_6_3_7_debt_change_regressions.csv
   result/table6_2_6_3_7_debt_change_regressions.tex
   ```

   Component CSV/DTA outputs are retained for auditability:

   ```text
   result/table6_2_debt_level_dynamics_regression.csv
   result/table6_2_debt_level_dynamics_regression.dta
   result/table7_0_baseline_debt_change_regression.csv
   result/table7_0_baseline_debt_change_regression.dta
   result/table7_continuous_theta_debt_regression.csv
   result/table7_continuous_theta_debt_regression.dta
   ```

9. Run theta-grouped heterogeneity regressions.

   The do-file uses the Full-theta debt-change sample and estimates
   `B_{i,t+1} - B_it` on current readiness, controls, country fixed effects,
   and year fixed effects within each theta subsample.

   Retained groups:

   - Bottom 50%.
   - Top 50%.
   - 0--20%.
   - 20--40%.
   - 40--60%.
   - 60--80%.
   - 80--100%.

   Outputs:

   ```text
   result/table7_theta_group_heterogeneity.csv
   result/table7_theta_group_heterogeneity.dta
   result/table7_theta_group_heterogeneity.tex
   ```

10. Run the RSS cutoff experiment.

    The code searches over empirical Full-theta cutoff values that leave both
    low- and high-theta groups nonempty, selects the cutoff that minimizes RSS,
    and estimates:

    ```text
    B_{i,t+1} - B_it = lambda_L * G_it * 1(theta_hat_full < c)
                     + lambda_H * G_it * 1(theta_hat_full >= c)
                     + Gamma'Z_it
                     + alpha_i + tau_t + error
    ```

    Outputs:

    ```text
    result/table7_deltaB_rss_cutoff_grid.csv
    result/table7_deltaB_rss_cutoff_grid.dta
    result/table7_deltaB_rss_selected_cutoff.csv
    result/table7_deltaB_rss_selected_cutoff.dta
    result/table7_deltaB_rss_cutoff_regression.tex
    ```

11. Verify completion.

    A successful run ends with the retained-output `Done` message in
    `result/paperB_updated_1995_2023_tables.log`, closes the log, and returns
    Stata `ExitCode=0`.

## Output Inventory

The retained workflow writes or overwrites:

```text
result/paperB_updated_1995_2023_tables.log
result/table2_baseline_fe_periods.tex
result/table3_heterogeneity_theta.tex
result/table6_fullinteraction_theta_regression.tex
result/table6_theta_descriptive_stats.csv
result/table6_theta_descriptive_stats.dta
result/table6_theta_descriptive_stats.tex
result/table6_2_debt_level_dynamics_regression.csv
result/table6_2_debt_level_dynamics_regression.dta
result/table6_2_6_3_7_debt_change_regressions.csv
result/table6_2_6_3_7_debt_change_regressions.tex
result/table7_0_baseline_debt_change_regression.csv
result/table7_0_baseline_debt_change_regression.dta
result/table7_continuous_theta_debt_regression.csv
result/table7_continuous_theta_debt_regression.dta
result/table7_theta_group_heterogeneity.csv
result/table7_theta_group_heterogeneity.dta
result/table7_theta_group_heterogeneity.tex
result/table7_deltaB_rss_cutoff_grid.csv
result/table7_deltaB_rss_cutoff_grid.dta
result/table7_deltaB_rss_selected_cutoff.csv
result/table7_deltaB_rss_selected_cutoff.dta
result/table7_deltaB_rss_cutoff_regression.tex
result/theta_full_empirical_panel.csv
result/theta_full_empirical_panel.dta
```

The following old files are intentionally removed on each run if present:

```text
result/table1_descriptive_stats_compare.csv
result/table1_descriptive_stats_compare.dta
result/table1_descriptive_stats_compare.tex
result/table6_1_theta_region_stats.csv
result/table6_1_theta_region_stats.dta
result/table6_1_theta_region_stats.tex
result/table7_1_censored_theta_debt_regression.csv
result/table7_1_censored_theta_debt_regression.dta
result/table7_1_censored_theta_debt_regression.tex
result/table7_deltaB_marginal_cutoff_selected.csv
result/table7_deltaB_marginal_cutoff_selected.dta
result/table7_deltaB_marginal_cutoff_regression.tex
result/table7_deltaB_marginal_cutoff_subsample.csv
result/table7_deltaB_marginal_cutoff_subsample.dta
result/table7_deltaB_marginal_cutoff_subsample.tex
```

## G/X Grid Extension

The 20-combination G/X grid is run by:

```powershell
$p = Start-Process -FilePath 'C:\environment_tools\Stata18\StataMP-64.exe' -ArgumentList @('/e','do','paperB_gx_grid_1995_2023_tables.do','C:/Users/chenyu/Desktop/emoirical0524') -Wait -PassThru -WindowStyle Hidden
$p.ExitCode
```

The grid runner calls `paperB_gx_one_1995_2023_tables.do` once for each
combination of:

```text
G: readiness100 EcoReadiness100 governance100 social100 readiness_delta100
X: vulnerability100 vulnerability_delta100 capacity sensitivity
```

For each combination, the single-combination do-file maps the selected source
columns to internal variables `G_main` and `X_main`, scales `G_main`, `X_main`,
`debt_ratio`, and all controls by 0.01, and then runs the retained workflow:

- Table 2: `G+B+X + controls` only.
- Table 3: controlled debt heterogeneity, controlled climate-risk
  heterogeneity, and controlled full interaction.
- Full-interaction empirical theta.
- Combined debt-change dynamics.
- Theta-grouped heterogeneity with 50/50 and 20% quantile groups.
- Full-theta RSS cutoff.

Grid outputs are written under:

```text
result/gx_grid/<G>__<X>/
```

Each combination directory contains the same retained result files as the
single-combination workflow plus a generated `report.md`. The root-level grid
summary files are:

```text
paperB_gx_grid_empirical_report.md
result/gx_grid/gx_grid_summary.csv
result/gx_grid/paperB_gx_grid_1995_2023_tables.log
```

Reports are generated from the Stata outputs with:

```powershell
python .\generate_gx_grid_reports.py
```

## Delta G/X Grid Extension

The delta G/X grid uses the same 20 source combinations, but replaces the
regression variables with within-country first differences before estimation:

```text
delta G_it = G_it - G_i,t-1
delta X_it = X_it - X_i,t-1
```

The first available year for each country is missing by construction because no
lagged source value exists. For each source pair, the single-combination script
sets `G_main = 0.01 * delta(G source)` and `X_main = 0.01 * delta(X source)`.
`debt_ratio` and all controls continue to be scaled by 0.01 as in the retained
workflow.

Run all 20 delta combinations with:

```powershell
$p = Start-Process -FilePath 'C:\environment_tools\Stata18\StataMP-64.exe' -ArgumentList @('/e','do','paperB_gx_delta_grid_1995_2023_tables.do','C:/Users/chenyu/Desktop/emoirical0524') -Wait -PassThru -WindowStyle Hidden
$p.ExitCode
```

The delta grid runner calls `paperB_gx_delta_one_1995_2023_tables.do` once for
each combination of:

```text
G: readiness100 EcoReadiness100 governance100 social100 readiness_delta100
X: vulnerability100 vulnerability_delta100 capacity sensitivity
```

Delta grid outputs are written under:

```text
result/gx_delta_grid/<G>__<X>/
```

Each combination directory contains the retained result files plus a generated
`report.md`. The root-level delta grid summary files are:

```text
paperB_gx_delta_grid_empirical_report.md
result/gx_delta_grid/gx_delta_grid_summary.csv
result/gx_delta_grid/paperB_gx_delta_grid_1995_2023_tables.log
```

Reports are generated from the Stata outputs with:

```powershell
python .\generate_gx_delta_grid_reports.py
```

## Delta-G / Source-X Grid Extension

The delta-G grid uses the same 20 source combinations, but replaces only the
readiness-side variable with its within-country first difference:

```text
delta G_it = G_it - G_i,t-1
```

`X_it` remains the selected X source variable in levels. The first available
year for each country is missing from the regression sample because no lagged G
value exists. For each source pair, the single-combination script sets
`G_main = 0.01 * delta(G source)` and `X_main = 0.01 * X source`. `debt_ratio`
and all controls continue to be scaled by 0.01.

Run all 20 delta-G/source-X combinations with:

```powershell
$p = Start-Process -FilePath 'C:\environment_tools\Stata18\StataMP-64.exe' -ArgumentList @('/e','do','paperB_gx_deltaG_grid_1995_2023_tables.do','C:/Users/chenyu/Desktop/emoirical0524') -Wait -PassThru -WindowStyle Hidden
$p.ExitCode
```

The delta-G grid runner calls `paperB_gx_deltaG_one_1995_2023_tables.do` once
for each combination of:

```text
G: readiness100 EcoReadiness100 governance100 social100 readiness_delta100
X: vulnerability100 vulnerability_delta100 capacity sensitivity
```

Delta-G grid outputs are written under:

```text
result/gx_deltaG_grid/<G>__<X>/
```

Each combination directory contains the retained result files plus a generated
`report.md`. The root-level delta-G grid summary files are:

```text
paperB_gx_deltaG_grid_empirical_report.md
result/gx_deltaG_grid/gx_deltaG_grid_summary.csv
result/gx_deltaG_grid/paperB_gx_deltaG_grid_1995_2023_tables.log
```

Reports are generated from the Stata outputs with:

```powershell
python .\generate_gx_deltaG_grid_reports.py
```
