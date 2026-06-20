# Resume Template

A minimal, reproducible LaTeX resume template designed for long-term maintenance with GitHub, GitHub Actions, and coding agents such as Codex.

[中文说明](../README.md)

## Quick Start

```bash
make
```

The generated PDFs will be written to:

```text
dist/resume-en.pdf
dist/resume-zh.pdf
```

This project uses `tectonic` for XeLaTeX-compatible rendering.

## File Layout

| File | Purpose |
| --- | --- |
| `resume.tex` | English resume content. Edit this file for your own English resume. |
| `resume-zh.tex` | Chinese resume content. Edit this file for your own Chinese resume. |
| `resume.cls` | Resume document class: fonts, layout, margins, section styles, contact info, dates, and list spacing. |
| `Makefile` | Local build command and output path. |
| `dist/resume-en.pdf` | Generated English PDF output after running `make`. |
| `dist/resume-zh.pdf` | Generated Chinese PDF output after running `make`. |
| `fonts/` | Bundled fonts for consistent local and CI rendering. |
| `AGENTS.md` | Maintenance notes for future coding agents. |

## GitHub Actions

Pushes to `main` automatically build both PDFs when resume source, style, fonts, build files, or the workflow changes.

The workflow uploads `dist/resume-en.pdf` and `dist/resume-zh.pdf` as artifacts and commits them back to `main` if the PDFs changed.

## Customize

1. Rename the repository for your own resume.
2. Edit `resume.tex` and/or `resume-zh.tex`.
3. Adjust style only when needed in `resume.cls`.
4. Run `make -B`.
5. Check that both generated PDFs remain one A4 page.

## Notes

- Chinese text uses bundled Noto Sans SC fonts under `fonts/NotoSansSC/`.
- Latin text uses Times New Roman when available, with TeX Gyre Termes as a fallback.
- FontAwesome files are kept locally so icons render consistently.
- `SOURCE_DATE_EPOCH` is set in the Makefile to reduce meaningless PDF metadata diffs.
- Third-party fonts and icon files keep their own upstream licenses and notices.
