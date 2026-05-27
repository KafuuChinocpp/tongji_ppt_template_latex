# 百态冬韵 LaTeX 模板

这是从同济大学 `百态冬韵.pptx` 改写而来的 LaTeX Beamer 模板。当前版本已经包含封面、目录、章节页、结束页、正文白底页、图文页、对比页、架构页、实验页、代码分析页、计划页等常用科研汇报版式。

## 文件说明

```text
main_hybrid.tex                 Vibe Coding 示例汇报
main_worldmodel.tex             World Model 插图示例汇报
main_worldmodel_gallery.tex     汇总展示所有主要模板页
tongjiwinter-layouts.tex        当前主要模板命令
tongjiwinter.sty                早期基础样式，保留作兼容参考
assets/                         模板背景和示例素材
reference/                      原 PPT 导出的参考图和插图素材
FONT_REQUIREMENTS.md            字体依赖和高保真复刻说明
LAYOUT_WORKFLOW.md              版式命令和 vibe coding 工作流
```

## 编译方式

推荐直接使用 `make`，编译产生的 `.aux/.log/.nav/.toc` 等中间文件会统一放到 `build/logs/`，根目录只复制最终 PDF：

```bash
cd ppt_01/source
make
make hybrid
make worldmodel
make worldmodel-gallery
```

常用目标：

```bash
make                     # 默认生成 main_hybrid.pdf
make main                # 生成早期基础示例 main.pdf
make hybrid              # 生成 main_hybrid.pdf
make worldmodel          # 生成 main_worldmodel.pdf
make worldmodel-gallery  # 生成 main_worldmodel_gallery.pdf
make check-fonts         # 检查字体匹配
make clean               # 删除 build/logs 和根目录残留中间文件，保留 PDF
make distclean           # 在 clean 基础上删除生成的 PDF
```

## Arch Linux 安装建议

如果你还没有 LaTeX 环境，可以先安装：

```bash
sudo pacman -S texlive texlive-langchinese
```

如果字体缺失，建议再安装常见开源中文字体：

```bash
sudo pacman -S noto-fonts-cjk wqy-microhei
```

微软雅黑和 Segoe UI 属于 Windows 字体。当前模板优先从 `ppt_01/source/fonts/` 读取这些字体文件，不需要把它们安装到系统字体目录。这样浏览器不会因为系统安装了 `Microsoft YaHei` 而改变网页字体。

`fonts/` 已经写入 `.gitignore`。如果要放到公开 GitHub 仓库，请不要提交这些 Windows 字体文件，除非你确认字体许可允许重新分发。

高保真字体的本地放置方式见 `FONT_REQUIREMENTS.md`。核心命令是：

```bash
mkdir -p ppt_01/source/fonts
cp /path/to/Fonts/msyh.ttc /path/to/Fonts/msyhbd.ttc /path/to/Fonts/msyhl.ttc ppt_01/source/fonts/
cp /path/to/Fonts/seguibl.ttf /path/to/Fonts/ariblk.ttf ppt_01/source/fonts/
```

## 素材提交策略

当前模板正常编译需要保留：

```text
assets/
reference/background.png
reference/ppt插图/
```

其中 `assets/` 不是完全重复，它现在分成几类：

```text
assets/hybrid/       从无文字 PPT 背景整理出的模板背景，模板命令直接依赖
assets/worldmodel/   从 World Model 视频/SVG 转出的静态图，LaTeX 正常编译依赖
assets/image*.jpeg   Vibe Coding 示例页使用的普通插图
```

下面这些文件只用于复刻过程对照，或者重新生成高保真背景；公开 GitHub 仓库默认忽略：

```text
reference/*.pdf
reference/百态冬韵/
reference/百态冬韵_无文字/
reference/ppt插图/*.mp4
assets/assets_contact_sheet.png
assets/reference/
```

因此 `make hybrid`、`make worldmodel`、`make worldmodel-gallery` 不依赖被忽略的参考文件；`make exact` 和 `make hybrid-backgrounds` 需要这些本地参考导出文件。

字体依赖和高保真复刻方案见：

```text
FONT_REQUIREMENTS.md
```

可以运行下面的命令检查当前系统字体匹配结果：

```bash
make check-fonts
```

## 版式命令

模板命令集中在 `tongjiwinter-layouts.tex`，示例用法见 `main_worldmodel_gallery.tex`。实际写新汇报时，建议先复制 `main_hybrid.tex` 或 `main_worldmodel.tex`，再用 `LAYOUT_WORKFLOW.md` 里的命令替换内容。
