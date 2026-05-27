# 字体依赖说明

本模板需要中文宋体风格字体和西文字体来复现实验报告排版。为避免字体授权和再分发风险，仓库不提交字体文件，`fonts/` 目录只保留 `.gitkeep` 占位。

## 模板期望的字体文件

`src/tongji-comporg-report.cls` 默认从 `fonts/` 读取以下文件：

- `NotoSerif-Regular.ttf`
- `NotoSerif-Bold.ttf`
- `NotoSerifCJK-Regular.ttc`
- `NotoSerifCJK-Bold.ttc`

其中 CJK 字体使用 `FontIndex = 2`，对应简体中文样式。该字体不是宋体本体，但在 Linux 上可作为较稳妥的宋体风格替代。

## Arch Linux 准备方式

安装系统字体包：

```sh
sudo pacman -S noto-fonts noto-fonts-cjk
```

然后将系统字体复制到本项目的 `fonts/` 目录：

```sh
cp /usr/share/fonts/noto/NotoSerif-Regular.ttf fonts/
cp /usr/share/fonts/noto/NotoSerif-Bold.ttf fonts/
cp /usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc fonts/
cp /usr/share/fonts/noto-cjk/NotoSerifCJK-Bold.ttc fonts/
```

也可以使用授权允许的宋体/仿宋/思源宋体文件替换这些文件，但需要同步修改 `src/tongji-comporg-report.cls` 中的字体文件名和 `FontIndex` 设置。

## 版权注意

请只在本机按字体授权使用字体文件，不要把字体文件提交到仓库或打包分发。`.gitignore` 已忽略 `fonts/*`，只允许提交 `fonts/.gitkeep`。
