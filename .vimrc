" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

"inoremap jj <Esc> 
fixdel

"set length of a tab
set tabstop=6

"set the shift width
set shiftwidth=6

"automatic indent
set autoindent

"automatic indent
set noexpandtab

"enable syntax highlighting"
syntax on

"disable ex mode"
map Q <Nop>

"colorscheme
colorscheme default

"show the indentation line (note: there is a space in the end)
set list lcs=tab:\|\ 

"show the line numbers
set number 

"show relative number instead of absolute linenumber
set relativenumber

"disable the swapfiles
set noswapfile 
set nocompatible

"highlight the search results
set hlsearch

"auto complete the parenthesises
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
