\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tongji-comporg-report}[2026/05/27 Tongji computer organization lab report]

\LoadClass[UTF8,zihao=-4,fontset=none]{ctexart}

\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{float}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{xparse}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{fancyhdr}
\RequirePackage{indentfirst}

\geometry{
  a4paper,
  top=2.54cm,
  bottom=2.54cm,
  left=3.18cm,
  right=3.18cm,
  headheight=0pt,
  headsep=0pt,
  footskip=0pt
}

\pagestyle{empty}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\setlength{\lineskip}{0pt}
\setlength{\lineskiplimit}{0pt}

\setmainfont[
  Path = fonts/,
  UprightFont = NotoSerif-Regular.ttf,
  BoldFont = NotoSerif-Bold.ttf
]{NotoSerif}

\setCJKmainfont[
  Path = fonts/,
  UprightFont = NotoSerifCJK-Regular.ttc,
  BoldFont = NotoSerifCJK-Bold.ttc,
  UprightFeatures = {FontIndex = 2},
  BoldFeatures = {FontIndex = 2}
]{NotoSerifCJK}

\newCJKfontfamily\songstyle[
  Path = fonts/,
  UprightFont = NotoSerifCJK-Regular.ttc,
  BoldFont = NotoSerifCJK-Bold.ttc,
  UprightFeatures = {FontIndex = 2},
  BoldFeatures = {FontIndex = 2}
]{NotoSerifCJK}

\xeCJKsetup{CJKecglue = {}}
\AtBeginDocument{\songstyle\zihao{-4}}

\newcommand{\reportErhao}{\fontsize{22pt}{33pt}\selectfont}
\newcommand{\reportXiaoer}{\fontsize{18pt}{27pt}\selectfont}
\newcommand{\reportSihao}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\reportXiaosi}{\fontsize{12pt}{12pt}\selectfont}
\newcommand{\reportSectionSize}{\fontsize{18pt}{23.4pt}\selectfont}

\newcommand{\ReportDepartment}[1]{\gdef\report@department{#1}}
\newcommand{\ReportName}[1]{\gdef\report@name{#1}}
\newcommand{\ReportTopic}[1]{\gdef\report@topic{#1}}
\newcommand{\ReportLogo}[1]{\gdef\report@logo{#1}}
\newcommand{\ReportStudentID}[1]{\gdef\report@studentid{#1}}
\newcommand{\ReportStudentName}[1]{\gdef\report@studentname{#1}}
\newcommand{\ReportMajor}[1]{\gdef\report@major{#1}}
\newcommand{\ReportTeacher}[1]{\gdef\report@teacher{#1}}

\ReportDepartment{同济大学计算机系}
\ReportName{计算机组成原理课程设计实验报告}
\ReportTopic{}
\ReportLogo{assets/title-logo.png}
\ReportStudentID{}
\ReportStudentName{}
\ReportMajor{}
\ReportTeacher{}

\newcommand{\report@labeltwo}[2]{\makebox[2.35cm][l]{#1\hfill#2}}
\newcommand{\report@labelfour}[4]{\makebox[2.35cm][l]{#1\hfill#2\hfill#3\hfill#4}}
\newcommand{\report@field}[2]{%
  #1 &
  \underline{\makebox[7.7cm][c]{#2}}%
}

\NewDocumentCommand{\MakeReportCover}{}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \songstyle
    \vspace*{0cm}
    \begin{center}
      {\reportErhao\bfseries
        \report@department\par
        \report@name\par
      }
      \vspace{1.20cm}
      \includegraphics[width=7.09cm,height=6.83cm]{\report@logo}\par
      \vspace{0.25cm}
      {\reportXiaoer\bfseries 题目：\report@topic\par}
      \vspace{1.10cm}
      {\reportSihao\bfseries
        \renewcommand{\arraystretch}{1.28}
        \begin{tabular}{@{}r@{\hspace{0.2cm}}l@{}}
          \report@field{\report@labeltwo{学}{号}}{\report@studentid}\\
          \report@field{\report@labeltwo{姓}{名}}{\report@studentname}\\
          \report@field{\report@labeltwo{专}{业}}{\report@major}\\
          \report@field{\report@labelfour{授}{课}{老}{师}}{\report@teacher}
        \end{tabular}
      }
    \end{center}
  \end{titlepage}
}

\renewcommand{\thesection}{\chinese{section}}
\titleformat{\section}[hang]
  {\songstyle\bfseries\reportSectionSize}
  {\makebox[1.16cm][l]{\thesection、}}
  {0pt}
  {}
\titlespacing*{\section}{0pt}{12pt}{3pt}

\newcommand{\ReportSection}[1]{\section{#1}}
\newcommand{\ReportSectionGap}{\vspace{1.15cm}}
\NewDocumentCommand{\ReportBigGap}{O{2.15cm}}{\vspace{#1}}

\NewDocumentEnvironment{ReportBody}{}{%
  \songstyle\reportXiaosi
  \setstretch{1}
}{}

\NewDocumentEnvironment{ReportNoIndent}{}{%
  \par\setlength{\parindent}{0pt}
}{\par}

\captionsetup{
  font={small},
  labelfont=bf,
  labelsep=quad
}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\NewDocumentCommand{\ReportFigure}{O{0.82\linewidth} m m}{%
  \begin{figure}[H]
    \centering
    \includegraphics[width=#1]{#2}
    \caption{#3}
  \end{figure}
}

\NewDocumentEnvironment{ReportTable}{m O{\linewidth}}{%
  \begin{table}[H]
    \centering
    \caption{#1}
    \begin{tabularx}{#2}
}{%
    \end{tabularx}
  \end{table}
}

\lstdefinestyle{reportverilog}{
  basicstyle=\ttfamily\small,
  keywordstyle=\bfseries,
  commentstyle=\itshape\color{gray!75!black},
  numbers=left,
  numberstyle=\scriptsize\color{gray!75!black},
  stepnumber=1,
  numbersep=0.8em,
  columns=fullflexible,
  keepspaces=true,
  showstringspaces=false,
  breaklines=true,
  frame=single,
  rulecolor=\color{black!35},
  xleftmargin=2em,
  framexleftmargin=1.4em
}
\lstnewenvironment{ReportCode}[1][Verilog]{%
  \lstset{style=reportverilog,language=#1}%
}{}

\setlist{
  nosep,
  leftmargin=2em,
  labelsep=0.5em
}
