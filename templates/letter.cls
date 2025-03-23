% Custom Letter Class
% Written by Matthew Santos
%---------------------------

% Class Definition
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../templates/letter}[2024/11/10 Letter LaTeX class]

% Packages
\LoadClass[12pt]{article} % [10pt,12pt]
\usepackage[letterpaper,margin=1in]{geometry} % Canada/USA
%\usepackage[a4paper,margin=1in]{geometry} % Europe/International
\usepackage[english]{babel} % Language Typography
\usepackage[hidelinks]{hyperref}
\usepackage[raggedright]{titlesec}
\usepackage{enumitem}
\usepackage{fontawesome}
\usepackage{times}
\usepackage[country=US]{phonenumbers}
\usepackage{graphicx}

% Varriables
\input{../templates/varriables.var}

% PDF Configuration (Generic Entries)
\hypersetup{
	pdfauthor={\name},
	pdftitle={\name Resume},
	pdfsubject={Cover Letter},
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
\setlength{\parskip}{\baselineskip} % Paragraph Spacing

% Define Personal Header
\newcommand{\header}{
	\centerline{{\Huge\textbf{\name}}}
	\vspace{-3\baselineskip}
	{\small
	\href{https://\website}{\faGithubSquare~\website}\hfill
	\href{mailto:\email}{\faEnvelope~\email}\\
	\href{https://linkedin.com/in/\linkedin}{\faLinkedinSquare~in/\linkedin}\hfill
	\ifdefined\telephone
	\href{tel:+\telephone}{\faPhone~\phonenumber{\telephone}}
	\else
	\href{https://www.google.ca/maps/place/Milton,+ON/}{\faMapMarker~\location}
	\fi
	\vspace{\baselineskip}}
}

% Add Header to Every Page
\AddToHook{shipout}{\header}

% Arguement is Sincerly/Regards/etc
\newcommand{\Signature}[1]{%
	\raggedright{#1},\\
	\vspace{4pt}
	\hspace*{-0.4cm}\includegraphics[width=4.5cm]{../templates/signature.png}\\
	%\vspace{2pt}
    Matthew Santos
}

%Arguements are {Company Name}{Address}{City}{Postal}{Date}
\newcommand{\CompanyInfo}[5]{%
	\textbf{#1} \hfill #5\\
	#2\\
	#3\\
	#4\\
	\vspace{2\baselineskip}
}



