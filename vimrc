call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General usability
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on

set noerrorbells
set vb t_vb=

set nobackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set expandtab 
set shiftwidth=2
set tabstop=2

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

