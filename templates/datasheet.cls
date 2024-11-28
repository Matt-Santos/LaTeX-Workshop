% Custom Datasheet Style
% Written by Matthew Santos (Inspired by Analog Devices)
%---------------------------

% Class Definition
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{datasheet}[2024/11/27 Datasheet LaTeX class]

% Packages
\LoadClass[11pt,twocolumn]{article} % [10pt,12pt]
\usepackage[includeheadfoot,letterpaper,margin=0.7in,top=0.5in]{geometry}
\usepackage[english]{babel} % Language Typography
\usepackage[hidelinks]{hyperref}
\usepackage[raggedright]{titlesec}
\usepackage{fancyhdr}
\usepackage{enumitem}
\usepackage{xcolor}
\usepackage{fontawesome}
\usepackage{graphicx}
\usepackage{helvet}
\usepackage{multicol}
\usepackage[smartEllipses]{markdown}
\usepackage{lastpage}

% Markdown Options
\markdownSetup{
	taskLists = true,
	definitionLists = true,
	smartEllipses,
	hashEnumerators,
	renderers={
		link = {\href{#3}{#1}}
	}
}

% Assign Font
\renewcommand{\familydefault}{\sfdefault}

% Define Header and Footer
\pagestyle{fancy}
\fancypagestyle{firstpage}{%
	\fancyhead[L]{\includegraphics[height=2cm]{images/logo.png}}
	\fancyhead[C]{}
	\fancyhead[R]{{\large\color{gray}Data Sheet}\\ \huge\color{blue}\textbf{PROJECT NAME}}
	\fancyfoot[L]{\today}
	\fancyfoot[C]{}
	\fancyfoot[R]{\thepage~of~\pageref{LastPage}}
}
\fancypagestyle{subsequentpages}{%
	\fancyhead[C]{}
	\fancyhead[R]{\huge\color{blue}\textbf{PROJECT NAME}}
	\fancyhead[L]{{\large\color{gray}Data Sheet}}
	
	\fancyfoot[L]{\today}
	\fancyfoot[C]{}
	\fancyfoot[R]{\thepage~of~\pageref{LastPage}}
}
\AtBeginDocument{\thispagestyle{firstpage}\vspace*{\baselineskip}}
\pagestyle{subsequentpages}

% Section Header Formats
\titleformat{\section}{\Large\color{blue}}{}{0em}{}
\titleformat{\subsection}{\normalfont\scshape}{}{1em}{}

