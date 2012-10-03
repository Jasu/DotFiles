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

" Fix NBSP elsewhere
if !has("win32")
  au BufWritePre * let ma = Mark() | %!sed 's/\xC2\xA0/ /g'
  au BufWritePre * exec ma
  au BufWritePost * set nomod
endif


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

