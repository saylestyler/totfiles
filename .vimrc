call plug#begin('~/.vim/plugged')

"Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript' " for react
Plug 'mxw/vim-jsx' " jsx
Plug 'HerringtonDarkholme/yats.vim' " typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'mattn/webapi-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter' " NERD
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'h1mesuke/unite-outline'
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'

call plug#end()

filetype plugin indent on
syntax on

set belloff=all

" Use qq in insert and command mode to Esc and to exit when in normal mode
inoremap qq <Esc>
cnoremap qq <Esc>
nnoremap qq :q<cr>
nnoremap q1 :q!<cr>

" Use qs to save while in insert mode
inoremap qs <Esc>:w<cr>a

" Use ,s to refresh
nnoremap <leader>s :so $MYVIMRC<cr>

" Use ,w to save
nnoremap <leader>w :w<cr>

" Handle Cursor
set cursorline
set nostartofline
set ruler

set wrap

colorscheme default

"" Easy access to the shell ,,
map <Leader><Leader> :!

" Allow stylesheets to autocomplete hyphenated words
autocmd FIleType css,scss,sass,less setlocal iskeyword+=-

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python2_host_prog = '/usr/local/bin/python2'

let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

" NERDTree
" B
" = toggle bookmarks

"sort file by line length, good for when regex annoying
" '<,'> ! awk '{ print length(), $0 | \"sort -n | cut -d\\  -f2-\" }'

map <leader>vimrc :tabe ~/.vim/.vimrc<cr>
" autocmd bufwritepost .vimrc source $MYVIMRC

" for same as set in chrome://settings, (l <space> term)
let g:vim_g_command = "Go"
let g:vim_g_query_url = "http://www.google.com/search?btnI=1&q="

"let g:ctrlp_map = '<C-p>'
"let g:ctrlp_cmd = 'P' "Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_working_path_mode = 'ra' "When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
let g:ctrlp_custom_ignore = '\v[\/]\.(exe|so|dll|git|hg|svn)$'

map <M-s> :w<kEnter>  "Works in normal mode, must press Esc first"
imap <M-s> <Esc>:w<kEnter>i "Works in insert mode, saves and puts back in insert mode"
"
" SNIPPET THANGS
" 1. to scroll through snippets use Ctrl + N
" 2. once on a snippet expand it w/ <TAB>
"
" map cmd+s to save in nongui vim
map <M-s> :w<kEnter>
imap <M-s> <Esc>:w<kEnter>i

set completeopt-=menu
set completeopt+=menuone   " show the popup menu even when there is only 1 match
set completeopt+=longest   " don't insert the longest common text
set completeopt+=preview   " don't show preview window
set completeopt+=noinsert  " don't insert any text until user chooses a match
set completeopt-=noselect  " select first match

" running :ALEFix on a file will standard-ize it
let g:ale_linters = {
\   'javascript': [''],
\   'css': ['prettier'],
\   'html': ['htmlhint']
\}
" let g:ale_fixers = {'javascript': ['standard']}
" let g:ale_lint_on_save = 1
" let g:ale_fix_on_save = 1

" DELETE ALL TRAILING WHITESPACE ON SAVE
autocmd BufWritePre * %s/\s\+$//e

" search with highlights by default; Press Space to turn off highlighting and clear any message already displayed.
set hls

" Write all writeable buffers when changing buffers or losing focus.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>""
set autowriteall " Save when doing various buffer-switching things.
autocmd BufLeave,FocusLost * silent! wall  " Save anytime we leave a buffer or MacVim loses focus.

" TAB SHIT
set expandtab                   " Use soft tabs
set tabstop=2                   " Tab settings
set autoindent
set smarttab                    " Use shiftwidth to tab at line beginning
set shiftwidth=2                " Width of autoindent

" Keep swapfiles
set swapfile
set undofile
set udir=~/.vim-tmp
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

set nowrap

" No prompt for file changes outside Vim
set autoread

