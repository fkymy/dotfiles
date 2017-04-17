" Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Be iMproved
if &compatible
  set nocompatible
endif

filetype off

""""""""""""""""""""""""""""""
" NeoBundle
""""""""""""""""""""""""""""""
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

"One colorscheme pack to rule them all.
NeoBundle 'flazz/vim-colorschemes'

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

"Auto pairing
NeoBundle 'jiangmiao/auto-pairs'

"wisely add end in ruby
NeoBundle 'tpope/vim-endwise'

"rails.vim
NeoBundle 'tpope/vim-rails'

"Railscast colorscheme
"NeoBundle 'jpo/vim-railscasts-theme'

"Base16 colors
"NeoBundle 'chriskempson/base16-vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" tmp customization
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set clipboard=unnamed

set showcmd
set incsearch
set noeb vb t_vb=

set title
set number
set ruler

""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""
syntax on
colorscheme tomorrow-night
"autocmd FileType ruby colorscheme badwolf

highlight LineNr ctermfg=grey

set laststatus=2


" http://inari.hatenablog.com/entry/2014/05/05/231307
""""""""""""""""""""""""""""""
" Zenkaku
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""

filetype on

