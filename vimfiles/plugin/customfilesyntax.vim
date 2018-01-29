augroup filetypedetect
  	au BufRead,BufNewFile *.audit	set syntax=config
  	au BufRead,BufNewFile *.audit	set wrap!
"	au BufRead,BufNewFile *.audit set filetype=config
augroup END

