%% Earth Rover Program client report class.
%%
%% This class centralizes the visual and structural conventions used by
%% external-facing investigation, survey, analysis, and technical reports.
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\ProvidesClass{erp-report}
  [2026/08/10 v1.2 Earth Rover Program client report class]

% --------------------------------------------------------------------------
% Engine and base class
% --------------------------------------------------------------------------
\RequirePackage{iftex}
\ifLuaTeX\else
  \ClassError{erp-report}
    {This class requires LuaLaTeX}
    {Compile with lualatex or latexmk -lualatex.}
\fi

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax
\LoadClass[
  11pt,
  a4paper,
  oneside,
  open=any,
  headings=normal,
  parskip=half
]{scrreprt}

% --------------------------------------------------------------------------
% Packages and page geometry
% --------------------------------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{microtype}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{caption}
\RequirePackage{tikz}
\RequirePackage[most]{tcolorbox}
\RequirePackage{listings}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{hyperref}
\RequirePackage{xurl}

\geometry{
  a4paper,
  left=24mm,
  right=24mm,
  top=25mm,
  bottom=27mm,
  headheight=15pt,
  headsep=8mm,
  footskip=14mm
}

% --------------------------------------------------------------------------
% Brand colours for print output
% --------------------------------------------------------------------------
\definecolor{ERPHumus}{cmyk}{0.46,0.81,0.79,0.72}
\definecolor{ERPDarkOrange}{cmyk}{0,0.86,1,0}
\definecolor{ERPOffWhite}{cmyk}{0,0.01,0.09,0}
\definecolor{ERPTopSoil}{cmyk}{0.41,0.63,0.79,0.34}
\definecolor{ERPSubSoil}{cmyk}{0.33,0.63,0.78,0.22}
\definecolor{ERPRegolith}{cmyk}{0.29,0.52,0.74,0.10}
\definecolor{ERPBedrock}{cmyk}{0.24,0.43,0.57,0.02}
\definecolor{ERPMidOrange}{cmyk}{0,0.75,1,0}
\definecolor{ERPMustard}{cmyk}{0.08,0.51,1,0}
\definecolor{ERPStone}{cmyk}{0.15,0.13,0.24,0}

% --------------------------------------------------------------------------
% Brand typography
% --------------------------------------------------------------------------
\IfFontExistsTF{Inter}{}{
  \ClassError{erp-report}
    {The required Inter font is not installed}
    {Install Inter Regular, then compile again with LuaLaTeX.}
}
\IfFontExistsTF{Roboto}{}{
  \ClassError{erp-report}
    {The required Roboto font is not installed}
    {Install Roboto Regular, then compile again with LuaLaTeX.}
}

\defaultfontfeatures{Ligatures=TeX,Scale=MatchLowercase}
\setmainfont{Inter}[
  UprightFont=Inter Regular,
  BoldFont=Inter Regular,
  ItalicFont=Inter Regular,
  BoldItalicFont=Inter Regular
]
\newfontfamily\erpheadingfont{Roboto}[
  UprightFont=Roboto Regular,
  BoldFont=Roboto Regular,
  ItalicFont=Roboto Regular,
  BoldItalicFont=Roboto Regular
]
\newcommand{\erpbodyheadingfont}{\normalfont\MakeUppercase}

\setstretch{1.08}
\setlength{\emergencystretch}{2em}
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

% --------------------------------------------------------------------------
% Report metadata and public setters
% --------------------------------------------------------------------------
\newcommand{\erp@reporttitle}{}
\newcommand{\erp@reportsubtitle}{}
\newcommand{\erp@reportnumber}{}
\newcommand{\erp@reportversion}{1.0}
\newcommand{\erp@reportdate}{\today}
\newcommand{\erp@reporttype}{Technical report}
\newcommand{\erp@reportstatus}{Final}
\newcommand{\erp@confidentiality}{}
\newcommand{\erp@clientname}{}
\newcommand{\erp@clientcontact}{}
\newcommand{\erp@projectname}{}
\newcommand{\erp@projectlocation}{}
\newcommand{\erp@projectnumber}{}
\newcommand{\erp@preparedby}{}
\newcommand{\erp@reviewedby}{}
\newcommand{\erp@approvedby}{}
\newcommand{\erp@logopath}{%
  assets/ERP-Primary-Logo-CMYK-Dark Orange.png%
}
\newcommand{\erp@footerlogopath}{%
  assets/ERP-Secondary-Logo-CMYK-Dark Orange.png%
}

