set nocompatible

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
call plug#end()

syntax on
filetype indent plugin on

set number

set tabstop=4
set shiftwidth=4

autocmd BufNewFile,BufRead *.fish setf sh
