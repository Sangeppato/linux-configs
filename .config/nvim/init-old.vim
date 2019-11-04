" INIT.VIM


" --------------------------------------------GENERAL ---------------------------------------------

syntax on
set mouse=a
set nu
set autoindent
set cursorline
set hidden
set listchars=tab:\|\ 
"set showtabline=2    "Always show the Tabline

" TABS --------------------------------------------------------------------------------------------
set tabstop=4
set shiftwidth=4
"set softtabstop=4


" SHURTCUTS ---------------------------------------------------------------------------------------
noremap SS :w<CR>
noremap QQ :q!<CR>
map <C-l> :set relativenumber!<CR>
map <C-o> :NERDTreeToggle<CR>

" Switch tabs
map <C-s> gt
map <C-a> gT

"Find and replace
noremap <C-x> cgn

map <F2>  :set list!<CR>
map <F3>  :ALEToggle<CR>
map <F4>  :call CodeMode()<CR>
"map <F5>  :IndentGuidesToggle<CR>

" Folding ----------------------------------------
setlocal foldmethod=syntax
set foldlevel=99
noremap <space> za


" FILETYPE ----------------------------------------------------------------------------------------
" credit for auto-closing: https://stackoverflow.com/a/34992101
" (Use <ctrl+v> in Insert mode to avoid the automatic character)

autocmd FileType vim call VimMode()
autocmd FileType sh,c,cpp,python,java,go,xml,css,javascript,json call CodeMode()
autocmd FileType markdown call MdMode()

function! VimMode()
	set signcolumn=yes
	set list
	AcpEnable
endfunction

function! CodeMode()
	set signcolumn=yes
	set list
	call AutoClose()
	AcpEnable
endfunction 

function! MdMode()
	call AutoClose()
endfunction 

" Automatically appen closing characters for   (,[,{,<,',",`
" credit: http://vim.wikia.com/wiki/Automatically_append_closing_characters
function! AutoClose() 
	inoremap        (  ()<Left>
	inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
	
	inoremap        [  []<Left>
	inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
	
	inoremap        {  {}<Left>
	inoremap        {<CR>  {<CR>}<Esc>O
	inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
	
	inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
	inoremap <expr> ` strpart(getline('.'), col('.')-1, 1) == "\`" ? "\<Right>" : "\`\`\<Left>"
	inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
endfunction


" AUTOCOMPLETITION --------------------------------------------------------------------------------
set completeopt=longest,menuone
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:acp_enableAtStartup = 0



" ---------------------------------------- PLUGINS ------------------------------------------------

" VIM-PLUG ----------------------------------------------------------------------------------------
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" Make sure setu use single quotes
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'ervandew/supertab'
Plug 'exvim/ex-autocomplpop'
Plug 'w0rp/ale'
" Initialize plugin system
call plug#end()


" GRUVBOX -----------------------------------------------------------------------------------------
colorscheme gruvbox
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark = 'hard'


" LIGHTLINE ---------------------------------------------------------------------------------------
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'


" ALE ---------------------------------------------------------------------------------------------
"let g:ale_sign_error = '●'
"let g:ale_sign_warning = '-'
"highlight clear ALEErrorSign
"highlight clear ALEWarningSign


" NerdTree -----------------------------------------------------------------------------------------
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
