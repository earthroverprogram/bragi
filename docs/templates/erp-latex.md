# Earth Rover Program LaTeX report template

This repository provides a reusable Earth Rover Program document class for
client-facing investigation, survey, analysis, and technical reports. The
class owns the page geometry, brand colours, typography, cover, document
control, headings, running furniture, captions, tables, callouts, and
technical listings. Report source files can therefore remain focused on
project content.

## Requirements

- LuaLaTeX (TeX Live 2026 or another current distribution is recommended)
- `latexmk` for the one-command build shown below
- Installed Inter Regular and Roboto Regular fonts
- The packages loaded by `erp-report.cls`, all of which are included
  in a typical full TeX Live installation

The class intentionally reports an error when compiled with another engine or
when either approved brand font is missing. It does not silently substitute
typography.

## Compile the example

From the repository root, run:

```text
latexmk -lualatex -interaction=nonstopmode -halt-on-error example-report.tex
```

This creates `example-report.pdf`. To build without `latexmk`, run LuaLaTeX
at least twice so that the contents, references, and total page count settle:

```text
lualatex -interaction=nonstopmode -halt-on-error example-report.tex
lualatex -interaction=nonstopmode -halt-on-error example-report.tex
```

Generated LaTeX files are excluded by `.gitignore`.

## Start a new report

1. Copy `erp-report.cls`, `assets/`, and `example-report.tex` into the
   new report directory.
2. Rename the example source to a project-specific filename.
3. Replace the metadata and illustrative content.
4. Keep the logo at the expected path or set an approved alternative with
   `\reportlogopath{...}`.
5. Compile with LuaLaTeX and review the complete PDF before client issue.

A minimal report begins as follows:

```latex
\documentclass{erp-report}

\reporttitle{Site Investigation Report}
\reportnumber{ERP-2026-001}
\clientname{Example Client}
\projectname{Example Project}

\begin{document}
\makecover
\reportfrontmatter
\makedocumentcontrol
\tableofcontents
\reportmainmatter
\chapter{Introduction}
Report content goes here.
\end{document}
```

## Metadata commands

Set metadata in the preamble. Only `\reporttitle` is required to generate the
cover, but client reports should populate all applicable fields.

| Command | Purpose | Default |
| --- | --- | --- |
| `\reporttitle{...}` | Main report title | Required |
| `\reportsubtitle{...}` | Supporting title | Empty |
| `\reportnumber{...}` | Controlled report identifier | Empty |
| `\reportversion{...}` | Revision or issue | `1.0` |
| `\reportdate{...}` | Issue date | `\today` |
| `\reporttype{...}` | Report category | `Technical report` |
| `\reportstatus{...}` | Draft or final status | `Final` |
| `\reportconfidentiality{...}` | Cover issue marking | Empty |
| `\clientname{...}` | Client organization | Empty |
| `\clientcontact{...}` | Named client contact | Empty |
| `\projectname{...}` | Project title | Empty |
| `\projectlocation{...}` | Site or study location | Empty |
| `\projectnumber{...}` | Project identifier | Empty |
| `\preparedby{...}` | Report author | Empty |
| `\reviewedby{...}` | Technical reviewer | Empty |
| `\approvedby{...}` | Approver | Empty |
| `\reportlogopath{...}` | Approved primary logo path | Bundled asset |
| `\reportfooterlogopath{...}` | Approved horizontal logo path | Bundled asset |

## Structural commands

- `\makecover` creates the branded cover and validates the report title.
- `\makedocumentcontrol` creates metadata and authorization tables.
- `\reportfrontmatter` starts lower-case Roman page numbering.
- `\reportmainmatter` starts Arabic page numbering at one.
- `\reportbackmatter` starts references and appendices without resetting the
  page number.
- `\chapterintro{...}` adds a quiet introductory panel below a chapter title.
- `executivesummary` creates an unnumbered, contents-listed summary chapter.

Use standard `\tableofcontents`, `\listoffigures`, `\listoftables`,
`\appendix`, and bibliography tools as needed.

## Custom environments and helpers

| API | Intended use |
| --- | --- |
| `keyfindings` | High-value findings with a Dark Orange accent |
| `recommendations` | Action-oriented recommendations with Mustard accent |
| `summarybox` | Short synthesis or interpretive summary |
| `reportnote` | Supporting note or assumption |
| `reportwarning` | Limitation, hazard, or issue requiring attention |
| `reportfigure` | Standard centered figure float |
| `reporttable` | Standard centered table float |
| `technicalcode` | Breakable technical settings or short code excerpts |
| `\figureplaceholder[Label]{height}` | Rounded figure placeholder |

Each callout accepts an optional title, for example:

```latex
\begin{keyfindings}[Survey findings]
  \begin{itemize}
    \item First finding.
  \end{itemize}
\end{keyfindings}
```

Use ordinary `\caption` and `\label` commands inside `reportfigure` and
`reporttable`. The example shows the recommended table rule and heading
treatment.

## Assets and brand use

The class expects the approved cover and footer logos at:

```text
assets/ERP-Primary-Logo-CMYK-Dark Orange.png
assets/ERP-Secondary-Logo-CMYK-Dark Orange.png
```

The cover uses the official primary stacked logo at 45 mm wide, above the
20 mm print minimum, with generous clear space. See `assets/README.md` before
replacing it. Interior pages use the official Dark Orange secondary horizontal
logo in the bottom-left footer at 38 mm wide, above its 35 mm print minimum.
The page number remains at bottom right, while the report number and version
share the top-right header. The cover does not repeat the footer logo.

The visual system follows the April 2026 Earth Rover Program guidance:

- Roboto Regular for major headings and titles
- Inter Regular for body copy and supporting headings
- print CMYK definitions for the approved Earth Rover Program palette
- Off white and Stone surfaces with Humus text
- Dark Orange for cover structure, headlines, rules, and key emphasis
- soil colours and Mustard for supporting hierarchy
- spacious A4 layouts, fine rules, rounded panels, and branded footers

Use real, high-resolution project photography when a report calls for images.
Select natural field, landscape, soil, agriculture, people, or technology
imagery that complements the palette. Do not use artificial or stock-like
images, and retain rounded corners for image-led cards. The example uses
explicit placeholders so that no unapproved imagery is shipped with the
template.

## Pre-issue checks

Before delivering a report:

1. Replace every placeholder and verify every factual statement.
2. Confirm client, project, revision, authorization, and issue metadata.
3. Verify figure units, scales, legends, orientation, and accessibility.
4. Check citations, cross-references, contents, and page totals.
5. Review the final PDF at screen and print scale.
6. Confirm that the approved logo remains unmodified and has adequate space.
