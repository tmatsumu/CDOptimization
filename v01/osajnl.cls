%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              File: osajnl.cls		                  %
%              Version: 1.3                           %
%              Date: 22th December 2014               %
%                                                     %
%     This class file and associated style files 	  %
%	  listed below are provided for authors           %
%     submitting to the Optical Society's Applied     %
%     Optics Journal, http://www.osa.org  	          %
%													  %
%     Style files: ao, ol, josaa, josab.sty		      %
%                                                     %
%     Produced by WriteLaTeX Limited				  %
%													  %
%     Copyright 2014 Optical Society of America       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either
% version 1.3 of this license or any later version.
% The latest version of this license is in
% http://www.latex-project.org/lppl.txt and
% version 1.3 or later is part of all distributions
% of LaTeX version 2005/12/01 or later.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{osajnl}[22/12/2014, v1.3]
\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions*
\LoadClass{extarticle}

% Fonts and language
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{mathpazo} % Widely available alternative to Garamond
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{url}
\RequirePackage[colorlinks=true, allcolors=blue]{hyperref}

\newcommand{\headerfont}{\normalfont\sffamily\fontsize{7}{9} \selectfont}
\newcommand{\titlefont}{\normalfont\sffamily\bfseries\fontsize{21}{23}\selectfont}
\newcommand{\datesfont}{\normalfont\sffamily\itshape\fontsize{8}{10}\selectfont}
\renewcommand\UrlFont{\color{color1}\sffamily}
\newcommand{\absfont}{\normalfont\rmfamily\bfseries\linespread{1.2}\fontsize{10}{12}\selectfont}
\newcommand{\copyrightfont}{\normalfont\sffamily\fontsize{8}{10}\selectfont}


% Author and affiliation
\RequirePackage{authblk}
\setlength{\affilsep}{1em}
\renewcommand\Authfont{\color{color2}\normalfont\sffamily\bfseries\scshape\fontsize{12}{14}\selectfont}
\renewcommand\Affilfont{\color{color0}\normalfont\sffamily\itshape\fontsize{8}{10}\selectfont}

