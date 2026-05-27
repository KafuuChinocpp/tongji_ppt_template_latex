# Vibe coding 排版协作说明

这个模板现在分成两层：

- `main_hybrid.tex`：内容脚本。优先在这里改标题、正文、图片和页面顺序。
- `tongjiwinter-layouts.tex`：版式库。只在需要调整某一类页面的位置、字号、颜色、图片透明度时修改。

## 内容修改方式

新增或修改内容时，尽量使用已有页面命令，不直接写坐标。例如：

```tex
\WinterCapabilityFrame{典型能力拆解}{%
  \WinterCapabilityCard{1}{生成}{根据目标描述生成页面、接口、脚本或测试样例}
  \WinterCapabilityCard{2}{修改}{根据反馈进行局部重构和样式调整}
  \WinterCapabilityCard{3}{验证}{通过日志、截图和测试结果定位问题}
  \WinterCapabilityCard{4}{沉淀}{把有效提示和流程规范沉淀为团队资产}
}
```

这样 AI 只需要选择“第几个卡片/第几个步骤”，不会每次重新猜坐标。

## 图片插入方式

常规图片放到 `assets/` 里，然后在内容脚本中传入路径：

```tex
\WinterMethodFrame
  {调研方法}
  {assets/image4.jpeg}
  {正文内容}
  {关键词：\\意图表达\\快速原型\\自动修复\\人工验收}
```

模板已经把常见图片位置封装成槽位。优先使用这些页面命令传图：

```tex
\WinterWhyFrame
  {为什么值得关注}
  {assets/image3.jpeg}
  {assets/image8.jpeg}
  {需求侧变化}
  {正文}
  {供给侧变化}
  {正文}
```

现在可用的图片槽位包括：

- `\WinterWhyPhotoSlots`：第 5 页右侧主图和辅助图。
- `\WinterMethodPhotoSlot`：第 8 页右侧调研方法图。
- `\WinterFindingPhotoSlot`：第 12 页右侧竖向发现图。
- `\WinterRecommendationHeroPhoto`：第 14 页顶部横幅图。

如果某页需要微调图片位置、裁切、透明度或蓝色蒙版，去 `tongjiwinter-layouts.tex` 里调整对应槽位，不在 `main_hybrid.tex` 里写坐标。

## 干净背景图片页

含图片的内容页现在优先使用 `reference/background.png` 作为纯背景，不再叠加原 PPT 里已经带照片的页面背景。

当前已经做了四种常见排版：

- 第 5 页：左侧双段文字，右侧主图 + 辅助图。
- 第 8 页：左侧说明文字，右侧蓝色信息块 + 图片。
- 第 12 页：左侧关键发现，右侧大图。
- 第 14 页：顶部横幅图，下方正文 + 四点建议。

World Model 示例稿中验证过的版式也已经收进模板：

- `\WinterTextImageFrame`：左侧说明文字，右侧大图。
- `\WinterTwoImageCompareFrame`：左右双图对比，各带说明。
- `\WinterWideImageFrame`：单张大图居中，下方说明。
- `\WinterArchitectureFrame`：架构/流程大图，下方说明。
- `\WinterArchitecturePointsFrame`：上方宽图，下方两个说明点。
- `\WinterDualArchitectureFrame`：左右两个架构图，各带说明。
- `\WinterExperimentCompareFrame`：左右两张实验截图，各带标题和说明。
- `\WinterThreeImageResultFrame`：两张上方结果图 + 一张下方横向图。
- `\WinterCodeAnalysisFrame`：左侧问题图，右侧两张代码/日志图。
- `\WinterPlanFrame`：研究计划或路线图大图。

如果要新增图片页，优先复用这些结构；只有在这些结构都不适合时，再新增新的页面命令。

## 视觉反馈格式

为了让排版迭代更快，建议反馈时写成：

```text
第 9 页：四个卡片标题整体偏上 2-3px，正文可以再小一点。
第 12 页：右侧图片太抢眼，透明度降低一点。
第 15 页：五个标题横向位置正常，但正文太靠下。
```

优先提供：

- 页码
- 哪个元素
- 偏大/偏小/偏左/偏右/过深/过浅
- 大概程度，例如“一点点”“明显”“约 5px”

## 编译和检查

```bash
make hybrid
```

输出文件是 `main_hybrid.pdf`。

World Model 示例稿可以用：

```bash
make worldmodel
```

输出文件是 `main_worldmodel.pdf`。
