version 18.0
clear
set more off
capture log close
set linesize 255

/*
Paper B delta G/X grid single-combination empirical tables, 1995-2023 panel.

This script produces the retained Paper B empirical outputs: Table 2, Table 3,
the Full-interaction empirical theta panel, a combined debt-change dynamics
table, theta-grouped debt-change heterogeneity regressions, and the
Full-theta debt-change RSS cutoff experiment.
Tables are written as booktabs/threeparttable LaTeX fragments suitable for
direct inclusion in a manuscript.

The selected G and X sources are first-differenced within country as
delta source_it = source_it - source_i,t-1, then scaled to 0.01 times those
delta values. B and all controls are scaled to 0.01 times their source panel
values in prep_panel before interactions and debt-change variables are constructed.
*/

*---------------------------*
* 0. Paths
*---------------------------*
args project_root g_source x_source combo_id
local root "`project_root'"
if strtrim("`root'") == "" {
    local root "`c(pwd)'"
}
local root = subinstr("`root'", "\", "/", .)
local empirical_dir "`root'/empirical"
capture confirm file "`empirical_dir'/cleaned_imf_like_panel_1995_2023.csv"
if _rc {
    local empirical_dir "`root'"
}
global root "`root'"
global empirical_dir "`empirical_dir'"
global newdata "${empirical_dir}/cleaned_imf_like_panel_1995_2023.csv"
if strtrim("`g_source'") == "" {
    display as error "G source variable argument is required."
    exit 198
}
if strtrim("`x_source'") == "" {
    display as error "X source variable argument is required."
    exit 198
}
local combo "`combo_id'"
if strtrim("`combo'") == "" {
    local combo "`g_source'__`x_source'"
}
global g_source "`g_source'"
global x_source "`x_source'"
global combo_id "`combo'"
global grid_out "${empirical_dir}/result/gx_delta_grid"
global out "${grid_out}/`combo'"

capture mkdir "${empirical_dir}/result"
capture mkdir "${grid_out}"
capture mkdir "${out}"
log using "${out}/paperB_gx_delta_one_1995_2023_tables.log", replace text

display as text "Root: ${root}"
display as text "Empirical dir: ${empirical_dir}"
display as text "New data: ${newdata}"
display as text "Output: ${out}"
display as text "G source: ${g_source}"
display as text "X source: ${x_source}"
display as text "Combo: ${combo_id}"

capture confirm file "${newdata}"
if _rc {
    display as error "New data not found: ${newdata}"
    exit 601
}

foreach stale in ///
    table1_descriptive_stats_compare.csv ///
    table1_descriptive_stats_compare.dta ///
    table1_descriptive_stats_compare.tex ///
    table6_1_theta_region_stats.csv ///
    table6_1_theta_region_stats.dta ///
    table6_1_theta_region_stats.tex ///
    table7_1_censored_theta_debt_regression.csv ///
    table7_1_censored_theta_debt_regression.dta ///
    table7_1_censored_theta_debt_regression.tex ///
    table7_deltaB_marginal_cutoff_selected.csv ///
    table7_deltaB_marginal_cutoff_selected.dta ///
    table7_deltaB_marginal_cutoff_regression.tex ///
    table7_deltaB_marginal_cutoff_subsample.csv ///
    table7_deltaB_marginal_cutoff_subsample.dta ///
    table7_deltaB_marginal_cutoff_subsample.tex {
    capture erase "${out}/`stale'"
}

*---------------------------*
* 1. Shared settings
*---------------------------*
global dep_main "bond_spreads"
global G "G_main"
global X "X_main"
global B "debt_ratio"
global ctrls "lnrgdp growth inflation_cpi OB_gdp reserves gee rqe tt"
global ctrls_miss "lnrgdp, growth, inflation_cpi, OB_gdp, reserves, gee, rqe, tt"

*---------------------------*
* 2. Helper programs
*---------------------------*
capture program drop prep_panel
program define prep_panel
    capture drop id is_us debt_ratio G_B G_X G_main X_main G_source_level X_source_level

    compress
    encode iso3, gen(id)
    xtset id year, yearly
    isid iso3 year, sort
    sort id year

    gen byte is_us = inlist(strupper(strtrim(iso3)), "USA", "US") | regexm(strupper(country_name), "UNITED STATES")
    label var is_us "United States indicator"

    capture confirm variable ${g_source}
    if _rc {
        display as error "G source variable not found: ${g_source}"
        exit 111
    }
    capture confirm variable ${x_source}
    if _rc {
        display as error "X source variable not found: ${x_source}"
        exit 111
    }

    gen double G_source_level = ${g_source} if !missing(${g_source})
    gen double X_source_level = ${x_source} if !missing(${x_source})
    gen double G_main = G_source_level - L.G_source_level if !missing(G_source_level, L.G_source_level)
    gen double X_main = X_source_level - L.X_source_level if !missing(X_source_level, L.X_source_level)
    replace G_main = G_main * 0.01 if !missing(G_main)
    replace X_main = X_main * 0.01 if !missing(X_main)
    foreach z in lnrgdp growth inflation_cpi OB_gdp reserves gee rqe tt {
        replace `z' = `z' * 0.01 if !missing(`z')
    }

    gen double debt_ratio = debt_gdp * 0.01 if !missing(debt_gdp)
    label var debt_ratio "Debt/GDP ratio, scaled by 0.01"

    gen double G_B = G_main * debt_ratio if !missing(G_main, debt_ratio)
    gen double G_X = G_main * X_main if !missing(G_main, X_main)
    label var G_B "G x B"
    label var G_X "G x X"

    label var bond_spreads "10-year sovereign spread, s^g"
    label var bond_10y "10-year sovereign yield"
    label var G_main "Delta G source ${g_source}, scaled by 0.01"
    label var X_main "Delta X source ${x_source}, scaled by 0.01"
    label var lnrgdp "Real GDP, scaled by 0.01"
    label var growth "Real GDP growth, scaled by 0.01"
    label var inflation_cpi "CPI inflation, scaled by 0.01"
    label var OB_gdp "Overall balance/GDP, scaled by 0.01"
    label var reserves "International reserves, scaled by 0.01"
    label var gee "Government effectiveness, scaled by 0.01"
    label var rqe "Regulatory quality, scaled by 0.01"
    label var tt "Terms of trade, scaled by 0.01"
end

