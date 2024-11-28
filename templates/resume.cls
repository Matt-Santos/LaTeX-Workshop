% Custom Resume Class
% Written by Matthew Santos
%---------------------------

% Class Definition
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../templates/resume}[2024/11/10 Resume LaTeX class]

% Packages
\LoadClass[10pt]{article} % [10pt,12pt]
\usepackage[letterpaper,margin=0.5in]{geometry} % Canada/USA
%\usepackage[a4paper,margin=0.5in]{geometry} % Europe/International
\usepackage[english]{babel} % Language Typography
\usepackage[hidelinks]{hyperref}
\usepackage[compact,raggedright]{titlesec}
\usepackage{enumitem}
\usepackage{fontawesome}
\usepackage{times}
\usepackage[country=US]{phonenumbers}
\usepackage{iftex}
%\usepackage{showframe}	 % Boundary Check

% Varriables
\input{../templates/varriables.var}

% PDF Configuration (Generic Entries)
\hypersetup{
	pdfauthor={\name},
	pdftitle={\name Resume},
	pdfsubject={Resume},
	pdfkeywords={Electrical Engineer},
	pdfcreator={LaTeX},
	pdfstartview={FitH},
	pdfview={FitH},
	pdfremotestartview={FitH},
	pdfpagelayout={SinglePage},
	pdfdisplaydoctitle={true},
	pdfduplex={Simplex},
	pdfpagemode={UseNone},
}

% Unicode Fixes (ensures machine readable)
\ifpdftex
\input{glyphtounicode}
\pdfgentounicode=1
\fi

% Universal Formating
\setlength{\tabcolsep}{0in} % Eliminate indentation
\pagenumbering{gobble} % Eliminate pagenumbers
\raggedright
\urlstyle{same}

% Define Personal Header
\newcommand{\header}{
	\centerline{{\Huge\textbf{\name}}}
	\vspace{-2\baselineskip}
	{\large
	\href{https://\website}{\faGithubSquare~\website}\hfill
	\href{mailto:\email}{\faEnvelope~\email}\\
	\href{https://linkedin.com/in/\linkedin}{\faLinkedinSquare~in/\linkedin}\hfill
	\ifdefined\telephone
	\href{tel:+\telephone}{\faPhone~\phonenumber{\telephone}}
	\else
	\href{https://www.google.ca/maps/place/Milton,+ON/}{\faMapMarker~\location}
	\fi}
}

% Add Header to Every Page
\AddToHook{shipout}{\header}

% Section Header
\titleformat{\section}{\bfseries}{}{0em}{}[\titlerule]

% Line Entry Command
% Args={Company,Location,Job Title,Date,Subheading,Items}
\newcommand{\resumeEntry}[6]{
	\begin{itemize}[leftmargin=0.0in, label={},nosep]
		\item
		\begin{tabular*}{1.0\textwidth}{l@{\extracolsep{\fill}}r}
			\textbf{#1} $|$ #2, \emph{#3} & \textbf{#4}
		\end{tabular*}
		#5
	\end{itemize}
	\ifx&#6&\empty\else
	\begin{itemize}[nosep]
		#6
	\end{itemize}
	\fi
	\vspace{4pt}
}

% Technical Skills Entry Command
% Args={Category,Entries}
\newcommand{\resumeSkillEntry}[3]{
	\begin{itemize}[leftmargin=0.0in, label={},nosep]
		\item
		\begin{tabular*}{1.0\textwidth}{l@{\extracolsep{\fill}}r}
			\textbf{#1} $|$ #2 & \textbf{#3}
		\end{tabular*}
	\end{itemize}
}