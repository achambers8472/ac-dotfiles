set nocompatible

" Plugins {{{
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'beloglazov/vim-online-thesaurus'
"Plug 'bling/vim-bufferline'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
"Plug 'Lokaltog/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
"Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
"Plug 'LaTeX-Box-Team/LaTeX-Box'
"Plug 'valloric/youcompleteme'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-latex/vim-latex'
call plug#end()
" }}}


" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}
" vim-colors-solarized {{{
set background=light
colorscheme solarized
" }}}
" vim-gitgutter {{{
set updatetime=250
if exists('&signcolumn')  " Vim 7.4.2201
	set signcolumn=yes
else
	let g:gitgutter_sign_column_always = 1
endif
" }}}
" vim-easymotion setup {{{
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
" }}}
" ultisnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
" }}}
" vim-airline {{{
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0
" }}}
" vim-latex {{{
"let g:Tex_BIBINPUTS=expand('~/git/tex')
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_ViewRule_pdf='evince'
"let g:Imap_UsePlaceHolders=0
"let g:Tex_Leader2='\'
" }}}
" vimtex {{{
let g:vimtex_fold_enabled = 1
" }}}
" nerdcommenter setup {{{
let g:NERDCreateDefaultMappings = 0
" }}}

" Leader keys {{{
let mapleader = ","
let maplocalleader = "\\"
" }}}

" Global options {{{
"set noexpandtab   " Inserted tabs are ACTUALLY tabs
"set tabstop=4     " Existings tabs are shown to be 4 columns wide
"set softtabstop=4 " Tabs I put in are made of tabs
"set shiftround    " Using > and < to shift indent always rounds to a multiple of 4
"set shiftwidth=4
"

let g:tex_flavor='latex'

set timeoutlen=500
set showcmd
set wildmode=list:longest
set scrolloff=10 " Show at least 10 lines above and below cursor
set foldlevelstart=0
" Search Options
set hlsearch
set ignorecase
set smartcase
" Tab options
set wrap
set number
set numberwidth=4
set linebreak
set hidden
" Display options
if exists('&colorcolumn')
	set colorcolumn=81
else
	2mat ErrorMsg '\%81v.'
endif
set viewoptions=folds,cursor
set undofile
"}}}

" GUI options {{{
if has('gui_running')
	set guioptions=a
	set guifont=Inconsolata\ Medium\ 16
	set guiheadroom=0
endif
" highlight Search cterm=NONE ctermfg=white ctermbg=black
" }}}

" Insert mode mappings {{{
inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>
" }}}
" Normal/Visual/Operator-Pending mappings {{{
noremap H 0
noremap L $
map <space> <Plug>(easymotion-s)
" }}}
" Normal mode mappings {{{
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
nnoremap <enter> o<esc>k
nnoremap <s-enter> O<esc>j
nnoremap <tab> :bnext!<enter>
nnoremap <s-tab> :bprevious!<enter>
nnoremap qq @w
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>c <plug>NERDCommenterToggle

nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gh :Gpush<cr>
nnoremap <leader>gl :Gpull<cr>

nnoremap <leader>w :write<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>q :quit<cr>

nnoremap <leader>bd :bdelete
" }}}
" Visual mode mappings {{{
vnoremap <leader>ev :vsplit $MYVIMRC<cr>
vnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <tab> :bnext<enter>
vmap <leader>n :NERDTreeToggle<cr>
vmap <leader>c <plug>NERDCommenterToggle
" }}}
" Operator-pending mappings {{{
" }}}
" Training mappings {{{
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <esc> <nop>
" }}}

" Autocommands {{{
function! TrimWhitespace()
	let old_cursor_position = getpos('.')
	:%s/\s\+$//e
	:silent! %s#\($\n\s*\)\+\%$##
	call setpos('.',old_cursor_position)
endfunction

augroup global
	autocmd!
	autocmd BufWrite * :filetype detect
	autocmd BufWritePre * call TrimWhitespace()
	autocmd BufEnter * silent! lcd %:p:h
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
augroup END
"  }}}

" Abbreviations {{{
iabbrev @@ alexander.chambers@adelaide.edu.au
" }}}