capture program drop texcell
program define texcell, rclass
    args var
    tempname b se tstat p

    capture scalar `b' = _b[`var']
    if _rc {
        return local coef ""
        return local se ""
        exit
    }
    capture scalar `se' = _se[`var']
    if _rc | missing(`b') | missing(`se') | `se' <= 0 {
        return local coef ""
        return local se ""
        exit
    }

    scalar `tstat' = `b' / `se'

    if !missing(e(df_r)) {
        scalar `p' = 2 * ttail(e(df_r), abs(`tstat'))
    }
    else {
        scalar `p' = 2 * normal(-abs(`tstat'))
    }

    local stars ""
    if scalar(`p') < 0.01 local stars "***"
    else if scalar(`p') < 0.05 local stars "**"
    else if scalar(`p') < 0.10 local stars "*"

    local coef : display %9.3f scalar(`b')
    local coef = strtrim("`coef'")
    local tstatf : display %9.3f scalar(`tstat')
    local tstatf = strtrim("`tstatf'")

    return local coef "`coef'`stars'"
    return local se "(`tstatf')"
end

capture program drop regstats
program define regstats, rclass
    tempvar touse tag
    gen byte `touse' = e(sample)
    egen byte `tag' = tag(id) if `touse'
    quietly count if `tag'
    return scalar N_countries = r(N)
    return scalar N = e(N)
    capture return scalar r2 = e(r2_a)
    if _rc return scalar r2 = .
end

capture program drop collect_model
program define collect_model, rclass
    syntax, Prefix(name)

    foreach v in G_main debt_ratio X_main G_B G_X {
        texcell `v'
        return local `v'_b "`r(coef)'"
        return local `v'_se "`r(se)'"
    }

    regstats
    return scalar N = r(N)
    return scalar N_countries = r(N_countries)
    return scalar r2 = r(r2)
end

*---------------------------*
* 3. Load updated data for regression tables
*---------------------------*
import delimited using "${newdata}", varnames(1) case(preserve) encoding("UTF-8") clear
prep_panel
tempfile updated_panel
save `updated_panel', replace

*---------------------------*
* 4. Table 2: baseline FE, updated 1995-2023 panel
*---------------------------*
use `updated_panel', clear

local ifperiod "year >= 1995 & year <= 2023"

local t2_rhs1 "G_main"
local t2_miss1 "bond_spreads, G_main"
local t2_ctrl1 "No"
local t2_rhs2 "debt_ratio"
local t2_miss2 "bond_spreads, debt_ratio"
local t2_ctrl2 "No"
local t2_rhs3 "X_main"
local t2_miss3 "bond_spreads, X_main"
local t2_ctrl3 "No"
local t2_rhs4 "G_main ${ctrls}"
local t2_miss4 "bond_spreads, G_main, ${ctrls_miss}"
local t2_ctrl4 "Yes"
local t2_rhs5 "debt_ratio ${ctrls}"
local t2_miss5 "bond_spreads, debt_ratio, ${ctrls_miss}"
local t2_ctrl5 "Yes"
local t2_rhs6 "X_main ${ctrls}"
local t2_miss6 "bond_spreads, X_main, ${ctrls_miss}"
local t2_ctrl6 "Yes"
local t2_rhs7 "G_main debt_ratio X_main ${ctrls}"
local t2_miss7 "bond_spreads, G_main, debt_ratio, X_main, ${ctrls_miss}"
local t2_ctrl7 "Yes"

forvalues j = 7/7 {
    local rhs "`t2_rhs`j''"
    local miss "`t2_miss`j''"
    quietly regress bond_spreads `rhs' i.id i.year ///
        if `ifperiod' & !is_us & !missing(`miss'), ///
        vce(robust)
    collect_model, prefix(t2m`j')
    foreach v in G_main debt_ratio X_main {
        local t2_`v'_b`j' "`r(`v'_b)'"
        local t2_`v'_se`j' "`r(`v'_se)'"
    }
    local t2_N`j' : display %9.0fc r(N)
    local t2_Nc`j' : display %9.0fc r(N_countries)
    local t2_r2`j' : display %9.3f r(r2)
}

file open fh using "${out}/table2_baseline_fe_periods.tex", write replace text
file write fh "\begin{table}[H]\centering" _n
file write fh "\begin{threeparttable}" _n
file write fh "\caption{Baseline Fixed-Effects Estimates, 1995--2023}" _n
file write fh "\label{tab:baseline_periods}" _n
file write fh "\scriptsize" _n
file write fh "\begin{tabularx}{\textwidth}{lY}" _n
file write fh "\toprule" _n
file write fh "Dependent variable & \multicolumn{1}{c}{10-year sovereign spread, " _char(36) _char(36) "s^g_{it}" _char(36) _char(36) "} \\" _n
file write fh "\cmidrule(lr){2-2}" _n
file write fh "Specification & G+B+X + controls \\" _n
file write fh "\midrule" _n

foreach row in G_main debt_ratio X_main {
    if "`row'" == "G_main" {
        file write fh _char(36) _char(36) "G_{it}" _char(36) _char(36)
    }
    if "`row'" == "debt_ratio" {
        file write fh _char(36) _char(36) "B_{it}" _char(36) _char(36)
    }
    if "`row'" == "X_main" {
        file write fh _char(36) _char(36) "X_{it}" _char(36) _char(36)
    }
    file write fh " & `t2_`row'_b7'"
    file write fh " \\" _n
    file write fh " "
    file write fh " & `t2_`row'_se7'"
    file write fh " \\" _n
}
file write fh "\midrule" _n
file write fh "Controls & Yes \\" _n
file write fh "Country FE & Yes \\" _n
file write fh "Year FE & Yes \\" _n
file write fh "Sample period & 1995--2023 \\" _n
local tmp = strtrim("`t2_Nc7'")
file write fh "Countries & `tmp' \\" _n
local tmp = strtrim("`t2_N7'")
file write fh "Observations & `tmp' \\" _n
local tmp = strtrim("`t2_r27'")
file write fh "Adjusted " _char(36) _char(36) "R^2" _char(36) _char(36) " & `tmp' \\" _n
file write fh "\bottomrule" _n
file write fh "\end{tabularx}" _n
file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
file write fh "\item Notes: Robust t-statistics are reported in parentheses. *** " _char(36) _char(36) "p<0.01" _char(36) _char(36) ", ** " _char(36) _char(36) "p<0.05" _char(36) _char(36) ", * " _char(36) _char(36) "p<0.10" _char(36) _char(36) "." _n
file write fh "\end{tablenotes}" _n
file write fh "\end{threeparttable}" _n
file write fh "\end{table}" _n
file close fh

*---------------------------*
* 5. Table 3: debt and climate heterogeneity
*---------------------------*
use `updated_panel', clear

local t3_rhs1 "G_main debt_ratio G_B X_main"
local t3_miss1 "bond_spreads, G_main, debt_ratio, G_B, X_main"
local t3_ctrl1 "No"
local t3_rhs2 "G_main debt_ratio G_B X_main ${ctrls}"
local t3_miss2 "bond_spreads, G_main, debt_ratio, G_B, X_main, ${ctrls_miss}"
local t3_ctrl2 "Yes"
local t3_rhs3 "G_main debt_ratio X_main G_X"
local t3_miss3 "bond_spreads, G_main, debt_ratio, X_main, G_X"
local t3_ctrl3 "No"
local t3_rhs4 "G_main debt_ratio X_main G_X ${ctrls}"
local t3_miss4 "bond_spreads, G_main, debt_ratio, X_main, G_X, ${ctrls_miss}"
local t3_ctrl4 "Yes"
local t3_rhs5 "G_main debt_ratio G_B X_main G_X"
local t3_miss5 "bond_spreads, G_main, debt_ratio, G_B, X_main, G_X"
local t3_ctrl5 "No"
local t3_rhs6 "G_main debt_ratio G_B X_main G_X ${ctrls}"
local t3_miss6 "bond_spreads, G_main, debt_ratio, G_B, X_main, G_X, ${ctrls_miss}"
local t3_ctrl6 "Yes"

foreach j in 2 4 6 {
    local rhs "`t3_rhs`j''"
    local miss "`t3_miss`j''"
    quietly regress bond_spreads `rhs' i.id i.year ///
        if !is_us & !missing(`miss'), ///
        vce(robust)
    collect_model, prefix(t3m`j')
    foreach v in G_main debt_ratio X_main G_B G_X {
        local t3_`v'_b`j' "`r(`v'_b)'"
        local t3_`v'_se`j' "`r(`v'_se)'"
    }
    local t3_N`j' : display %9.0fc r(N)
    local t3_Nc`j' : display %9.0fc r(N_countries)
    local t3_r2`j' : display %9.3f r(r2)
}

file open fh using "${out}/table3_heterogeneity_theta.tex", write replace text
file write fh "\begin{table}[H]\centering" _n
file write fh "\begin{threeparttable}" _n
file write fh "\caption{Debt and Climate-Risk Heterogeneity in Sovereign Spread Estimates}" _n
file write fh "\label{tab:heterogeneity_theta}" _n
file write fh "\scriptsize" _n
file write fh "\begin{tabularx}{\textwidth}{lYYY}" _n
file write fh "\toprule" _n
file write fh "Dependent variable & \multicolumn{3}{c}{10-year sovereign spread, " _char(36) _char(36) "s^g_{it}" _char(36) _char(36) "} \\" _n
file write fh "\cmidrule(lr){2-4}" _n
file write fh "Specification & Debt heterogeneity Controls & Climate-risk heterogeneity Controls & Full interaction Controls \\" _n
file write fh "\midrule" _n

foreach row in G_main debt_ratio X_main G_B G_X {
    if "`row'" == "G_main" {
        file write fh _char(36) _char(36) "G_{it}" _char(36) _char(36)
    }
    if "`row'" == "debt_ratio" {
        file write fh _char(36) _char(36) "B_{it}" _char(36) _char(36)
    }
    if "`row'" == "X_main" {
        file write fh _char(36) _char(36) "X_{it}" _char(36) _char(36)
    }
    if "`row'" == "G_B" {
        file write fh _char(36) _char(36) "G_{it}\times B_{it}" _char(36) _char(36)
    }
    if "`row'" == "G_X" {
        file write fh _char(36) _char(36) "G_{it}\times X_{it}" _char(36) _char(36)
    }
    foreach j in 2 4 6 {
        file write fh " & `t3_`row'_b`j''"
    }
    file write fh " \\" _n
    file write fh " "
    foreach j in 2 4 6 {
        file write fh " & `t3_`row'_se`j''"
    }
    file write fh " \\" _n
}
file write fh "\midrule" _n
file write fh "Controls & Yes & Yes & Yes \\" _n
file write fh "Country FE & Yes & Yes & Yes \\" _n
file write fh "Year FE & Yes & Yes & Yes \\" _n
file write fh "Countries"
foreach j in 2 4 6 {
    local tmp = strtrim("`t3_Nc`j''")
    file write fh " & `tmp'"
}
file write fh " \\" _n
file write fh "Observations"
foreach j in 2 4 6 {
    local tmp = strtrim("`t3_N`j''")
    file write fh " & `tmp'"
}
file write fh " \\" _n
file write fh "Adjusted " _char(36) _char(36) "R^2" _char(36) _char(36)
foreach j in 2 4 6 {
    local tmp = strtrim("`t3_r2`j''")
    file write fh " & `tmp'"
}
file write fh " \\" _n
file write fh "\bottomrule" _n
file write fh "\end{tabularx}" _n
file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
file write fh "\item Notes: Robust t-statistics are reported in parentheses. *** " _char(36) _char(36) "p<0.01" _char(36) _char(36) ", ** " _char(36) _char(36) "p<0.05" _char(36) _char(36) ", * " _char(36) _char(36) "p<0.10" _char(36) _char(36) "." _n
file write fh "\end{tablenotes}" _n
file write fh "\end{threeparttable}" _n
file write fh "\end{table}" _n
file close fh

