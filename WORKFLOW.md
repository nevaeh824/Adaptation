# Empirical Workflow

This workflow documents how `paperB_updated_1995_2023_tables.do` reproduces the
updated Paper B empirical outputs summarized in
`paperB_updated_empirical_report.md`.

## Scope

The workflow uses the 1995-2023 country-year panel in
`cleaned_imf_like_panel_1995_2023.csv` and writes all Stata logs, tables, and
intermediate theta outputs to `result/`.

The do-file currently produces:

- Table 1 descriptive statistics.
- Table 2 baseline fixed-effects sovereign spread regressions.
- Table 3 debt and climate-risk heterogeneity regressions.
- Full-interaction empirical theta estimates.
- Full-theta region diagnostics.
- Combined debt-change dynamics table ordered as baseline readiness,
  continuous Full-theta, and the former Full-theta dynamics specifications.
- Theta-grouped Full-theta debt-change heterogeneity regressions.
- Censored Full-theta robustness checks.
- Full-theta RSS cutoff experiments for debt-change dynamics.
- Full-theta marginal-effect cutoff diagnostics for debt-change dynamics.
- Marginal-effect cutoff subsample diagnostics for debt-change dynamics.

## Inputs

Primary input:

- `cleaned_imf_like_panel_1995_2023.csv`

Supporting data source used to augment the panel:

- `ndgain_countryindex_2026/resources/readiness/readiness.csv`

The Stata workflow consumes the `readiness100` panel column directly from
`cleaned_imf_like_panel_1995_2023.csv`. The panel keeps `governance100` as a
separate source column, but it is no longer the empirical `G` variable in this
workflow.

Main variables used by the Stata workflow:

- `bond_spreads`: sovereign spread dependent variable.
- `readiness100`: readiness proxy, denoted as `G`.
- `vulnerability100`: vulnerability proxy, denoted as `X`.
- `debt_gdp`: debt/GDP source variable, converted to `debt_ratio`.
- `lnrgdp`, `growth`, `inflation_cpi`, `OB_gdp`, `reserves`, `gee`, `rqe`, `tt`:
  control vector.

## Environment

Required software:

- Stata 18 or compatible.
- A shell capable of running Stata in batch mode.

The do-file accepts an optional project root argument. If the argument is
omitted, it uses the current working directory. The script first checks
`<root>/empirical/cleaned_imf_like_panel_1995_2023.csv`; if that file does not
exist, it uses `<root>/cleaned_imf_like_panel_1995_2023.csv`.

Example command:

```powershell
stata-mp -b do paperB_updated_1995_2023_tables.do "C:/Users/chenyu/Desktop/emoirical0524"
```

On the current Windows machine, the verified command uses the local Stata 18
installation under `C:\environment_tools`:

```powershell
$p = Start-Process -FilePath 'C:\environment_tools\Stata18\StataMP-64.exe' -ArgumentList @('/e','do','paperB_updated_1995_2023_tables.do','C:/Users/chenyu/Desktop/emoirical0524') -Wait -PassThru -WindowStyle Hidden
$p.ExitCode
```

## Execution Steps

1. Resolve paths.

   The do-file sets `root`, `empirical_dir`, `newdata`, and `out`, creates
   `result/` if needed, opens `result/paperB_updated_1995_2023_tables.log`, and
   confirms that the panel CSV exists.

2. Define shared model settings.

   The script maps the empirical notation to Stata variables:

   - `G = readiness100`
   - `X = vulnerability100`
   - `B = debt_ratio`
   - controls are `lnrgdp growth inflation_cpi OB_gdp reserves gee rqe tt`

3. Prepare the panel.

   The helper program `prep_panel` encodes `iso3` into a numeric country id,
   declares the panel with `xtset id year`, flags U.S. observations, creates
   `debt_ratio`, and constructs the interaction terms:

   - `G_B = readiness100 * debt_ratio`
   - `G_X = readiness100 * vulnerability100`

4. Generate Table 1.

   The code imports the panel, applies the descriptive sample restriction to
   non-U.S. country-years in 1995-2023 with nonmissing spread, readiness,
   vulnerability, and debt/GDP, then exports descriptive statistics as CSV, DTA,
   and LaTeX.

5. Generate Table 2.

   The code estimates seven robust fixed-effects spread regressions over
   1995-2023. Specifications separately test `G`, `B`, and `X`, then repeat
   those regressions with controls, and finally estimate the combined
   `G + B + X + controls` model.

6. Generate Table 3.

   The code estimates debt heterogeneity, climate-risk heterogeneity, and full
   interaction spread models, each with and without controls. The key interaction
   terms are `G_B` and `G_X`.

7. Construct Full-interaction empirical theta.

   The controlled full-interaction spread model is estimated on non-U.S.
   observations. The saved theta panel computes:

   ```text
   theta_hat_full = B_it * -d s_it / d G_it
                  = B_it * -(beta_G + beta_GB * B_it + beta_GX * X_it)
   ```

   The code saves both the coefficient table and the observation-level theta
   panel.

8. Produce Full-theta region diagnostics.

   Observations with nonmissing `theta_hat_full` are grouped into three regions:

   - `theta_hat_full < 0`
   - `0 <= theta_hat_full < 1`
   - `theta_hat_full >= 1`

   The diagnostic table reports counts and means for debt/GDP, readiness,
   sovereign spreads, and next-period debt changes.

