if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    autocmd! BufRead,BufNewFile Tiltfile setfiletype python
    autocmd! BufRead,BufNewFile *.tf setfiletype terraform
augroup END
