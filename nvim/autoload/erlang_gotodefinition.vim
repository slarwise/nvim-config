" For this function to work, all modules that are searched for must be
" reachable through &path, and `suffixesadd` must be set correctly, i.e.
" `.erl` and `.hrl` are added.
function erlang_gotodefinition#ErlangGotodefinition() abort
    let function_name = expand('<cword>')
    " Get the context around the function name
    let context = expand('<cWORD>')
    let symbol_before_function_name = context[match(context, function_name)-1]
    let function_is_from_another_module = symbol_before_function_name ==# ':'
    if function_is_from_another_module
        let module_name = matchstr(context, '\w*\ze:'.function_name)
        execute 'find ' . module_name
        let search_result = search('^' . function_name . '(', 'cw')
        if search_result ==# 0
            echohl WarningMsg
            echo 'ErlangGotodefintion: did not find function `'.
                        \function_name.'` in module `'.module_name.'`'
            echohl None
            execute "normal \<C-O>"
        endif
    else
        mark '
        call search('^'.function_name.'(', 'cw')
    endif
endfunction
