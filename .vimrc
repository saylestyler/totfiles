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

"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "       _       _
" "      (_)   __(_)___ ___
" "     / / | / / / __ `__ \
" "    / /| |/ / / / / / / /
" "   /_/ |___/_/_/ /_/ /_/  mini
" "
" "   ivim mini (ivim for fast and easy usage, supports both vim 8.0+ and neovim)
" "   Main Contributor: Xiao-Ou Zhang (kepbod) <kepbod@gmail.com>
" "   Version: 3.0
" "   Created: 2015-09-24
" "   Last Modified: 2019-03-31
" "
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "------------------------------------------------
" " => General
" "------------------------------------------------
"
" set nocompatible " Get out of vi compatible mode
" filetype plugin indent on " Enable filetype
" let mapleader=',' " Change the mapleader
" let maplocalleader='\' " Change the maplocalleader
" set timeoutlen=500 " Time to wait for a command
"
" " Source the vimrc file after saving it
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" " Fast edit the .vimrc file using ,x
" nnoremap <Leader>x :tabedit $MYVIMRC<CR>
"
" set autoread " Set autoread when a file is changed outside
" set autowrite " Write on make/shell commands
" set hidden " Turn on hidden"
"
" set history=1000 " Increase the lines of history
" set modeline " Turn on modeline
" set encoding=utf-8 " Set utf-8 encoding
" set completeopt+=longest " Optimize auto complete
" set completeopt-=preview " Optimize auto complete
"
" set undofile " Set undo
"
" " Set directories
" function! InitializeDirectories()
"     let parent=$HOME
"     if has('nvim')
"         let prefix='.local/share/nvim'
"         let dir_list={'cache': ''}
"     else
"         let prefix='.vim'
"         let dir_list={
"                     \ 'backup': 'backupdir',
"                     \ 'view': 'viewdir',
"                     \ 'swap': 'directory',
"                     \ 'undo': 'undodir',
"                     \ 'cache': ''}
"     endif
"     for [dirname, settingname] in items(dir_list)
"         let directory=parent.'/'.prefix.'/'.dirname.'/'
"         if !isdirectory(directory)
"             if exists('*mkdir')
"                 let dir = substitute(directory, "/$", "", "")
"                 call mkdir(dir, 'p')
"             else
"                 echo 'Warning: Unable to create directory: '.directory
"             endif
"         endif
"         if settingname!=''
"             exe 'set '.settingname.'='.directory
"         endif
"     endfor
" endfunction
" call InitializeDirectories()
"
" autocmd BufWinLeave *.* silent! mkview " Make Vim save view (state) (folds, cursor, etc)
" autocmd BufWinEnter *.* silent! loadview " Make Vim load view (state) (folds, cursor, etc)
"
" " Disable mouse
" set mouse=
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "--------------------------------------------------
" " => Vim-plug
" "--------------------------------------------------
"
" if has('nvim')
"     if empty(glob('~/.config/nvim/autoload/plug.vim'))
"         silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"                     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"         autocmd VimEnter * PlugInstall | source $MYVIMRC
"     endif
"     call plug#begin('~/.config/nvim/plugged')
" else
"     if empty(glob('~/.vim/autoload/plug.vim'))
"         silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"                     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"         autocmd VimEnter * PlugInstall | source $MYVIMRC
"     endif
"     call plug#begin('~/.vim/plugged')
" endif
"
"
" " Install plugins
" Plug 'arcticicestudio/nord-vim' " Colorscheme Nord
" Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' " Status line
" Plug 'Yggdroot/indentLine' " Indentation level
" Plug 'ryanoasis/vim-devicons' " Devicons
" Plug 'machakann/vim-highlightedyank' " highlight yanked region
" Plug 'bling/vim-bufferline' " Buffer line
" Plug 'mhinz/vim-startify' " Start page
" Plug 'Raimondi/delimitMate' " Closing of quotes
" Plug 'tomtom/tcomment_vim' " Commenter
" Plug 'haya14busa/incsearch.vim' " Incremental highlighting
" Plug 'haya14busa/vim-asterisk' " Improved asterisk
" Plug 'easymotion/vim-easymotion' " Easy motion
" Plug 'terryma/vim-multiple-cursors' " Multiple cursors
" Plug 'tommcdo/vim-exchange' " Exchange text
" Plug 'tpope/vim-surround' " Surround
" Plug 'tpope/vim-repeat' " Repeat
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } " Fuzzy finder
" Plug 'junegunn/fzf.vim' " Fuzzy finder plugin
" Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] } " Easy align
" Plug 'roxma/vim-paste-easy' " Easy paste
" Plug 'sickill/vim-pasta' " Vim pasta
" Plug 'Keithbsmiley/investigate.vim' " Helper
" Plug 'wellle/targets.vim' " Text objects
" Plug 'roman/golden-ratio' " Resize windows
" Plug 'chrisbra/vim-diff-enhanced' " Create better diffs
" Plug 'tpope/vim-unimpaired' " Pairs of mappings
" Plug 'bradford-smith94/quick-scope' " Quick scope
" " Plug 'yuttie/comfortable-motion.vim' " Comfortable motion
" Plug 'sjl/gundo.vim' " Uundo tree
" Plug 'bkad/CamelCaseMotion' " Camel case motion
" Plug 'majutsushi/tagbar' " Tag bar
" Plug 'ludovicchabant/vim-gutentags' " Manage tag files
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " NERD tree
" Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' } " NERD tree git
" Plug 'prabirshrestha/asyncomplete.vim' " Async autocompletion
" Plug 'prabirshrestha/async.vim' " Normalize async job control api
" Plug 'prabirshrestha/vim-lsp' " Async language server protocol
" Plug 'prabirshrestha/asyncomplete-lsp.vim' " Language server protocol
" Plug 'ryanolsonx/vim-lsp-python' " Python language server
" Plug 'prabirshrestha/asyncomplete-tags.vim' " Tag completions
" Plug 'yami-beta/asyncomplete-omni.vim' " Omni completion
" Plug 'prabirshrestha/asyncomplete-buffer.vim' " Buffer completion
" Plug 'prabirshrestha/asyncomplete-file.vim' " File completion
" Plug 'prabirshrestha/asyncomplete-neosnippet.vim' " Neosnippet autocompletion
" Plug 'Shougo/neosnippet.vim' " Snippet engine
" Plug 'Shougo/neosnippet-snippets' " Snippets
" Plug 'wellle/tmux-complete.vim' " Completion for tmux panes
" Plug 'w0rp/ale' " Lint engine
" Plug 'tpope/vim-fugitive' " Git wrapper
" Plug 'airblade/vim-gitgutter' " Git diff sign
" Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] } " Emmet
" Plug 'sheerun/vim-polyglot' " Language Support
"
" call plug#end()
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "-------------------------------------------------
" " => User Interface
" "-------------------------------------------------
"
" " Set status line
" set laststatus=2 " Show the statusline
" set noshowmode " Hide the default mode text
" let g:airline_theme='nord'
" set ttimeoutlen=50
" let g:bufferline_echo=0
" let g:bufferline_modified='[+]'
" let g:airline_powerline_fonts=1
"
" " Set tabline
" let g:airline#extensions#tabline#enabled=1

" " Only have cursorline in current window and in normal window
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
" set wildmenu " Show list instead of just completing
" set wildmode=list:longest,full " Use powerful wildmenu
" set shortmess=at " Avoids hit enter
" set showcmd " Show cmd
"
" set backspace=indent,eol,start " Make backspaces delete sensibly
" set whichwrap+=h,l,<,>,[,] " Backspace and cursor keys wrap to
" set virtualedit=block,onemore " Allow for cursor beyond last character
" set scrolljump=5 " Lines to scroll when cursor leaves screen
" set scrolloff=3 " Minimum lines to keep above and below cursor
" set sidescroll=1 " Minimal number of columns to scroll horizontally
" set sidescrolloff=10 " Minimal number of screen columns to keep away from cursor
"
" set showmatch " Show matching brackets/parenthesis
" set matchtime=2 " Decrease the time to blink
"
" set number " Show line numbers
"
" set formatoptions+=rnlmM " Optimize format options
" set wrap " Set wrap
" set textwidth=80 " Change text width
" set list " Show these tabs and spaces and so on
" " set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮ " Change listchars
" set linebreak " Wrap long lines at a blank
" " set showbreak=↪  " Change wrap line break
" " set fillchars=diff:⣿,vert:│ " Change fillchars
" " augroup trailing " Only show trailing whitespace when not in insert mode
" "     autocmd!
" "     autocmd InsertEnter * :set listchars-=trail:
" "     autocmd InsertLeave * :set listchars+=trail:
" " augroup END
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "-------------------------------------------------
" " => Colors and Fonts
" "-------------------------------------------------
"
" " Use true colors
" if (empty($TMUX))
"     if (has('nvim'))
"         let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"     endif
"     if (has('termguicolors'))
"         set termguicolors
"     endif
" endif
"
" syntax on " Enable syntax
set background=light
set t_Co=256 " Use 256 colors
"
" " Enable italic
" let g:nord_italic=1
" let g:nord_italic_comments=1
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"

"
" " Load a colorscheme
" colorscheme nord
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "-------------------------------------------------
" " => Indent Related
" "-------------------------------------------------
"
" set autoindent " Preserve current indent on new lines
" set cindent " set C style indent
" set expandtab " Convert all tabs typed to spaces
" set softtabstop=4 " Indentation levels every four columns
" set shiftwidth=4 " Indent/outdent by four columns
" set shiftround " Indent/outdent to nearest tabstop
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "-------------------------------------------------
" " => Search Related
" "-------------------------------------------------
"
" set ignorecase " Case insensitive search
" set smartcase " Case sensitive when uc present
" set hlsearch " Highlight search terms
" set incsearch " Find as you type search
" set gdefault " turn on g flag
" if has('nvim')
"     set inccommand=split " live substitution
" endif
"
" " incsearch & asterisk
" let g:incsearch#magic='\m'
" let g:incsearch#auto_nohlsearch=1
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)
" map g* <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)
" map #  <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)
" map g# <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)
"
" " Toggle relativenumber
" nnoremap <Leader>n :set relativenumber!<CR>
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "-------------------------------------------------
" " => Fold Related
" "-------------------------------------------------
"
" set foldlevelstart=0 " Start with all folds closed
" set foldcolumn=1 " Set fold column
"
" " Space to toggle and create folds.
" nnoremap <silent> <Space> @=(foldlevel('.') ? 'za' : '\<Space>')<CR>
" vnoremap <Space> zf
"
" " Set foldtext
" function! MyFoldText()
"     let line=getline(v:foldstart)
"     let nucolwidth=&foldcolumn+&number*&numberwidth
"     let windowwidth=winwidth(0)-nucolwidth-3
"     let foldedlinecount=v:foldend-v:foldstart+1
"     let onetab=strpart('          ', 0, &tabstop)
"     let line=substitute(line, '\t', onetab, 'g')
"     let line=strpart(line, 0, windowwidth-2-len(foldedlinecount))
"     let fillcharcount=windowwidth-len(line)-len(foldedlinecount)
"     return line.'…'.repeat(' ',fillcharcount).foldedlinecount.'L'.' '
" endfunction
" set foldtext=MyFoldText()
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "-------------------------------------------------
" " => Key Mapping
" "-------------------------------------------------
"
" " Make j and k work the way you expect
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk
"
" " Navigation between windows
" nnoremap <C-J> <C-W>j
" nnoremap <C-K> <C-W>k
" nnoremap <C-H> <C-W>h
" nnoremap <C-L> <C-W>l
"
" " Same when jumping around
" nnoremap g; g;zz
" nnoremap g, g,zz
"
" " Reselect visual block after indent/outdent
" vnoremap < <gv
" vnoremap > >gv
"
" " Keep the cursor in place while joining lines
" nnoremap J mzJ`z
"
" " Strip all trailing whitespace in the current file
" nnoremap <Leader>q :%s/\s\+$//<CR>:let @/=''<CR>
"
" " Modify all the indents
" nnoremap \= gg=G
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" "--------------------------------------------------
" " => Plugin Setting
" "--------------------------------------------------
"
" " -> Startify
" if has('nvim')
"     let g:startify_session_dir=$HOME . '/.config/nvim/cache/session'
" else
"     let g:startify_session_dir=$HOME .'/.vim/cache/session'
" endif
" hi StartifyHeader  ctermfg=111
" hi StartifyFooter  ctermfg=111
" hi StartifyBracket ctermfg=240
" hi StartifyNumber  ctermfg=215
" hi StartifyPath    ctermfg=245
" hi StartifySlash   ctermfg=240
"
" " -> delimitMate
" let delimitMate_expand_cr=1
" let delimitMate_expand_space=1
" let delimitMate_balance_matchpairs=1
"
" " -> TComment
" " Map \<Space> to commenting
" function! IsWhiteLine()
"     if (getline('.')=~'^$')
"         exe 'TCommentBlock'
"         normal! j
"     else
"         normal! A
"         exe 'TCommentRight'
"         normal! l
"         normal! x
"     endif
"     startinsert!
" endfunction
" nnoremap <silent> <LocalLeader><Space> :call IsWhiteLine()<CR>
"
" " -> Asyncomplete
" let g:asyncomplete_remove_duplicates=1
" let g:asyncomplete_smart_completion=1
" let g:lsp_diagnostics_enabled=0
" inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
" inoremap <expr> <CR> delimitMate#WithinEmptyPair() ?
"             \ "\<C-R>=delimitMate#ExpandReturn()\<CR>" :
"             \ pumvisible() ? "\<C-Y>" : "\<CR>"
"
" nnoremap <silent> <LocalLeader>g :LspDefinition<CR>
" " Omni
" call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
" \ 'name': 'omni',
" \ 'whitelist': ['*'],
" \ 'blacklist': ['c', 'cpp', 'html'],
" \ 'completor': function('asyncomplete#sources#omni#completor')
" \  }))
" " Ctags
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
"     \ 'name': 'tags',
"     \ 'whitelist': ['c'],
"     \ 'completor': function('asyncomplete#sources#tags#completor'),
"     \ }))
" " Buffer
" call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"     \ 'name': 'buffer',
"     \ 'whitelist': ['*'],
"     \ 'blacklist': ['go'],
"     \ 'completor': function('asyncomplete#sources#buffer#completor'),
"     \ }))
" " File
" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"     \ 'name': 'file',
"     \ 'whitelist': ['*'],
"     \ 'priority': 10,
"     \ 'completor': function('asyncomplete#sources#file#completor')
"     \ }))
" " Neosnippet
" call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
"     \ 'name': 'neosnippet',
"     \ 'whitelist': ['*'],
"     \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
"     \ }))
" imap <C-K> <Plug>(neosnippet_expand_or_jump)
" smap <C-K> <Plug>(neosnippet_expand_or_jump)
" xmap <C-K> <Plug>(neosnippet_expand_target)
" " Tmux-complete
" let g:tmuxcomplete#asyncomplete_source_options = {
"     \ 'name':      'tmuxcomplete',
"     \ 'whitelist': ['*'],
"     \ 'config': {
"     \     'splitmode':      'words',
"     \     'filter_prefix':   1,
"     \     'show_incomplete': 1,
"     \     'sort_candidates': 0,
"     \     'scrollback':      0
"     \     }
"     \ }
"
" " -> Easy Align
" xmap ga <Plug>(EasyAlign)
" nmap ga <Plug>(EasyAlign)
"
" " -> Investigate.vim
" nnoremap K :call investigate#Investigate()<CR>
" let g:investigate_use_dash=1
"
" " -> EnhancedDiff
" let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
"
" " -> Quick-scope
" let g:qs_max_chars=80
"
" " -> Tag bar
" nnoremap <Leader>t :TagbarToggle<CR>
" let g:tagbar_autofocus=1
" let g:tagbar_expand=1
" let g:tagbar_foldlevel=2
" let g:tagbar_autoshowtag=1
"
" " -> Gutentags
" if has('nvim')
"     let gutentags_cache_dir=$HOME . '/.local/share/nvim/cache/ctags'
" else
"     let g:gutentags_cache_dir=$HOME . '/.vim/cache/ctags'
" endif
"
" " -> NERD Tree
nnoremap <Leader>n :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
augroup nerd_loader
    autocmd!
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd BufEnter,BufNew *
                \  if isdirectory(expand('<amatch>'))
                \|   call plug#load('nerdtree')
                \|   execute 'autocmd! nerd_loader'
                \| endif
augroup END
"
" " -> Emmet
let g:user_emmet_leader_key='<C-Y>'
let g:user_emmet_settings={'indentation':'  '}
let g:use_emmet_complete_tag=1

let g:vim_markdown_concel=0
