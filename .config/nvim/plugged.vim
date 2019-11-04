" === VIM-PLUG ===  

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" Make sure setu use single quotes
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}    "Binary
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Initialize plugin system
call plug#end()
