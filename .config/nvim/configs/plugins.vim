" === PLUGINS ===

" --- Gruvbox ---
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
set background=dark    "Setting dark mode
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox

" --- Lightline ---
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
		\ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
	\ },
	\ }

" --- NerdTree ---
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" --- Coc ---

autocmd FileType json syntax match Comment +\/\/.\+$+

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
