"Corbin McNeill
"corbin.mc96@gmail.com

"Vundle
set nocompatible
filetype off
try
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'airblade/vim-gitgutter'
	Plugin 'gmarik/Vundle.vim'
	"Plugin 'lervag/vimtex'
	Plugin 'octol/vim-cpp-enhanced-highlight'
	Plugin 'scrooloose/nerdtree'
	Plugin 'sjl/gundo.vim'
	Plugin 'tclem/vim-arduino'
	Plugin 'tpope/vim-fugitive'
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'xolox/vim-misc'
	call vundle#end()
catch
endtry
filetype plugin indent on

"filetypes
autocmd BufRead,BufNewFile *.ino,*.pde set filetype=c

"appearence
syntax enable
set number
set relativenumber
set background=dark
set cursorline
set term=xterm-256color
set showmatch
try
	colorscheme Tomorrow-Night
catch
	hi CursorLine cterm=NONE ctermbg=darkblue guibg=darkred
endtry

"white character display
"set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸▸
"set list

let g:airline_powerline_fonts = 1
set noshowmode

"indenting
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set preserveindent
set copyindent

"searching
set hlsearch
set ignorecase
set smartcase
set incsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"gundo
try
	let g:gundo_width = 35
	let g:gundo_preview_height = 20
	let g:gundo_close_on_revert = 1
	nnoremap <F5> :GundoToggle<CR>
catch
endtry

"ctags manipulation
set tags=.tags;,./.tags;,tags;,./tags;
let g:easytags_dynamic_file = 2
let g:easytags_suppress_report = 1
let g:easytags_events = ['BufWritePost']

"persistent undo
set undofile
set undodir=~/.vim/undo_history/
set history=1000
set undolevels=1000

"Java commenting
set formatoptions+=r
set formatoptions+=c
set formatoptions+=o

"NERDTree
map <F3> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"swap files
set swapfile

"easier page switching
let g:BASH_Ctrl_h='off'
let g:BASH_Ctrl_j='off'
let g:BASH_Ctrl_k='off'
let g:BASH_Ctrl_l='off'
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-\> <C-w><bar>
nnoremap <C-_> <C-w>_
nnoremap <C-=> <C-w> =

"switch between number and relative number with <C-a>
function! NumberToggle()
	if(&relativenumber == 1)
		set relativenumber!
		set number
	else
		set relativenumber
	endif
endfunc
nnoremap <C-a> :call NumberToggle()<cr>

"tex
nnoremap <F6> :w<CR>:!pdflatex %<CR>

"other
set hidden
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
set pastetoggle=<F2>
"nnoremap ; :

set exrc
set secure

"temporary
imap jk <ESC>


"highlight lines longer than 80 chars
"autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
