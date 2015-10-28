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
