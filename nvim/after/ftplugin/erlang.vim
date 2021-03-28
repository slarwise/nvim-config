setlocal formatprg=erlfmt\ -

let g:ErlangGotoDefinitionFindfile = function('Projectfiles#GetFirstPath')
nmap <buffer><silent> [d <Plug>ErlangGotoDefinitionFloat
