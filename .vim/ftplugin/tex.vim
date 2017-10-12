"setlocal grepprg=grep\ -nH\ $*
"setlocal iskeyword+=:
"
" Activate spell-checking
setlocal spell spelllang=en_au

" Maximum text-width is 80 characters, line broken by a space otherwise
setlocal textwidth=79
if exists('&colorcolumn')
	set colorcolumn=80
else
	2mat ErrorMsg '\%80v.'
endif

setlocal shiftwidth=2
autocmd BufWritePre <buffer> :%s/\s\+$//e
nnoremap <F5> :!make<CR>
