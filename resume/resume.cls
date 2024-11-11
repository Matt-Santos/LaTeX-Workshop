% Custom Resume Class
% Written by Matthew Santos
%---------------------------

% Class Definition
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2024/11/10 Resume LaTeX class]

% Packages
\LoadClass[10.5pt]{article} % [10pt,12pt]
\RequirePackage[letterpaper,margin=0.5in]{geometry} % Canada/USA
%\RequirePackage[a4paper,margin=0.5in]{geometry} % Europe/International
\RequirePackage[english]{babel} % Language Typography
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[compact,raggedright]{titlesec}
\RequirePackage{enumitem}
\RequirePackage{fontawesome}
\RequirePackage{times}
%\RequirePackage{showframe}	 % Boundary Check

% PDF Configuration (Generic Entries)
\hypersetup{
	pdfauthor={Matthew Santos},
	pdftitle={Matthew Santos Resume},
	pdfsubject={Resume},
	pdfkeywords={Electrical Engineer},
	pdfcreator={LaTeX},
	pdfstartview={FitH},
	pdfview={FitH},
	pdfremotestartview={FitH},
	pdfpagelayout={SinglePage},
	pdfdisplaydoctitle={true},
	pdfduplex={Simplex},
	pdfpagemode={None},
}

% Unicode Fixes (ensures machine readable)
\input{glyphtounicode}
\pdfgentounicode=1
\urlstyle{same}

% Universal Formating
\setlength{\tabcolsep}{0in} % Eliminate indentation
\pagenumbering{gobble} % Eliminate pagenumbers
\raggedright


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