"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load modules
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'a.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/Align'
Plugin 'Colour-Sampler-Pack'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'matchit.zip'
Plugin 'chreekat/vim-paren-crosshairs'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mhinz/vim-signify'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/vimproc.vim'

call vundle#end()

filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General usability
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype indent plugin on

let mapleader=","

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

" Disable EX mode
map Q <Nop>

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
  set t_Co=256
  set background=dark

  colorscheme lucius

  hi LineNr ctermfg=241 ctermbg=235
  hi ColorColumn ctermbg=235
  set cursorline
  hi Comment ctermfg=138
  hi clear CursorLine
  augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
  augroup END
  hi CursorLineNR ctermfg=226 ctermbg=234 cterm=bold
  augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR ctermfg=226 ctermbf=234 cterm=bold
  augroup END
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
" Ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsNoPythonWarning=1

" Tab jumps to next substitution, not C-j
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Snippet directory - disregard default snippets
let g:UltiSnipsSnippetDirectories=["ultisnippets"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_enable_balloons=0
let g:syntastic_php_checkers=['php']
"Disable on C/C++, since syntastic does not know include paths.
let g:syntastic_cpp_checkers=[]
let g:syntastic_c_checkers=[]
let g:syntastic_c_checkers=[]
"Disable for SCSS, since the checker can't find external libraries for
"compass.
let g:syntastic_scss_checkers=[]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimfiler
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable NetRW, since somehow it gets sometimes opened even if Vimfiler is the default.
"let g:loaded_netrwPlugin = 1

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" Key mappings
let g:vimfiler_no_default_key_mappings = 1

autocmd FileType vimfiler call s:InitVimfiler()
fun! s:InitVimfiler()
  let g:vimfiler_no_default_key_mappings = 1
  " Default Vimfiler mappings (redefined, since the defaults are disabled.)
  nmap <buffer> .  <Plug>(vimfiler_toggle_visible_ignore_files)
  nmap <buffer> j  <Plug>(vimfiler_loop_cursor_down)
  nmap <buffer> k  <Plug>(vimfiler_loop_cursor_up)
  nmap <buffer> gg <Plug>(vimfiler_cursor_top)
  nmap <buffer> c  <Plug>(vimfiler_copy_file)
  nmap <buffer> m  <Plug>(vimfiler_move_file)
  nmap <buffer> a  <Plug>(vimfiler_new_file)
  nmap <buffer> r  <Plug>(vimfiler_rename_file)
  nmap <buffer> d  <Plug>(vimfiler_delete_file)
  nmap <buffer> l  <Plug>(vimfiler_smart_l)
  nmap <buffer> h  <Plug>(vimfiler_smart_h)
  nmap <buffer> \  <Plug>(vimfiler_switch_to_root_directory)
  nmap <buffer> ~  <Plug>(vimfiler_switch_to_home_directory)
  nmap <buffer> <Space>  <Plug>(vimfiler_toggle_mark_current_line)
  nmap <buffer> * <Plug>(vimfiler_toggle_mark_all_lines)
  nmap <buffer> <Enter>  <Plug>(vimfiler_mark_current_line)

  " Non-default mappings
  nmap <buffer> C  <Plug>(vimfiler_smart_l)
  nmap <buffer> o <Plug>(vimfiler_edit_file)
  nmap <buffer> u <Plug>(vimfiler_switch_to_parent_directory)
  nmap <buffer> <Esc> <Plug>(vimfiler_exit)
  "nmap <buffer> <Space> <Plug>(vimfiler_split_edit_file)

  set nonu
endfun

"imap <C-o> :VimFiler -split -horizontal -buffer-name=aux<CR>
nmap <C-o> :VimFiler -split -horizontal -buffer-name=aux<CR>
cnoreabbrev Sex silent! exe 'silent! spl '.expand("%:p:h") 
cnoreabbrev Ex silent! exe 'silent! e '.expand("%:p:h") 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_right_sep = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.branch = ''

let g:airline_theme = 'bubblegum'

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1

fun! AirlineInit()
  let g:airline_section_b = airline#section#create_left(['branch'])
  let g:airline_section_x = airline#section#create_left(['hunks'])
endfun
autocmd VimEnter * call AirlineInit()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_vcs_list = ['git']
let g:signify_sign_delete            = '-'
let g:signify_sign_overwrite = 0
highlight DiffAdd           cterm=bold ctermfg=119 ctermbg=28
highlight DiffDelete        cterm=bold ctermfg=174 ctermbg=88
highlight DiffChange        cterm=bold ctermfg=33 ctermbg=17

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_prompt='» '

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--line-numbers --nogroup --nocolor'
let g:unite_source_grep_recursive_opt = ''

nnoremap <silent> <C-g> :Unite -buffer-name=aux -default-action=split -silent grep:. <CR>
nnoremap <silent> <C-i> :Unite -buffer-name=aux -default-action=split -start-insert file_rec/async:!<cr>
nnoremap <silent> <C-u> :Unite -buffer-name=aux outline<cr>

autocmd FileType unite call s:InitUnite()
fun! s:InitUnite()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  nmap <buffer> <Esc>   <Plug>(unite_exit)
endfun

