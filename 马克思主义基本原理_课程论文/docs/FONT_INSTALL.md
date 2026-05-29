# 指定字体安装说明

字体文件通常受版权或授权限制，因此本项目不提交字体文件。请从已授权的软件、系统或字体厂商渠道取得字体，再复制到项目的 `Font/` 目录。

模板最终应使用以下字体：

- 标题：华文新魏，文件名应为 `STXINWEI.ttf`。
- 封面信息：方正楷体_GBK，文件名应为 `FZKTK.TTF`。
- 正文题目/正文：宋体，文件名应为 `Simsun.ttc`。
- 一级标题：黑体，文件名应为 `SimHei.ttf`。
- 二级标题：楷体，文件名应为 `Kaiti.ttf`。
- 英文与数字：Times New Roman，文件名应为 `times.ttf` 和 `timesbd.ttf`。

`source/main.tex` 当前通过相对路径 `../Font/` 读取上述文件名。文件名大小写需要与这里一致。

## 合法获取渠道

1. 华文新魏

   Microsoft 字体信息页显示该字体文件名为 `STXINWEI.ttf`，并说明该字体可随 Office 应用提供。建议从已授权的 Windows 或 Microsoft Office 安装中取得，不建议使用来源不明的字体下载站。

2. 方正楷体_GBK

   建议通过方正字库官网或“字加/方正字库客户端”获取并激活。方正字库官网提供客户端下载入口；第三方字体站可能只提供文件，不等于授予使用授权。

3. 宋体、黑体、楷体、Times New Roman

   通常随 Windows 或 Microsoft Office 提供。macOS 默认未必带有 Windows 的 `SimSun`、`SimHei`、`KaiTi`，如果必须严格复刻模板，也需要从已授权 Windows/Office 环境取得并安装。

## 项目内字体目录方式

推荐把已授权取得的字体文件放到项目根目录的 `Font/` 文件夹：

```text
Font/
  FZKTK.TTF
  Kaiti.ttf
  STXINWEI.ttf
  SimHei.ttf
  Simsun.ttc
  times.ttf
  timesbd.ttf
```

例如，假设字体文件已经放在 `~/Downloads/tongji-report-fonts/`：

```bash
cd /Users/jinjiacheng/Documents/lessons/projects/tongji_ppt_template_latex/马克思主义基本原理_课程论文
cp ~/Downloads/tongji-report-fonts/STXINWEI.ttf Font/
cp ~/Downloads/tongji-report-fonts/FZKTK.TTF Font/
cp ~/Downloads/tongji-report-fonts/Simsun.ttc Font/
cp ~/Downloads/tongji-report-fonts/SimHei.ttf Font/
cp ~/Downloads/tongji-report-fonts/Kaiti.ttf Font/
cp ~/Downloads/tongji-report-fonts/times.ttf Font/
cp ~/Downloads/tongji-report-fonts/timesbd.ttf Font/
```

如果来源文件名不同，请复制后重命名为模板要求的文件名。

## macOS 用户字体目录方式

也可以把字体安装到当前用户字体目录，但如果继续使用当前 `main.tex`，仍建议同时复制一份到项目 `Font/` 目录。

```bash
mkdir -p ~/Library/Fonts
cp STXINWEI.ttf ~/Library/Fonts/
cp FZKTK.TTF ~/Library/Fonts/
cp Simsun.ttc ~/Library/Fonts/
cp SimHei.ttf ~/Library/Fonts/
cp Kaiti.ttf ~/Library/Fonts/
cp times.ttf ~/Library/Fonts/
cp timesbd.ttf ~/Library/Fonts/
```

复制后建议退出并重开终端或 IDE。

## 检查字体是否被 XeLaTeX 识别

```bash
fc-match STXinwei
fc-match "方正楷体_GBK"
fc-match FZKai-Z03
fc-match SimSun
fc-match SimHei
fc-match KaiTi
fc-match "Times New Roman"
```

如果 `fc-match "方正楷体_GBK"` 找不到，但 `fc-match FZKai-Z03` 能找到，LaTeX 中应使用 `FZKai-Z03` 作为字体名。

也可以查看字体内部名称：

```bash
otfinfo -i ~/Library/Fonts/FZKTK.TTF
otfinfo -i ~/Library/Fonts/STXINWEI.ttf
```

安装完成后，把检查命令的输出发给我，我会把 `source/main.tex` 改为严格使用这些字体并重新编译。
