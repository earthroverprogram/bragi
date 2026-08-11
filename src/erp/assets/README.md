# Earth Rover Program assets

This directory contains the two official Earth Rover Program logos used by
the report class:

```text
ERP-Primary-Logo-CMYK-Dark Orange.png
ERP-Secondary-Logo-CMYK-Dark Orange.png
```

Both assets were copied without visual modification from the April 2026 Earth
Rover Program brand package. They are approved Dark Orange CMYK variants for
print output on the template's Off white and white surfaces.

Do not recolour, distort, crop, or rebuild the logo. Keep clear space around
each logo equal to the height of two logo "E" glyphs on every side.

The class uses the preferred primary stacked logo at 45 mm on the cover,
above its 20 mm print minimum. It uses the secondary horizontal logo only in
the constrained running footer, where a stacked logo would not fit. The
secondary logo is rendered at 38 mm, above its 35 mm print minimum. The page
margins and otherwise empty bottom-left corner provide the required clear
space.

To use another approved logo file, copy it into the report project and set its
path before `\begin{document}`:

```latex
\reportlogopath{assets/approved-logo-file.png}
\reportfooterlogopath{assets/approved-horizontal-logo-file.png}
```
