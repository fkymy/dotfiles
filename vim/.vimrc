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
"Gruvbox
NeoBundle 'morhetz/gruvbox'
"NeoBundle 'sainnhe/gruvbox-material'

"A light and configurable statusline for vim.
NeoBundle 'itchyny/lightline.vim'

"A tree explorer plugin for vim.
NeoBundle 'scrooloose/nerdtree'

"Icons for nerdtree
NeoBundle 'ryanoasis/vim-devicons'

"Syntax highlighting for nerdtree
"NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'

"A git wrapper so awesome, it should be illegal
NeoBundle 'tpope/vim-fugitive'

"Syntax checking for vim
NeoBundle 'scrooloose/syntastic'

"Completion
NeoBundle 'neoclide/coc.nvim'

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

"One colorscheme pack to rule them all.
"NeoBundle 'flazz/vim-colorschemes'

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

"show list chars
set list
set listchars=tab:>\ ,extends:<
set listchars+=space:.

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
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead',
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
set termguicolors
let g:gruvbox_italic=1
"let g:gruvbox_termcolors=16
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_hls_cursor="orange"
let g:gruvbox_number_column="bg1"
let g:gruvbox_improved_strings=1
let g:gruvbox_vert_split="bg0"
colorscheme gruvbox

"autocmd FileType ruby colorscheme badwolf
"highlight LineNr ctermfg=grey

""""""""""""""""""""""""""""""
" Indents
""""""""""""""""""""""""""""""
"indent-guide
let g:indent_guides_enable_on_vim_startup = 1

"default tab to 2 spaces
set tabstop=4
"default indent width
set shiftwidth=4
"tabs become multiple spaces
"set expandtab
"continue previous tab when going to next line
set autoindent
"adjust indents when going to next line
"set smartindent
set noexpandtab

"credits: https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.indent
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType c          setlocal sw=4
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

"jsx
let g:jsx_ext_required = 0
"let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1

""""""""""""""""""""""""""""""
" Zenkaku
""""""""""""""""""""""""""""""
" http://inari.hatenablog.com/entry/2014/05/05/231307
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

""""""""""""""""""""""""""""""
" 42
""""""""""""""""""""""""""""""
let s:asciiart = [
			\"        :::      ::::::::",
			\"      :+:      :+:    :+:",
			\"    +:+ +:+         +:+  ",
			\"  +#+  +:+       +#+     ",
			\"+#+#+#+#+#+   +#+        ",
			\"     #+#    #+#          ",
			\"    ###   ########.fr    "
			\]

let s:start		= '/*'
let s:end		= '*/'
let s:fill		= '*'
let s:length	= 80
let s:margin	= 5

let s:types		= {
			\'\.c$\|\.h$\|\.cc$\|\.hh$\|\.cpp$\|\.hpp$\|\.php':
			\['/*', '*/', '*'],
			\'\.htm$\|\.html$\|\.xml$':
			\['<!--', '-->', '*'],
			\'\.js$':
			\['//', '//', '*'],
			\'\.tex$':
			\['%', '%', '*'],
			\'\.ml$\|\.mli$\|\.mll$\|\.mly$':
			\['(*', '*)', '*'],
			\'\.vim$\|\vimrc$':
			\['"', '"', '*'],
			\'\.el$\|\emacs$':
			\[';', ';', '*'],
			\'\.f90$\|\.f95$\|\.f03$\|\.f$\|\.for$':
			\['!', '!', '/']
			\}

function! s:filetype()
	let l:f = s:filename()

	let s:start	= '#'
	let s:end	= '#'
	let s:fill	= '*'

	for type in keys(s:types)
		if l:f =~ type
			let s:start	= s:types[type][0]
			let s:end	= s:types[type][1]
			let s:fill	= s:types[type][2]
		endif
	endfor

endfunction

function! s:ascii(n)
	return s:asciiart[a:n - 3]
endfunction

function! s:textline(left, right)
	let l:left = strpart(a:left, 0, s:length - s:margin * 3 - strlen(a:right) + 1)

	return s:start . repeat(' ', s:margin - strlen(s:start)) . l:left . repeat(' ', s:length - s:margin * 2 - strlen(l:left) - strlen(a:right)) . a:right . repeat(' ', s:margin - strlen(s:end)) . s:end