\newcommand{\reporttitle}[1]{\gdef\erp@reporttitle{#1}}
\newcommand{\reportsubtitle}[1]{\gdef\erp@reportsubtitle{#1}}
\newcommand{\reportnumber}[1]{\gdef\erp@reportnumber{#1}}
\newcommand{\reportversion}[1]{\gdef\erp@reportversion{#1}}
\newcommand{\reportdate}[1]{\gdef\erp@reportdate{#1}}
\newcommand{\reporttype}[1]{\gdef\erp@reporttype{#1}}
\newcommand{\reportstatus}[1]{\gdef\erp@reportstatus{#1}}
\newcommand{\reportconfidentiality}[1]{\gdef\erp@confidentiality{#1}}
\newcommand{\clientname}[1]{\gdef\erp@clientname{#1}}
\newcommand{\clientcontact}[1]{\gdef\erp@clientcontact{#1}}
\newcommand{\projectname}[1]{\gdef\erp@projectname{#1}}
\newcommand{\projectlocation}[1]{\gdef\erp@projectlocation{#1}}
\newcommand{\projectnumber}[1]{\gdef\erp@projectnumber{#1}}
\newcommand{\preparedby}[1]{\gdef\erp@preparedby{#1}}
\newcommand{\reviewedby}[1]{\gdef\erp@reviewedby{#1}}
\newcommand{\approvedby}[1]{\gdef\erp@approvedby{#1}}
\newcommand{\reportlogopath}[1]{\gdef\erp@logopath{#1}}
\newcommand{\reportfooterlogopath}[1]{%
  \gdef\erp@footerlogopath{#1}%
}

\NewDocumentCommand{\erpbrandlogo}{O{42mm}}{%
  \IfFileExists{\erp@logopath}{%
    \includegraphics[width=#1,keepaspectratio]{\erp@logopath}%
  }{%
    \ClassError{erp-report}
      {The Earth Rover Program logo was not found}
      {Check the asset path or set it with \string\reportlogopath.}%
  }%
}

\newcommand{\erp@footerlogo}{%
  \IfFileExists{\erp@footerlogopath}{%
    \includegraphics[
      width=38mm,
      keepaspectratio
    ]{\erp@footerlogopath}%
  }{%
    \ClassError{erp-report}
      {The Earth Rover Program footer logo was not found}
      {Check the asset path or set it with
       \string\reportfooterlogopath.}%
  }%
}

% --------------------------------------------------------------------------
% Heading hierarchy, lists, captions, and links
% --------------------------------------------------------------------------
\setkomafont{chapter}{%
  \normalfont\erpheadingfont\fontsize{28}{32}\selectfont%
  \color{ERPDarkOrange}%
}
\setkomafont{section}{%
  \normalfont\fontsize{14}{17}\selectfont\color{ERPHumus}%
  \MakeUppercase%
}
\setkomafont{subsection}{%
  \normalfont\fontsize{12}{15}\selectfont\color{ERPTopSoil}%
}
\setkomafont{subsubsection}{%
  \normalfont\fontsize{11}{14}\selectfont\color{ERPSubSoil}%
}
\setkomafont{paragraph}{%
  \normalfont\fontsize{10.5}{13}\selectfont\color{ERPHumus}%
  \MakeUppercase%
}
\setkomafont{disposition}{\normalfont}
\renewcommand*{\chapterformat}{%
  \textcolor{ERPTopSoil}{\thechapter\autodot\enskip}%
}
\renewcommand*{\sectionformat}{%
  \textcolor{ERPDarkOrange}{\thesection\autodot\enskip}%
}
\renewcommand*{\subsectionformat}{%
  \textcolor{ERPDarkOrange}{\thesubsection\autodot\enskip}%
}
\RedeclareSectionCommand[beforeskip=0pt,afterskip=1.2\baselineskip]{chapter}
\RedeclareSectionCommand[
  beforeskip=1.8\baselineskip,
  afterskip=0.55\baselineskip
]{section}
\RedeclareSectionCommand[
  beforeskip=1.4\baselineskip,
  afterskip=0.45\baselineskip
]{subsection}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand{\bibname}{References}
\setlist{
  leftmargin=6mm,
  itemsep=2pt,
  parsep=0pt,
  topsep=5pt
}
\setlist[itemize,1]{label=\textcolor{ERPDarkOrange}{\textbullet}}
\setlist[itemize,2]{label=\textcolor{ERPTopSoil}{--}}

\captionsetup{
  font={small,color=ERPHumus},
  labelfont={color=ERPDarkOrange},
  labelsep=period,
  justification=raggedright,
  singlelinecheck=false,
  skip=7pt
}
\urlstyle{same}
\hypersetup{
  colorlinks=true,
  linkcolor=ERPDarkOrange,
  citecolor=ERPTopSoil,
  urlcolor=ERPSubSoil,
  bookmarksopen=true,
  bookmarksnumbered=true,
  pdfdisplaydoctitle=true
}
\AtBeginDocument{%
  \renewcommand{\bibname}{References}%
  \hypersetup{
    pdftitle={\erp@reporttitle},
    pdfauthor={Earth Rover Program},
    pdfsubject={\erp@reporttype}
  }%
}

% --------------------------------------------------------------------------
% Running headers and footers
% --------------------------------------------------------------------------
\clearpairofpagestyles
\automark[section]{chapter}
\ihead{%
  \normalfont\fontsize{8}{10}\selectfont\color{ERPTopSoil}%
  \MakeUppercase{\leftmark}%
}
\ohead{%
  \normalfont\fontsize{8}{10}\selectfont\color{ERPTopSoil}%
  \erp@reportnumber\enspace|\enspace
  \MakeUppercase{Version}\enspace\erp@reportversion%
}
\ifoot*{%
  \raisebox{-0.25\height}{\erp@footerlogo}%
}
\ofoot*{%
  \normalfont\fontsize{8}{10}\selectfont\color{ERPTopSoil}%
  Page \thepage%
}
\KOMAoptions{headsepline=0.45pt}
\setkomafont{headsepline}{\color{ERPDarkOrange}}
\renewcommand*{\chapterpagestyle}{plain.scrheadings}

% --------------------------------------------------------------------------
% Cover and document-control pages
% --------------------------------------------------------------------------
\newcommand{\erp@coverlabel}[1]{%
  {\fontsize{8}{10}\selectfont\color{ERPTopSoil}\MakeUppercase{#1}}%
}

\newcommand{\makecover}{%
  \ifdefempty{\erp@reporttitle}{%
    \ClassError{erp-report}
      {No report title has been supplied}
      {Set one with \string\reporttitle before \string\makecover.}%
  }{}%
  \hypersetup{pageanchor=false}
  \begin{titlepage}
    \thispagestyle{empty}
    \pagecolor{ERPOffWhite}
    \begin{tikzpicture}[remember picture,overlay]
      \fill[ERPDarkOrange]
        ([xshift=-12mm]current page.north east)
        rectangle (current page.south east);
      \fill[ERPStone]
        ([xshift=-12mm,yshift=32mm]current page.south east)
        rectangle ([xshift=-8mm,yshift=92mm]current page.south east);
    \end{tikzpicture}
    \color{ERPHumus}
    \erpbrandlogo[45mm]

    \vspace{20mm}
    {\fontsize{9}{12}\selectfont\color{ERPTopSoil}%
      \MakeUppercase{\erp@reporttype}\par}
    \vspace{4mm}
    \begin{minipage}{0.80\textwidth}
      \raggedright
      \hyphenpenalty=10000
      {\erpheadingfont\fontsize{31}{35}\selectfont%
        \color{ERPDarkOrange}\erp@reporttitle\par}
      \ifdefempty{\erp@reportsubtitle}{}{%
        \vspace{5mm}
        {\fontsize{15}{19}\selectfont\color{ERPTopSoil}%
          \erp@reportsubtitle\par}%
      }
    \end{minipage}

    \vfill
    \begin{tcolorbox}[
      enhanced,
      width=0.82\textwidth,
      colback=white,
      colframe=white,
      boxrule=0pt,
      arc=3mm,
      left=6mm,
      right=6mm,
      top=5mm,
      bottom=5mm
    ]
      \renewcommand{\arraystretch}{1.45}
      \begin{tabularx}{\linewidth}{%
        @{}>{\raggedright\arraybackslash}p{34mm}X@{}%
      }
        \erp@coverlabel{Prepared for} & \erp@clientname \\
        \erp@coverlabel{Project} & \erp@projectname \\
        \erp@coverlabel{Location} & \erp@projectlocation \\
        \erp@coverlabel{Report number} & \erp@reportnumber \\
        \erp@coverlabel{Version and date} &
          \erp@reportversion\enspace|\enspace\erp@reportdate \\
      \end{tabularx}
    \end{tcolorbox}
    \ifdefempty{\erp@confidentiality}{}{%
      \vspace{4mm}
      {\fontsize{8}{10}\selectfont\color{ERPTopSoil}%
        \MakeUppercase{\erp@confidentiality}\par}%
    }
  \end{titlepage}
  \nopagecolor
  \hypersetup{pageanchor=true}
}

\newcommand{\erp@controlrow}[2]{%
  \textcolor{ERPTopSoil}{\MakeUppercase{#1}} & #2 \\
}

\newcommand{\makedocumentcontrol}{%
  \chapter*{Document control}
  \addcontentsline{toc}{chapter}{Document control}
  \begin{tcolorbox}[
    colback=ERPOffWhite,
    colframe=ERPStone,
    boxrule=0.4pt,
    arc=2mm,
    left=5mm,
    right=5mm,
    top=4mm,
    bottom=4mm
  ]
    \renewcommand{\arraystretch}{1.55}
    \begin{tabularx}{\linewidth}{%
      @{}>{\raggedright\arraybackslash}p{42mm}X@{}%
    }
      \erp@controlrow{Report title}{\erp@reporttitle}
      \erp@controlrow{Report number}{\erp@reportnumber}
      \erp@controlrow{Version}{\erp@reportversion}
      \erp@controlrow{Status}{\erp@reportstatus}
      \erp@controlrow{Issue date}{\erp@reportdate}
      \erp@controlrow{Client}{\erp@clientname}
      \erp@controlrow{Client contact}{\erp@clientcontact}
      \erp@controlrow{Project}{\erp@projectname}
      \erp@controlrow{Project number}{\erp@projectnumber}
      \erp@controlrow{Project location}{\erp@projectlocation}
    \end{tabularx}
  \end{tcolorbox}

  \vspace{7mm}
  \section*{Authorization}
  {\centering
    \begin{tabularx}{0.98\linewidth}{@{}p{30mm}X p{30mm}@{}}
      \toprule
      \textcolor{ERPTopSoil}{\MakeUppercase{Role}} &
      \textcolor{ERPTopSoil}{\MakeUppercase{Name}} &
      \textcolor{ERPTopSoil}{\MakeUppercase{Date}} \\
      \midrule
      Prepared by & \erp@preparedby & \erp@reportdate \\
      Reviewed by & \erp@reviewedby & \erp@reportdate \\
      Approved by & \erp@approvedby & \erp@reportdate \\
      \bottomrule
    \end{tabularx}\par
  }
}

% --------------------------------------------------------------------------
% Front matter and report structure helpers
% --------------------------------------------------------------------------
\newcommand{\reportfrontmatter}{%
  \clearpage
  \pagenumbering{roman}
  \pagestyle{scrheadings}
}
\newcommand{\reportmainmatter}{%
  \clearpage
  \pagenumbering{arabic}
  \pagestyle{scrheadings}
}
\newcommand{\reportbackmatter}{%
  \clearpage
  \pagestyle{scrheadings}
}

\NewDocumentEnvironment{executivesummary}{}{%
  \chapter*{Executive summary}
  \addcontentsline{toc}{chapter}{Executive summary}
}{%
  \clearpage
}

\NewDocumentCommand{\chapterintro}{m}{%
  \begin{tcolorbox}[
    colback=ERPOffWhite,
    colframe=ERPOffWhite,
    boxrule=0pt,
    arc=2mm,
    left=5mm,
    right=5mm,
    top=4mm,
    bottom=4mm
  ]
    \color{ERPTopSoil}\large #1
  \end{tcolorbox}
}

% --------------------------------------------------------------------------
% Reusable callouts, figures, tables, and technical listings
% --------------------------------------------------------------------------
\tcbset{
  erp callout/.style={
    enhanced,
    breakable,
    colback=ERPOffWhite,
    colframe=ERPStone,
    boxrule=0.4pt,
    arc=2.5mm,
    left=6mm,
    right=6mm,
    top=4mm,
    bottom=4mm,
    before skip=7mm,
    after skip=7mm,
    fonttitle=\normalfont\MakeUppercase,
    coltitle=ERPHumus,
    attach boxed title to top left={xshift=4mm,yshift=-2mm},
    boxed title style={
      colback=ERPOffWhite,
      colframe=ERPOffWhite,
      boxrule=0pt,
      arc=0pt,
      left=2mm,
      right=2mm
    }
  }
}

\newtcolorbox{keyfindings}[1][Key findings]{
  erp callout,
  title=#1,
  borderline west={2.2mm}{0pt}{ERPDarkOrange}
}
\newtcolorbox{recommendations}[1][Recommendations]{
  erp callout,
  title=#1,
  borderline west={2.2mm}{0pt}{ERPMustard}
}
\newtcolorbox{summarybox}[1][Summary]{
  erp callout,
  title=#1,
  borderline west={2.2mm}{0pt}{ERPTopSoil}
}
\newtcolorbox{reportnote}[1][Note]{
  erp callout,
  title=#1,
  colback=ERPStone!35!white,
  borderline west={2.2mm}{0pt}{ERPRegolith}
}
\newtcolorbox{reportwarning}[1][Important]{
  erp callout,
  title=#1,
  colback=ERPDarkOrange!7!white,
  borderline west={2.2mm}{0pt}{ERPDarkOrange}
}

\NewDocumentEnvironment{reportfigure}{O{htbp}}{%
  \begin{figure}[#1]
    \centering
}{%
  \end{figure}
}

\NewDocumentEnvironment{reporttable}{O{htbp}}{%
  \begin{table}[#1]
    \centering
    \small
}{%
  \end{table}
}

\NewDocumentCommand{\figureplaceholder}{O{Figure placeholder}m}{%
  \begin{tcolorbox}[
    width=\linewidth,
    height=#2,
    valign=center,
    halign=center,
    colback=ERPStone!45!white,
    colframe=ERPStone,
    boxrule=0.4pt,
    arc=3mm
  ]
    \color{ERPTopSoil}\MakeUppercase{#1}
  \end{tcolorbox}
}

\lstdefinestyle{erp}{
  basicstyle=\normalfont\small,
  keywordstyle=\color{ERPDarkOrange},
  commentstyle=\color{ERPTopSoil},
  stringstyle=\color{ERPSubSoil},
  backgroundcolor=\color{ERPStone!35!white},
  frame=single,
  rulecolor=\color{ERPStone},
  framerule=0.4pt,
  framesep=4mm,
  breaklines=true,
  columns=fullflexible,
  keepspaces=true,
  showstringspaces=false,
  aboveskip=7mm,
  belowskip=7mm
}
\lstnewenvironment{technicalcode}[1][]{%
  \lstset{style=erp,#1}%
}{}

% Keep table rules within the approved brand palette.
\arrayrulecolor{ERPStone}
\setlength{\heavyrulewidth}{0.8pt}
\setlength{\lightrulewidth}{0.45pt}
