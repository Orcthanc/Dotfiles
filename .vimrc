set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
	" Vimtex
	Plug 'lervag/vimtex'

	" NCM2 Neovim Completion Manager2
	Plug 'ncm2/ncm2'
	Plug 'roxma/nvim-yarp'

	" LanguageServers
		" Client
		Plug 'autozimu/LanguageClient-neovim', {
    		\ 'branch': 'next',
    		\ 'do': 'bash install.sh',
    		\ }

		" Bufword (Suggest next word)
		Plug 'ncm2/ncm2-bufword'

		" Path
		Plug 'ncm2/ncm2-path'

		" Github
		Plug 'ncm2/ncm2-github'

		" CSS
		Plug 'ncm2/ncm2-cssomni'

		" Python
		Plug 'ncm2/ncm2-jedi'

		" C/C++
		Plug 'ncm2/ncm2-pyclang'

		" Sippet completion
		Plug 'ncm2/ncm2-ultisnips'
		Plug 'SirVer/ultisnips'

	
	" ALE
	Plug 'https://github.com/w0rp/ale.git'

	" Airline (statusbar)
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Git
	Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()

" NCM2
set completeopt=noinsert,menuone,noselect

" Make NCM2 faster
let ncm2#popup_delay = 5

" Trigger 
augroup autocomplete_triggers
	autocmd BufEnter * call ncm2#enable_for_buffer()
	autocmd TextChangedI * call ncm2#auto_trigger()
augroup END

" Map autocomplete to Tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" C/C++ Language Server
let g:ncm2_pyclang#library_path = '/usr/lib/libclang.so.6.0'
let g:ncm2_pyclang#database_path = [
	\ 'compile_commands.json',
	\ 'build/compile_commands.json',
	\ '../build/compile_commands.json'
	\ ]

let g:ale_linters={
	  \ 'c'  : ['clang', 'clangd', 'cppcheck', 'cquery', 'flawfinder', 'gcc'],
      \ 'cpp': [ 'clang', 'cppcheck', 'cpplint', 'gcc' ]
      \ }

let g:ale_echo_msg_format = '%linter% says %s'

" Vimtex compiler options
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'arara'
let g:ncm2_look_enabled = 1

"Make airline pretty
let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1

" Make ale pretty
let g:airline#extensions#ale#enabled = 1

" Mess with the vim compatability options to make sure Netrw runs
version 6.0
if &cp | set nocp | endif
map Q gq
let s:cpo_save=&cpo
set cpo&vim

" Open file with gx
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())

" Unmess the vim compatability options
let &cpo = s:cpo_save
" Clean up temp variable
unlet s:cpo_save

syntax on
colorscheme eldar
set background=dark
set backspace=indent,eol,start
set display=truncate
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=200
set incsearch
set langnoremap
set nolangremap
set mouse=a
set nrformats=bin,hex
set ruler
set scrolloff=5
set showcmd
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg
set tabstop=4
set shiftwidth=4
set ttimeout
set ttimeoutlen=100
set visualbell
set wildmenu
