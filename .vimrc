" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'delimitMate')
call add(g:pathogen_disabled, 'vim-javascript')

" config-pathogen-start
execute pathogen#infect()
filetype plugin indent on
syntax on
" config-pathogen-end

set smartindent

" Set autoindent according to file type.
if (&ft == 'php' || &ft == 'html')
    set tabstop=2
    set shiftwidth=2
elseif (&ft == 'js')
    set tabstop=2
    set shiftwidth=2
else
    set tabstop=2
    set shiftwidth=2
endif

set expandtab

set hls

" 80 Column mode
set colorcolumn=81

"
" custom syntax hightlight
"
au BufRead,BufNewFile *.esp setfiletype javascript
au BufRead,BufNewFile *.module setfiletype php
au BufRead,BufNewFile *.html setfiletype php

" Highlight current line
:set cursorline
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"===============================================================================
" The NERD Tree
" https://github.com/scrooloose/nerdtree
"===============================================================================

" Auto-open NERDTree in “EVERY” tab
"autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

"===============================================================================
" neocomplete plugin setting
" https://github.com/Shougo/neocomplete.vim#configuration-examples
"===============================================================================

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"===============================================================================
" vim-airline
" https://github.com/vim-airline/vim-airline
"===============================================================================

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"===============================================================================
" Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
"===============================================================================

" Use this option to control whether the plugin is enabled on Vim startup.
let g:indent_guides_enable_on_vim_startup = 1
