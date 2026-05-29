# 字体依赖说明

这个模板来自 WPS 导出的 `百态冬韵.pptx`，原 PPT 中识别到的主要字体是：

```text
中文标题字体：微软雅黑
中文正文字体：微软雅黑 Light
英文标题字体：Segoe UI Black
数字字体：Segoe UI Black
```

为了避免污染浏览器和桌面环境，当前 LaTeX 文件优先使用项目目录中的字体文件：

```text
ppt_01/source/fonts/msyh.ttc    微软雅黑 Regular
ppt_01/source/fonts/msyhbd.ttc  微软雅黑 Bold
ppt_01/source/fonts/msyhl.ttc   微软雅黑 Light
ppt_01/source/fonts/seguibl.ttf Segoe UI Black
ppt_01/source/fonts/ariblk.ttf  Arial Black fallback
```

也就是说，不再需要把这些 Windows 字体安装到系统字体目录。XeLaTeX 会通过相对路径读取 `fonts/` 目录里的文件。

为了便于 GitHub 维护，字体依赖分成两档。

## 最低编译要求

模板可以在没有原始 PPT 字体的情况下编译。当前 fallback 顺序如下：

中文标题：

```text
Microsoft YaHei
Noto Sans CJK SC
Source Han Sans SC
WenQuanYi Micro Hei
FandolHei-Regular
```

中文正文：

```text
Microsoft YaHei UI Light
Microsoft YaHei Light
Noto Sans CJK SC
Source Han Sans SC
WenQuanYi Micro Hei
FandolHei-Regular
```

英文粗标题和数字：

```text
Segoe UI Black
Arial Black
LaTeX 默认无衬线粗体
```

只要系统里有 TeX Live 自带的 Fandol 字体，理论上就应该能编译；但视觉会和原 PPT 有差异。

## 高保真复刻字体

如果目标是尽量接近原 PPT，请把这些字体文件放到 `ppt_01/source/fonts/`：

```text
Microsoft YaHei
Microsoft YaHei Light 或 Microsoft YaHei UI Light
Segoe UI Black
Arial Black
```

这些字体通常来自 Windows 系统字体。它们不是本仓库的一部分，不应该直接提交到公开 GitHub 仓库，除非你确认许可证允许。推荐在私有仓库或本地工作区维护这些文件。

从 Windows 的 `Fonts` 目录找到这些文件后，可以在项目根目录运行：

```bash
mkdir -p ppt_01/source/fonts
cp /path/to/Fonts/msyh.ttc ppt_01/source/fonts/
cp /path/to/Fonts/msyhbd.ttc ppt_01/source/fonts/
cp /path/to/Fonts/msyhl.ttc ppt_01/source/fonts/
cp /path/to/Fonts/seguibl.ttf ppt_01/source/fonts/
cp /path/to/Fonts/ariblk.ttf ppt_01/source/fonts/
```

如果你已经在 Windows 的 `Fonts` 目录里，可以先把 `repo` 改成你的项目根目录，再复制：

```bash
repo=/path/to/ppt_template
mkdir -p "$repo/ppt_01/source/fonts"
cp msyh.ttc msyhbd.ttc msyhl.ttc seguibl.ttf ariblk.ttf "$repo/ppt_01/source/fonts/"
```

复制完成后运行：

```bash
cd /path/to/ppt_template/ppt_01/source
make check-fonts
```

## Arch Linux 建议

最低可用环境可以先安装 TeX Live 和常见开源字体：

```bash
sudo pacman -S texlive texlive-langchinese noto-fonts-cjk wqy-microhei
```

如果需要 Windows 字体，请从你有授权的 Windows 安装中获取，然后放到 `ppt_01/source/fonts/`。不建议安装到 `~/.local/share/fonts` 或 `/usr/share/fonts`，否则浏览器可能会把网页中的 `Microsoft YaHei` 真的渲染成微软雅黑。

## 检查字体

在 `ppt_01/source` 目录下运行：

```bash
make check-fonts
```

输出格式优先显示项目内字体文件：

```text
字体用途 -> 实际 family | style | 项目内 font file
```

系统 fallback 字体只在 `fonts/` 目录缺少对应 Windows 字体时使用。
