# 指定字体安装说明

模板最终应使用以下字体：

- 标题：华文新魏，字体文件通常为 `STXINWEI.ttf`，LaTeX 字体族名通常为 `STXinwei` 或 `华文新魏`。
- 封面信息：方正楷体_GBK，字体文件通常为 `FZKTK.TTF`，LaTeX 字体族名常见为 `FZKai-Z03`、`方正楷体_GBK` 或 `FZKai-Z03S`，以实际安装结果为准。
- 正文题目/正文：宋体，常见字体名 `SimSun`。
- 一级标题：黑体，常见字体名 `SimHei`。
- 二级标题：楷体，常见字体名 `KaiTi`。
- 英文与数字：Times New Roman。

## 合法获取渠道

1. 华文新魏

   Microsoft 字体信息页显示该字体文件名为 `STXINWEI.ttf`，并说明该字体可随 Office 应用提供。建议从已授权的 Windows 或 Microsoft Office 安装中取得，不建议使用来源不明的字体下载站。

2. 方正楷体_GBK

   建议通过方正字库官网或“字加/方正字库客户端”获取并激活。方正字库官网提供客户端下载入口；第三方字体站可能只提供文件，不等于授予使用授权。

3. 宋体、黑体、楷体、Times New Roman

   通常随 Windows 或 Microsoft Office 提供。macOS 默认未必带有 Windows 的 `SimSun`、`SimHei`、`KaiTi`，如果必须严格复刻模板，也需要从已授权 Windows/Office 环境取得并安装。

## macOS 安装方式

本项目已采用更方便的方式：把可用字体文件复制到项目根目录的 `Font/` 文件夹，然后由 `source/main.tex` 通过相对路径 `../Font/` 直接加载。

当前已从 Microsoft Word 内置字体目录复制：

- `Font/STXINWEI.ttf`：华文新魏
- `Font/Simsun.ttc`：宋体
- `Font/SimHei.ttf`：黑体
- `Font/Kaiti.ttf`：楷体
- `Font/times.ttf`、`Font/timesbd.ttf`：Times New Roman

当前已从用户字体目录复制：

- `Font/FZKTK.TTF`：方正楷体_GBK，字体内部名称为 `FZKai-Z03`。

如果改用用户字体目录，也可以把字体文件复制到当前用户字体目录：

```bash
mkdir -p ~/Library/Fonts
cp STXINWEI.ttf ~/Library/Fonts/
cp FZKTK.TTF ~/Library/Fonts/
cp simsun.ttc ~/Library/Fonts/
cp simhei.ttf ~/Library/Fonts/
cp simkai.ttf ~/Library/Fonts/
```

文件名可能因来源不同而不同，以上只是常见名称。复制后建议退出并重开终端或 IDE。

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
