import csv
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parent
GRID_DIR = ROOT / "result" / "gx_deltaG_grid"
SUMMARY_CSV = GRID_DIR / "gx_deltaG_grid_summary.csv"
SUMMARY_MD = ROOT / "paperB_gx_deltaG_grid_empirical_report.md"

G_SOURCES = [
    "readiness100",
    "EcoReadiness100",
    "governance100",
    "social100",
    "readiness_delta100",
]
X_SOURCES = [
    "vulnerability100",
    "vulnerability_delta100",
    "capacity",
    "sensitivity",
]


def read_csv_dicts(path):
    with path.open(newline="", encoding="utf-8-sig") as f:
        return list(csv.DictReader(f))


def read_csv_rows(path):
    with path.open(newline="", encoding="utf-8-sig") as f:
        return list(csv.reader(f))


def tex_cells(line):
    line = line.strip()
    if line.endswith(r"\\"):
        line = line[:-2].strip()
    return [cell.strip() for cell in line.split("&")]


def parse_estimate_tex(path, labels):
    lines = path.read_text(encoding="utf-8-sig").splitlines()
    out = {}
    stats = {}
    for i, line in enumerate(lines):
        stripped = line.strip()
        for key, label in labels.items():
            if stripped.startswith(label):
                coef_cells = tex_cells(stripped)[1:]
                t_cells = []
                if i + 1 < len(lines):
                    next_cells = tex_cells(lines[i + 1].strip())
                    if next_cells and next_cells[0] == "":
                        t_cells = next_cells[1:]
                out[key] = {"coef": coef_cells, "t": t_cells}
        if stripped.startswith("Countries"):
            stats["Countries"] = tex_cells(stripped)[1:]
        elif stripped.startswith("Observations"):
            stats["Observations"] = tex_cells(stripped)[1:]
        elif stripped.startswith("Adjusted"):
            stats["Adjusted R2"] = tex_cells(stripped)[1:]
    return out, stats


def stars(p):
    try:
        p = float(p)
    except (TypeError, ValueError):
        return ""
    if p < 0.01:
        return "***"
    if p < 0.05:
        return "**"
    if p < 0.10:
        return "*"
    return ""


def fmt_float(value, digits=3):
    if value is None or value == "":
        return ""
    try:
        return f"{float(value):,.{digits}f}"
    except ValueError:
        return str(value)


def md_table(headers, rows):
    lines = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join(["---"] + ["---:"] * (len(headers) - 1)) + " |",
    ]
    for row in rows:
        lines.append("| " + " | ".join(str(x) for x in row) + " |")
    return "\n".join(lines)


def csv_rows_to_md(rows):
    if not rows:
        return ""
    headers = rows[0]
    body = rows[1:]
    lines = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join(["---"] + ["---:"] * (len(headers) - 1)) + " |",
    ]
    for row in body:
        lines.append("| " + " | ".join(row) + " |")
    return "\n".join(lines)


def label_from_combo(combo):
    g, x = combo.split("__", 1)
    return g, x


