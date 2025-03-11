\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{teamhenkler}[2014/08/16 Example LaTeX class]



\newcommand{\uniname}{Unknown A}
\newcommand{\projecttype}{Unknown Project Type}
\newcommand{\company}{\empty}
\newcommand{\studyprogram}{Uknown Course of Study}
\newcommand{\logospaceup}{3cm}
\newcommand{\logospacedown}{3cm}
\newcommand{\logopath}{NoPath}


\newcommand{\declaration}{\chapter*{Affidavit}
	I <your full name> herewith declare that I have composed the present paper and work by myself and without use of any other than the cited sources and aids. Sentences or parts of sentences quoted literally are marked as such; other references with regard to the statement and scope are indicated by full details of the publications concerned. The paper and work in the same or similar form has not been submitted to any examination body and has not been published. This paper was not yet, even in part, used in another examination or as a course performance.
	. ~\\
	Lippstadt,  \today\\[.6cm] %<city>, <date>
	Name of student\\ % signature
	}

\RequirePackage{pgfkeys}


\pgfkeys{/henkler/.is family, /henkler, 
	university/.estore in = \uniname,
	project/.estore in = \projecttype,
}




\pgfkeys{/henkler,
	university/.is choice,
	FhD/.code = {\renewcommand{\uniname}{Fachhochschule Dortmund}
							\renewcommand{\studyprogram}{Embedded Systems Engineering}
							\renewcommand{\logopath}{assets/logo/FH_Dortmund-logo.svg.png}
							\renewcommand{\logospaceup}{4cm}
							\renewcommand{\logospacedown}{4cm}
							\renewcommand{\declaration}{\chapter*{Declaration}
								I, \theauthor, hereby confirm, that I have written the \projecttype\space at hand independently – in case of a group work: my respectively designated part of the work -, that I have not used any sources or materials other than those stated, and that I have highlighted any citations properly.
								. ~\\
							Dortmund,  \thegraddate\\[.6cm] %<city>, <date>
							\theauthor\\ % signature
							}
							},
	HSHL/.code = {
								\renewcommand{\uniname}{Hamm-Lippstadt}
								\renewcommand{\studyprogram}{Electronic Engineering}
								\renewcommand{\logopath}{assets/logo/HSHL_Logo_vertikal_RGB_yellow_red_ENG.jpg}
								\renewcommand{\logospacedown}{3cm}
								\renewcommand{\logospaceup}{3cm}
								\renewcommand{\declaration}{\chapter*{Affidavit}
									I,\theauthor, herewith declare that I have composed the present paper and work by myself and without use of any other than the cited sources and aids. Sentences or parts of sentences quoted literally are marked as such; other references with regard to the statement and scope are indicated by full details of the publications concerned. The paper and work in the same or similar form has not been submitted to any examination body and has not been published. This paper was not yet, even in part, used in another examination or as a course performance. ~\\
									Lippstadt,  \thegraddate\\[.6cm] %<city>, <date>
									\theauthor\\ % signature
								}
								},
	project/.is choice,
	ProjectWork/.code = {\renewcommand{\projecttype}{Project Work}},
	BachelorThesis/.code = {\renewcommand{\projecttype}{Bachelor Thesis}},
	MasterThesis/.code = {\renewcommand{\projecttype}{Master Thesis}},
	ResearchThesis/.code = {\renewcommand{\projecttype}{Research Thesis}}
}

\DeclareOption*{%
	\pgfkeys{/henkler/\CurrentOption}%
}

\ProcessOptions\relax







\LoadClass{report}

\usepackage{titling}



% ==========================
% Packages
% ==========================
\usepackage{graphicx} % Required for inserting images
\RequirePackage[english]{babel}
\usepackage[hidelinks]{hyperref}
\usepackage{setspace}
\usepackage[utf8]{inputenc}
\usepackage{enumitem} 
\usepackage[pass]{geometry}
\usepackage{multirow}
\usepackage{pdfpages}
\usepackage{chngcntr}
\usepackage{bbm}
\usepackage{xargs}  

% ==========================
% Math Packages
% ==========================

\usepackage{amsmath, amssymb, amsfonts, mathtools}
\usepackage{algorithm}
\usepackage{amsthm}
\usepackage{algpseudocode}

