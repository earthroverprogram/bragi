---
title: "Example Report"
author: "Alex Taylor"
date: "2026-04-07"
geometry: margin=1in
fontsize: 11pt
lang: en
---

# Executive Summary

This example report demonstrates a Markdown source file suitable for conversion to EPUB or LaTeX with Pandoc. It includes headings, lists, tables, code blocks, and citations to show common document features.

# Introduction

Pandoc can convert Markdown to many formats, including EPUB and LaTeX. When writing source Markdown, use simple structure and metadata to support both output types.

## Objectives

- Provide a sample document structure
- Demonstrate formatting that converts cleanly
- Include elements often used in reports

# Analysis

The dataset analysis was completed using a Python script. Results are summarized below.

### Key findings

1. The first key finding is clearly stated.
2. The second key finding includes a supporting observation.
3. The third key finding describes the expected impact.

# Results

| Metric | Value | Target |
|--------|------:|-------:|
| Accuracy | 92.3% | 90% |
| Precision | 88.1% | 85% |
| Recall | 90.5% | 88% |

# Methodology

The following code block shows a sample Python function for data processing:

```python
import pandas as pd

def load_and_clean(path):
    df = pd.read_csv(path)
    df = df.dropna()
    return df
```

# Discussion

This section discusses the findings and outlines next steps. Use inline formatting such as *emphasis*, **strong text**, and [links](https://pandoc.org).

# Conclusion

The sample report is ready for conversion with Pandoc. You can generate EPUB or PDF/LaTeX output from this Markdown document.

# References

1. John Doe. *Example Reference*. 2025.
2. Pandoc Documentation. <https://pandoc.org>.
