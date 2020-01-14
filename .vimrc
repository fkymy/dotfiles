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

"Chocolate Liquor
NeoBundle 'ChocolateLiquor'

"Gruvbox
NeoBundle 'morhetz/gruvbox'

"A tree explorer plugin for vim.
NeoBundle 'scrooloose/nerdtree'

"A light and configurable statusline for vim.
NeoBundle 'itchyny/lightline.vim'

"Fuzzy file, buffer, mru, tag, finder.
NeoBundle 'kien/ctrlp.vim'

"Orgasmic comment.
NeoBundle 'tomtom/tcomment_vim'

"Text filtering and alignment
NeoBundle 'godlygeek/tabular'

"Highlights trailing whitespace.
NeoBundle 'bronson/vim-trailing-whitespace'

"Auto pairing.
NeoBundle 'jiangmiao/auto-pairs'

"Auto complete html.
NeoBundle 'othree/html5.vim'

"Javascript indentation and syntax support.
NeoBundle 'pangloss/vim-javascript'

"JSX syntax highlighting and indenting
NeoBundle 'mxw/vim-jsx'

"ES6 syntax highlighting
NeoBundle 'isruslan/vim-es6'

"Markdown vim mode.
NeoBundle 'plasticboy/vim-markdown'

"Realtime preview by vim.
NeoBundle 'kannokanno/previm'

"Open URI
NeoBundle 'tyru/open-browser.vim'

"Python mode
NeoBundle 'klen/python-mode'

"Python PEP8 indentation
NeoBundle 'Vimjas/vim-python-pep8-indent'

"wisely add end in ruby
"NeoBundle 'tpope/vim-endwise'

"rails.vim
"NeoBundle 'tpope/vim-rails'

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

""""""""""""""""""""""""""""""
" Temporary Customization
""""""""""""""""""""""""""""""

"disable annoying beeps
set noeb vb t_vb=

"allow mouse usage in terminal
set mouse=a
"use OS clipboard
set clipboard+=unnamed
"system clipboard when yanked
set clipboard=unnamed
"Ctrl+k to copy what's on clipboard
imap <C-p>  <ESC>"*pa

"show command in status line
set showcmd
"show unseen words
set list
"display where tabs and lines go
set listchars=tab:>\ ,extends:<

"incremental search
set incsearch
"highlight search
set hlsearch
"ignore case
set ignorecase

"show filepath on window titlebar
set title
"display line number
set number
"locate cursor
set ruler

"for vim.lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return expand('%')
endfunction

set laststatus=2

"for html
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"terminal emulator default
set sh=zsh
tnoremap <silent> <ESC> <C-\><C-n>

""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""
syntax on

"gruxbox settings
"set termguicolors
"let g:gruvbox_italic=1
"let g:gruvbox_termcolors=16
colorscheme gruvbox
"autocmd FileType ruby colorscheme badwolf
highlight LineNr ctermfg=grey

""""""""""""""""""""""""""""""
" Indents
""""""""""""""""""""""""""""""

"default tab to 2 spaces
set tabstop=2
"default indent width
set shiftwidth=2
"tabs become multiple spaces
set expandtab
"continue previous tab when going to next line
set autoindent
"adjust indents when going to next line
"set smartindent

"credits: https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.indent
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType c          setlocal sw=4 sts=4 ts=4
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType jsx        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go         setlocal noexpandtab list tabstop=2 shiftwidth=2
endif

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

"for markdown
au BufRead,BufNewFile *.md set filetype=markdown

filetype on
