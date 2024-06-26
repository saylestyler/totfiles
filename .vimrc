" " plug.vim {{ "
" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
"  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
"         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" endif
" 
" call plug#begin()
" 
" " :GenTocGFM && :UpdateToc
" Plug 'mzlogin/vim-markdown-toc'
" 
" " build fzf
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" 
" " coc-nvim 
" " https://github.com/neoclide/coc.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 
" Plug 'honza/vim-snippets'
" Plug 'tpope/vim-commentary'
" Plug 'liuchengxu/eleline.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" " Plug 'ludovicchabant/vim-gutentags'
" " Plug 'liuchengxu/vista.vim', { 'on': 'Vista' }
" Plug 'farmergreg/vim-lastplace'
" Plug 'zef/vim-cycle'
" Plug 'nelstrom/vim-visual-star-search'
" Plug 'sgur/vim-editorconfig'
" Plug 'romainl/vim-cool'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'scrooloose/nerdtree'
" 
" Plug 'nacitar/a.vim', { 'on': 'A' }
" Plug 'bronson/vim-trailing-whitespace', { 'on': 'FixWhitespace' }
" Plug 'sk1418/Join', { 'on': 'Join'}
" 
" Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" 
" Plug 'vim-scripts/Colour-Sampler-Pack'
" Plug 'godlygeek/csapprox' " makes gui-only themes run in term
" 
" Plug 'sheerun/vim-polyglot'
" Plug 'neoclide/vim-jsx-improve'
" Plug 'neoclide/jsonc.vim'
" call plug#end()
" " }} plug.vim "
" 
" " basic {{ "
let mapleader = ","
set notermguicolors
colorscheme github

set hidden
set number
set expandtab
set tabstop=4
set shiftwidth=4
set nofoldenable
set foldmethod=indent
set showmatch
set matchtime=2
set matchpairs+=<:>
set ignorecase
set smartcase
set switchbuf=useopen,usetab,newtab
set updatetime=100
set noshowmode
set completeopt=menu
set cmdheight=2
set formatexpr=CocAction('formatSelected')
set shortmess+=c
set pumheight=20
setlocal noswapfile
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" `yy`ank to system clipboard
set clipboard+=unnamedplus

let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 0
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
" }} basic "

autocmd {{
augroup common
  autocmd!
  autocmd FileType go setlocal expandtab
  autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd FileType lua setlocal includeexpr=substitute(v:fname,'\\.','/','g')
  autocmd FileType lua setlocal include=require
  autocmd FileType lua setlocal define=function
  autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
  autocmd FileType crontab setlocal nobackup nowritebackup
  autocmd FileType ruby,html,javascript,typescript,css,json,vue setlocal shiftwidth=2 tabstop=2

  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd BufReadPost *.log normal! G
  autocmd BufNewFile,BufReadPost *.md setfiletype markdown
  autocmd BufNewFile,BufReadPost *.tsx setfiletype typescript.tsx
  autocmd BufNewFile,BufReadPost *.jsx setfiletype javascript.jsx

  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd User CocQuickfixChange :CocList --normal quickfix

  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

  " set up default omnifunc
  autocmd FileType *
        \ if &omnifunc == "" |
        \    setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
augroup end
}} autocmd
" 
 " command {{ "
 command! -nargs=0 E     :e
 command! -nargs=0 Q     :q
 command! -nargs=0 Qa    :qa
 command! -nargs=0 T     :tabnew
 command! -nargs=0 W     :w
 command! -nargs=0 Wa    :wa
 command! -nargs=0 Wqa   :wqa
 command! -nargs=0 WQa   :wqa
 command! -nargs=0 F     :echomsg @%
" 
" command! -nargs=0 C             :CocConfig
" command! -nargs=0 R             :CocRestart
" command! -nargs=0 L             :CocListResume
" command! -nargs=0 -range D      :CocCommand
" 
" command! -nargs=0 JSONPretty    :%!python -m json.tool
" command! -nargs=0 Todos         :CocList -A --normal grep -e TODO|FIXME
" command! -nargs=0 Status        :CocList -A --normal gstatus
" command! -nargs=+ Find          :exe 'CocList -A --normal grep --smart-case '.<q-args>
" command! -nargs=0 Format        :call CocAction('format')
" command! -nargs=0 GitChunkUndo  :call CocAction('runCommand', 'git.chunkUndo')
" command! -nargs=0 OR            :call CocAction('runCommand', 'editor.action.organizeImport')
" " }} command "
" 
" " mappings {{ "
" map <silent> <leader>ee :e $HOME/.config/nvim/init.vim<CR>
" map <silent> <leader>dd :e $HOME/.config/nvim/dev.dict<CR>
" setl dictionary+=$HOME/.config/nvim/dev.dict
" 
" map <leader>n :NERDTreeToggle<CR>
" 
" map ? /\<\><Left><Left>
" " map <silent> <leader>n :nohlsearch<CR>
" 
" nnoremap <leader>cp :set clipboard=unnamed<CR>
" 
" nnoremap <silent> gb :bn<CR>
" nnoremap <silent> gB :bp<CR>
" 
" " insert mode
" inoremap <C-c> <ESC>
" inoremap <C-w> <C-[>diwa
" inoremap <C-h> <BS>
" inoremap <C-d> <Del>
" inoremap <C-u> <C-G>u<C-U>
" inoremap <C-b> <Left>
" inoremap <C-f> <Right>
" inoremap <C-a> <Home>
" inoremap <C-n> <Down>
" inoremap <C-p> <Up>
" inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
" 
" " command line mappings
" cnoremap <C-a> <Home>
" cnoremap <C-b> <S-Left>
" cnoremap <C-f> <S-Right>
" cnoremap <C-e> <End>
" cnoremap <C-d> <Del>
" cnoremap <C-h> <BS>
" cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>
" 
" nmap t<Enter> :bo sp term://zsh\|resize 10<CR>i
" " tnoremap <Esc> <C-\><C-n>
" 
" " esc in insert & cmd mode
" inoremap jk <esc>
" cnoremap jk <C-C>
" 
" " }} mappings "
" 
" " functions {{ "
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocActionAsync('doHover')
"   endif
" endfunction
" 
" function! s:GoToDefinition()
"   if CocAction('jumpDefinition')
"     return v:true
"   endif
" 
"   let ret = execute("silent! normal \<C-]>")
"   if ret =~ "Error" || ret =~ "错误"
"     call searchdecl(expand('<cword>'))
"   endif
" endfunction
" 
" function! s:select_current_word()
"   if !get(g:, 'coc_cursors_activated', 0)
"     return "\<Plug>(coc-cursors-word)"
"   endif
"   return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
" endfunc
" 
" function! CopyFloatText() abort
"   let id = win_getid()
"   let winid = coc#util#get_float()
"   if winid
"     call win_gotoid(winid)
"     execute 'normal! ggvGy'
"     call win_gotoid(id)
"   endif
" endfunction
" " }} functions "
" 
" " wildignore {{ "
" set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
" set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
" set wildignore+=*.log,*.pyc,*.sqlite,*.sqlite3,*.min.js,*.min.css,*.tags
" set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
" set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
" set wildignore+=*.pdf,*.dmg,*.app,*.ipa,*.apk,*.mobi,*.epub
" set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
" set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
" set wildignore+=*/.git/*,*/.svn/*,*.DS_Store
" set wildignore+=*/node_modules/*,*/nginx_runtime/*,*/build/*,*/logs/*,*/dist/*,*/tmp/*
" " }} wildignore "
" 
" " CtrlP {{ "
" nnoremap <silent> <C-l> :CtrlPLine<CR>
" 
" if executable('fd')
"   let g:ctrlp_user_command = 'fd --type file'
"   let g:ctrlp_use_caching = 0
" endif
" " }} CtrlP "
" 
" " vim-gutentags {{ "
" " set tags=./.tags;,.tags
" " let g:gutentags_project_root = ['.root', '.git', '.svn', '.hg', '.project']
" " let g:gutentags_ctags_tagfile = '.tags'
" " let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
" " let g:gutentags_ctags_exclude = ['*.json', '*.js', '*.ts', '*.jsx', '*.css', '*.less', '*.sass', '*.go', '*.dart', 'node_modules', 'dist', 'vendor']
" " }} vim-gutentags "
" 
" " vim-rooter {{ "
" let g:rooter_patterns = ['.root', 'package.json', '.git/']
" " }} vim-rooter "
" 
" " go.vim {{ "
" let g:go_fmt_command = "gofumports"
" " let g:go_def_mode='gopls'
" " let g:go_info_mode='gopls'
" " }} go.vim "
" 
" " Netrw {{
" let g:netrw_chgwin = 2
" let g:netrw_list_hide = ',\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_winsize=20
" let g:netrw_liststyle=3
" " }} Netrw
" 
" " coc.nvim {{ "
" let g:coc_global_extensions = [
"       \'coc-pairs',
"       \'coc-json',
"       \'coc-html',
"       \'coc-tsserver',
"       \'coc-eslint',
"       \'coc-prettier',
"       \'coc-highlight',
"       \'coc-dictionary',
"       \'coc-snippets',
"       \'coc-lists',
"       \'coc-yank',
"       \'coc-yaml',
"       \'coc-syntax',
"       \'coc-git',
"       \'coc-marketplace',
"       \'coc-webpack',
"       \'coc-word',
"       \'coc-markdownlint',
"       \'coc-ecdict'
"       \]
" 
" nmap <silent> gd :call <SID>GoToDefinition()<CR>
" nmap <silent> gD <Plug>(coc-declaration)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gn <Plug>(coc-rename)
" nmap <silent> ge <Plug>(coc-diagnostic-next)
" nmap <silent> ga <Plug>(coc-codeaction)
" nmap <silent> gl <Plug>(coc-codelens-action)
" nmap <silent> gs <Plug>(coc-git-chunkinfo)
" nmap <silent> gm <Plug>(coc-git-commit)
" omap <silent> ig <Plug>(coc-git-chunk-inner)
" xmap <silent> ig <Plug>(coc-git-chunk-inner)
" 
" nmap <silent> <expr> [c &diff ? '[c' : '<Plug>(coc-git-prevchunk)'
" nmap <silent> <expr> ]c &diff ? ']c' : '<Plug>(coc-git-nextchunk)'
" 
" " vscode style, select current word
" " nmap <silent> <expr> <C-d> <SID>select_current_word()
" 
" nmap <silent> <C-c> <Plug>(coc-cursors-position)
" xmap <silent> <C-d> <Plug>(coc-cursors-range)
" 
" nmap <leader>x  <Plug>(coc-cursors-operator)
" nmap <leader>rf <Plug>(coc-refactor)
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" 
" inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" 
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" nnoremap <silent> <space>o  :<C-u>CocList -A outline<CR>
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
" nnoremap <silent> <space>f  :<C-u>CocList files<CR>
" nnoremap <silent> <space>l  :<C-u>CocList locationlist<CR>
" nnoremap <silent> <space>q  :<C-u>CocList quickfix<CR>
" nnoremap <silent> <space>w  :<C-u>CocList -I -N symbols<CR>
" nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<CR>
" nnoremap <silent> <space>m  :<C-u>CocList -A -N mru<CR>
" nnoremap <silent> <space>b  :<C-u>CocList -A -N --normal buffers<CR>
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" nnoremap <silent> <space>s  :exe 'CocList -A -I --normal --input='.expand('<cword>').' words'<CR>
" nnoremap <silent> <space>S  :exe 'CocList -A --normal grep '.expand('<cword>').''<CR>
" 
" imap <C-k> <Plug>(coc-snippets-expand)
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" 
" call coc#add_command('tree', 'Vexplore', 'open netrw explorer')
" " }} coc.nvim "
" 
vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:
