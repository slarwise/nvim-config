" Allows pressing K on a package to open its corresponding doc pdf
" Equivalent to writing texdoc <packagename> on the command line
setlocal keywordprg=texdoc

setlocal formatoptions-=tc

" Mappings
nnoremap <buffer> j gj
nnoremap <buffer> k gk
