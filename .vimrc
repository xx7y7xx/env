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
