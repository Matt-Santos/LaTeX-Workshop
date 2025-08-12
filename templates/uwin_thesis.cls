% University of Windsor Thesis Class
% Written by Matthew Santos
%---------------------------

% Class Definition
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{templates/uwin_thesis}[2024/11/10 Uwindsor Thesis LaTeX class]
\LoadClass[12pt]{report}

% Packages
\ifdefined\directlua
	\usepackage{newtxtext}
\else
	\usepackage{times}
\fi
\usepackage{graphicx}
\usepackage{cite}
\usepackage{caption}
\usepackage{setspace}
\usepackage{float}
\usepackage{soul}
\usepackage{color}
\usepackage{titletoc}
\usepackage{titlesec}
\usepackage{multirow}
\usepackage{threeparttable}
\usepackage[RPvoltages]{circuitikz}
\usepackage{notoccite}
\usepackage{subfig}
\usepackage{pdfpages}
\usepackage{comment}
\usepackage[section]{placeins}
\usepackage{amsmath}
\usepackage{txfonts}
\usepackage[hyphens,spaces,obeyspaces]{url}
\usepackage[byname]{smartref}
\usepackage[toc,page,header]{appendix}
\usepackage[left=1.5in,top=1in,right=1in,right=1in]{geometry}
\usepackage[hidelinks,linktoc=all]{hyperref}
\usepackage[sort=use,acronym,toc,symbols,section=chapter,automake=immediate]{glossaries-extra}
\usepackage{lipsum}
%\usepackage{showframe} %Used to verify positioning

% Main Definitions
\def\Author#1{\def\@Author{#1}}
\def\Title#1{\def\@Title{#1}}
\def\DefenceYear#1{\def\@DefenceYear{#1}}
\def\DefenceMonth#1{\def\@DefenceMonth{#1}}
\def\DefenceDay#1{\def\@DefenceDay{#1}}
\def\Abstract#1{\def\@Abstract{#1}}
\def\Dedication#1{\def\@Dedication{#1}}
\def\Acknowledgments#1{\def\@Acknowledgments{#1}}
\def\PDFKeywords#1{\def\@PDFKeywords{#1}}
\def\ApprovalA#1#2#3{\def\@ApprovalAName{#1} \def\@ApprovalARole{#2} \def\@ApprovalADepartment{#3}}
\def\ApprovalB#1#2#3{\def\@ApprovalBName{#1} \def\@ApprovalBRole{#2} \def\@ApprovalBDepartment{#3}}
\def\ApprovalC#1#2#3{\def\@ApprovalCName{#1} \def\@ApprovalCRole{#2} \def\@ApprovalCDepartment{#3}}
\def\ApprovalD#1#2#3{\def\@ApprovalDName{#1} \def\@ApprovalDRole{#2} \def\@ApprovalDDepartment{#3}}
\def\ApprovalE#1#2#3{\def\@ApprovalEName{#1} \def\@ApprovalERole{#2} \def\@ApprovalEDepartment{#3}}
\def\Appendices#1{\def\@Appendices{#1}}
\def\VitaAuctoris#1{\def\@VitaAuctoris{#1}}

% Default Values
\Author{Author Full Name}
\Title{Thesis Title}
\DefenceYear{Year}
\DefenceMonth{Month}
\DefenceDay{Day}
\PDFKeywords{}

