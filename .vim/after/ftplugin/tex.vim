" Allows pressing K on a package to open its corresponding doc pdf
" Equivalent to writing texdoc <packagename> on the command line
setlocal keywordprg=texdoc

" Mappings
" /----------------------------------------------------------------------------\
" Insert mode mappings

" Math mode
inoremap <buffer> ;mat $$<left>

" \<name>{}
inoremap <buffer> ;sec \section{}<left>
inoremap <buffer> ;ssec \subsection{}<left>
inoremap <buffer> ;sssec \subsubsection{}<left>
inoremap <buffer> ;use \usepackage[]{}<left>

" \begin{<name>} ... \end{<name>}
inoremap <buffer> ;equ \begin{equation}<CR>\end{equation}<ESC>O
inoremap <buffer> ;ite \begin{itemize}<CR>\end{itemize}<ESC>O\item 
inoremap <buffer> ;doc \begin{document}<CR>\end{document}<ESC>O
inoremap <buffer> ;enu \begin{enumerate}<CR>\end{enumerate}<ESC>O\item 

" Longer environments
inoremap <buffer> ;fig \begin{figure}[H]<CR>
            \\centering<CR>
            \\includegraphics[]{}<CR>
            \\caption{}<CR>
            \\label{}<CR>
            \\end{figure}
            \<ESC>3k$ci}
inoremap <buffer> ;tit \title{}<CR>
            \\author{Arvid Bjurklint}<CR>
            \\date{\today}<CR>
            \\maketitle
            \<ESC>3kci}

" Normal mode mappings
nnoremap <LOCALLEADER>r :!clear && latexmk -pdf --shell-escape %<CR>
" \----------------------------------------------------------------------------/
