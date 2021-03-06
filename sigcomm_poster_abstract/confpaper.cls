\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{confpaper}[2014/6/17 conference paper latex class]

%%% Opitons
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}

%%% Process given options
\ProcessOptions\relax

%%%
%%%  Load base
%%%
\LoadClass[pdftex,letterpaper]{extarticle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
%%%  Custom variables to be set appropriately.
%%%
\newcommand{\AUTHORS}{Anne Edmundson, Roya Ensafi, Nick Feamster,
  Jennifer Rexford}
\newcommand{\TITLE}{A First Look into Transnational Routing Detours}
\newcommand{\KEYWORDS}{Keywords}
\newcommand{\CONFERENCE}{Conference}
\newcommand{\PAGENUMBERS}{yes} % "yes" or "no"
\newcommand{\COLOR}{yes}
\newcommand{\showComments}{yes}
\newcommand{\comment}[1]{}
\newcommand{\onlyAbstract}{no}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
%%%  ACM Fonts.
%%%
\newfont{\secfnt}{ptmb8t at 12pt}
\newfont{\secit}{ptmbi8t at 12pt}     %13 Jan 00 gkmt
\newfont{\subsecfnt}{ptmri8t at 11pt}
\newfont{\subsecit}{ptmbi8t at 11pt}  % 
\newfont{\ttlfnt}{phvb8t at 18pt}
\newfont{\ttlit}{phvbo8t at 18pt}     % GM 2/4/2000
\newfont{\subttlfnt}{phvr8t at 14pt}
\newfont{\subttlit}{phvro8t at 14pt}  % GM 2/4/2000
\newfont{\subttlbf}{phvb8t at 14pt}   % 13 Jan 00 gkmt
\newfont{\aufnt}{phvr8t at 12pt}
\newfont{\auit}{phvro8t at 12pt}      % GM 2/4/2000
\newfont{\affaddr}{phvr8t at 10pt}
\newfont{\affaddrit}{phvro8t at 10pt} % GM 2/4/2000
\newfont{\eaddfnt}{phvr8t at 12pt}
\newfont{\ixpt}{ptmr8t at 9pt}
\newfont{\confname}{ptmri8t at 8pt}
\newfont{\crnotice}{ptmr8t at 8pt}
\newfont{\ninept}{ptmr8t at 9pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% IEEE Formatting - Uncomment to get IEEE-Style Section headings
%%%

%
% \renewcommand{\thesection}{\Roman{section}} 
% \renewcommand{\thesubsection}{\thesection.\Alph{subsection}}
%
% \titleformat{\section}%                     % IEEE/ACM: caps + period
%   {\centering\sc}{\roman{section}.\quad}{0pt}{}
%
% \titleformat{\subsection}%                     % IEEE/ACM: caps + period
%   {\flushleft\it}{\Alph{subsection}.\quad}{0pt}{}
%
% \titleformat{\subsubsection}%                     % IEEE/ACM: caps + period
%   {\flushleft\it}{\Alph{subsection}.\arabic{subsubsection}.\quad}{0pt}{}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
%%%  Page Setup
%%%
\RequirePackage{balance}
\RequirePackage{tabulary}
\RequirePackage[hyphens]{url}
\RequirePackage{ifthen}

\Urlmuskip=0mu plus 1mu

\special{papersize=8.5in,11in}
\setlength{\pdfpagewidth}{8.5in}
\setlength{\pdfpageheight}{11in}

\ifthenelse{\equal{\PAGENUMBERS}{yes}}{%
\RequirePackage[nohead,
% SIGCOMM/ACM
    left=0.75in,right=0.75in,top=0.75in, bottom=1in,
    columnsep=0.25in
% USENIX
%    left=1.0in,right=1.0in,top=1.0in,
%    footskip=0.5in,bottom=1.0in,   % Room for page numbers
%    columnsep=0.25in
% IEEE
%            left=0.75in,right=0.75in,top=0.75in, bottom=1in,
%            columnsep=0.2in
% Custom
%    left=1.5in,right=1.5in,top=1.0in,
%    footskip=0.5in,bottom=1.0in,   % Room for page numbers
%    columnsep=0.25in
  ]{geometry}
}{%
\RequirePackage[noheadfoot,left=0.75in,right=0.75in,top=0.75in,
    footskip=0.5in,bottom=1in,
    columnsep=0.33in
  ]{geometry}
}

%%%
%%%  Renew "itemize" environment
%%%
\renewenvironment{itemize}
{\begin{list}{$\bullet$}{
    \setlength{\labelsep}{4pt}
    \setlength{\labelwidth}{3pt}
    \setlength{\rightmargin}{0pt}
    \setlength{\leftmargin}{0pt}
    \addtolength{\leftmargin}{\labelwidth}
    \addtolength{\leftmargin}{\labelsep}
}}{\end{list}}

%%%
%%%  Captions
%%%
%\RequirePackage[font=bf]{caption}
\RequirePackage[font=small,format=plain,labelfont=bf,textfont=it]{caption}
\RequirePackage{subcaption}
%% Space between figure and caption (assuming caption
%% is below figure)
%\RequirePackage[font=bf,aboveskip=0pt]{caption} % SPACE
%% Space between caption and body text of document
\addtolength{\textfloatsep}{-7pt} % SPACE

%%%
%%%  Section headings
%%%
%\RequirePackage{titlesec}
%\titlespacing{\paragraph}{0pt}{*1}{*1} % SPACE
\RequirePackage[compact]{titlesec}  % SPACE
%\titleformat{\section}%  % IEEE/ACM: caps + period
% {\bf\large\uppercase}{\thesection.\quad}{0pt}{}
\titleformat{\section}{\bf\large}{\thesection}{8pt}{} % USENIX


%%%
%%%  Lists
%%%
\RequirePackage{paralist}
\RequirePackage{enumitem}
\setlist{itemsep=0pt,parsep=0pt}  % more compact lists

\renewcommand{\paragraph}[1]{\vspace*{0.03in}\noindent{\bf #1}}

%%%
%%%  Custom Environments
%%%
\RequirePackage{pifont}
\newcommand{\cmark}{\ding{51}}%
\newcommand{\xmark}{\ding{55}}%

%%%
%%%  Header / Footer
%%%
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}

\ifthenelse{\equal{\PAGENUMBERS}{yes}}{%

%\fancypagestyle{version}{\fancyhf{}\renewcommand{\headrulewidth}{0pt}\fancyfoot[R]{{\small Date: March 11, 2016}}}

\pagestyle{plain}
\renewcommand{\headrulewidth}{0pt}

}{%
  \pagestyle{empty}
}

%%%
%%%  Bibliography
%%%
%\RequirePackage[numbers]{natbib}
\RequirePackage{cite}

%%%
%%%  Footnotes / Endnotes
%%%
\interfootnotelinepenalty=10000  % Split footnotes are annoying

%% If you want endnodes, uncomment:
%\RequirePackage{endnotes}
%\RequirePackage{drafthead}
%\let\footnote=\endnote

%%%
%%%  Tables
%%%
\RequirePackage{booktabs}
\RequirePackage{color}
\RequirePackage{colortbl}
\RequirePackage{float}  % Must appear before hyperref to
                        % avoid weird PDF compile issues

%%%
%%%  Fonts
%%%
\RequirePackage{mathptmx} % Times/Times-like math symbols
\RequirePackage{courier}
\RequirePackage[scaled=0.92]{helvet}

%%%
%%%  PDF setup
%%%

\RequirePackage[breaklinks=true,filecolor=black,citecolor=blue,urlcolor=black,linkcolor=blue,colorlinks,pdfpagelabels,pdfpagelayout=SinglePage]{hyperref}

% \renewcommand*{\backref}[1]{}
% \renewcommand*{\backrefalt}[4]{
%   \ifcase #1 %
%     (Not cited.) %
%   \or
%     {\small (Cited on page~#2.)}%
%   \else
%     {\small (Cited on pages~#2.)}%
%   \fi
% }
% \renewcommand*{\backrefsep}{, }
% \renewcommand*{\backreftwosep}{ and~}
% \renewcommand*{\backreflastsep}{ and~}

% \hypersetup{%
% pdfauthor = {\AUTHORS},
% pdfsubject = {\CONFERENCE},
% pdfkeywords = {\KEYWORDS},
% bookmarksopen = {true}
% }

%%
%%  Figure placeholder macros
%%
\definecolor{placeholderbg}{rgb}{0.85,0.85,0.85}
\newcommand{\placeholder}[1]{%
\fcolorbox{black}{placeholderbg}{\parbox[top][1.5in][c]{0.95\columnwidth}{#1}}}

%%%
%%%  Misc
%%%
\RequirePackage[pdftex]{graphicx}
\RequirePackage{soul}
\RequirePackage{subcaption}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{listings}
\RequirePackage{tikz}
\usetikzlibrary{arrows}

%\setlength{\parindent}{0pt}
%\setlength{\parskip}{\baselineskip}

\clubpenalty=10000  % Don't allow orphans
\widowpenalty=10000 % Don't allow widows

%%%
%%%  To appear/appeared in text on title page
%%%
\RequirePackage[absolute]{textpos}
\newcommand{\ToAppear}{%
\begin{textblock*}{\textwidth}(0.95in,0.4in)
\begin{flushright}
    %\noindent{\fbox{\textsf{Under submission---please do not redistribute.}}}
    %  --OR--
    \noindent{\small To appear in \textit{Proceedings of the XYZ}\\
    \noindent{\small \textit{Conference (XYZ'08)}, City, State, Month 2008}}
    %  --OR--
    %\noindent{\small In \textit{Proceedings of the XYZ}\\
    %\noindent{\small \textit{Conference (XYZ'08)}, City, State, Month 2008}}
\end{flushright}
\end{textblock*}
}

%%%
%%%  Sample ACM Copyright Block
%%%
\floatstyle{plain}
\newfloat{acmcr}{b}{acmcr}
\newcommand{\AcmCopyright}{%
\begin{acmcr}
\parbox[b]{20pc}{%
\footnotesize
Permission to make digital or hard copies of all or part of this work for
personal or classroom use is granted without fee provided that copies are not
made or distributed for profit or commercial advantage and that copies bear
this notice and the full citation on the first page. Copyrights for components
of this work owned by others than ACM must be honored. Abstracting with credit
is permitted. To copy otherwise, or republish, to post on servers or to
redistribute to lists, requires prior specific permission and/or a fee. Request
permissions from Permissions@acm.org.

{\em SIGCOMM'16}, August 22--26, 2016, Florian\'{o}polis, Brazil.\\
Copyright 2016 ACM. ISBN 978-1-4503-4193-6/16/08...\$15.00\\
DOI: \url{http://dx.doi.org/10.1145/2934872.2959081}}
\end{acmcr}}

%%%
%%%  Comments
%%%
\newcommand{\note}[2]{
    \ifthenelse{\equal{\showComments}{yes}}{\textcolor{#1}{#2}}{}
}

\newcommand{\xxx}[1]{\note{red}{#1}}
\newcommand{\todo}[1]{\note{red}{\bf #1}}

%%%
%%%  Abbreviations
%%%
\newcommand{\ie}{{\em i.e.}}
\newcommand{\eg}{{\em e.g.}}
\newcommand{\ea}{{\em et al.}}
\newcommand{\fp}{\vspace*{0.05in}\noindent}
\newcommand{\name}{NAME\xspace}

%%%
%%%  Theorems
%%%
\newtheoremstyle{tighter}
    {3pt}        % Space above
    {3pt}        % Space below
    {\em}        % Body font
    {}           % Indentation
    {\bfseries}  % Head font
    {:}          % Head punctuation
    {.5em}       % Head space
    {}           % Custom head spec
\theoremstyle{tighter}
\newtheorem{lesson}{Lesson}
\newtheorem{constraint}{Constraint}
%\newcommand{\lesson}[1]{\vspace{1em}{\centering\fbox{\parbox{0.95\columnwidth}{\centering\bf Lesson: #1}}}\vspace{1em}}

% This needs to be the last thing before \begin{document}
\RequirePackage{microtype}  % SPACE

%%%
%%% Additional Packages
%%%

\usepackage{multirow}
\usepackage{xspace}

%%%
%%% ACM Formatting
%%%

% Need Copyright Year and Copyright Data to be user definable (in .tex file).
% Gerry Nov. 30th. 1999
\newtoks\copyrtyr
\newtoks\acmcopyr
\newtoks\boilerplate

%% \setcopyright{rightsretained}
%% \conferenceinfo{SIGCOMM'16,}{August 22--26, 2016, Florianopolis, Brazil.}
%% \isbn{978-1-4503-4424-1.}
%% \doi{YOUR UNIQUE DOI}


\global\acmcopyr={X-XXXXX-XX-X/XX/XX}  % Default - 5/11/2001 *** Gerry
\global\copyrtyr={\the\year}                % Default - 3/3/2003 *** Gerry
\def\acmPrice#1{\gdef\@acmPrice{#1}}
\acmPrice{} %article price  % Changed to 15 - June 2012 - Gerry


\def\CopyrightYear#1{\global\copyrtyr{#1}}
\def\crdata#1{\global\acmcopyr{#1}}
\def\permission#1{\global\boilerplate{#1}}

% ISBN
%
\def\isbn#1{\global\acmcopyr={#1}}
\isbn{978-1-4503-2138-9}

\RequirePackage{url}
\urlstyle{rm}
\def\doi#1{\def\@doi{#1}}
\doi{http://dx.doi.org/10.1145/2934872.2959081}
\def\printdoi#1{\url{#1}}



% Copyright
%\RequirePackage{acmcopyright}
%\setcopyright{none}

%
\global\boilerplate={\@copyrightpermission}

\newtoks\conf
\newtoks\confinfo
\def\conferenceinfo#1#2{\global\conf={#1}\global\confinfo{#2}}

\let\@concepts\@empty
% Support for CCSXML file
\RequirePackage{comment}
\excludecomment{CCSXML}

% New concepts scheme
%
% The first argument is the significance, the
% second is the concept(s)
%
\newcommand\ccsdesc[2][100]{%
  \ccsdesc@parse#1~#2~}
%
% The parser of the expression Significance~General~Specific
%
\def\ccsdesc@parse#1~#2~#3~{%
  \expandafter\ifx\csname CCS@#2\endcsname\relax
    \expandafter\gdef\csname CCS@#2\endcsname{\textbullet\textbf{#2} $\to$ }%
  \g@addto@macro{\@concepts}{\csname CCS@#2\endcsname}\fi
  \expandafter\g@addto@macro\expandafter{\csname CCS@#2\endcsname}{%
    \ifnum#1>499\textbf{#3; }\else
    \ifnum#1>299\textit{#3; }\else
    #3; \fi\fi}}

\newcommand\printccsdesc{%
  \ifx\@concepts\@empty\else
  \if@twocolumn
    \section*{CCS Concepts}
    \@concepts
    \else \small
    \quotation{\@concepts}%
    \fi
    \fi}

\def\doi#1{\def\@doi{#1}}
\doi{http://dx.doi.org/10.1145/2934872.2959081}

\def\keywords{\if@twocolumn
\section*{Keywords}
\else \small
\quotation
\fi}

\endinput
