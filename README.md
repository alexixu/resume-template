# 简历模板

一个适合长期维护的 LaTeX 简历模板，内置中英文版本、GitHub Actions 自动构建，以及面向 Codex 等 coding agent 的维护说明。

[English README](docs/README.en.md)

## 快速开始

```bash
make
```

构建完成后会生成两份 PDF：

```text
dist/resume-en.pdf
dist/resume-zh.pdf
```

本项目使用 `tectonic` 构建，兼容 XeLaTeX 渲染方式。

## 文件结构

| 文件 | 用途 |
| --- | --- |
| `resume.tex` | 英文简历内容，编辑这里生成英文版。 |
| `resume-zh.tex` | 中文简历内容，编辑这里生成中文版。 |
| `resume.cls` | 简历样式文件，负责字体、版式、页边距、标题、联系方式、日期和列表间距。 |
| `Makefile` | 本地构建入口，封装 PDF 输出路径。 |
| `dist/resume-en.pdf` | 运行 `make` 后生成的英文 PDF。 |
| `dist/resume-zh.pdf` | 运行 `make` 后生成的中文 PDF。 |
| `fonts/` | 随仓库保留的字体文件，保证本地和 CI 渲染一致。 |
| `AGENTS.md` | 写给后续 coding agent 的维护说明。 |

## GitHub Actions

push 到 `main` 后，如果简历源码、样式、字体、构建文件或 workflow 发生变化，GitHub Actions 会自动构建中英文 PDF。

workflow 会上传 `dist/resume-en.pdf` 和 `dist/resume-zh.pdf` 作为 artifact；如果 PDF 内容发生变化，也会自动提交回 `main`。

## 如何改成自己的简历

1. 使用这个仓库创建自己的模板仓库，或直接 clone 后改名。
2. 修改 `resume.tex` 和 / 或 `resume-zh.tex`。
3. 只有需要调整版式时，再修改 `resume.cls`。
4. 运行 `make -B` 重新构建。
5. 检查两份 PDF 是否仍然保持一页 A4。

## 维护建议

- 中文使用 `fonts/NotoSansSC/` 下的 Noto Sans SC 字体。
- 英文优先使用 Times New Roman，不可用时回退到 TeX Gyre Termes。
- FontAwesome 文件保留在仓库中，避免图标在 CI 环境里渲染不一致。
- `Makefile` 设置了 `SOURCE_DATE_EPOCH`，减少 PDF metadata 时间戳导致的无意义 diff。
- 第三方字体、图标和 LaTeX 支持文件保留各自上游许可证与版权声明。