% Class Commands (Internal Use)
\newcommand{\ThesisAuthor}{\@Author}
\newcommand{\ThesisTitle}{\@Title}
\newcommand{\ThesisDefenceYear}{\@DefenceYear}
\newcommand{\ThesisDefenceMonth}{\@DefenceMonth}
\newcommand{\ThesisDefenceDay}{\@DefenceDay}
\newcommand{\ThesisAbstract}{\@Abstract}
\newcommand{\ThesisDedication}{\@Dedication}
\newcommand{\ThesisAcknowledgments}{\@Acknowledgments}
\newcommand{\ThesisPDFKeywords}{\@PDFKeywords}
\newcommand{\ThesisApproval}{ %Note: this could use a loop implementation
        \ifx\@ApprovalAName\undefined\else%
            \rule{0.7\textwidth}{0.4pt}\\\@ApprovalAName
            \ifx\@ApprovalARole\empty\else, \@ApprovalARole\fi
            \\\@ApprovalADepartment\\\vfill
        \fi
        \ifx\@ApprovalBName\undefined\else%
            \rule{0.7\textwidth}{0.4pt}\\\@ApprovalBName
            \ifx\@ApprovalBRole\empty\else, \@ApprovalBRole\fi
            \\\@ApprovalBDepartment\\\vfill
        \fi
        \ifx\@ApprovalCName\undefined\else%
            \rule{0.7\textwidth}{0.4pt}\\\@ApprovalCName
            \ifx\@ApprovalCRole\empty\else, \@ApprovalCRole\fi
            \\\@ApprovalCDepartment\\\vfill
        \fi
        \ifx\@ApprovalDName\undefined\else%
            \rule{0.7\textwidth}{0.4pt}\\\@ApprovalDName
            \ifx\@ApprovalDRole\empty\else, \@ApprovalDRole\fi
            \\\@ApprovalDDepartment\\\vfill
        \fi
        \ifx\@ApprovalEName\undefined\else%
            \rule{0.7\textwidth}{0.4pt}\\\@ApprovalEName
            \ifx\@ApprovalERole\empty\else, \@ApprovalERole\fi
            \\\@ApprovalEDepartment\\\vfill
        \fi
}
\newcommand{\ThesisAppendices}{\@Appendices}
\newcommand{\AppendixSection}[3]{
    \includepdf[pages=1-,pagecommand={\chapter*{Appendix #1: #2}\label{Appendix.#1}
        \addcontentsline{toc}{section}{Appendix #1: #2}}
        ,width=\textwidth,height=0.9\textheight,offset=0.65cm -0.65cm]{#3}
}
\newcommand{\ThesisVitaAuctoris}{\@VitaAuctoris}

% Primary Formatting Changes
\linespread{1.241}  %1.241 for Standard 1.5x Spacing, 1.655 for Double Spacing
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\titlecontents{chapter}[4.8em]{}{\bfseries\contentslabel[\chaptername~\thecontentslabel]{4.8em}}{\bfseries\hspace*{-4.8em}}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{section}[6.1em]{}{\contentslabel{2.3em}}{\hspace*{-2.3em}}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{subsection}[7.6em]{}{\contentslabel{3.05em}}{\hspace*{-3.05em}}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{subsubsection}[9.85em]{}{\contentslabel{3.8em}}{\hspace*{-3.8em}}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{figure}[2.3em]{}{\contentslabel{2.3em}}{\hspace*{-2.3em}}{\titlerule*[1pc]{.}\contentspage}
\titlecontents{table}[2.3em]{}{\contentslabel{2.3em}}{\hspace*{-2.3em}}{\titlerule*[1pc]{.}\contentspage}
\titleformat{\chapter}[hang]{\normalfont\LARGE\bfseries\raggedright}{Chapter~\thechapter:}{0.5em}{\LARGE}[\vspace{1ex}\titlerule]
\titleformat{name=\chapter,numberless}[block]{\centering\normalfont\Large\bfseries}{}{0em}{\Large}
\titleformat{\section}{\normalfont\Large\bfseries\raggedright}{\thesection}{1em}{\Large}
\titleformat{\subsection}{\normalfont\large\bfseries\raggedright}{\thesubsection}{1em}{\large}
\titleformat{\subsubsection}{\normalfont\large\bfseries\raggedright}{\thesubsubsection}{1em}{\large}
\titlespacing{\chapter}{0pt}{0cm}{1cm}
\numberwithin{figure}{chapter}
\captionsetup{labelfont=bf}
\renewcommand*{\contentsname}{Table of Contents}
\renewcommand\bibname{References}

% Compile Glossaries
\makeglossaries

%PDF Metadata
\hypersetup{
	breaklinks=true,
	pdfauthor={\ThesisAuthor{}},
	pdftitle={\ThesisTitle{}},
	pdfsubject={MASc Thesis},
	pdfkeywords={\ThesisPDFKeywords{}},
	pdfcreator={LuaLaTeX}
}

% Front Matter Pages
%--------------------------------------
\newcommand\FrontMatter{
    \cleardoublepage\pagenumbering{roman}

     %Title Page
    \begin{titlepage}
        \begin{large}
            \begin{center}
                \vspace*{0.5cm}
                {\bfseries \LARGE \ThesisTitle}\\
                \vspace{1.5cm}
                {\large by}\\
                \vspace{1.5cm}
                {\large \bfseries\ThesisAuthor}\\
                \vfill
                {A Thesis\\
                Submitted to the Faculty of Graduate Studies\\
                through the Department of Electrical and Computer Engineering\\
                in Partial Fulfillment of the Requirements for\\
                the Degree of Master of Applied Science\\
                at the University of Windsor}\\
                \vspace{2.5cm}
                Windsor, Ontario, Canada\\
                \vspace{1.5cm}
                \ThesisDefenceYear\\
                \vspace{1.5cm}
                {\copyright} \ThesisDefenceYear~{\bfseries \ThesisAuthor}\\
            \end{center}
        \end{large}
    \end{titlepage}

    %Approval Page
    \begin{titlepage}
        \begin{large}
            \begin{center}
                \vspace*{0.5cm}
                {\bfseries \LARGE \ThesisTitle}\\
                \vspace{1cm}
                by\\
                {\ThesisAuthor}\\
                \vspace{1cm}
                APPROVED BY:\\
                \vfill
                \ThesisApproval
                {\hfill \ThesisDefenceMonth~\ThesisDefenceDay, \ThesisDefenceYear}
            \end{center}
        \end{large}
    \end{titlepage}

    %Declaration of Originality
    \chapter*{Declaration of Originality}
    \addcontentsline{toc}{chapter}{Declaration of Originality}
    \setcounter{page}{3}

    I hereby certify that I am the sole author of this thesis and that no part of this thesis has been published or submitted for publication.

    I certify that, to the best of my knowledge, my thesis does not infringe upon anyone’s copyright nor violate any proprietary rights and that any ideas, techniques, quotations, or any other material from the work of other people included in my thesis, published or otherwise, are fully acknowledged in accordance with the standard referencing practices. Furthermore, to the extent that I have included copyrighted material that surpasses the bounds of fair dealing within the meaning of the Canada Copyright Act, I certify that I have obtained a written permission from the copyright owner(s) to include such material(s) in my thesis and have included copies of such copyright clearances to my appendix.

    I declare that this is a true copy of my thesis, including any final revisions, as approved by my thesis committee and the Graduate Studies office, and that this thesis has not been submitted for a higher degree to any other University or Institution.

    \clearpage

    %Abstract
    \ifx\@Abstract\undefined\else
        \chapter*{Abstract}
        \addcontentsline{toc}{chapter}{Abstract}
        \doublespacing{\ThesisAbstract}
        \clearpage %Note: one page maximum
    \fi

    %Dedication
    \ifx\@Dedication\undefined\else
        \chapter*{Dedication}
        \addcontentsline{toc}{chapter}{Dedication}
        \begin{center}
            %\vfill
            \vspace{2cm}
            \ThesisDedication
            \vfill
        \end{center}
        \clearpage
    \fi
    
    %Acknowledgments
    \ifx\@Acknowledgments\undefined\else
        \chapter*{Acknowledgments}
        \addcontentsline{toc}{chapter}{Acknowledgments}
        \ThesisAcknowledgments
        \clearpage
    \fi

    %Table of Contents
    \tableofcontents
    \clearpage

    %List of Tables
    \listoftables
    \addcontentsline{toc}{chapter}{List of Tables}
    \clearpage

    %List of Figures
    \listoffigures
    \addcontentsline{toc}{chapter}{List of Figures}
    \clearpage

    %Glossaries
    \setglossarystyle{longheader}
    \printglossary[type=\acronymtype,title=List of Abbreviations,toctitle=List of Abbreviations,nonumberlist]
    \printglossary[type=symbols,title=List of Symbols,toctitle=List of Symbols,nonumberlist]
    \printglossary[title=Glossary,toctitle=Glossary]
    \clearpage

    %Start Main Matter
    \cleardoublepage\pagenumbering{arabic}
}

% End Matter Pages
%--------------------------------------
\newcommand\EndMatter{

    %Appendices
    \ifx\@Appendices\undefined\else
        \appendix
        \addappheadtotoc
        \chapter*{Appendices}
        \ThesisAppendices{}
        \clearpage
    \fi

    %References
    %\nocite{*} %use with care
    \bibliographystyle{IEEEtran}
    \bibliography{bibliography}
    \addcontentsline{toc}{chapter}{References}
    
    %Vita Auctoris
    \ifx\@VitaAuctoris\undefined\else
        \clearpage
        \chapter*{Vita Auctoris}
        \addcontentsline{toc}{chapter}{Vita Auctoris}
        \ThesisVitaAuctoris
    \fi
}