*---------------------------*
* 6. Full-interaction empirical theta
*---------------------------*
use `updated_panel', clear
keep if !is_us & inrange(year, 1995, 2023)
xtset id year, yearly

quietly regress bond_spreads G_main debt_ratio G_B X_main G_X ${ctrls} i.id i.year ///
    if !missing(bond_spreads, G_main, debt_ratio, G_B, X_main, G_X, ${ctrls_miss}), ///
    vce(robust)

collect_model, prefix(t6m1)
foreach v in G_main debt_ratio X_main G_B G_X {
    local t6_`v'_b "`r(`v'_b)'"
    local t6_`v'_se "`r(`v'_se)'"
}
local t6_N : display %9.0fc r(N)
local t6_Nc : display %9.0fc r(N_countries)
local t6_r2 : display %9.3f r(r2)

file open fh using "${out}/table6_fullinteraction_theta_regression.tex", write replace text
file write fh "\begin{table}[H]\centering" _n
file write fh "\begin{threeparttable}" _n
file write fh "\caption{Full-Interaction Spread Model for Empirical Theta}" _n
file write fh "\label{tab:fullinteraction_theta_regression}" _n
file write fh "\scriptsize" _n
file write fh "\begin{tabularx}{\textwidth}{lY}" _n
file write fh "\toprule" _n
file write fh "Dependent variable & \multicolumn{1}{c}{10-year sovereign spread, " _char(36) _char(36) "s^g_{it}" _char(36) _char(36) "} \\" _n
file write fh "\cmidrule(lr){2-2}" _n
file write fh "Specification & (1) \\" _n
file write fh "\midrule" _n

foreach row in G_main debt_ratio X_main G_B G_X {
    if "`row'" == "G_main" {
        file write fh _char(36) _char(36) "G_{it}" _char(36) _char(36)
    }
    if "`row'" == "debt_ratio" {
        file write fh _char(36) _char(36) "B_{it}" _char(36) _char(36)
    }
    if "`row'" == "X_main" {
        file write fh _char(36) _char(36) "X_{it}" _char(36) _char(36)
    }
    if "`row'" == "G_B" {
        file write fh _char(36) _char(36) "G_{it}\times B_{it}" _char(36) _char(36)
    }
    if "`row'" == "G_X" {
        file write fh _char(36) _char(36) "G_{it}\times X_{it}" _char(36) _char(36)
    }
    file write fh " & `t6_`row'_b' \\" _n
    file write fh " & `t6_`row'_se' \\" _n
}
file write fh "\midrule" _n
file write fh "Controls & Yes \\" _n
file write fh "Country FE & Yes \\" _n
file write fh "Year FE & Yes \\" _n
local tmp = strtrim("`t6_Nc'")
file write fh "Countries & `tmp' \\" _n
local tmp = strtrim("`t6_N'")
file write fh "Observations & `tmp' \\" _n
local tmp = strtrim("`t6_r2'")
file write fh "Adjusted " _char(36) _char(36) "R^2" _char(36) _char(36) " & `tmp' \\" _n
file write fh "\bottomrule" _n
file write fh "\end{tabularx}" _n
file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
file write fh "\item Notes: Robust t-statistics are reported in parentheses. *** " _char(36) _char(36) "p<0.01" _char(36) _char(36) ", ** " _char(36) _char(36) "p<0.05" _char(36) _char(36) ", * " _char(36) _char(36) "p<0.10" _char(36) _char(36) "." _n
file write fh "\end{tablenotes}" _n
file write fh "\end{threeparttable}" _n
file write fh "\end{table}" _n
file close fh

gen byte theta_sample_full = e(sample)
gen double sg_G_hat_full = _b[G_main] + _b[G_B] * debt_ratio + _b[G_X] * X_main if theta_sample_full
gen double mG_hat_full = -sg_G_hat_full if theta_sample_full
gen double theta_hat_full = debt_ratio * mG_hat_full if theta_sample_full
format theta_hat_full %20.15g
label var theta_sample_full "Full-interaction spread-model estimation sample"
label var sg_G_hat_full "Marginal spread response to readiness, full interactions"
label var mG_hat_full "Marginal spread relief from selected G, full interactions"
label var theta_hat_full "Theta hat, full interactions"

compress
save "${out}/theta_full_empirical_panel.dta", replace
export delimited using "${out}/theta_full_empirical_panel.csv", replace

tempfile theta_desc
postfile thetadesc str32 varname double N mean sd median min max using `theta_desc', replace
foreach v in theta_hat_full mG_hat_full sg_G_hat_full {
    quietly summarize `v' if theta_sample_full, detail
    post thetadesc ("`v'") (r(N)) (r(mean)) (r(sd)) (r(p50)) (r(min)) (r(max))
}
postclose thetadesc

preserve
    use `theta_desc', clear
    save "${out}/table6_theta_descriptive_stats.dta", replace
    export delimited using "${out}/table6_theta_descriptive_stats.csv", replace

    local rowvars "theta_hat_full mG_hat_full sg_G_hat_full"

    file open fh using "${out}/table6_theta_descriptive_stats.tex", write replace text
    file write fh "\begin{table}[H]\centering" _n
    file write fh "\begin{threeparttable}" _n
    file write fh "\caption{Descriptive Statistics for Full-Interaction Empirical Theta}" _n
    file write fh "\label{tab:theta_descriptive_stats}" _n
    file write fh "\scriptsize" _n
    file write fh "\begin{tabularx}{\textwidth}{lYYYYYY}" _n
    file write fh "\toprule" _n
    file write fh "Variable & " _char(36) _char(36) "N" _char(36) _char(36) " & Mean & SD & Median & Min. & Max. \\" _n
    file write fh "\midrule" _n

    foreach v of local rowvars {
        keep if varname == "`v'"
        local N_s : display %9.0fc N[1]
        local mean_s : display %9.3f mean[1]
        local sd_s : display %9.3f sd[1]
        local med_s : display %9.3f median[1]
        local min_s : display %9.3f min[1]
        local max_s : display %9.3f max[1]
        foreach nm in N_s mean_s sd_s med_s min_s max_s {
            local `nm' = strtrim("``nm''")
        }
        if "`v'" == "theta_hat_full" {
            file write fh _char(36) _char(36) "\widehat{\theta}^{F}_{it}" _char(36) _char(36)
        }
        if "`v'" == "mG_hat_full" {
            file write fh "Marginal spread relief, " _char(36) _char(36) "-\partial s^g/\partial G" _char(36) _char(36)
        }
        if "`v'" == "sg_G_hat_full" {
            file write fh "Marginal spread response, " _char(36) _char(36) "\partial s^g/\partial G" _char(36) _char(36)
        }
        file write fh " & `N_s' & `mean_s' & `sd_s' & `med_s' & `min_s' & `max_s' \\" _n
        use `theta_desc', clear
    }

    file write fh "\bottomrule" _n
    file write fh "\end{tabularx}" _n
    file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
    file write fh "\item Notes: Statistics are computed on the controlled full-interaction spread-model estimation sample." _n
    file write fh "\end{tablenotes}" _n
    file write fh "\end{threeparttable}" _n
    file write fh "\end{table}" _n
    file close fh
restore

*---------------------------*
* 6.1 Full-theta debt-change dynamics regression
*---------------------------*
use "${out}/theta_full_empirical_panel.dta", clear
xtset id year, yearly

gen double B_change = F1.debt_ratio - debt_ratio
gen double G_level = G_main
gen double G_theta_full = G_level * theta_hat_full if !missing(G_level, theta_hat_full)
label var B_change "Next-period change in debt/GDP"
label var G_level "Selected G"
label var G_theta_full "Readiness x Full-theta"

gen byte sample_t6_2_level = theta_sample_full == 1 ///
    & !missing(B_change, G_level, G_theta_full, theta_hat_full, ${ctrls_miss})
label var sample_t6_2_level "Full-theta debt-change dynamics sample"

quietly regress B_change G_level G_theta_full theta_hat_full ${ctrls} i.id i.year ///
    if sample_t6_2_level == 1, vce(robust)

texcell G_level
local t62_G_b "`r(coef)'"
local t62_G_se "`r(se)'"
texcell G_theta_full
local t62_Gtheta_b "`r(coef)'"
local t62_Gtheta_se "`r(se)'"
texcell theta_hat_full
local t62_theta_b "`r(coef)'"
local t62_theta_se "`r(se)'"

foreach z of global ctrls {
    texcell `z'
    local t62_`z'_b "`r(coef)'"
    local t62_`z'_se "`r(se)'"
}

