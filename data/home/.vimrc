set number
set showcmd
set incsearch
set expandtab
set showcmd
set history=400
set autoread
set ffs=unix,mac,dos
set hlsearch
set shiftwidth=2
set wrap
set ai
set si
set cindent
set tabstop=2
set nocompatible
set showmatch
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set ttyfast
syntax on
set imcmdline
set previewwindow
set showfulltag
set cursorline
set ruler
color ron
autocmd InsertEnter * se cul
set ruler
set showcmd
set laststatus=2
set tabstop=2
set softtabstop=4
inoremap fff <esc>h
autocmd BufWritePost $MYVIMRC source $MYVIMRCi
