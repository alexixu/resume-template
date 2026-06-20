# Agent Instructions

## Project

This repository stores a LaTeX resume template and its generated PDF.

The main source files are `resume.tex` and `resume-zh.tex`.
The style and reusable LaTeX commands live in `resume.cls`.
The generated PDFs are `dist/resume-en.pdf` and `dist/resume-zh.pdf`.

## Build

Use:

```bash
make
```

The build uses `tectonic`:

```bash
make -B
```

Always run `make -B` after changing LaTeX source, style, fonts, or build files.
The Makefile exports `SOURCE_DATE_EPOCH` so repeated builds do not change the PDF only because of metadata timestamps.

## Editing Guidelines

- Edit resume content in `resume.tex`.
- Edit Chinese resume content in `resume-zh.tex`.
- Edit layout, fonts, margins, section spacing, contact formatting, and helper commands in `resume.cls`.
- Keep each resume to one A4 page unless the user explicitly asks otherwise.
- Preserve existing visual structure unless the user asks for a design change.
- Keep section and contact icons working; they depend on FontAwesome files in this repository.
- Prefer small, targeted edits over broad template rewrites.
- Keep README documentation concise and user-facing.
- Keep detailed maintenance instructions in this file.
- Keep public templates free of real personal information.

## Important Files

- `resume.tex`: English resume content.
- `resume-zh.tex`: Chinese resume content.
- `resume.cls`: resume class, layout, fonts, and custom commands.
- `Makefile`: local build entry point.
- `.github/workflows/build-resume.yml`: GitHub Actions PDF build.
- `fonts/NotoSansSC/`: bundled Chinese fonts.
- `fontawesome.sty`, `fontawesomesymbols-generic.tex`, `fontawesomesymbols-xeluatex.tex`, `fonts/fontawesome-webfont.ttf`: local FontAwesome icon support.

## Verification

Before finishing a change:

```bash
make -B
pdfinfo dist/resume-en.pdf
pdfinfo dist/resume-zh.pdf
```

Confirm that:

- The PDF builds successfully.
- The PDF remains one A4 page.
- Icons, Chinese text, and Latin text render correctly.

For layout-sensitive changes, render the PDF to an image and inspect it:

```bash
mkdir -p /tmp/resume-template-review
pdftoppm -png -r 160 dist/resume-en.pdf /tmp/resume-template-review/resume-en
pdftoppm -png -r 160 dist/resume-zh.pdf /tmp/resume-template-review/resume-zh
```

## GitHub Actions

Pushes to `main` trigger the GitHub Actions workflow.
The workflow is path-filtered to resume source, style, font, build, and workflow files.
It installs `tectonic`, runs `make`, uploads the PDF artifacts, and commits `dist/resume-en.pdf` and `dist/resume-zh.pdf` back to `main` if they changed.
