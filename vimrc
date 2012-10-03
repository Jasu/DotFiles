call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General usability
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on

" Force terminal encoding. Is this wise..?
set enc=utf8

" Tab-completition enhanced
set wildmenu 

" Make sure paths work on Win32
set shellslash 

" Grep to display filename
set grepprg=grep\ -nH\ $* 

" Easy window navigation
" Noremap to shadow NERDtree
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Reselect after indent
vnoremap < <gv
vnoremap > >gv

" Put scandinavian letters to use
map å ^
map ö <C-b>
map ä <C-f>

" Y works like other capitals
map Y y$

" w!! sudo-writes.
cmap w!! w !sudo tee % >/dev/null

" Disable all bells
set noerrorbells
set vb t_vb=

" No backups / clutterfiles
set nobackup
set noswapfile

" Hilight search
set hls 
" Incremental search
set incsearch 
" Ignore case
set ignorecase 

" Search timeout
autocmd cursorhold * set nohlsearch 
nnoremap n :set hlsearch<cr>n
nnoremap N :set hlsearch<cr>N
nnoremap / :set hlsearch<cr>/
nnoremap ? :set hlsearch<cr>?

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent

" Tab = 2 spaces
set expandtab 
set shiftwidth=2
set tabstop=2

" Backspace works like backspace, needed for gvim on Windows at least
set bs=2 

" Fix NBSP on mac
imap <a-space> <space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
" Show line numbers
set number 
" Show col and line in bar
set ruler
" Show matching parentheses
set showmatch 
" Show statusbar
set laststatus=2
"Show + before each wrapped line
set showbreak=+ 

if has("gui_running")
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " GUI options
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  colorscheme eclipse
  "Hide the icons
  set go=m 
  "Hide toolbar in OS X Lion fullscreen mode (go=m is insufficient)
  autocmd VimResized * set toolbar=
  set guifont=monospace\ 11
  if has("win32")
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Windows options
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set guifont=Consolas:h9:cANSI
    " Windows-specific UI-behaviour for selections etc.
    behave mswin 
  endif
else
  colorscheme torte
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction 

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMake
au! BufNewFile,BufReadPre,BufRead,BufReadPost CMake* set filetype=cmake

" C/C++
au BufNewFile,BufReadPre,BufRead,BufReadPost *.cpp,*.cpp.*,*.h,*.h.*,*.hpp,*.hxx,*.cxx,*.c set cindent 

" PHP
" Drupal modules and install files
au! BufNewFile,BufReadPre,BufRead,BufReadPost *.module set filetype=php
au! BufNewFile,BufReadPre,BufReadPost *.install set filetype=php
" PHP includes
au! BufNewFile,BufReadPre,BufRead,BufReadPost *.inc set filetype=php

" Java
au BufNewFile,BufReadPost *.java set shiftwidth=4|:set tabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alternate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-a> :A<return>

let g:alternateExtensions_h = "cpp,CPP,c,C,mm,MM,m,M"
let g:alternateExtensions_H = "CPP,cpp,C,c,MM,mm,M,m"
let g:alternateextensions_cpp = "h,H,hpp,HPP"
let g:alternateextensions_CPP = "H,h,HPP,hpp"
let g:alternateextensions_cc = "h,H,hpp,HPP"
let g:alternateextensions_CC = "H,h,HPP,hpp"
let g:alternateExtensions_m = "h,H,hpp,HPP"
let g:alternateExtensions_M = "H,h,HPP,hpp"
let g:alternateExtensions_mm = "h,H,hpp,HPP"
let g:alternateExtensions_MM = "H,h,HPP,hpp"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev N NERDTree
" Make VIM CWD follow NerdTree:
let g:NERDTreeChDirMode = 2 
" Show hidden files (to allow .vimrc edinting...)
let g:NERDTreeShowHidden = 1 
let g:NERDTreeWinSize = 40 
" Replace NetRW commands
cnoreabbrev Sex NERDTree
cnoreabbrev Ex NERDTree
" Show NERDTree on startup
autocmd VimEnter * NERDTree

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snipmate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snippets_dir = $HOME."/.vim/snippets"

