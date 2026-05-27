# 同济大学计算机组成原理实验报告 LaTeX 模板

本模板用 XeLaTeX 复现 `计算机组成原理课程设计实验二乘法器实验.pdf` 的 A4 版式。正文内容写在 `src/main.tex`，页面、封面、字体、章节、图表、公式和代码样式封装在 `src/tongji-comporg-report.cls`。

## 目录

- `src/`：LaTeX 源码和模板类。
- `assets/`：报告图片素材，封面校徽为 `assets/title-logo.png`。
- `fonts/`：本地字体目录，字体文件不提交到仓库，准备方法见 `FONT_DEPENDENCIES.md`。
- `build/`：编译输出目录，日志和中间文件都放在这里。

## 编译

Arch Linux 上建议安装 `texlive`、`texlive-langchinese`、`latexmk`，并按 `FONT_DEPENDENCIES.md` 准备本地字体文件。在当前目录执行：

```sh
make
```

生成的 PDF 位于 `build/main.pdf`。

## 填写报告

封面信息在 `src/main.tex` 顶部填写：

```tex
\ReportTopic{乘法器}
\ReportStudentID{2250000}
\ReportStudentName{张三}
\ReportMajor{计算机科学与技术}
\ReportTeacher{李四}
```

正文用模板命令保持格式一致：

```tex
\ReportSection{实验环境与实验内容}
这里直接填写正文段落。

\ReportFigure[0.7\linewidth]{assets/example.png}{仿真波形}

\begin{equation}
  P = A \times B
\end{equation}

\begin{ReportCode}
module multiplier(input [31:0] a, input [31:0] b, output [63:0] p);
  assign p = a * b;
endmodule
\end{ReportCode}
```
