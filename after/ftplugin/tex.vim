" Allows pressing K on a package to open its corresponding doc pdf
" Equivalent to writing texdoc <packagename> on the command line
setlocal keywordprg=texdoc

" Don't force new lines using textwidth
setlocal formatoptions-=tc

" Find files in include/ from cwd
setlocal path+=include/**

" Mappings
nnoremap <buffer> j gj
nnoremap <buffer> k gk

" Abbreviations
inoreabbrev ref \ref{}<left>
