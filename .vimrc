
"Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles:
"A git wrapper so awesome, it should be illegal
NeoBundle 'tpope/vim-fugitive'

"A tree explorer plugin for vim.
NeoBundle 'scrooloose/nerdtree'

"A light and configurable statusline for vim.
NeoBundle 'itchyny/lightline.vim'

"Fuzzy file, buffer, mru, tag, finder.
NeoBundle 'kien/ctrlp.vim'

"Orgasmic comment
NeoBundle 'tomtom/tcomment_vim'

"Highlights trailing whitespace
NeoBundle 'bronson/vim-trailing-whitespace'

"wisely add end in ruby
NeoBundle 'tpope/vim-endwise'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"tmp customization
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set clipboard=unnamed

set title
set number
set ruler
syntax on

highlight LineNr ctermfg=darkyellow
set laststatus=2