% Choose journal type
\newcommand*{\journal}[1]{%
  \RequirePackage{#1}}

% Options for element switching
\RequirePackage{xifthen}
\newboolean{displaycopyright}
\newboolean{shortarticle}

% Copyright statement
\RequirePackage{textcomp} % For copyright symbol styling
\newcommand{\copyrightstatement}{\, \textcopyright\, \the\year{} Optical Society of America}

% Graphics, tables and other formatting
\RequirePackage{graphicx,xcolor}
\RequirePackage{colortbl}
\RequirePackage{booktabs}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{changepage}
\RequirePackage[left=48pt,%
                right=42pt,%
                top=46pt,%
                bottom=60pt,%
                headheight=15pt,%
                headsep=10pt,%
                letterpaper,twoside]{geometry}%
\RequirePackage{caption}
%\RequirePackage[labelfont={bf,sf},%
%                labelsep=period,%
%                figurename=Fig.,%
%                singlelinecheck=off,%
%                justification=RaggedRight]{caption}
\setlength{\columnsep}{24pt} % Distance between the two columns of text
\setlength{\parindent}{12pt} % Paragraph indent

% Set document color scheme
\definecolor{color0}{RGB}{0,0,0} % Base
\definecolor{color1}{RGB}{59,90,198} % author email, doi
% color2 defined by the specific journal style file

% Bibliography
\RequirePackage[numbers,sort&compress]{natbib}
\setlength{\bibsep}{0.0pt}
\bibliographystyle{osajnl}

\makeatletter
\renewcommand\@biblabel[1]{ #1.} % Remove brackets from label
\def\bibfont{\normalfont\sffamily\fontsize{8}{10}\selectfont}
\def\tagform@#1{\maketag@@@{\bfseries(\ignorespaces#1\unskip\@@italiccorr)}}
\renewcommand{\eqref}[1]{\textup{{\normalfont Eq.~(\ref{#1}}\normalfont)}}
\makeatother

% Table style
\arrayrulecolor{color2} % Set the color of the horizontal rules
\renewcommand{\arraystretch}{1.5} % Increased line spacing
\captionsetup[table]{position=below} % Reduce spacing below caption

% Algorithm style
\makeatletter
\newcommand\fs@coloruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@coloruled
  \def\@fs@pre{\kern2pt}%
  \def\@fs@post{\kern2pt{\color{color2}\hrule}\relax}%
  \def\@fs@mid{\kern2pt{\color{color2}\hrule}\kern2pt}%
  \let\@fs@iftopcapt\iftrue}
\makeatother

\floatstyle{coloruled}
\restylefloat{algorithm}

% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\fancyhead[LE]{\headerfont \begin{tabular*}{\textwidth}{!{\color{black}\vrule}c!{\color{black}\vrule} @{\extracolsep{\fill}} c!{\color{black}\vrule}}\arrayrulecolor{black}
      \hline
      \cellcolor{black}\textcolor{white}{\ifthenelse{\boolean{shortarticle}}{Letter}{Research Article}} & \journalname\hspace{21pt}\thepage \\
      \hline
    \end{tabular*}}
\fancyhead[RO]{\headerfont \begin{tabular*}{\textwidth}{!{\color{black}\vrule}c!{\color{black}\vrule} @{\extracolsep{\fill}} c!{\color{black}\vrule}}\arrayrulecolor{black}
      \hline
      \cellcolor{black}\textcolor{white}{\ifthenelse{\boolean{shortarticle}}{Letter}{Research Article}} & \journalname\hspace{21pt}\thepage \\
      \hline
    \end{tabular*}}
\fancyhead[LO,RE]{}
% Footers
\lfoot{}%
\cfoot{}%
\rfoot{}%
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

% Section/subsection/paragraph set-up
\RequirePackage[explicit]{titlesec}
\renewcommand{\thesubsection}{\Alph{subsection}}

\titleformat{\section}
  {\large\sffamily\bfseries}
  {\thesection.}
  {0.5em}
  {\MakeUppercase{#1}}
  []
\titleformat{name=\section,numberless}
  {\large\sffamily\bfseries}
  {}
  {0em}
  {\MakeUppercase{#1}}
  []
\titleformat{\subsection}
  {\sffamily\bfseries}
  {\thesubsection.}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries\itshape}
  {\thesubsubsection.}
  {0.5em}
  {#1}
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{2pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{12pt}


% Article meta data additional fields
\newcommand{\ociscodes}[1]{\def\@ociscodes{#1}}
\newcommand{\ociscodesname}{\textbf{\textit{OCIS codes:}}} % Defines the heading name
\newcommand{\dates}[1]{\def\@dates{#1}}
\newcommand{\doi}[1]{\def\@doi{#1}}

\def\xabstract{abstract}
\long\def\abstract#1\end#2{\def\two{#2}\ifx\two\xabstract
\long\gdef\theabstract{\ignorespaces#1}
\def\go{\end{abstract}}\else
\typeout{^^J^^J PLEASE DO NOT USE ANY \string\begin\space \string\end^^J
COMMANDS WITHIN ABSTRACT^^J^^J}#1\end{#2}
\gdef\theabstract{\vskip12pt BADLY FORMED ABSTRACT: PLEASE DO
NOT USE {\tt\string\begin...\string\end} COMMANDS WITHIN
THE ABSTRACT\vskip12pt}\let\go\relax\fi
\go}

% Define a new environment with abstract content and styling
% (to enable switching between long and short articles)
\newcommand{\abscontent}{
\noindent
{%
\parbox{\dimexpr\linewidth}{%
	\absfont \theabstract
    \copyrightfont \ifthenelse{\boolean{displaycopyright}}{\copyrightstatement}{}
}%
}%
\vskip8pt%
\noindent
\parbox{\dimexpr\linewidth}{%
{\ociscodesname\hspace*{1em}} \textit{\@ociscodes}%
}%
\vskip8pt%
\noindent
\parbox{\dimexpr\linewidth}{%
\@doi%
}%
\hfil\rule{\linewidth}{.4pt}
}

% Custom title page
\renewcommand{\@maketitle}{%
{%
\vskip68pt%
{\raggedright \titlefont \@title\par}%
\vskip11pt
{\raggedright \@author\par}
\vskip11pt%
{\raggedright \datesfont \@dates\par}
\vskip1pt%
\ifthenelse{\boolean{shortarticle}}
{% just a single line for short article
\rule{\linewidth}{.4pt}
\vskip12pt}
{% else display the abstract contents (in reduced width box)
{%
\begin{adjustwidth}{24pt}{24pt}
\rule{\linewidth}{.4pt}
\vskip12pt%
\abscontent
\end{adjustwidth}
}%
\vskip25pt%
}%
}%
}%

% Other packages
\RequirePackage{enumitem} % For reducing bullet list item separation
\usepackage{lipsum} % Required to insert dummy text