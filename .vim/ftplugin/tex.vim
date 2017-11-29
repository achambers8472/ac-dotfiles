"setlocal grepprg=grep\ -nH\ $*
"setlocal iskeyword+=:
"
" Activate spell-checking
setlocal spell spelllang=en_au

" Maximum text-width is 80 characters, line broken by a space otherwise
setlocal textwidth=78
if exists('&colorcolumn')
	set colorcolumn=79
else
	2mat ErrorMsg '\%79v.'
endif

setlocal shiftwidth=2
autocmd BufWritePre <buffer> :%s/\s\+$//e
nnoremap <F5> :!make<CR>

match ErrorMsg /sn order to/
match ErrorMsg /\\mathrm{d}/
match ErrorMsg /\\braopket/
match ErrorMsg /of the form/
match ErrorMsg /plot of/
match ErrorMsg /\\lambda/
match ErrorMsg /\\pdv/
match ErrorMsg /\\notag/
match ErrorMsg /_E/
match ErrorMsg /\\dd\[4\]/
