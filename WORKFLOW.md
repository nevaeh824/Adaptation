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
- Baseline governance debt-change regressions.
- Continuous Full-theta debt-change regressions.
- Theta-grouped Full-theta debt-change heterogeneity regressions.
- Censored Full-theta robustness checks.
- Full-theta RSS cutoff experiments for debt-change dynamics.
- Full-theta marginal-effect cutoff experiments for debt-change dynamics.
- Marginal-effect cutoff subsample regressions for debt-change dynamics.

## Inputs

Primary input:

- `cleaned_imf_like_panel_1995_2023.csv`

Supporting data source used to augment the panel:

- `ndgain_countryindex_2026/resources/readiness/governance.csv`

The `governance100` panel column is constructed by matching `iso3` and `year`
to the `ISO3` row and year column in `governance.csv`, then multiplying the
source governance value by 100. Missing source values remain blank in the panel.

Main variables used by the Stata workflow:

- `bond_spreads`: sovereign spread dependent variable.
- `governance100`: governance100 denoted as `G`.
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

Use the local Stata executable name on the machine, such as `stata-mp`,
`stata-se`, or the Windows Stata executable path.

## Execution Steps

1. Resolve paths.

   The do-file sets `root`, `empirical_dir`, `newdata`, and `out`, creates
   `result/` if needed, opens `result/paperB_updated_1995_2023_tables.log`, and
   confirms that the panel CSV exists.

2. Define shared model settings.

   The script maps the empirical notation to Stata variables:

   - `G = governance100`
   - `X = vulnerability100`
   - `B = debt_ratio`
   - controls are `lnrgdp growth inflation_cpi OB_gdp reserves gee rqe tt`

3. Prepare the panel.

   The helper program `prep_panel` encodes `iso3` into a numeric country id,
   declares the panel with `xtset id year`, flags U.S. observations, creates
   `debt_ratio`, and constructs the interaction terms:

   - `G_B = governance100 * debt_ratio`
   - `G_X = governance100 * vulnerability100`

4. Generate Table 1.

   The code imports the panel, applies the descriptive sample restriction to
   non-U.S. country-years in 1995-2023 with nonmissing spread, governance,
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

   The diagnostic table reports counts and means for debt/GDP, governance,
   sovereign spreads, and next-period debt changes.

9. Estimate the baseline governance debt-change regression.

   The dependent variable is `B_{i,t+1} - B_it`. The baseline specification
   regresses this debt change on current governance, controls, country fixed
   effects, and year fixed effects.

10. Estimate continuous Full-theta debt-change regressions.

   The dependent variable is `B_{i,t+1} - B_it`. The main regressors are current
   governance and `governance100 * theta_hat_full`. The do-file reports four
   specifications: controls only, debt only, debt plus controls, and no debt or
   controls.

11. Run theta-grouped heterogeneity regressions.

    The code splits the empirical theta sample into bottom 50% and top 50%
    groups, then into bottom 20% and top 20% groups. Within each subsample, it
    estimates `B_{i,t+1} - B_it` on current governance, controls, country fixed
    effects, and year fixed effects.

12. Run the censored-theta robustness check.

    The robustness check replaces `theta_hat_full` with
    `max(theta_hat_full, 0)` and re-estimates the controlled debt-change model.

13. Run the RSS cutoff experiment.

    The code searches over empirical Full-theta cutoff values that leave both
    low- and high-theta groups nonempty, selects the cutoff that minimizes RSS,
    and then estimates the debt-change equation with regime-specific governance
    slopes.

14. Run the marginal-effect cutoff experiment.

    The code uses the `Z controls` continuous Full-theta debt-change model from
    Step 10. The marginal effect of governance is
    `lambda_0 + lambda_1 * theta_hat_full`. Setting this expression equal to
    zero gives the cutoff `lambda_0 / (-lambda_1)`. The code then estimates the
    same low- and high-theta debt-change regression using this fixed cutoff.

15. Run the marginal-effect cutoff subsample regressions.

    The code splits the debt-change sample into
    `theta_hat_full <= c_ME` and `theta_hat_full > c_ME` groups. Within each
    subsample, it estimates `B_{i,t+1} - B_it` on current governance, controls,
    country fixed effects, and year fixed effects.

16. Close the log and verify completion.

    A successful run ends with the message that Table 1-3, Full-interaction
    theta, theta region diagnostics, baseline debt-change, continuous theta,
    theta-grouped heterogeneity, censored theta, RSS cutoff, marginal-effect
    cutoff, and marginal-effect subsample outputs were written to `result/`.

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
result/table7_0_baseline_debt_change_regression.csv
result/table7_0_baseline_debt_change_regression.dta
result/table7_0_baseline_debt_change_regression.tex
result/table7_continuous_theta_debt_regression.csv
result/table7_continuous_theta_debt_regression.dta
result/table7_continuous_theta_debt_regression.tex
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
  size, the baseline debt-change coefficient, the RSS-selected cutoff, the
  marginal-effect cutoff, and the marginal-effect cutoff subsample coefficients.

## Maintenance Notes

- If the input panel changes, rerun the full do-file rather than editing output
  tables by hand.
- If a new source variable is added to `cleaned_imf_like_panel_1995_2023.csv`,
  document its source and transformation in this workflow.
- If the do-file adds or removes outputs, update both this workflow and
  `paperB_updated_empirical_report.md`.
