"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>dummy <Plug>FocusmodeToggle
runtime! pathogen/autoload/pathogen.vim
call pathogen#infect() 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General usability
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent plugin on

let mapleader=","

set foldmethod=syntax
set foldminlines=5
set foldlevel=1

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

nnoremap <space> za 
vnoremap <space> za 
nnoremap <S-space> zMzv 
vnoremap <S-space> zMzv 

" Reselect after indent
vnoremap < <gv
vnoremap > >gv

" Move between wrapped lines
nnoremap j gj
nnoremap k gk

" Put scandinavian letters to use
nmap å ^
nmap ö <C-b>
nmap ä <C-f>


" Y works like other capitals
map Y y$

" w!! sudo-writes.
cmap w!! w !sudo tee % >/dev/null

" Disable all bells
set noerrorbells
set novb

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

" Start scrolling when 5 lines from the end of screen
set scrolloff=5

set cryptmethod=blowfish

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

" Dragging lines around
noremap <A-j> :m+<CR>
noremap <A-k> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>
inoremap <A-k> <Esc>:m-2<CR>
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv

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
" Show + before each wrapped line
set showbreak=+ 
" Color 80th column
set colorcolumn=80

if has("gui_running")
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " GUI options
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  colorscheme inkpot
  hi Folded guibg=#332244
  hi ColorColumn guibg=#332222
  "Hide the icons and the menu
  set go=
  "Hide toolbar in OS X Lion fullscreen mode (go=m is insufficient)
  autocmd VimResized * set toolbar=
  if has("gui_macvim")
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Mac options
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set guifont=Monaco:h11
  elseif has("win32")
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Windows options
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set guifont=Consolas:h9:cANSI
    " Windows-specific UI-behaviour for selections etc.
    behave mswin 
  else
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Linux options
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set guifont=monospace\ 9
  endif
else
  if $TERM == 'xterm' || $TERM == 'screen'
    set t_Co=256
  endif
  colorscheme torte
  hi LineNr ctermbg=darkgray
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Python
au BufNewFile,BufReadPost *.py setlocal shiftwidth=4 tabstop=8 softtabstop=4

" CMake
au! BufNewFile,BufReadPre,BufRead,BufReadPost CMake* set filetype=cmake

" Markdown
au! BufNewFile,BufReadPre,BufRead,BufReadPost *md set filetype=Markdown

" C/C++
au BufNewFile,BufReadPre,BufRead,BufReadPost *.cpp,*.cpp.*,*.h,*.h.*,*.hpp,*.hxx,*.cxx,*.c set cindent|:set foldlevel=2

" PHP
fun! PHPFold()
  if (stridx(expand("<afile>"), "index.php") > -1 || stridx(expand("<afile>"), "default.php") > -1)
    let g:DisableAutoPHPFolding=1
    set filetype=php
    set foldmethod=indent
  else
    let g:DisableAutoPHPFolding=0
    set filetype=php
    set foldmethod=manual
    EnableFastPHPFolds
    set foldlevel=1
  endif
endfun 

au! BufNewFile,BufReadPre,BufRead,BufReadPost *.module,*.install,*.inc,*.php call PHPFold()

" Java
au BufNewFile,BufReadPost *.java set shiftwidth=4|:set tabstop=4

" Squirrel
au BufNewFile,BufRead *.nut setf squirrel

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
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$'] 
" Show hidden files (to allow .vimrc edinting...)
let g:NERDTreeShowHidden = 1 
let g:NERDTreeWinSize = 40 
let g:NERDTreeDirArrows = 0 
" Replace NetRW commands
cnoreabbrev Sex silent! exe 'silent! spl '.expand("%:p:h") 
cnoreabbrev Ex silent! exe 'silent! e '.expand("%:p:h") 
" Show NERDTree on startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snipmate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snippets_dir = $HOME."/.vim/snippets"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsNoPythonWarning=1

" Tab jumps to next substitution, not C-j
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Snippet directory - disregard default snippets
let g:UltiSnipsSnippetDirectories=["snippets"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_check_on_open=1
let g:syntastic_enable_balloons=0
let g:syntastic_php_checkers=['php']
"Disable on C/C++, since syntastic does not know include paths.
let g:syntastic_cpp_checkers=[]
let g:syntastic_c_checkers=[]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Focus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Leader>f <Plug>FocusModeToggle
let g:focusmode_width=120
