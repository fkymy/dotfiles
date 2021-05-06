""""""""""""""""""""""""""""""
" Basic Configurations
""""""""""""""""""""""""""""""
set number
set title
set list
set listchars=tab:>\ ,extends:<
set listchars+=space:.
set noeb vb t_vb=
set mouse=a
set clipboard=unnamed
set incsearch
set hlsearch
set inccommand=nosplit
set ignorecase
set splitright
set updatetime=100
set sh=zsh

" Temporarily removed
" set ruler
" set showcmd

""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""
call plug#begin('~/dotfiles/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kien/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-trailing-whitespace'

Plug 'mxw/vim-jsx', { 'for': ['jsx', 'js', 'ts'] }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'othree/html5.vim'
" Plug 'godlygeek/tabular'
" Plug 'tpope/vim-fugitive'
" Plug 'scrooloose/syntastic'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
"Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cc', 'cpp'] }
call plug#end()

""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""
let mapleader = ","

nmap // :BLines!<CR>
nmap ?? :Rg!<CR>
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
nnoremap <leader>nt :NERDTreeToggle<cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

""""""""""""""""""""""""""""""
" Statusbar
""""""""""""""""""""""""""""""
set laststatus=2
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

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""
syntax on
set termguicolors
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_hls_cursor="orange"
let g:gruvbox_number_column="bg1"
let g:gruvbox_improved_strings=1
let g:gruvbox_vert_split="bg0"
colorscheme gruvbox

let g:cpp_no_function_highlight = 1

""""""""""""""""""""""""""""""
" Indents
""""""""""""""""""""""""""""""
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab

let g:AutoPairs={'(':')', '[':']', '{':'}', '```':'```', '"""':'"""', "'''":"'''"}

" Temporarily removed
"let g:indent_guides_enable_on_vim_startup = 1

if has("autocmd")
  filetype plugin on
  filetype indent on

  autocmd FileType c,cpp      setlocal cindent
  autocmd FileType c          setlocal sw=4
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
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
  autocmd FileType go         setlocal sw=2 sts=2 ts=2
  autocmd FileType json       setlocal sw=2 et
endif

"jsx
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1

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

function! ToggleNERDTree()
  NERDTreeToggle
  silence NERDTreeMirror
endfunction

let g:NERDTreeWinSize = 25

""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = { 'passive_filetypes': ['shell', 'sh'] }
"
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

""""""""""""""""""""""""""""""
" git-gutter
""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""
" LSP
""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

""""""""""""""""""""""""""""""
" Hot Fixes
""""""""""""""""""""""""""""""
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

"for markdown
au BufRead,BufNewFile *.md set filetype=markdown

filetype on