local b_lvl_G = _b[G_level]
local se_lvl_G = _se[G_level]
local t_lvl_G = `b_lvl_G' / `se_lvl_G'
local p_lvl_G = 2 * ttail(e(df_r), abs(`t_lvl_G'))

local b_lvl_Gtheta = _b[G_theta_full]
local se_lvl_Gtheta = _se[G_theta_full]
local t_lvl_Gtheta = `b_lvl_Gtheta' / `se_lvl_Gtheta'
local p_lvl_Gtheta = 2 * ttail(e(df_r), abs(`t_lvl_Gtheta'))

local b_lvl_theta = _b[theta_hat_full]
local se_lvl_theta = _se[theta_hat_full]
local t_lvl_theta = `b_lvl_theta' / `se_lvl_theta'
local p_lvl_theta = 2 * ttail(e(df_r), abs(`t_lvl_theta'))

regstats
local t62_N = r(N)
local t62_Nc = r(N_countries)
local t62_r2 = r(r2)

tempfile t6_2_level
postfile t62level double b_lambda0 se_lambda0 t_lambda0 p_lambda0 ///
    b_lambda1 se_lambda1 t_lambda1 p_lambda1 ///
    b_lambda2 se_lambda2 t_lambda2 p_lambda2 ///
    N_model N_countries r2 using `t6_2_level', replace
post t62level (`b_lvl_G') (`se_lvl_G') (`t_lvl_G') (`p_lvl_G') ///
    (`b_lvl_Gtheta') (`se_lvl_Gtheta') (`t_lvl_Gtheta') (`p_lvl_Gtheta') ///
    (`b_lvl_theta') (`se_lvl_theta') (`t_lvl_theta') (`p_lvl_theta') ///
    (`t62_N') (`t62_Nc') (`t62_r2')
postclose t62level

preserve
    use `t6_2_level', clear
    format b_lambda0 se_lambda0 t_lambda0 p_lambda0 b_lambda1 se_lambda1 t_lambda1 p_lambda1 b_lambda2 se_lambda2 t_lambda2 p_lambda2 r2 %12.6f
    save "${out}/table6_2_debt_level_dynamics_regression.dta", replace
    export delimited using "${out}/table6_2_debt_level_dynamics_regression.csv", replace
restore

local t62_N_s : display %9.0fc `t62_N'
local t62_N_s = strtrim("`t62_N_s'")
local t62_Nc_s : display %9.0fc `t62_Nc'
local t62_Nc_s = strtrim("`t62_Nc_s'")
local t62_r2_s : display %9.3f `t62_r2'
local t62_r2_s = strtrim("`t62_r2_s'")
local t62_p_G_s : display %9.3f `p_lvl_G'
local t62_p_G_s = strtrim("`t62_p_G_s'")
local t62_p_Gtheta_s : display %9.3f `p_lvl_Gtheta'
local t62_p_Gtheta_s = strtrim("`t62_p_Gtheta_s'")
local t62_p_theta_s : display %9.3f `p_lvl_theta'
local t62_p_theta_s = strtrim("`t62_p_theta_s'")

file open fh using "${out}/table6_2_debt_level_dynamics_regression.tex", write replace text
file write fh "\begin{table}[H]\centering" _n
file write fh "\begin{threeparttable}" _n
file write fh "\caption{Full-Theta Debt-Change Dynamics with Readiness}" _n
file write fh "\label{tab:debt_change_fulltheta_readiness}" _n
file write fh "\scriptsize" _n
file write fh "\begin{tabularx}{\textwidth}{lY}" _n
file write fh "\toprule" _n
file write fh "Dependent variable & " _char(36) _char(36) "B_{i,t+1}-B_{it}" _char(36) _char(36) " \\" _n
file write fh "\midrule" _n
file write fh _char(36) _char(36) "G_{it}" _char(36) _char(36) " & `t62_G_b' \\" _n
file write fh " & `t62_G_se' \\" _n
file write fh _char(36) _char(36) "G_{it}\times\widehat{\theta}^{F}_{it}" _char(36) _char(36) " & `t62_Gtheta_b' \\" _n
file write fh " & `t62_Gtheta_se' \\" _n
file write fh _char(36) _char(36) "\widehat{\theta}^{F}_{it}" _char(36) _char(36) " & `t62_theta_b' \\" _n
file write fh " & `t62_theta_se' \\" _n
foreach z of global ctrls {
    if "`z'" == "lnrgdp" local lab "Real GDP"
    if "`z'" == "growth" local lab "Real GDP growth"
    if "`z'" == "inflation_cpi" local lab "CPI inflation"
    if "`z'" == "OB_gdp" local lab "Overall balance/GDP"
    if "`z'" == "reserves" local lab "International reserves"
    if "`z'" == "gee" local lab "Government effectiveness"
    if "`z'" == "rqe" local lab "Regulatory quality"
    if "`z'" == "tt" local lab "Terms of trade"
    file write fh "`lab' & `t62_`z'_b' \\" _n
    file write fh " & `t62_`z'_se' \\" _n
}
file write fh "\midrule" _n
file write fh "Controls & Yes \\" _n
file write fh "Country FE & Yes \\" _n
file write fh "Year FE & Yes \\" _n
file write fh _char(36) _char(36) "p" _char(36) _char(36) "-value: " _char(36) _char(36) "\lambda_0=0" _char(36) _char(36) " & `t62_p_G_s' \\" _n
file write fh _char(36) _char(36) "p" _char(36) _char(36) "-value: " _char(36) _char(36) "\lambda_1=0" _char(36) _char(36) " & `t62_p_Gtheta_s' \\" _n
file write fh _char(36) _char(36) "p" _char(36) _char(36) "-value: " _char(36) _char(36) "\lambda_2=0" _char(36) _char(36) " & `t62_p_theta_s' \\" _n
file write fh "Observations & `t62_N_s' \\" _n
file write fh "Countries & `t62_Nc_s' \\" _n
file write fh "Adjusted " _char(36) _char(36) "R^2" _char(36) _char(36) " & `t62_r2_s' \\" _n
file write fh "\bottomrule" _n
file write fh "\end{tabularx}" _n
file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
file write fh "\item Notes: The specification estimates the next-period change in debt/GDP, " _char(36) _char(36) "B_{i,t+1}-B_{it}" _char(36) _char(36) ", on current readiness, the readiness-Full-theta interaction, Full-theta itself, controls, country fixed effects, and year fixed effects. The estimation sample is the Full-theta estimation sample with nonmissing debt change and all regressors. Robust t-statistics are reported in parentheses. *** " _char(36) _char(36) "p<0.01" _char(36) _char(36) ", ** " _char(36) _char(36) "p<0.05" _char(36) _char(36) ", * " _char(36) _char(36) "p<0.10" _char(36) _char(36) "." _n
file write fh "\end{tablenotes}" _n
file write fh "\end{threeparttable}" _n
file write fh "\end{table}" _n
file close fh

*---------------------------*
* 7.3 Baseline debt-change regression
*---------------------------*
use "${out}/theta_full_empirical_panel.dta", clear
xtset id year, yearly

gen double B_change = F1.debt_ratio - debt_ratio
gen double G_level = G_main
label var B_change "Next-period change in debt/GDP"
label var G_level "Selected G"

gen byte sample_t7_base = theta_sample_full == 1 ///
    & !missing(B_change, G_level, ${ctrls_miss})
label var sample_t7_base "Baseline debt-change sample"

quietly regress B_change G_level ${ctrls} i.id i.year ///
    if sample_t7_base == 1, vce(robust)

texcell G_level
local t7b_G_b "`r(coef)'"
local t7b_G_se "`r(se)'"

foreach z of global ctrls {
    texcell `z'
    local t7b_`z'_b "`r(coef)'"
    local t7b_`z'_se "`r(se)'"
}

local b_base_G = _b[G_level]
local se_base_G = _se[G_level]
local t_base_G = `b_base_G' / `se_base_G'
local p_base_G = 2 * ttail(e(df_r), abs(`t_base_G'))

regstats
local t7b_N = r(N)
local t7b_Nc = r(N_countries)
local t7b_r2 = r(r2)

tempfile t7_baseline
postfile t7base double b_G se_G t_G p_G N_model N_countries r2 using `t7_baseline', replace
post t7base (`b_base_G') (`se_base_G') (`t_base_G') (`p_base_G') ///
    (`t7b_N') (`t7b_Nc') (`t7b_r2')
postclose t7base

preserve
    use `t7_baseline', clear
    format b_G se_G t_G p_G r2 %12.6f
    save "${out}/table7_0_baseline_debt_change_regression.dta", replace
    export delimited using "${out}/table7_0_baseline_debt_change_regression.csv", replace
restore

local t7b_N_s : display %9.0fc `t7b_N'
local t7b_N_s = strtrim("`t7b_N_s'")
local t7b_Nc_s : display %9.0fc `t7b_Nc'
local t7b_Nc_s = strtrim("`t7b_Nc_s'")
local t7b_r2_s : display %9.3f `t7b_r2'
local t7b_r2_s = strtrim("`t7b_r2_s'")
local t7b_p_s : display %9.3f `p_base_G'
local t7b_p_s = strtrim("`t7b_p_s'")

file open fh using "${out}/table7_0_baseline_debt_change_regression.tex", write replace text
file write fh "\begin{table}[H]\centering" _n
file write fh "\begin{threeparttable}" _n
file write fh "\caption{Baseline Readiness and Debt-Change Dynamics}" _n
file write fh "\label{tab:baseline_debt_change_readiness}" _n
file write fh "\scriptsize" _n
file write fh "\begin{tabularx}{\textwidth}{lY}" _n
file write fh "\toprule" _n
file write fh "Dependent variable & " _char(36) _char(36) "B_{i,t+1}-B_{it}" _char(36) _char(36) " \\" _n
file write fh "\midrule" _n
file write fh _char(36) _char(36) "G_{it}" _char(36) _char(36) " & `t7b_G_b' \\" _n
file write fh " & `t7b_G_se' \\" _n
foreach z of global ctrls {
    if "`z'" == "lnrgdp" local lab "Real GDP"
    if "`z'" == "growth" local lab "Real GDP growth"
    if "`z'" == "inflation_cpi" local lab "CPI inflation"
    if "`z'" == "OB_gdp" local lab "Overall balance/GDP"
    if "`z'" == "reserves" local lab "International reserves"
    if "`z'" == "gee" local lab "Government effectiveness"
    if "`z'" == "rqe" local lab "Regulatory quality"
    if "`z'" == "tt" local lab "Terms of trade"
    file write fh "`lab' & `t7b_`z'_b' \\" _n
    file write fh " & `t7b_`z'_se' \\" _n
}
file write fh "\midrule" _n
file write fh "Controls & Yes \\" _n
file write fh "Country FE & Yes \\" _n
file write fh "Year FE & Yes \\" _n
file write fh _char(36) _char(36) "p" _char(36) _char(36) "-value: " _char(36) _char(36) "\lambda_0=0" _char(36) _char(36) " & `t7b_p_s' \\" _n
file write fh "Observations & `t7b_N_s' \\" _n
file write fh "Countries & `t7b_Nc_s' \\" _n
file write fh "Adjusted " _char(36) _char(36) "R^2" _char(36) _char(36) " & `t7b_r2_s' \\" _n
file write fh "\bottomrule" _n
file write fh "\end{tabularx}" _n
file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
file write fh "\item Notes: The baseline debt-change specification estimates " _char(36) _char(36) "B_{i,t+1}-B_{it}" _char(36) _char(36) " on current readiness and controls, with country and year fixed effects. The estimation sample is the Full-theta estimation sample with nonmissing debt change, readiness, and controls. Robust t-statistics are reported in parentheses. *** " _char(36) _char(36) "p<0.01" _char(36) _char(36) ", ** " _char(36) _char(36) "p<0.05" _char(36) _char(36) ", * " _char(36) _char(36) "p<0.10" _char(36) _char(36) "." _n
file write fh "\end{tablenotes}" _n
file write fh "\end{threeparttable}" _n
file write fh "\end{table}" _n
file close fh

*---------------------------*
* 8. Continuous Full-theta debt-change regression
*---------------------------*
use "${out}/theta_full_empirical_panel.dta", clear
xtset id year, yearly

gen double B_change = F1.debt_ratio - debt_ratio
gen double G_level = G_main
gen double G_theta_full = G_level * theta_hat_full if !missing(G_level, theta_hat_full)
label var B_change "Next-period change in debt/GDP"
label var G_level "Selected G"
label var G_theta_full "Readiness x Full-theta"

tempfile t7_continuous
postfile t7cont str24 specification byte debt_control z_controls ///
    double b_lambda0 se_lambda0 t_lambda0 p_lambda0 ///
    b_lambda1 se_lambda1 t_lambda1 p_lambda1 ///
    b_debt se_debt t_debt p_debt ///
    N_model N_countries r2 using `t7_continuous', replace

local t7c_name1 "Z controls"
local t7c_rhs1 "G_level G_theta_full ${ctrls}"
local t7c_miss1 "B_change, G_level, theta_hat_full, G_theta_full, ${ctrls_miss}"
local t7c_debt1 "No"
local t7c_ctrl1 "Yes"
local t7c_models 1

forvalues j = 1/`t7c_models' {
    local rhs "`t7c_rhs`j''"
    local miss "`t7c_miss`j''"
    quietly regress B_change `rhs' i.id i.year ///
        if theta_sample_full == 1 & !missing(`miss'), vce(robust)

    texcell G_level
    local t7c_G_b`j' "`r(coef)'"
    local t7c_G_se`j' "`r(se)'"
    texcell G_theta_full
    local t7c_Gtheta_b`j' "`r(coef)'"
    local t7c_Gtheta_se`j' "`r(se)'"
    texcell debt_ratio
    local t7c_debt_b`j' "`r(coef)'"
    local t7c_debt_se`j' "`r(se)'"

    foreach z of global ctrls {
        texcell `z'
        local t7c_`z'_b`j' "`r(coef)'"
        local t7c_`z'_se`j' "`r(se)'"
    }

    local b_lambda0 = _b[G_level]
    local se_lambda0 = _se[G_level]
    local t_lambda0 = `b_lambda0' / `se_lambda0'
    local p_lambda0 = 2 * ttail(e(df_r), abs(`t_lambda0'))

    local b_lambda1 = _b[G_theta_full]
    local se_lambda1 = _se[G_theta_full]
    local t_lambda1 = `b_lambda1' / `se_lambda1'
    local p_lambda1 = 2 * ttail(e(df_r), abs(`t_lambda1'))
    local t7c_p_G_s`j' : display %9.3f `p_lambda0'
    local t7c_p_G_s`j' = strtrim("`t7c_p_G_s`j''")
    local t7c_p_Gtheta_s`j' : display %9.3f `p_lambda1'
    local t7c_p_Gtheta_s`j' = strtrim("`t7c_p_Gtheta_s`j''")

    local b_debt = .
    local se_debt = .
    local t_debt = .
    local p_debt = .
    capture scalar __tmp_b_debt = _b[debt_ratio]
    if !_rc {
        local b_debt = _b[debt_ratio]
        local se_debt = _se[debt_ratio]
        local t_debt = `b_debt' / `se_debt'
        local p_debt = 2 * ttail(e(df_r), abs(`t_debt'))
    }

    regstats
    local t7c_N`j' = r(N)
    local t7c_Nc`j' = r(N_countries)
    local t7c_r2`j' = r(r2)
    local debt_control = 0
    if "`t7c_debt`j''" == "Yes" local debt_control = 1
    local z_controls = 0
    if "`t7c_ctrl`j''" == "Yes" local z_controls = 1

    post t7cont ("`t7c_name`j''") (`debt_control') (`z_controls') ///
        (`b_lambda0') (`se_lambda0') (`t_lambda0') (`p_lambda0') ///
        (`b_lambda1') (`se_lambda1') (`t_lambda1') (`p_lambda1') ///
        (`b_debt') (`se_debt') (`t_debt') (`p_debt') ///
        (`t7c_N`j'') (`t7c_Nc`j'') (`t7c_r2`j'')
}
postclose t7cont

preserve
    use `t7_continuous', clear
    format b_lambda0 se_lambda0 t_lambda0 p_lambda0 b_lambda1 se_lambda1 t_lambda1 p_lambda1 b_debt se_debt t_debt p_debt r2 %12.6f
    save "${out}/table7_continuous_theta_debt_regression.dta", replace
    export delimited using "${out}/table7_continuous_theta_debt_regression.csv", replace
restore

forvalues j = 1/`t7c_models' {
    local t7c_N_s`j' : display %9.0fc `t7c_N`j''
    local t7c_N_s`j' = strtrim("`t7c_N_s`j''")
    local t7c_Nc_s`j' : display %9.0fc `t7c_Nc`j''
    local t7c_Nc_s`j' = strtrim("`t7c_Nc_s`j''")
    local t7c_r2_s`j' : display %9.3f `t7c_r2`j''
    local t7c_r2_s`j' = strtrim("`t7c_r2_s`j''")
}

local t62_N_csv : display %9.0f `t62_N'
local t62_N_csv = strtrim("`t62_N_csv'")
local t7b_N_csv : display %9.0f `t7b_N'
local t7b_N_csv = strtrim("`t7b_N_csv'")
local t7c_N_csv1 : display %9.0f `t7c_N1'
local t7c_N_csv1 = strtrim("`t7c_N_csv1'")

file open fh using "${out}/table6_2_6_3_7_debt_change_regressions.csv", write replace text
file write fh "row,baseline,continuous_z_controls,full_theta_dynamics" _n
file write fh "G_it,`t7b_G_b',`t7c_G_b1',`t62_G_b'" _n
file write fh "t-stat.,`t7b_G_se',`t7c_G_se1',`t62_G_se'" _n
file write fh "G_it_x_theta_F_it,,`t7c_Gtheta_b1',`t62_Gtheta_b'" _n
file write fh "t-stat.,,`t7c_Gtheta_se1',`t62_Gtheta_se'" _n
file write fh "theta_F_it,,,`t62_theta_b'" _n
file write fh "t-stat.,,,`t62_theta_se'" _n
foreach z of global ctrls {
    if "`z'" == "lnrgdp" local lab "Real GDP"
    if "`z'" == "growth" local lab "Real GDP growth"
    if "`z'" == "inflation_cpi" local lab "CPI inflation"
    if "`z'" == "OB_gdp" local lab "Overall balance/GDP"
    if "`z'" == "reserves" local lab "International reserves"
    if "`z'" == "gee" local lab "Government effectiveness"
    if "`z'" == "rqe" local lab "Regulatory quality"
    if "`z'" == "tt" local lab "Terms of trade"
    file write fh "`lab',`t7b_`z'_b',`t7c_`z'_b1',`t62_`z'_b'" _n
    file write fh "t-stat.,`t7b_`z'_se',`t7c_`z'_se1',`t62_`z'_se'" _n
}
file write fh "Theta main effect,No,No,Yes" _n
file write fh "Debt control,No,No,No" _n
file write fh "Controls,Yes,Yes,Yes" _n
file write fh "Country FE,Yes,Yes,Yes" _n
file write fh "Year FE,Yes,Yes,Yes" _n
file write fh "p(lambda0=0),`t7b_p_s',`t7c_p_G_s1',`t62_p_G_s'" _n
file write fh "p(lambda1=0),,`t7c_p_Gtheta_s1',`t62_p_Gtheta_s'" _n
file write fh "p(lambda2=0),,,`t62_p_theta_s'" _n
file write fh "Observations,`t7b_N_csv',`t7c_N_csv1',`t62_N_csv'" _n
file write fh "Countries,`t7b_Nc_s',`t7c_Nc_s1',`t62_Nc_s'" _n
file write fh "Adjusted R2,`t7b_r2_s',`t7c_r2_s1',`t62_r2_s'" _n
file close fh

file open fh using "${out}/table6_2_6_3_7_debt_change_regressions.tex", write replace text
file write fh "\begin{table}[H]\centering" _n
file write fh "\begin{threeparttable}" _n
file write fh "\caption{Debt-Change Dynamics: Baseline and Full-Theta Specifications}" _n
file write fh "\label{tab:debt_change_combined_fulltheta}" _n
file write fh "\scriptsize" _n
file write fh "\begin{tabularx}{\textwidth}{lYYY}" _n
file write fh "\toprule" _n
file write fh "Dependent variable & \multicolumn{3}{c}{" _char(36) _char(36) "B_{i,t+1}-B_{it}" _char(36) _char(36) "} \\" _n
file write fh "\cmidrule(lr){2-4}" _n
file write fh "Specification & Baseline & Continuous Full-theta & Full-theta dynamics \\" _n
file write fh "\midrule" _n
file write fh _char(36) _char(36) "G_{it}" _char(36) _char(36) " & `t7b_G_b' & `t7c_G_b1' & `t62_G_b' \\" _n
file write fh " & `t7b_G_se' & `t7c_G_se1' & `t62_G_se' \\" _n
file write fh _char(36) _char(36) "G_{it}\times\widehat{\theta}^{F}_{it}" _char(36) _char(36) " &  & `t7c_Gtheta_b1' & `t62_Gtheta_b' \\" _n
file write fh " &  & `t7c_Gtheta_se1' & `t62_Gtheta_se' \\" _n
file write fh _char(36) _char(36) "\widehat{\theta}^{F}_{it}" _char(36) _char(36) " &  &  & `t62_theta_b' \\" _n
file write fh " &  &  & `t62_theta_se' \\" _n
foreach z of global ctrls {
    if "`z'" == "lnrgdp" local lab "Real GDP"
    if "`z'" == "growth" local lab "Real GDP growth"
    if "`z'" == "inflation_cpi" local lab "CPI inflation"
    if "`z'" == "OB_gdp" local lab "Overall balance/GDP"
    if "`z'" == "reserves" local lab "International reserves"
    if "`z'" == "gee" local lab "Government effectiveness"
    if "`z'" == "rqe" local lab "Regulatory quality"
    if "`z'" == "tt" local lab "Terms of trade"
    file write fh "`lab' & `t7b_`z'_b' & `t7c_`z'_b1' & `t62_`z'_b' \\" _n
    file write fh " & `t7b_`z'_se' & `t7c_`z'_se1' & `t62_`z'_se' \\" _n
}
file write fh "\midrule" _n
file write fh "Theta main effect & No & No & Yes \\" _n
file write fh "Debt control & No & No & No \\" _n
file write fh "Controls & Yes & Yes & Yes \\" _n
file write fh "Country FE & Yes & Yes & Yes \\" _n
file write fh "Year FE & Yes & Yes & Yes \\" _n
file write fh _char(36) _char(36) "p" _char(36) _char(36) "-value: " _char(36) _char(36) "\lambda_0=0" _char(36) _char(36) " & `t7b_p_s' & `t7c_p_G_s1' & `t62_p_G_s' \\" _n
file write fh _char(36) _char(36) "p" _char(36) _char(36) "-value: " _char(36) _char(36) "\lambda_1=0" _char(36) _char(36) " &  & `t7c_p_Gtheta_s1' & `t62_p_Gtheta_s' \\" _n
file write fh _char(36) _char(36) "p" _char(36) _char(36) "-value: " _char(36) _char(36) "\lambda_2=0" _char(36) _char(36) " &  &  & `t62_p_theta_s' \\" _n
file write fh "Observations & `t7b_N_s' & `t7c_N_s1' & `t62_N_s' \\" _n
file write fh "Countries & `t7b_Nc_s' & `t7c_Nc_s1' & `t62_Nc_s' \\" _n
file write fh "Adjusted " _char(36) _char(36) "R^2" _char(36) _char(36) " & `t7b_r2_s' & `t7c_r2_s1' & `t62_r2_s' \\" _n
file write fh "\bottomrule" _n
file write fh "\end{tabularx}" _n
file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
file write fh "\item Notes: The table combines the former Sections 6.2, 6.3, and 7 debt-change specifications. The continuous Full-theta column keeps only the Z-controls specification; debt-control and no-control variants are omitted. Robust t-statistics are reported in parentheses. *** " _char(36) _char(36) "p<0.01" _char(36) _char(36) ", ** " _char(36) _char(36) "p<0.05" _char(36) _char(36) ", * " _char(36) _char(36) "p<0.10" _char(36) _char(36) "." _n
file write fh "\end{tablenotes}" _n
file write fh "\end{threeparttable}" _n
file write fh "\end{table}" _n
file close fh

capture erase "${out}/table6_2_debt_level_dynamics_regression.tex"
capture erase "${out}/table7_0_baseline_debt_change_regression.tex"
capture erase "${out}/table7_continuous_theta_debt_regression.tex"

*---------------------------*
* 7.1 Theta-grouped debt-change heterogeneity regressions
*---------------------------*
use "${out}/theta_full_empirical_panel.dta", clear
xtset id year, yearly

gen double B_change = F1.debt_ratio - debt_ratio
gen double G_level = G_main
label var B_change "Next-period change in debt/GDP"
label var G_level "Selected G"

gen byte sample_t7het = theta_sample_full == 1 ///
    & !missing(B_change, G_level, theta_hat_full, ${ctrls_miss})
label var sample_t7het "Full-theta grouped heterogeneity sample"

quietly _pctile theta_hat_full if sample_t7het == 1, p(20 40 50 60 80)
local theta_p20 = r(r1)
local theta_p40 = r(r2)
local theta_p50 = r(r3)
local theta_p60 = r(r4)
local theta_p80 = r(r5)

gen byte theta_group50 = .
replace theta_group50 = 1 if sample_t7het == 1 & theta_hat_full <= `theta_p50'
replace theta_group50 = 2 if sample_t7het == 1 & theta_hat_full > `theta_p50'
label define theta_group50_lbl 1 "Bottom 50%" 2 "Top 50%", replace
label values theta_group50 theta_group50_lbl

gen byte theta_group20 = .
replace theta_group20 = 1 if sample_t7het == 1 & theta_hat_full <= `theta_p20'
replace theta_group20 = 2 if sample_t7het == 1 & theta_hat_full > `theta_p20' & theta_hat_full <= `theta_p40'
replace theta_group20 = 3 if sample_t7het == 1 & theta_hat_full > `theta_p40' & theta_hat_full <= `theta_p60'
replace theta_group20 = 4 if sample_t7het == 1 & theta_hat_full > `theta_p60' & theta_hat_full <= `theta_p80'
replace theta_group20 = 5 if sample_t7het == 1 & theta_hat_full > `theta_p80'
label define theta_group20_lbl 1 "0-20%" 2 "20-40%" 3 "40-60%" 4 "60-80%" 5 "80-100%", replace
label values theta_group20 theta_group20_lbl

tempfile t7_heterogeneity
postfile t7het str24 group str12 split double cutoff_low cutoff_high ///
    b_G se_G t_G p_G N_model N_countries r2 using `t7_heterogeneity', replace

local t7h_name1 "Bottom 50%"
local t7h_split1 "50"
local t7h_cond1 "theta_group50 == 1"
local t7h_low1 "."
local t7h_high1 "`theta_p50'"

local t7h_name2 "Top 50%"
local t7h_split2 "50"
local t7h_cond2 "theta_group50 == 2"
local t7h_low2 "`theta_p50'"
local t7h_high2 "."

local t7h_name3 "0-20%"
local t7h_split3 "20"
local t7h_cond3 "theta_group20 == 1"
local t7h_low3 "."
local t7h_high3 "`theta_p20'"

local t7h_name4 "20-40%"
local t7h_split4 "20"
local t7h_cond4 "theta_group20 == 2"
local t7h_low4 "`theta_p20'"
local t7h_high4 "`theta_p40'"

local t7h_name5 "40-60%"
local t7h_split5 "20"
local t7h_cond5 "theta_group20 == 3"
local t7h_low5 "`theta_p40'"
local t7h_high5 "`theta_p60'"

local t7h_name6 "60-80%"
local t7h_split6 "20"
local t7h_cond6 "theta_group20 == 4"
local t7h_low6 "`theta_p60'"
local t7h_high6 "`theta_p80'"

local t7h_name7 "80-100%"
local t7h_split7 "20"
local t7h_cond7 "theta_group20 == 5"
local t7h_low7 "`theta_p80'"
local t7h_high7 "."

forvalues j = 1/7 {
    quietly regress B_change G_level ${ctrls} i.id i.year ///
        if `t7h_cond`j'', vce(robust)

    texcell G_level
    local t7h_G_b`j' "`r(coef)'"
    local t7h_G_se`j' "`r(se)'"

    foreach z of global ctrls {
        texcell `z'
        local t7h_`z'_b`j' "`r(coef)'"
        local t7h_`z'_se`j' "`r(se)'"
    }

    local b_G = _b[G_level]
    local se_G = _se[G_level]
    local t_G = `b_G' / `se_G'
    local p_G = 2 * ttail(e(df_r), abs(`t_G'))

    regstats
    local t7h_N`j' = r(N)
    local t7h_Nc`j' = r(N_countries)
    local t7h_r2`j' = r(r2)

    post t7het ("`t7h_name`j''") ("`t7h_split`j''") (`t7h_low`j'') (`t7h_high`j'') ///
        (`b_G') (`se_G') (`t_G') (`p_G') ///
        (`t7h_N`j'') (`t7h_Nc`j'') (`t7h_r2`j'')
}
postclose t7het

preserve
    use `t7_heterogeneity', clear
    format cutoff_low cutoff_high b_G se_G t_G p_G r2 %12.6f
    save "${out}/table7_theta_group_heterogeneity.dta", replace
    export delimited using "${out}/table7_theta_group_heterogeneity.csv", replace
restore

forvalues j = 1/7 {
    local t7h_N_s`j' : display %9.0fc `t7h_N`j''
    local t7h_N_s`j' = strtrim("`t7h_N_s`j''")
    local t7h_Nc_s`j' : display %9.0fc `t7h_Nc`j''
    local t7h_Nc_s`j' = strtrim("`t7h_Nc_s`j''")
    local t7h_r2_s`j' : display %9.3f `t7h_r2`j''
    local t7h_r2_s`j' = strtrim("`t7h_r2_s`j''")
}

local theta_p50_s : display %9.3f `theta_p50'
local theta_p50_s = strtrim("`theta_p50_s'")
local theta_p20_s : display %9.3f `theta_p20'
local theta_p20_s = strtrim("`theta_p20_s'")
local theta_p40_s : display %9.3f `theta_p40'
local theta_p40_s = strtrim("`theta_p40_s'")
local theta_p60_s : display %9.3f `theta_p60'
local theta_p60_s = strtrim("`theta_p60_s'")
local theta_p80_s : display %9.3f `theta_p80'
local theta_p80_s = strtrim("`theta_p80_s'")

file open fh using "${out}/table7_theta_group_heterogeneity.tex", write replace text
file write fh "\begin{table}[H]\centering" _n
file write fh "\begin{threeparttable}" _n
file write fh "\caption{Full-Theta Grouped Heterogeneity and Debt-Change Dynamics}" _n
file write fh "\label{tab:theta_group_heterogeneity_debt}" _n
file write fh "\scriptsize" _n
file write fh "\begin{tabularx}{\textwidth}{lYYYYYYY}" _n
file write fh "\toprule" _n
file write fh "Dependent variable & \multicolumn{7}{c}{" _char(36) _char(36) "B_{i,t+1}-B_{it}" _char(36) _char(36) "} \\" _n
file write fh "\cmidrule(lr){2-8}" _n
file write fh "Theta group & Bottom 50\% & Top 50\% & 0--20\% & 20--40\% & 40--60\% & 60--80\% & 80--100\% \\" _n
file write fh "\midrule" _n
file write fh _char(36) _char(36) "G_{it}" _char(36) _char(36)
forvalues j = 1/7 {
    file write fh " & `t7h_G_b`j''"
}
file write fh " \\" _n
file write fh " "
forvalues j = 1/7 {
    file write fh " & `t7h_G_se`j''"
}
file write fh " \\" _n

foreach z of global ctrls {
    if "`z'" == "lnrgdp" local lab "Real GDP"
    if "`z'" == "growth" local lab "Real GDP growth"
    if "`z'" == "inflation_cpi" local lab "CPI inflation"
    if "`z'" == "OB_gdp" local lab "Overall balance/GDP"
    if "`z'" == "reserves" local lab "International reserves"
    if "`z'" == "gee" local lab "Government effectiveness"
    if "`z'" == "rqe" local lab "Regulatory quality"
    if "`z'" == "tt" local lab "Terms of trade"
    file write fh "`lab'"
    forvalues j = 1/7 {
        file write fh " & `t7h_`z'_b`j''"
    }
    file write fh " \\" _n
    file write fh " "
    forvalues j = 1/7 {
        file write fh " & `t7h_`z'_se`j''"
    }
    file write fh " \\" _n
}
file write fh "\midrule" _n
file write fh "Controls & Yes & Yes & Yes & Yes & Yes & Yes & Yes \\" _n
file write fh "Country FE & Yes & Yes & Yes & Yes & Yes & Yes & Yes \\" _n
file write fh "Year FE & Yes & Yes & Yes & Yes & Yes & Yes & Yes \\" _n
file write fh "Observations"
forvalues j = 1/7 {
    file write fh " & `t7h_N_s`j''"
}
file write fh " \\" _n
file write fh "Countries"
forvalues j = 1/7 {
    file write fh " & `t7h_Nc_s`j''"
}
file write fh " \\" _n
file write fh "Adjusted " _char(36) _char(36) "R^2" _char(36) _char(36)
forvalues j = 1/7 {
    file write fh " & `t7h_r2_s`j''"
}
file write fh " \\" _n
file write fh "\bottomrule" _n
file write fh "\end{tabularx}" _n
file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
file write fh "\item Notes: The first two columns split the sample at the median Full-theta value, " _char(36) _char(36) "\widehat{\theta}^{F}_{it}=`theta_p50_s'" _char(36) _char(36) ". The remaining columns split the sample into quintiles using the 20th, 40th, 60th, and 80th percentile cutoffs, " _char(36) _char(36) "`theta_p20_s', `theta_p40_s', `theta_p60_s', `theta_p80_s'" _char(36) _char(36) ". Each column estimates the next-period change in debt/GDP on current readiness and controls within the indicated theta subsample. Robust t-statistics are reported in parentheses. *** " _char(36) _char(36) "p<0.01" _char(36) _char(36) ", ** " _char(36) _char(36) "p<0.05" _char(36) _char(36) ", * " _char(36) _char(36) "p<0.10" _char(36) _char(36) "." _n
file write fh "\end{tablenotes}" _n
file write fh "\end{threeparttable}" _n
file write fh "\end{table}" _n
file close fh

*---------------------------*
* 8. Full-theta RSS cutoff for debt-change regression
*---------------------------*
use "${out}/theta_full_empirical_panel.dta", clear
xtset id year, yearly

gen double B_change = F1.debt_ratio - debt_ratio
gen double G_level = G_main
label var B_change "Next-period change in debt/GDP"
label var G_level "Selected G"

gen byte sample_t7_full = theta_sample_full == 1 ///
    & !missing(B_change, G_level, theta_hat_full, ${ctrls_miss})
label var sample_t7_full "Full-theta debt-change RSS sample"

tempfile t7_grid
postfile t7grid double cutoff rss N N_low N_high share_low share_high using `t7_grid', replace

quietly count if sample_t7_full == 1
local N_t7 = r(N)
quietly levelsof theta_hat_full if sample_t7_full == 1, local(cutoffs7)

foreach c of local cutoffs7 {
    capture drop t7_L_tmp
    capture drop t7_H_tmp
    capture drop t7_G_low_tmp
    capture drop t7_G_high_tmp
    gen byte t7_L_tmp = theta_hat_full < `c' if sample_t7_full == 1
    gen byte t7_H_tmp = theta_hat_full >= `c' if sample_t7_full == 1

    quietly count if sample_t7_full == 1 & t7_L_tmp == 1
    local N_low = r(N)
    quietly count if sample_t7_full == 1 & t7_H_tmp == 1
    local N_high = r(N)

    if `N_low' > 0 & `N_high' > 0 {
        gen double t7_G_low_tmp = G_level * t7_L_tmp if sample_t7_full == 1
        gen double t7_G_high_tmp = G_level * t7_H_tmp if sample_t7_full == 1

        capture quietly regress B_change t7_G_low_tmp t7_G_high_tmp ${ctrls} i.id i.year ///
            if sample_t7_full == 1, vce(robust)
        if !_rc {
            local rss = e(rss)
            local share_low = `N_low' / `N_t7'
            local share_high = `N_high' / `N_t7'
            post t7grid (`c') (`rss') (`N_t7') (`N_low') (`N_high') (`share_low') (`share_high')
        }
    }
}
postclose t7grid

use `t7_grid', clear
quietly count
if r(N) == 0 {
    display as error "No admissible Full-theta debt-change RSS cutoff was found."
    exit 498
}
sort cutoff
gen long rank_cutoff = _n
sort rss cutoff
gen long rank_rss = _n
format cutoff %20.15g
format rss share_low share_high %12.6f
save "${out}/table7_deltaB_rss_cutoff_grid.dta", replace
export delimited using "${out}/table7_deltaB_rss_cutoff_grid.csv", replace

use "${out}/table7_deltaB_rss_cutoff_grid.dta", clear
sort rank_rss

tempname c_hat_scalar
scalar `c_hat_scalar' = cutoff[1]
local rss_hat = rss[1]
local N_grid_hat = N[1]
local N_low_hat = N_low[1]
local N_high_hat = N_high[1]
local share_low_hat = share_low[1]
local share_high_hat = share_high[1]
local pct_hat = 100 * `share_low_hat'

use "${out}/theta_full_empirical_panel.dta", clear
xtset id year, yearly
gen double B_change = F1.debt_ratio - debt_ratio
gen double G_level = G_main
gen byte sample_t7_full = theta_sample_full == 1 ///
    & !missing(B_change, G_level, theta_hat_full, ${ctrls_miss})
gen byte t7_low = theta_hat_full < `c_hat_scalar' if sample_t7_full == 1
gen byte t7_high = theta_hat_full >= `c_hat_scalar' if sample_t7_full == 1
gen double t7_G_low = G_level * t7_low if sample_t7_full == 1
gen double t7_G_high = G_level * t7_high if sample_t7_full == 1

quietly regress B_change t7_G_low t7_G_high ${ctrls} i.id i.year ///
    if sample_t7_full == 1, vce(robust)

texcell t7_G_low
local t7_L_b "`r(coef)'"
local t7_L_se "`r(se)'"
texcell t7_G_high
local t7_H_b "`r(coef)'"
local t7_H_se "`r(se)'"

foreach z of global ctrls {
    texcell `z'
    local t7_`z'_b "`r(coef)'"
    local t7_`z'_se "`r(se)'"
}

local b_lambda_L = _b[t7_G_low]
local se_lambda_L = _se[t7_G_low]
local t_lambda_L = `b_lambda_L' / `se_lambda_L'
local p_lambda_L = 2 * ttail(e(df_r), abs(`t_lambda_L'))

local b_lambda_H = _b[t7_G_high]
local se_lambda_H = _se[t7_G_high]
local t_lambda_H = `b_lambda_H' / `se_lambda_H'
local p_lambda_H = 2 * ttail(e(df_r), abs(`t_lambda_H'))

quietly test t7_G_low = t7_G_high
local p_equal_lambda = r(p)

quietly lincom t7_G_low - t7_G_high
local diff_lambda = r(estimate)
local se_diff_lambda = r(se)
local t_diff_lambda = r(t)
local p_diff_lambda = r(p)
local diff_stars ""
if `p_diff_lambda' < 0.01 local diff_stars "***"
else if `p_diff_lambda' < 0.05 local diff_stars "**"
else if `p_diff_lambda' < 0.10 local diff_stars "*"
local t7_diff_b : display %9.3f `diff_lambda'
local t7_diff_b = strtrim("`t7_diff_b'") + "`diff_stars'"
local t7_diff_se : display %9.3f `t_diff_lambda'
local t7_diff_se = "(" + strtrim("`t7_diff_se'") + ")"

regstats
local t7_N = r(N)
local t7_Nc = r(N_countries)
local t7_r2 = r(r2)

tempfile t7_selected
postfile t7sel double cutoff rss_grid N_grid N_low_grid N_high_grid share_low_grid share_high_grid ///
    b_lambda_L se_lambda_L t_lambda_L p_lambda_L ///
    b_lambda_H se_lambda_H t_lambda_H p_lambda_H ///
    diff_lambda se_diff_lambda t_diff_lambda p_diff_lambda p_equal_lambda ///
    N_model N_countries r2 using `t7_selected', replace
post t7sel (`c_hat_scalar') (`rss_hat') (`N_grid_hat') (`N_low_hat') (`N_high_hat') ///
    (`share_low_hat') (`share_high_hat') ///
    (`b_lambda_L') (`se_lambda_L') (`t_lambda_L') (`p_lambda_L') ///
    (`b_lambda_H') (`se_lambda_H') (`t_lambda_H') (`p_lambda_H') ///
    (`diff_lambda') (`se_diff_lambda') (`t_diff_lambda') (`p_diff_lambda') (`p_equal_lambda') ///
    (`t7_N') (`t7_Nc') (`t7_r2')
postclose t7sel

use `t7_selected', clear
format cutoff %20.15g
format rss_grid share_low_grid share_high_grid b_lambda_L se_lambda_L t_lambda_L p_lambda_L b_lambda_H se_lambda_H t_lambda_H p_lambda_H diff_lambda se_diff_lambda t_diff_lambda p_diff_lambda p_equal_lambda r2 %12.6f
save "${out}/table7_deltaB_rss_selected_cutoff.dta", replace
export delimited using "${out}/table7_deltaB_rss_selected_cutoff.csv", replace
capture erase "${out}/table7_deltaB_top20_cutoff_selected.dta"
capture erase "${out}/table7_deltaB_top20_cutoff_selected.csv"
capture erase "${out}/table7_deltaB_top20_cutoff_regression.tex"

local cutoff_s : display %12.3f `c_hat_scalar'
local cutoff_s = strtrim("`cutoff_s'")
local pct_s : display %9.2f `pct_hat'
local pct_s = strtrim("`pct_s'")
local rss_s : display %12.3f `rss_hat'
local rss_s = strtrim("`rss_s'")
local lowN_s : display %9.0fc `N_low_hat'
local lowN_s = strtrim("`lowN_s'")
local highN_s : display %9.0fc `N_high_hat'
local highN_s = strtrim("`highN_s'")
local N_s : display %9.0fc `t7_N'
local N_s = strtrim("`N_s'")
local Nc_s : display %9.0fc `t7_Nc'
local Nc_s = strtrim("`Nc_s'")
local r2_s : display %9.3f `t7_r2'
local r2_s = strtrim("`r2_s'")
local pL_s : display %9.3f `p_lambda_L'
local pL_s = strtrim("`pL_s'")
local pH_s : display %9.3f `p_lambda_H'
local pH_s = strtrim("`pH_s'")
local peq_s : display %9.3f `p_equal_lambda'
local peq_s = strtrim("`peq_s'")

file open fh using "${out}/table7_deltaB_rss_cutoff_regression.tex", write replace text
file write fh "\begin{table}[H]\centering" _n
file write fh "\begin{threeparttable}" _n
file write fh "\caption{Full-Theta RSS Cutoff and Debt-Change Dynamics}" _n
file write fh "\label{tab:deltaB_rss_cutoff_fulltheta}" _n
file write fh "\scriptsize" _n
file write fh "\begin{tabularx}{\textwidth}{lY}" _n
file write fh "\toprule" _n
file write fh "Dependent variable & " _char(36) _char(36) "B_{i,t+1}-B_{it}" _char(36) _char(36) " \\" _n
file write fh "\midrule" _n
file write fh _char(36) _char(36) "G_{it}\times 1\{\widehat{\theta}^{F}_{it}<\widehat{c}\}" _char(36) _char(36) " & `t7_L_b' \\" _n
file write fh " & `t7_L_se' \\" _n
file write fh _char(36) _char(36) "G_{it}\times 1\{\widehat{\theta}^{F}_{it}\geq\widehat{c}\}" _char(36) _char(36) " & `t7_H_b' \\" _n
file write fh " & `t7_H_se' \\" _n
foreach z of global ctrls {
    if "`z'" == "lnrgdp" local lab "Real GDP"
    if "`z'" == "growth" local lab "Real GDP growth"
    if "`z'" == "inflation_cpi" local lab "CPI inflation"
    if "`z'" == "OB_gdp" local lab "Overall balance/GDP"
    if "`z'" == "reserves" local lab "International reserves"
    if "`z'" == "gee" local lab "Government effectiveness"
    if "`z'" == "rqe" local lab "Regulatory quality"
    if "`z'" == "tt" local lab "Terms of trade"
    file write fh "`lab' & `t7_`z'_b' \\" _n
    file write fh " & `t7_`z'_se' \\" _n
}
file write fh _char(36) _char(36) "\lambda_L-\lambda_H" _char(36) _char(36) " & `t7_diff_b' \\" _n
file write fh " & `t7_diff_se' \\" _n
file write fh "\midrule" _n
file write fh "RSS-selected cutoff " _char(36) _char(36) "\widehat{c}" _char(36) _char(36) " & `cutoff_s' \\" _n
file write fh "Empirical percentile of " _char(36) _char(36) "\widehat{c}" _char(36) _char(36) " & `pct_s' \\" _n
file write fh "RSS at " _char(36) _char(36) "\widehat{c}" _char(36) _char(36) " & `rss_s' \\" _n
file write fh "Low-theta observations & `lowN_s' \\" _n
file write fh "High-theta observations & `highN_s' \\" _n
file write fh "Controls & Yes \\" _n
file write fh "Country FE & Yes \\" _n
file write fh "Year FE & Yes \\" _n
file write fh _char(36) _char(36) "p_L" _char(36) _char(36) " at RSS cutoff & `pL_s' \\" _n
file write fh _char(36) _char(36) "p_H" _char(36) _char(36) " at RSS cutoff & `pH_s' \\" _n
file write fh _char(36) _char(36) "p" _char(36) _char(36) "-value: " _char(36) _char(36) "\lambda_L=\lambda_H" _char(36) _char(36) " & `peq_s' \\" _n
file write fh "Observations & `N_s' \\" _n
file write fh "Countries & `Nc_s' \\" _n
file write fh "Adjusted " _char(36) _char(36) "R^2" _char(36) _char(36) " & `r2_s' \\" _n
file write fh "\bottomrule" _n
file write fh "\end{tabularx}" _n
file write fh "\begin{tablenotes}[flushleft]\footnotesize" _n
file write fh "\item Notes: The RSS cutoff is selected by minimizing RSS over empirical values of " _char(36) _char(36) "\widehat{\theta}^{F}_{it}" _char(36) _char(36) " that leave nonempty low- and high-theta groups. For each candidate cutoff and for the final regression, the model includes regime-specific readiness slopes, the common control vector " _char(36) _char(36) "Z_{it}" _char(36) _char(36) ", country fixed effects, and year fixed effects. Robust t-statistics are reported in parentheses. *** " _char(36) _char(36) "p<0.01" _char(36) _char(36) ", ** " _char(36) _char(36) "p<0.05" _char(36) _char(36) ", * " _char(36) _char(36) "p<0.10" _char(36) _char(36) "." _n
file write fh "\end{tablenotes}" _n
file write fh "\end{threeparttable}" _n
file write fh "\end{table}" _n
file close fh

display as result "Done. Retained Paper B delta G/X outputs written to ${out} for G=${g_source}, X=${x_source}."

log close


