# 同济大学 PPT 模板转 LaTeX 实现方案

## 目标

把 `ppt_01/百态冬韵.pptx` 重写成一套可复用的 LaTeX Beamer 模板。最终效果应该尽量接近原 PPT，同时让日后写报告时不需要大量手写 LaTeX，只需要填写标题、作者、目录、章节标题、正文、图片等内容。

这个项目的优先级是：

1. 视觉效果接近原 PPT。
2. 常用页面易于填写和复用。
3. 代码结构清晰，后续可以继续微调。
4. 在不牺牲复刻效果的前提下，尽量减少复杂 LaTeX 暴露给使用者。

## 总体路线

我会采用“混合复刻”的方式实现，而不是简单把 PPT 每一页截图塞进 PDF，也不是一开始就把所有元素完全用 LaTeX 原生重画。

具体做法是：

1. 从 PPT 中提取尺寸、图片素材、颜色、文本和版式信息。
2. 用导出的 PDF 或 PNG 作为视觉参考。
3. 用 `ctexbeamer` 处理中文演示文稿。
4. 用 TikZ 绝对定位来模拟 PPT 中的拖拽排版。
5. 对复杂装饰图形和背景纹理，优先使用从 PPT 中提取或你提供的图片素材。
6. 对标题、正文、目录、页码、流程图、卡片等需要编辑的内容，用 LaTeX 命令封装。

## 技术选型

计划使用：

- `XeLaTeX`：适合中文字体和 Beamer。
- `ctexbeamer`：中文 Beamer 文档类。
- `tikz`：做绝对定位、色块、线条、圆角矩形、装饰元素。
- `graphicx`：插入图片素材。
- `fontspec`：指定中文和英文字体。
- `xcolor`：定义同济蓝和模板辅助色。

基础文档形式大致是：

```latex
\documentclass[aspectratio=169]{ctexbeamer}
\usetheme{TongjiWinter}

\title{汇报标题}
\author{汇报人}
\date{YYYY.MM.DD}

\begin{document}
  ...
\end{document}
```

## 预期文件结构

后续我会尽量把工程整理成类似结构：

```text
ppt_01/
  百态冬韵.pptx
  source/
    latex_template_plan.md
    information_needed.md
    reference/
      original.pdf
      slide_01.png
      slide_02.png
      ...
    assets/
      extracted images and logos
    main.tex
    theme/
      beamerthemeTongjiWinter.sty
      beamercolorthemeTongjiWinter.sty
      beamerfontthemeTongjiWinter.sty
      beamerinnerthemeTongjiWinter.sty
      beamerouterthemeTongjiWinter.sty
```

如果模板规模保持较小，也可能先合并成：

```text
ppt_01/source/
  main.tex
  tongjiwinter.sty
  assets/
  reference/
```

先追求能跑通和好调整，之后再拆分文件。

## 页面类型拆分

我已经初步看过 PPT 结构：它是 16:9，包含 16 页、5 个版式、1 个母版和若干图片素材。

我会把它拆成这些可复用页面类型：

1. 封面页
2. 目录页
3. 章节过渡页
4. 标准标题正文页
5. 多卡片信息页
6. 图文混排页
7. 流程或时间线页
8. 成果展示页
9. 未来展望页
10. 结束感谢页

这些页面不会都要求你写复杂 LaTeX。我会尽量封装成命令，例如：

```latex
\tongjicover
  {同济大学}
  {PPT 模板}
  {XXX}
  {YYYY.MM.DD}

\tongjisectionpage{课程背景概述}

\tongjicontentpage
  {课题背景分析}
  {背景信息一}
  {这里填写正文}
```

实际命令名称会根据实现过程调整，以好用为准。

## 实现阶段

### 阶段一：建立参考资料

需要拿到原 PPT 的标准渲染结果，例如 PDF 或逐页 PNG。这个阶段的目标是建立视觉标尺。

我会检查：

- 页面尺寸是否为 16:9。
- 每页主要元素的位置。
- 字体、字号、颜色。
- 背景图和装饰图是否可提取。
- 哪些内容应该可编辑，哪些可以作为图片背景。

### 阶段二：复刻核心风格页

优先实现这几页：

1. 第 1 页封面
2. 第 2 页目录
3. 第 3 页章节过渡
4. 第 16 页结束页

这四页决定整体风格。只要这几页调准，后续页面会更顺。

### 阶段三：实现内容页模板

根据原 PPT 中间页，继续实现：

- 多列卡片页
- 标题加大段正文页
- 关键词页
- 步骤流程页
- 成果展示页
- 未来展望页

这一阶段会把重复元素抽象成命令，避免每页都复制大量 TikZ 坐标。

### 阶段四：封装使用接口

把常用页面封装成更容易填写的命令或环境。理想状态下，你写一页只需要填少量文本：

```latex
\begin{tongjiframe}{理论与研究方法}
  \tongjipoint{1}{第一点}{这里填写正文}
  \tongjipoint{2}{第二点}{这里填写正文}
\end{tongjiframe}
```

### 阶段五：对比与微调

每次我生成 PDF 后，你可以根据截图反馈：

- 位置偏左或偏右
- 字体太粗或太细
- 色块颜色不对
- 图片裁剪不对
- 页脚、线条、间距不对
- 某一页整体不够像原版

我会根据反馈继续调坐标、颜色、字号和素材。

## 复刻精度说明

LaTeX 可以非常接近 PPT，但以下部分可能需要多轮微调：

- PPT 的阴影和透明度
- 图片裁剪方式
- 字体替换造成的字宽差异
- PowerPoint/WPS 与 XeLaTeX 的文字渲染差异
- 渐变、模糊、艺术字等特殊效果

如果要求最高视觉一致性，某些复杂背景或装饰可以直接使用图片素材；如果要求最高可编辑性，就需要用 TikZ 重画更多元素。我们可以逐页决定。

## 我的工作方式

每次你更新 `information_needed.md` 或补充文件后，我会：

1. 读取你提供的信息。
2. 检查 PPT、素材和参考图。
3. 修改 LaTeX 模板。
4. 编译生成 PDF。
5. 如果环境允许，导出截图做对比。
6. 告诉你当前完成了哪些页、还有哪些差异。

你不需要一次性给全所有信息。可以先给最关键的 PDF、PNG 和字体信息，然后我们逐步迭代。

