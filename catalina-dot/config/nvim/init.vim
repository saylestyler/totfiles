" set packpath=/usr/local/share/nvim/runtime,~/.local/share/nvim/site
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" source ~/.vimrc
set clipboard+=unnamedplus

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
" call deoplete#custom#option('smart_case', v:true)

" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction

" auto open nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif
