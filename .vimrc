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
" Plugin: The NERD Tree
" https://github.com/scrooloose/nerdtree
"===============================================================================

" Auto-open NERDTree in “EVERY” tab
"autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

"===============================================================================
" Plugin: vim-airline
" https://github.com/vim-airline/vim-airline
"===============================================================================

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"===============================================================================
" Plugin: Indent Guides
" https://github.com/nathanaelkane/vim-indent-guides
"===============================================================================

" Use this option to control whether the plugin is enabled on Vim startup.
let g:indent_guides_enable_on_vim_startup = 1

"===============================================================================
" Omni completion - Omni completion provides smart autocompletion for programs.
" http://vimdoc.sourceforge.net/htmldoc/version7.html
" http://vim.wikia.com/wiki/Omni_completion
"===============================================================================

"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"===============================================================================
" Tern for Vim - Provides Tern-based JavaScript editing support.
" https://github.com/ternjs/tern_for_vim
"===============================================================================

if exists('g:plugs["tern_for_vim"]')
	" Enable excellent keyboard shortcuts
	let g:tern_map_keys=1
	" Display argument type hints when the cursor is left over a function
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
