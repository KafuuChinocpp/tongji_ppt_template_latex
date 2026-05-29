# 马克思主义基本原理课程论文 LaTeX 模板

这是“同济大学思想政治理论课学生社会实践报告”模板的 LaTeX 版本。

## 目录结构

- `source/main.tex`：模板入口文件。
- `Font/`：模板编译所需字体，`main.tex` 通过相对路径加载。
- `assets/`：模板图片资源，目前包含封面标题图片。
- `docs/FONT_INSTALL.md`：字体来源和安装说明。
- `build/`：本地编译中间产物目录，不纳入版本管理。
- `output/`：生成的 PDF 输出目录。
- `latex_logs/`：历史编译日志和版面对照图片。

## 生成 PDF

推荐直接在本目录运行：

```bash
make
```

生成结果位于：

```text
output/同济大学思想政治理论课学生社会实践报告模板-LaTeX.pdf
```

也可以手动编译：

```bash
cd source
latexmk -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -outdir=../build main.tex
cd ..
cp build/main.pdf output/同济大学思想政治理论课学生社会实践报告模板-LaTeX.pdf
```

如果不用 `latexmk`，也可以在 `source/` 下连续运行两次 `xelatex`，以便目录、链接等辅助信息稳定。

## 清理中间文件

```bash
make clean
```

该命令只清理 `build/` 中的 LaTeX 中间产物，不删除 `output/` 中的 PDF。
