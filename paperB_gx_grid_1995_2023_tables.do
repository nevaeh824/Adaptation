version 18.0
clear
set more off
capture log close
set linesize 255

/*
Run the retained Paper B workflow over all requested G/X source combinations.

G sources:
    readiness100 EcoReadiness100 governance100 social100 readiness_delta100

X sources:
    vulnerability100 vulnerability_delta100 capacity sensitivity

Each combination is written under:
    result/gx_grid/<G>__<X>/
*/

args project_root
local root "`project_root'"
if strtrim("`root'") == "" {
    local root "`c(pwd)'"
}
local root = subinstr("`root'", "\", "/", .)

local g_sources "readiness100 EcoReadiness100 governance100 social100 readiness_delta100"
local x_sources "vulnerability100 vulnerability_delta100 capacity sensitivity"

foreach g of local g_sources {
    foreach x of local x_sources {
        local combo "`g'__`x'"
        display as text "Running G/X combo: `combo'"
        do "`root'/paperB_gx_one_1995_2023_tables.do" "`root'" "`g'" "`x'" "`combo'"
    }
}

display as result "Done. G/X grid workflow completed for all requested combinations."