9. Estimate and export the combined debt-change dynamics table.

   The dependent variable is `B_{i,t+1} - B_it`. The code estimates three
   component regressions and writes them as one combined presentation table
   ordered as Baseline, Continuous Full-theta, and Full-theta dynamics. The
   baseline column regresses this debt change on current readiness, controls,
   country fixed effects, and year fixed effects. The continuous Full-theta
   column uses current readiness and `readiness100 * theta_hat_full` with the
   same control vector and fixed effects. The Full-theta dynamics column also
   adds the Full-theta index main effect:

   ```text
   B_{i,t+1} - B_it = lambda_0 * G_it
                    + lambda_1 * (G_it * theta_hat_full)
                    + lambda_2 * theta_hat_full
                    + alpha_i + tau_t + Gamma'Z_it + error
   ```

   The continuous block now keeps only the `Z controls` specification; the
   former debt-control and no-control variants are not estimated or reported.

10. Run theta-grouped heterogeneity regressions.

    The code splits the empirical theta sample into bottom 50% and top 50%
    groups, then into bottom 80% and top 20% groups. Within each subsample, it
    estimates `B_{i,t+1} - B_it` on current readiness, controls, country fixed
    effects, and year fixed effects.

11. Run the censored-theta robustness check.

    The robustness check replaces `theta_hat_full` with
    `max(theta_hat_full, 0)` and re-estimates the controlled debt-change model.

12. Run the RSS cutoff experiment.

    The code searches over empirical Full-theta cutoff values that leave both
    low- and high-theta groups nonempty, selects the cutoff that minimizes RSS,
    and then estimates the debt-change equation using the same regime-slope
    specification with the common control vector:

    ```text
    B_{i,t+1} - B_it = lambda_L * G_it * 1(theta_hat_full < c)
                     + lambda_H * G_it * 1(theta_hat_full >= c)
                     + Gamma'Z_it
                     + alpha_i + tau_t + error
    ```

    The RSS grid search and final regression both include the same common
    control vector.

13. Run the marginal-effect cutoff diagnostics.

    The code uses the `Z controls` continuous Full-theta debt-change model from
    the combined debt-change step. The marginal effect of readiness is
    `lambda_0 + lambda_1 * theta_hat_full`. Setting this expression equal to
    zero gives the cutoff `lambda_0 / (-lambda_1)`. If this cutoff leaves both
    theta groups nonempty, the code estimates the same low- and high-theta
    debt-change regression using this fixed cutoff. If either group is empty,
    the code writes cutoff diagnostics, marks the split as not admissible, and
    skips the cutoff regressions.

14. Run the marginal-effect cutoff subsample diagnostics.

    The code splits the debt-change sample into
    `theta_hat_full <= c_ME` and `theta_hat_full > c_ME` groups. Within each
    subsample, it estimates `B_{i,t+1} - B_it` on current readiness, controls,
    country fixed effects, and year fixed effects only when the cutoff leaves
    both groups nonempty. Otherwise, it writes skip-status CSV, DTA, and TeX
    diagnostics.

15. Close the log and verify completion.

    A successful run ends with a Stata exit code of 0 and closes
    `result/paperB_updated_1995_2023_tables.log`. Under the current
    `readiness100` specification, the log reports that marginal-effect cutoff
    diagnostics were written and cutoff regressions were skipped because the
    cutoff leaves an empty theta group.

## Output Inventory

The workflow writes or overwrites:

```text
result/paperB_updated_1995_2023_tables.log
result/table1_descriptive_stats_compare.csv
result/table1_descriptive_stats_compare.dta
result/table1_descriptive_stats_compare.tex
result/table2_baseline_fe_periods.tex
result/table3_heterogeneity_theta.tex
result/table6_fullinteraction_theta_regression.tex
result/table6_1_theta_region_stats.csv
result/table6_1_theta_region_stats.dta
result/table6_1_theta_region_stats.tex
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
result/table7_1_censored_theta_debt_regression.csv
result/table7_1_censored_theta_debt_regression.dta
result/table7_1_censored_theta_debt_regression.tex
result/table7_deltaB_rss_cutoff_grid.csv
result/table7_deltaB_rss_cutoff_grid.dta
result/table7_deltaB_rss_selected_cutoff.csv
result/table7_deltaB_rss_selected_cutoff.dta
result/table7_deltaB_rss_cutoff_regression.tex
result/table7_deltaB_marginal_cutoff_selected.csv
result/table7_deltaB_marginal_cutoff_selected.dta
result/table7_deltaB_marginal_cutoff_regression.tex
result/table7_deltaB_marginal_cutoff_subsample.csv
result/table7_deltaB_marginal_cutoff_subsample.dta
result/table7_deltaB_marginal_cutoff_subsample.tex
result/theta_full_empirical_panel.csv
result/theta_full_empirical_panel.dta
```

## Verification Checklist

After running the workflow:

- Confirm that `result/paperB_updated_1995_2023_tables.log` exists.
- Confirm that the log contains no `r(...)` runtime errors.
- Confirm that Stata exits with code 0.
- Confirm that the generated output list matches the inventory above.
- Compare key statistics against `paperB_updated_empirical_report.md`, including
  Table 1 observation counts, Table 2 and Table 3 sample sizes, Full-theta sample
  size, the combined debt-change table coefficients, the RSS-selected cutoff,
  the marginal-effect cutoff, and the marginal-effect cutoff admissibility
  status.

## Maintenance Notes

- If the input panel changes, rerun the full do-file rather than editing output
  tables by hand.
- If a new source variable is added to `cleaned_imf_like_panel_1995_2023.csv`,
  document its source and transformation in this workflow.
- If the do-file adds or removes outputs, update both this workflow and
  `paperB_updated_empirical_report.md`.
