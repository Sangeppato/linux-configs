filetype on
syntax on
set number
set ruler
set autoindent
set smartindent
set mouse=a
colorscheme desert

" --- Tab ---
set tabstop=4
set shiftwidth=4

" --- Fold ---
set foldmethod=syntax
set foldlevel=99

" --- Key bindings ---
let mapleader=","
nnoremap H gT
nnoremap L gt
nnoremap <leader>l :set relativenumber!<CR>
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <silent> <leader><Space> @=(foldlevel('.')?'zA':"\<Space>")<CR>

" --- Status Line ---
set laststatus=2
set statusline=
set statusline+=\ %F
set statusline+=\ %r%m
set statusline+=%=
set statusline+=%y
set statusline+=%4p%%
set statusline+=%4l,%c\ 