% ==========================
% Graphic Packages
% ==========================
\usepackage{tikz}
\usepackage{tikz-cd}
\usepackage{tikz-3dplot}
\usepackage{xcolor} % For modern color palette
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage{pgfplots}
\usepackage[most]{tcolorbox}
\usepackage{deps/tikz-uml}
% ==========================
% Tikz Libraries
% =========================
\usetikzlibrary{positioning}
\usetikzlibrary{ arrows.meta}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{calc}
\usetikzlibrary{arrows}
\usetikzlibrary{shapes, arrows, positioning, fit, calc, backgrounds, chains,decorations.pathreplacing,hobby}
\usetikzlibrary{mindmap,trees}
\usetikzlibrary{automata,positioning}
\usetikzlibrary{decorations.markings}
% ==========================
% Pfg Libraries
% =========================
\usepgfkeyslibrary{ext.pgfkeys-plus}
\usepgfplotslibrary{groupplots}
\pgfplotsset{compat=1.17,colormap/viridis}

% ==========================
% Document Settings
% ==========================

%\addto\captionsenglish{\renewcommand{\bibname}{Bibliography}}
%\setcounter{secnumdepth}{5}
%\setcounter{tocdepth}{1}


% ==========================
% Reference Settings
% ==========================

\newcommand{\secref}[1]{Section \ref{#1}}
\newcommand{\chapref}[1]{Chapter \ref{#1}}
\newcommand{\figref}[1]{Fig \ref{#1}}
\newcommand{\equaref}[1]{(\ref{#1})}
\newcommand{\citepaperof}[2]{\textit{#2} in \cite{#1}}
\newcommand{\citepaperofs}[2]{\textit{#2 et al.} in \cite{#1}}
\newcommand{\algoref}[1]{Algorithm \ref{#1}}
\newcommand{\defref}[1]{Definition \ref{#1}}
\newcommand{\exref}[1]{Example \ref{#1}}
\newcommand{\tabref}[1]{Table \ref{#1}}
\newcommand{\problemref}[1]{Problem \ref{#1}}
\newcommand{\subfigref}[1]{(\subref{#1})} 
\newcommand{\appref}[1]{Appendix \ref{#1}}
\newcommand{\sectionbreak}{\clearpage}


% ==========================
% Theorem Style
% ==========================

\theoremstyle{definition}
\newtheorem{definition}{Definition}

\theoremstyle{definition}
\newtheorem{example}{Example}

\theoremstyle{definition}
\newtheorem{statecomprule}{SC-Rule}

\theoremstyle{definition}
\newtheorem{problem}{Problem}


% ==========================
% Colors
% ==========================
\definecolor{viridisgreencolor}{RGB}{32, 162, 57} % Viridis green color
\definecolor{viridisorangecolor}{RGB}{253, 174, 97}
\definecolor{viridisbluecolor}{RGB}{68, 1, 84}
\definecolor{viridisyellowcolor}{RGB}{253, 231, 37}
\definecolor{viridispurplecolor}{RGB}{108, 60, 142}
\definecolor{viridiscyancolor}{RGB}{1, 133, 113}
\definecolor{viridismagentacolor}{RGB}{177, 3, 155}


\definecolor{layer1}{HTML}{4CAF50} % Green for perception layer
\definecolor{layer2}{HTML}{2196F3} % Blue for network layer
\definecolor{layer3}{HTML}{FFC107} % Yellow for computation layer
\definecolor{layer4}{HTML}{F44336} % Red for control layer
\definecolor{layer5}{HTML}{9C27B0} % Purple for application layer
\definecolor{subLayer1}{HTML}{388E3C} % Darker green for sublayer 1
\definecolor{subLayer2}{HTML}{66BB6A} % Lighter green for sublayer 2


% ==========================
% Tikkz styles
% ==========================
\tikzstyle{class} = [fill=white, minimum width=3cm]


\tikzstyle{layer} = [rectangle, rounded corners, text centered, draw=black!50, dashed, inner sep= 15pt]
\tikzstyle{layerTight} = [rectangle, rounded corners, minimum width=6.3cm, minimum height=1cm, text centered, draw=black!50, dashed, inner sep= 5pt]
\tikzstyle{layerGroup} = [rectangle, rounded corners, minimum width=7.3cm, minimum height=1cm, text centered, draw= black, dashed, inner sep= 5pt]
\tikzstyle{subLayer} = [rectangle, rounded corners, minimum width=2.8cm, minimum height=1cm, text centered, draw=black]
\tikzstyle{arrow} = [thick,->,>=stealth]
\tikzstyle{arrowDown} = [thick,<-,>=stealth]
\tikzstyle{doublearrow} = [thick,<->,>=stealth]
\tikzstyle{title} = [font=\color{black}\fontsize{9}{9}\selectfont, opacity=0.5]
\tikzset{arrowstyle/.style={draw=black, fill=layer5!30, single arrow,single arrow,
		single arrow head extend=.4cm,}}
\newcommand{\asymcloud}[2][.1]{%Cloud shape
	\begin{scope}[#2]
		\pgftransformscale{#1}%    
		\pgfpathmoveto{\pgfpoint{261 pt}{115 pt}} 
		\pgfpathcurveto{\pgfqpoint{70 pt}{107 pt}}
		{\pgfqpoint{137 pt}{291 pt}}
		{\pgfqpoint{260 pt}{273 pt}} 
		\pgfpathcurveto{\pgfqpoint{78 pt}{382 pt}}
		{\pgfqpoint{381 pt}{445 pt}}
		{\pgfqpoint{412 pt}{410 pt}}
		\pgfpathcurveto{\pgfqpoint{577 pt}{587 pt}}
		{\pgfqpoint{698 pt}{488 pt}}
		{\pgfqpoint{685 pt}{366 pt}}
		\pgfpathcurveto{\pgfqpoint{840 pt}{192 pt}}
		{\pgfqpoint{610 pt}{157 pt}}
		{\pgfqpoint{610 pt}{157 pt}}
		\pgfpathcurveto{\pgfqpoint{531 pt}{39 pt}}
		{\pgfqpoint{298 pt}{51 pt}}
		{\pgfqpoint{261 pt}{115 pt}}
		\pgfusepath{fill,stroke}         
\end{scope}}    


\newcommand{\defineplane}[7]{%
	% Inputs: right uppermost point (#1, #2, #3), base (#4), height (#5), fill style (#6), vertex names (#7)
	\coordinate (#7-TopRight) at (#1, #2, #3);
	\coordinate (#7-TopLeft) at (#1-#4, #2, #3);
	\coordinate (#7-BottomRight) at (#1, #2-#5, #3);
	\coordinate (#7-BottomLeft) at (#1-#4, #2-#5, #3);
	\coordinate (#7-MiddlePoint) at (#1/4+#1/4-#4/4+#1/4+#1/4-#4/4,         #2/4+#2/4+#2/4-#5/4+#2/4-#5/4,            #3);
	
	% Draw the plane
	\filldraw[#6] (#7-TopRight) -- (#7-TopLeft) -- (#7-BottomLeft) -- (#7-BottomRight) -- cycle;
	\draw[thick] (#7-TopRight) -- (#7-TopLeft) -- (#7-BottomLeft) -- (#7-BottomRight) -- cycle;
	\node[fill=none, circle, inner sep=0pt] (#7-MiddlePoint) at (#7-MiddlePoint) {}; 
	
	% Automatically define the anchor points for the plane (center of each edge)
	\coordinate (#7-west) at ($(#7-TopLeft)!0.5!(#7-BottomLeft)$);   % west anchor at the center of the left edge
	\coordinate (#7-east) at ($(#7-TopRight)!0.5!(#7-BottomRight)$);  % east anchor at the center of the right edge
	\coordinate (#7-north) at ($(#7-TopLeft)!0.5!(#7-TopRight)$);    % north anchor at the center of the top edge
	\coordinate (#7-south) at ($(#7-BottomLeft)!0.5!(#7-BottomRight)$);  % south anchor at the center of the bottom edge
	
}



\tikzdeclarecoordinatesystem{hexaring}{%
	\pgfqkeys{/tikz/cs}{#1}%
	\pgfmathtruncatemacro\hRing{\pgfkeysvalueof{/tikz/cs/ring}}%
	\ifnum\hRing=0 \pgfpointorigin
	\else
	\pgfmathtruncatemacro\hPos{\pgfkeysvalueof{/tikz/cs/pos}}%
	\pgfmathtruncatemacro\hSide{\hPos/\hRing}%
	\pgfmathtruncatemacro\hPosOnSide{mod(\hPos,\hRing)}%
	\pgfpointlineattime{\hPosOnSide/\hRing}
	{\pgfpointpolarxy{30+\hSide*60}{1.73205*\hRing}}
	{\pgfpointpolarxy{90+\hSide*60}{1.73205*\hRing}}%
	\fi}
\tikzset{
	cs/ring/.initial=0, cs/pos/.initial=0, list/.initial={0,...,4},
	hexagon path/.style 2 args={
		insert path={plot[sharp cycle,samples at={0, 60, ..., 359}](\x:1)}},
	hexagon/.style 2 args={
		hexagon ring #1/.try={#2}, hexagon pos #2/.try={#1},
		/utils/TeX/ifnum={#1=0}{}{
			hexagon not ring 0/.try={#1}{#2},
			style/.pgfmath wrap={hexagon side ##1/.try={#1}{#2}}{int(#2/#1)},
			style/.pgfmath wrap={hexagon pos' ##1/.try={#1}{#2}}{int(mod(#2,#1))}}}}
\newcommand*\tikzhexagonofhexagons[1][]{%
	\foreach[/utils/exec=\tikzset{#1}, expand list,
	evaluate={\hexPerRing=int(max(1,\ring*6)-1);}]\ring in{\pgfkeysvalueof{/tikz/list}}
	\foreach[/tikz/cs/ring=\ring]\pos in {0, ..., \hexPerRing}
	\draw[hexagon={\ring}{\pos}, shift={(hexaring cs: pos=\pos)}, hexagon path={\ring}{\pos}];}


% ==========================
% Boxes for cool definitions, examples etc
% ==========================


\tcbset{
	myboxstyle/.style={
		enhanced, breakable,
		sharp corners,
		left skip=8mm,
		attach boxed title to top left={yshift*=-\tcboxedtitleheight/2},
		boxed title style={colframe=#1!40, height=6mm, bean arc, boxrule=1pt},
		colback=#1!10, colframe=#1!30, boxrule=1pt,
		coltitle=black, colbacktitle=#1!10,
		fonttitle=\bfseries,
		underlay boxed title={%
			\node[circle, fill=#1!10, draw=#1!40, inner sep=1pt, minimum size=6mm, line width=1pt, font=\bfseries] (boxnumber) at ([xshift=-6mm]title.west) {\thetcbcounter};
		},
		underlay unbroken={%
			\draw[#1!40, line width=1pt] (title.west)--(boxnumber);
			\draw[#1!40, -|, line width=1pt] (boxnumber)--(boxnumber|-frame.south);
		},
		underlay first={%
			\draw[#1!40, line width=1pt] (title.west)--(boxnumber);
			\draw[#1!40, line width=1pt] (boxnumber)--(boxnumber|-frame.south);
		},
		underlay middle={%
			\draw[#1!40, line width=1pt] (boxnumber|-frame.north)--(boxnumber|-frame.south);
		},
		underlay last={%
			\draw[#1!40, -|, line width=1pt] (boxnumber|-frame.north)--(boxnumber|-frame.south);
		},
	}
}

% Define the boxed environment
\newtcolorbox{definitionbox}[2][]{%
	colback=white, % Background color
	colframe=black, % Border color
	fonttitle=\bfseries, % Title font
	title=\textbf{Definition \arabic{definitionCounter}}:~\textit{#1}, % Title format
	sharp corners, % Box style
}


\newtcolorbox[use counter=definitionCounter]{definitionBox}[2][]{%
	myboxstyle=blue, title=\textbf{Definition}:~\textit{#2}, #1
}

\newtcolorbox[use counter=exampleCounter]{exampleBox}[1][]{%
	myboxstyle=green, title=\textbf{Example}, #1
}


\newtcolorbox[use counter=assumptionCounter]{assumptionBox}[1][]{%
	myboxstyle=red, title=\textbf{Assumption}, #1
}
\newtcolorbox[use counter=propertyCounter]{propertyBox}[1][]{%
	myboxstyle=cyan, title=\textbf{Property}, #1
}


% ==========================
% Counters
% ==========================


\newcounter{exampleCounter}
\newcounter{definitionCounter}
\newcounter{assumptionCounter}
\newcounter{propertyCounter}


% ==========================
% Useful Command to write notes, missing citations etc
% ==========================
\newcommand{\citationRequired}{\textcolor{red}{(CITATION)}}


\usepackage[colorinlistoftodos,prependcaption,textsize=tiny]{todonotes}
\newcommandx{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improvement}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommandx{\thiswillnotshow}[2][1=]{\todo[disable,#1]{#2}}




\newenvironment{missingelements}[1][Missing Elements]
{%
	\begin{tcolorbox}[colframe=red, colback=white, boxrule=1pt, arc=0pt]
		\textbf{\color{red}#1} % Title in bold and red
		\begin{itemize}
		}
		{%
		\end{itemize}
	\end{tcolorbox}
}


\newenvironment{ideastoinclude}[1][Possible ideas]
{%
	\begin{tcolorbox}[colframe=blue, colback=white, boxrule=1pt, arc=0pt]
		\textbf{\color{blue}#1} % Title in bold and red
		\begin{itemize}
		}
		{%
		\end{itemize}
	\end{tcolorbox}
}

\newenvironment{whattocheck}[1][What's there to check]
{%
	\begin{tcolorbox}[colframe=orange, colback=white, boxrule=1pt, arc=0pt]
		\textbf{\color{orange}#1} % Title in bold and red
		\begin{itemize}
		}
		{%
		\end{itemize}
	\end{tcolorbox}
}

\title{Default Title}
\author{Default Author}




\newcommand{\thegraddate}{\@graddate}
\def\graddate#1{\gdef\@graddate{#1}}
\def\@graddate{\@latex@error{No \noexpand\graddate given}\@ehc}

\makeatletter
\newcommand{\thesupervisor}{\@supervisor}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\@supervisor{\@latex@error{No \noexpand\supervisor given}\@ehc}

\newcommand{\thecosupervisor}{\@cosupervisor}
\def\cosupervisor#1{\gdef\@cosupervisor{#1}}
\def\@cosupervisor{\@latex@error{No \noexpand\cosupervisor given}\@ehc}


\newcommand{\thematriculationnumber}{\@matriculationnumber}
\def\matriculationnumber#1{\gdef\@matriculationnumber{#1}}
\def\@matriculationnumber{\@latex@error{No \noexpand\matriculationnumber given}\@ehc}


\newcommand{\thecompanyname}{\@companyname}
\def\companyname#1{\gdef\@companyname{#1}}
\def\@companyname{\@latex@error{No \noexpand\companyname given}\@ehc}
\companyname{}



\newcommand{\thecompanylogo}{\@companylogo}
\def\companylogo#1{\gdef\@companylogo{#1}}
\def\@companylogo{\@latex@error{No \noexpand\companylogo given}\@ehc}
\companylogo{}


\renewcommand{\maketitle}{%
	\newgeometry{margin=1in}  % Apply title page margin
	\begin{titlepage}
		\begin{center}
			\vspace*{0.5cm}
			\Large
			\textbf{\uniname} \\
			\textbf{University of Applied Sciences and Arts} \\
			\textbf{\studyprogram}\\
			
			\if\thecompanyname\empty
			%\textbf{No company provided.}
			\else
			% If company has a value
			\vspace{0.5cm}
			\textbf{\& \thecompanyname}
			\fi
			
			\vspace{2cm}
			
			\LARGE
			\textbf{\@title} \\
			\vspace{1cm}
			\textbf{\projecttype}
			
			\vspace{\logospaceup}
			
			\if\thecompanyname\empty
			\includegraphics[width=0.4\textwidth]{\logopath}\hspace{10mm}\\
			\else
				
				\if\thecompanylogo\empty
				\includegraphics[width=0.4\textwidth]{\logopath}\hspace{10mm}\\
					\else
					\includegraphics[width=0.4\textwidth]{\logopath}\hspace{10mm}
					\includegraphics[width=0.4\textwidth]{\thecompanylogo}\\
					\fi
			\fi
			\vspace{\logospacedown}
			\large
			\begin{minipage}[b]{10cm}
			\raggedright
			\textbf{Author:} \hspace{0.5cm} \@author\\
			\textbf{Matriculation Number:} \hspace{0.5cm} \@matriculationnumber \\
			\textbf{Supervisor:} \hspace{0.5cm} \@supervisor \\
			\textbf{Co-Supervisor:} \hspace{0.5cm} \@cosupervisor \\
			\textbf{Date:} \hspace{0.5cm} \@graddate
				\end{minipage}
			\vfill
			\vspace{1cm}
		\end{center}
	\end{titlepage}
	\restoregeometry
}


\newcommand{\makedeclaration}{
	
	\declaration
	\newpage
}



\newcommand{\maketoc}{%
	\pagenumbering{roman}
	\doublespacing
	\tableofcontents
	\newpage
	\listoffigures
	\listoftables
	\newpage
	\singlespacing
	
	\cleardoublepage
	\pagenumbering{arabic} 
}
\let\oldappendix\appendix
\renewcommand{\appendix}{
	\newpage
	\oldappendix
	\pagenumbering{arabic} % Set page numbering to arabic
	\renewcommand*{\thepage}{\thechapter\arabic{page}} % Customize the page numbering format
	\setcounter{chapter}{0}
}

\makeatother


\renewenvironment{abstract}{
	\chapter*{Abstract} % For articles, you might use \section*{Abstract} instead
	\vspace{1em} % Adjust the space if needed
	%\itshape % Italicize the text, optional
	
}{}