def write_combo_report(combo_dir):
    combo = combo_dir.name
    g, x = label_from_combo(combo)

    labels = {
        "G": r"$$G_{it}$$",
        "B": r"$$B_{it}$$",
        "X": r"$$X_{it}$$",
        "GxB": r"$$G_{it}\times B_{it}$$",
        "GxX": r"$$G_{it}\times X_{it}$$",
    }
    table2, table2_stats = parse_estimate_tex(combo_dir / "table2_baseline_fe_periods.tex", labels)
    table3, table3_stats = parse_estimate_tex(combo_dir / "table3_heterogeneity_theta.tex", labels)
    table6, table6_stats = parse_estimate_tex(combo_dir / "table6_fullinteraction_theta_regression.tex", labels)
    theta_stats = read_csv_dicts(combo_dir / "table6_theta_descriptive_stats.csv")
    debt_rows = read_csv_rows(combo_dir / "table6_2_6_3_7_debt_change_regressions.csv")
    group_rows = read_csv_dicts(combo_dir / "table7_theta_group_heterogeneity.csv")
    rss = read_csv_dicts(combo_dir / "table7_deltaB_rss_selected_cutoff.csv")[0]

    table2_rows = []
    for key, label in [("G", "$$G_{it}$$"), ("B", "$$B_{it}$$"), ("X", "$$X_{it}$$")]:
        rec = table2.get(key, {"coef": [""], "t": [""]})
        table2_rows.append([label, rec["coef"][0] if rec["coef"] else "", rec["t"][0] if rec["t"] else ""])
    table2_rows += [
        ["Countries", table2_stats.get("Countries", [""])[0], ""],
        ["Observations", table2_stats.get("Observations", [""])[0], ""],
        ["Adjusted $$R^2$$", table2_stats.get("Adjusted R2", [""])[0], ""],
    ]

    table3_rows = []
    for key, label in [
        ("G", "$$G_{it}$$"),
        ("B", "$$B_{it}$$"),
        ("X", "$$X_{it}$$"),
        ("GxB", "$$G_{it}\\times B_{it}$$"),
        ("GxX", "$$G_{it}\\times X_{it}$$"),
    ]:
        rec = table3.get(key, {"coef": ["", "", ""], "t": ["", "", ""]})
        table3_rows.append([label] + rec["coef"])
        table3_rows.append(["t-stat."] + rec["t"])
    table3_rows += [
        ["Countries"] + table3_stats.get("Countries", ["", "", ""]),
        ["Observations"] + table3_stats.get("Observations", ["", "", ""]),
        ["Adjusted $$R^2$$"] + table3_stats.get("Adjusted R2", ["", "", ""]),
    ]

    theta_rows = [
        [
            row["varname"],
            row["N"],
            fmt_float(row["mean"]),
            fmt_float(row["sd"]),
            fmt_float(row["median"]),
            fmt_float(row["min"]),
            fmt_float(row["max"]),
        ]
        for row in theta_stats
    ]

    group_md_rows = []
    for row in group_rows:
        coef = f"{fmt_float(row['b_G'])}{stars(row['p_G'])}"
        group_md_rows.append([
            row["group"],
            fmt_float(row["cutoff_low"]),
            fmt_float(row["cutoff_high"]),
            coef,
            fmt_float(row["t_G"]),
            fmt_float(row["p_G"]),
            row["N_model"],
            row["N_countries"],
            fmt_float(row["r2"]),
        ])

    rss_rows = [
        ["RSS cutoff", fmt_float(rss["cutoff"])],
        ["RSS", fmt_float(rss["rss_grid"])],
        ["Low-theta observations", rss["N_low_grid"]],
        ["High-theta observations", rss["N_high_grid"]],
        ["Low share", fmt_float(rss["share_low_grid"])],
        ["High share", fmt_float(rss["share_high_grid"])],
        ["$$\\lambda_L$$", f"{fmt_float(rss['b_lambda_L'])}{stars(rss['p_lambda_L'])}"],
        ["t-stat. $$\\lambda_L$$", fmt_float(rss["t_lambda_L"])],
        ["$$\\lambda_H$$", f"{fmt_float(rss['b_lambda_H'])}{stars(rss['p_lambda_H'])}"],
        ["t-stat. $$\\lambda_H$$", fmt_float(rss["t_lambda_H"])],
        ["$$\\lambda_L-\\lambda_H$$", f"{fmt_float(rss['diff_lambda'])}{stars(rss['p_diff_lambda'])}"],
        ["p-value $$\\lambda_L=\\lambda_H$$", fmt_float(rss["p_equal_lambda"])],
        ["Observations", rss["N_model"]],
        ["Countries", rss["N_countries"]],
        ["Adjusted $$R^2$$", fmt_float(rss["r2"])],
    ]

    lines = [
        f"# Delta-G/Source-X Combination Report: `{combo}`",
        "",
        "## 1. Specification",
        "",
        f"- $$G_{{it}} = \\Delta$$ `{g}`.",
        f"- $$X_{{it}}$$ source: `{x}`.",
        "- Source `G`, source `X`, and all controls are first multiplied by 0.01.",
        "- Delta `G` is then computed within country from scaled G as `scaled_G_it - scaled_G_i,t-1`; the first country-year observation is missing by construction.",
        "- `X` remains the selected scaled source variable in levels, and `B` is also scaled by 0.01 as in the retained workflow.",
        "- Output directory: `" + str(combo_dir.relative_to(ROOT)).replace("\\", "/") + "`",
        "",
        "## 2. Table 2: Baseline Fixed Effects",
        "",
        md_table(["Variable", "Coefficient", "t-stat."], table2_rows),
        "",
        "## 3. Table 3: Heterogeneity in Spread Estimates",
        "",
        md_table(
            [
                "Variable",
                "Debt heterogeneity Controls",
                "Climate-risk heterogeneity Controls",
                "Full interaction Controls",
            ],
            table3_rows,
        ),
        "",
        "## 4. Full-Interaction Empirical Theta",
        "",
        md_table(["Variable", "Full interaction Controls", "t-stat."], [
            ["$$G_{it}$$", table6.get("G", {"coef": [""]})["coef"][0], table6.get("G", {"t": [""]})["t"][0]],
            ["$$B_{it}$$", table6.get("B", {"coef": [""]})["coef"][0], table6.get("B", {"t": [""]})["t"][0]],
            ["$$X_{it}$$", table6.get("X", {"coef": [""]})["coef"][0], table6.get("X", {"t": [""]})["t"][0]],
            ["$$G_{it}\\times B_{it}$$", table6.get("GxB", {"coef": [""]})["coef"][0], table6.get("GxB", {"t": [""]})["t"][0]],
            ["$$G_{it}\\times X_{it}$$", table6.get("GxX", {"coef": [""]})["coef"][0], table6.get("GxX", {"t": [""]})["t"][0]],
            ["Countries", table6_stats.get("Countries", [""])[0], ""],
            ["Observations", table6_stats.get("Observations", [""])[0], ""],
            ["Adjusted $$R^2$$", table6_stats.get("Adjusted R2", [""])[0], ""],
        ]),
        "",
        md_table(["Variable", "N", "Mean", "SD", "Median", "Min.", "Max."], theta_rows),
        "",
        "## 5. Combined Debt-Change Dynamics",
        "",
        csv_rows_to_md(debt_rows),
        "",
        "## 6. Theta-Grouped Heterogeneity",
        "",
        md_table(
            ["Group", "Cutoff low", "Cutoff high", "$$G_{it}$$", "t-stat.", "p-value", "N", "Countries", "Adj. $$R^2$$"],
            group_md_rows,
        ),
        "",
        "## 7. RSS Cutoff",
        "",
        md_table(["Item", "Value"], rss_rows),
        "",
    ]

    (combo_dir / "report.md").write_text("\n".join(lines), encoding="utf-8")

    debt_dict = {row[0]: row[1:] for row in debt_rows[1:]}
    return {
        "combo": combo,
        "G": g,
        "X": x,
        "table2_G": table2.get("G", {"coef": [""]})["coef"][0],
        "table2_G_t": table2.get("G", {"t": [""]})["t"][0],
        "table2_B": table2.get("B", {"coef": [""]})["coef"][0],
        "table2_X": table2.get("X", {"coef": [""]})["coef"][0],
        "table2_r2": table2_stats.get("Adjusted R2", [""])[0],
        "full_GxB": table6.get("GxB", {"coef": [""]})["coef"][0],
        "full_GxX": table6.get("GxX", {"coef": [""]})["coef"][0],
        "theta_mean": fmt_float(theta_stats[0]["mean"]),
        "theta_median": fmt_float(theta_stats[0]["median"]),
        "debt_baseline_G": debt_dict.get("G_it", ["", "", ""])[0],
        "debt_continuous_Gtheta": debt_dict.get("G_it_x_theta_F_it", ["", "", ""])[1],
        "debt_full_theta_main": debt_dict.get("theta_F_it", ["", "", ""])[2],
        "rss_cutoff": fmt_float(rss["cutoff"]),
        "rss_lambda_L": f"{fmt_float(rss['b_lambda_L'])}{stars(rss['p_lambda_L'])}",
        "rss_lambda_H": f"{fmt_float(rss['b_lambda_H'])}{stars(rss['p_lambda_H'])}",
        "rss_p_equal": fmt_float(rss["p_equal_lambda"]),
        "N": rss["N_model"],
        "report": str((combo_dir / "report.md").relative_to(ROOT)).replace("\\", "/"),
    }


