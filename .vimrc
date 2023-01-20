" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

"colorscheme
colorscheme default

"inoremap jj <Esc> 
fixdel
set tabstop=6
set shiftwidth=6
set autoindent
set noexpandtab
syntax on
"set clipboard+=unnamedplus

"disable ex mode"
map Q <Nop>

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

"jump between the guides
"noremap <Space><Space> <Esc>/<++><Enter>"_c4l
"vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"map <Space><Space> <Esc>/<++><Enter>"_c4l

"====== Latex ======"

"au BufWritePost *.tex make


" Compile document
	"map <leader>c :w! \| !compiler <c-r>%<CR><CR>

"autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i

"====== END ========"