set scrolloff=3  " Scroll when the cursor is 3 lines from edge
set laststatus=2 " Always show statusline
set incsearch    " Incremental search
set history=9000 " History size
set ignorecase
set smartcase    " Smart case-sensitivity when searching

set showmatch                   " Show matching brackets
set hidden                      " Allow hidden, unsaved buffers
set splitright                  " Add new windows towards the right
set splitbelow                  " ... and bottom

set list                        " Show whitespace
set listchars=trail:·
set number

" MRU
let MRU_Window_Height = 10
let MRU_Auto_Close = 1

" TAB COMPLETION
set wildmode=longest,list      " Bash-like tab completion
set backspace=indent,eol,start " Let backspace work over anything.
set wildignore-=tags               " Ignore tags when globbing.
set wildignore+=tmp/**             " ...Also tmp files.
set wildignore+=.tmp
set wildignore+=public/uploads/**  " ...Also uploads.
set wildignore+=public/**  " ...Also uploads.
set wildignore+=private/uploads/** " ...Also uploads.
set wildignore+=public/images/**   " ...Also images.
set wildignore+=nodqqqq/images/**   " ...Also images.
set wildignore+=vendor/**          " ...Also vendor.
set wildignore+=node_modules
set wildignore+=bower_components

" RemoveFancyCharacters COMMAND
function! RemoveFancyCharacters()
  let typo = {}
  let typo["“"] = '"'
  let typo["”"] = '"'
  let typo["‘"] = "'"
  let typo["’"] = "'"
  let typo["–"] = '--'
  let typo["—"] = '---'
  let typo["…"] = '...'
  :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

" Find current word in command mode
function! AckGrep()
  let command = "ack ".expand("<cword>")
  cexpr system(command)
  cw
endfunction

function! AckVisual()
  normal gv"xy
  let command = "ack ".@x
  cexpr system(command)
  cw
endfunction

" Unset 'list' in :Gstatus window (which usually contains tab characters).
autocmd BufReadPost .git/index set nolist

" insert a space in normal mode
let mapleader = ","
let maplocalleader = ";"

inoremap jk <esc>

" makes @recording not a thing
map q <Nop>

map <leader>p pastetoggle=<F2>

" Make Y consistent with D and C
map Y           y$

" Search
nmap <leader>s  :%s/
vmap <leader>s  :s/

map <leader>nn :MRU<CR>

" Split screen
map <leader>v   :vsp<CR>

" :x
map <leader>x   :x<CR>

" Move between screens
map <leader>w   ^Ww
map <leader>=   ^W=
map <leader>j   ^Wj
map <leader>k   ^Wk

" Gracefully handle holding shift too long after : for common commands
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev Tabe tabe
cabbrev Tabc tabc

" Open .vimrc file in new tab. Think Command + , [Preferences...] but with Shift.
map <D-<>       :tabedit ~/.vimrc<CR>

" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" Auto-indent whole file
nmap <leader>=  gg=G``
map <silent> <F7> gg=G`` :delmarks z<CR>:echo "Reformatted."<CR>

" Jump to a new line in insert mode
imap <D-CR>     <Esc>o

" Fast scrolling
nnoremap <C-e>  3<C-e>
nnoremap <C-y>  3<C-y>

" File tree browser
map \           :NERDTreeToggle<CR>

inoremap jk <esc>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>

" Previous/next quickfix file listings (e.g. search results)
map <M-D-Down>  :cn<CR>
map <M-D-Up>    :cp<CR>

" Previous/next buffers
map <M-D-Left>  :bp<CR>
map <M-D-Right> :bn<CR>


" FuzzyFinder
map <D-e>       :FufBuffer<CR>
map <leader>rb  :FufBuffer<CR>

" Comment/uncomment lines
map <leader>cc   <plug>NERDCommenterToggle

" In command-line mode, <C-A> should go to the front of the line, as in bash.
cmap <C-A> <C-B>

" " -> Emmet
let g:user_emmet_leader_key='<C-Y>'
let g:user_emmet_settings={'indentation':'  '}
let g:use_emmet_complete_tag=1

let g:vim_markdown_concel=0