endfunction

function! s:line(n)
	if a:n == 1 || a:n == 11 " top and bottom line
		return s:start . ' ' . repeat(s:fill, s:length - strlen(s:start) - strlen(s:end) - 2) . ' ' . s:end
	elseif a:n == 2 || a:n == 10 " blank line
		return s:textline('', '')
	elseif a:n == 3 || a:n == 5 || a:n == 7 " empty with ascii
		return s:textline('', s:ascii(a:n))
	elseif a:n == 4 " filename
		return s:textline(s:filename(), s:ascii(a:n))
	elseif a:n == 6 " author
		return s:textline("By: " . s:user() . " <" . s:mail() . ">", s:ascii(a:n))
	elseif a:n == 8 " created
		return s:textline("Created: " . s:date() . " by " . s:user(), s:ascii(a:n))
	elseif a:n == 9 " updated
		return s:textline("Updated: " . s:date() . " by " . s:user(), s:ascii(a:n))
	endif
endfunction

function! s:user()
	let l:user = "yufukuya"
	if strlen(l:user) == 0
		let l:user = "yufukuya"
	endif
	return l:user
endfunction

function! s:mail()
	let l:mail = "marvin@42.fr"
	if strlen(l:mail) == 0
		let l:mail = "marvin@42.fr"
	endif
	return l:mail
endfunction

function! s:filename()
	let l:filename = expand("%:t")
	if strlen(l:filename) == 0
		let l:filename = "< new >"
	endif
	return l:filename
endfunction

function! s:date()
	return strftime("%Y/%m/%d %H:%M:%S")
endfunction

function! s:insert()
	let l:line = 11

	" empty line after header
	call append(0, "")

	" loop over lines
	while l:line > 0
		call append(0, s:line(l:line))
		let l:line = l:line - 1
	endwhile
endfunction

function! s:update()
	call s:filetype()
	if getline(9) =~ s:start . repeat(' ', s:margin - strlen(s:start)) . "Updated: "
		if &mod
			call setline(9, s:line(9))
		endif
		call setline(4, s:line(4))
		return 0
	endif
	return 1
endfunction

function! s:stdheader()
	if s:update()
		call s:insert()
	endif
endfunction

" Bind command and shortcut
command! Stdheader call s:stdheader ()
map <F1> :Stdheader<CR>
autocmd BufWritePre * call s:update ()

""""""""""""""""""""""""""""""
" File Navigation
""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
" let NERDTreeHighlightCursorline = 0
" let g:NERDTreeLimitedSyntax = 1
highlight NERDTreeCWD guifg=#9DD08E ctermfg=white
" highlight NERDTreeClosable guifg=#A8A521 ctermfg=white
" highlight NERDTreeOpenable guifg=#A8A521 ctermfg=white
highlight NERDTreeClosable guifg=#9DD08E ctermfg=white
highlight NERDTreeOpenable guifg=#9DD08E ctermfg=white
"highlight NERDTreeDir guifg=#5BABDC
"highlight NERDTreeDir guifg=#116C8B
highlight NERDTreeDir guifg=#549699
highlight! link NERDTreeFlags NERDTreeDir

""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['shell', 'sh'] }

""""""""""""""""""""""""""""""
" Hot Fixes
""""""""""""""""""""""""""""""
set updatetime=100

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" inoremap jk <ESC>
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

":hi Directory guifg=#FF0000 ctermfg=red
"highlight Directory ctermfg=blue
let s:lightGreen = "689FB6"
"let s:green = "8FAA54"
let s:green = "689FB6"

nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" git-gutter
" highlight SignColumn guifg=#549699
" highlight GitGutterAdd ctermfg=2
" highlight GitGutterChange ctermfg=3
" highlight GitGutterDelete ctermfg=1
" highlight GitGutterChangeDelete ctermfg=4
"let g:gitgutter_override_sign_column_highlight = 0
"highlight clear SignColumn
highlight GitGutterAdd guifg=#549699 guibg=#3C3836
highlight GitGutterChange guifg=#549699 guibg=#3C3836
highlight GitGutterDelete guifg=#549699 guibg=#3C3836
highlight GitGutterChangeDelete guifg=#549699 guibg=#3C3836

