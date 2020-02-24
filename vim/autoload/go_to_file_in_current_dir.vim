function! go_to_file_in_current_dir#go_to(direction)
    if !len(expand('%'))
        return
    endif
    let l:files = expand(expand('%:p:h') . '/*', 1, 1)
    let l:dot_files = expand(expand('%:p:h') . '/.*', 1, 1)
    let l:files += l:dot_files
    call filter(l:files, {_, val -> !isdirectory(val)})
    call sort(l:files)
    if a:direction ==# 'first'
        silent execute 'edit ' . l:files[0]
        return
    elseif a:direction ==# 'last'
        silent execute 'edit ' . l:files[-1]
        return
    endif
    let l:current_index = index(l:files, expand('%:p'))
    if a:direction ==# 'previous' && l:current_index > 0
        silent execute 'edit ' . l:files[current_index - 1]
    elseif a:direction ==# 'next' && l:current_index < len(l:files)-1
        silent execute 'edit ' . l:files[current_index + 1]
    endif
endfunction