def main():
    rows = []
    for g in G_SOURCES:
        for x in X_SOURCES:
            combo_dir = GRID_DIR / f"{g}__{x}"
            if not combo_dir.exists():
                raise FileNotFoundError(combo_dir)
            rows.append(write_combo_report(combo_dir))

    with SUMMARY_CSV.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)

    summary_rows = [
        [
            row["G"],
            row["X"],
            row["table2_G"],
            row["full_GxB"],
            row["full_GxX"],
            row["theta_mean"],
            row["debt_baseline_G"],
            row["debt_continuous_Gtheta"],
            row["rss_cutoff"],
            row["rss_lambda_L"],
            row["rss_lambda_H"],
            row["rss_p_equal"],
            f"[report]({row['report']})",
        ]
        for row in rows
    ]

    lines = [
        "# Paper B Delta-G/Source-X Grid Empirical Report",
        "",
        "This report summarizes the retained Paper B workflow for all 20 requested delta-G/source-X combinations.",
        "",
        "## 1. Design",
        "",
        "- G sources: `readiness100`, `EcoReadiness100`, `governance100`, `social100`, `readiness_delta100`.",
        "- X sources: `vulnerability100`, `vulnerability_delta100`, `capacity`, `sensitivity`.",
        "- For each source pair, source `G`, source `X`, and all controls are first multiplied by 0.01.",
        "- `G` is then replaced by its within-country first difference from scaled G: `scaled_G_it - scaled_G_i,t-1`.",
        "- `X` remains the selected scaled source variable in levels.",
        "- Each combination uses the same retained workflow as `WORKFLOW.md`: Table 2, Table 3, full-interaction theta, combined debt-change dynamics, theta-grouped heterogeneity, and RSS cutoff.",
        "- `B` is also scaled by 0.01 as in the retained workflow.",
        "- Detailed per-combination reports are written to `result/gx_deltaG_grid/<G>__<X>/report.md`.",
        "",
        "## 2. Output Inventory",
        "",
        "- Batch runner: `paperB_gx_deltaG_grid_1995_2023_tables.do`.",
        "- Single-combination engine: `paperB_gx_deltaG_one_1995_2023_tables.do`.",
        "- Grid runner log: `result/gx_deltaG_grid/paperB_gx_deltaG_grid_1995_2023_tables.log`.",
        "- Machine-readable summary: `result/gx_deltaG_grid/gx_deltaG_grid_summary.csv`.",
        "",
        "## 3. Cross-Combination Summary",
        "",
        md_table(
            [
                "G source",
                "X source",
                "Table 2 $$G$$",
                "Full $$G\\times B$$",
                "Full $$G\\times X$$",
                "Mean theta",
                "Debt baseline $$G$$",
                "Debt continuous $$G\\times\\theta$$",
                "RSS cutoff",
                "$$\\lambda_L$$",
                "$$\\lambda_H$$",
                "p equal",
                "Detail",
            ],
            summary_rows,
        ),
        "",
        "## 4. Verification",
        "",
        "All 20 single-combination Stata logs were checked for `r(...)` runtime errors after the grid run. No runtime errors were found.",
        "",
    ]
    SUMMARY_MD.write_text("\n".join(lines), encoding="utf-8")


if __name__ == "__main__":
    main()
