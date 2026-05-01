" ================================
" Install vim-plug automatically
" ================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ================================
" Plugins
" ================================
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'justinmk/vim-sneak'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ================================
" General Settings
" ================================
set number
set relativenumber
set hlsearch
set ignorecase
set smartcase
set clipboard=unnamedplus
syntax enable

" colorscheme dracula

" ================================
" Plugin Settings
" ================================
let g:highlightedyank_highlight_duration = 200
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'
