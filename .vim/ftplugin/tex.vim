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

" call matchadd('WarningMsg', '\cin\_s*order\_s*to')
" call matchadd('WarningMsg', '\cof\_s*the\_s*form')
" call matchadd('WarningMsg', '\cthe\_s*\S*ion\_s*of')
" call matchadd('WarningMsg', '\cerror')
" call matchadd('WarningMsg', '\c[^\\][^c]ref{')
call matchadd('ErrorMsg', '\\mathrm{d}')
call matchadd('ErrorMsg', '\\braopket')
call matchadd('ErrorMsg', '\\lambda')
call matchadd('ErrorMsg', '\\pdv')
call matchadd('ErrorMsg', '\\notag')
call matchadd('ErrorMsg', '_E')
call matchadd('ErrorMsg', '\\minkowski')
call matchadd('ErrorMsg', '\\fermionmatrix')
" call matchadd('ErrorMsg', '\c[^\\]excited\_s*state')
" call matchadd('ErrorMsg', '\c[^\\]excited-state')
" call matchadd('ErrorMsg', '\c[^\\]lattice')
" call matchadd('ErrorMsg', '\(\\eqcomma\)\@<!\n\\end{align}\&\(\\eqstop\)\@<!\n\\end{align}')
" call matchadd('ErrorMsg', '\(\\eqcomma\)\@<!\n\\end{split}\&\(\\eqstop\)\@<!\n\\end{split}')
