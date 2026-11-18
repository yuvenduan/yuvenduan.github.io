\ProvidesClass{clean_cv}[2026/11/17 v1.1.0 'CleanCV' Class]

% Options: [resume] switches to the industry-resume layout (title/date lines instead of a date column).
\newif\if@resume \@resumefalse
\DeclareOption{resume}{\@resumetrue}
\ProcessOptions\relax

\LoadClass[11pt]{article}
\RequirePackage[margin=0.65in,top=0.55in,bottom=0.55in]{geometry}

\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{xcolor}
\RequirePackage{enumitem}

% Fonts
\RequirePackage[fixed]{fontawesome5}
\RequirePackage[scaled=.96]{XCharter}
\linespread{1.04}

% Make the PDF text layer clean so applicant-tracking systems (ATS) can parse it
\input{glyphtounicode}
\pdfgentounicode=1

\RequirePackage[hidelinks]{hyperref}

\definecolor{dateline}{gray}{0.5}
\definecolor{datecolor}{gray}{0.4}
\definecolor{linkcolor}{RGB}{0,51,102}

% ---------------------------------------------------------------------------
% Academic layout: a right-aligned date column on the left. Implemented as a
% list (not a tabular) so long entries can break across pages.
%   \begin{datetabular}{<date column width>} \dateentry{dates}{content} ... \end{datetabular}
\newlength{\@datecolwidth}
\newenvironment{datetabular}[1]{%
  \setlength{\@datecolwidth}{#1}%
  \begin{list}{}{%
    \setlength{\labelwidth}{#1}%
    \setlength{\labelsep}{1em}%
    \setlength{\leftmargin}{\dimexpr #1 + 1em\relax}%
    \setlength{\itemsep}{0.45em}%
    \setlength{\topsep}{0pt}\setlength{\parsep}{0pt}%
    \renewcommand{\makelabel}[1]{\parbox[t]{\@datecolwidth}{\raggedleft\leavevmode\color{datecolor}##1}}}%
}{\end{list}}
\newcommand{\dateentry}[2]{\item[#1] #2}
\newcommand{\eatvspace}{}

% ---------------------------------------------------------------------------
% Resume layout: title + date on one line, subtitle + location on the next.
%   \entry{Title}{Dates}{Subtitle}{Location}  followed by an itemize (optional)
\newcommand{\entry}[4]{%
  \par\noindent\textbf{#1}\hfill{\color{datecolor}#2}%
  \ifx\relax#3\relax\else\\\textit{#3}\hfill{\color{datecolor}\itshape #4}\fi\par}
% Bulleted list used under entries
\newlist{bullets}{itemize}{1}
\setlist[bullets]{label=\textbullet, leftmargin=1.2em, itemsep=1pt, topsep=1pt, parsep=0pt, after=\vspace{3pt}}

% Numbered publication list
\newlist{publist}{enumerate}{1}
\setlist[publist]{label={[\arabic*]}, leftmargin=2em, itemsep=3pt, topsep=2pt, parsep=0pt}
% \pub{url}{title}{authors}{venue}
\newcommand{\pub}[4]{\item \ifx\relax#1\relax\textbf{#2}\else\href{#1}{\textbf{#2}}\fi. #3. \textit{#4}.}
% Compact one-line form for resumes: \cpub{url}{title}{short authors}{venue}
\newcommand{\cpub}[4]{\item \ifx\relax#1\relax#2\else\href{#1}{#2}\fi. #3 \textit{#4}.}

\newcommand{\faCenter}[1]{\raisebox{-1pt}{\faIcon{#1}}}

% Section headings
\titleformat{\section}[block]{\large\bfseries}{}{0pt}{}[\vspace{-7pt}\rule{\linewidth}{0.8pt}]
\if@resume
  \titlespacing*{\section}{0pt}{0.5em}{0.3em}
\else
  \titlespacing*{\section}{0pt}{0.9em}{0.45em}
\fi
\titleformat{\subsection}[runin]{\normalsize\bfseries\itshape}{}{0pt}{}
\titlespacing*{\subsection}{0pt}{0.4em}{0.6em}

\setlength\parindent{0pt}
\setlength\parskip{0pt}
\setlist{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}

\let\@author\@empty
\renewcommand{\maketitle}{%
\begin{center}
    {\Huge \@author}
\end{center}%
\vspace{-6pt}
}

\pagestyle{empty}
