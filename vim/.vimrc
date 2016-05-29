set nocompatible

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')
call plug#end()

set number
set tabstop=4
set shiftwidth=4
colorscheme desert
syntax on
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
