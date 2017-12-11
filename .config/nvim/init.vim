" https://github.com/xxd3vin/vimrc/blob/master/init.vim
" ```
" ln -s ~/env/.zshrc ~/.zshrc
" ```
" Dependencies:
" - npm install -g tern

" python intergration
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips', { 'on': [] }
"Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"
" for frontend (react) development
"

" syntax highlight for javascript
Plug 'pangloss/vim-javascript'
" syntax highlight for jsx(react)
Plug 'mxw/vim-jsx'
" react snippets
" Currently, es6 version of snippets is available in es6 branch only
" TODO or you could try https://github.com/epilande/vim-react-snippets
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }
" lots of snippets of other language
"Plug 'honza/vim-snippets' "optional
Plug 'w0rp/ale'
" status bar below
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Run shell commands in the background, like formatting source code
Plug 'skywind3000/asyncrun.vim'

"
" Autocompletion support
"

" asynchronous keyword completion system
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" tern_for_vim is a Vim plugin that provides Tern-based JavaScript editing support.
" And Tern is a stand-alone code-analysis engine for JavaScript.
" DEPENDENCY:
" - https://www.npmjs.com/package/tern need to global install
"   ```
"   npm install -g tern
"   ```
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

"
" Other plugins
"

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

"===============================================================================
" Plugin: vim-javascript
" https://github.com/pangloss/vim-javascript
"===============================================================================

" Enables syntax highlighting for JSDocs.
let g:javascript_plugin_jsdoc = 1

"===============================================================================
" Plugin: The NERD Tree
" https://github.com/scrooloose/nerdtree
"===============================================================================

" Auto-open NERDTree in “EVERY” tab
"autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror

" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Single click to open directory nodes with single click
" Double click to open file nodes
set mouse=a
let g:NERDTreeMouseMode=2

" Open file in a new tab when clicking twice
" https://github.com/scrooloose/nerdtree/issues/323#issuecomment-266419487
fun! s:MyNERDTreeSetting()
  fun! s:DoubleClickBehavior()
    if match(getline('.'), '▸') == -1 && match(getline('.'), '▾') == -1
      map <buffer> <2-LeftMouse> t
    else
      map <buffer> <2-LeftMouse> o
    endif
  endfun

  autocmd CursorMoved * call s:DoubleClickBehavior()
endfun
autocmd WinEnter * if &ft == 'nerdtree' | call s:MyNERDTreeSetting() | endif

"===============================================================================
" Plugin: ALE
" https://github.com/w0rp/ale
"===============================================================================

" enable only eslint linter (other linter will be disabled)
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
" keep the sign gutter open
let g:ale_sign_column_always = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" change the format for echo messages
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" show the linter output in the location list, make the ALE location list always show up when there are linter errors.
let g:ale_open_list = 1
" change the size of the window
let g:ale_list_window_size = 5

" Ctrl+j and Ctrl+k to moving(navigation) between errors 
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"===============================================================================
" Plugin: Airline
" https://github.com/vim-airline/vim-airline
"===============================================================================

" 从某个网页直接复制过来的，目前还不太明确是干啥用的，而且gruvbox这个主题没有安装，所以暂时注释掉这段代码吧
"let g:airline#extensions#tabline#enabled = 2
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#right_sep = ' '
"let g:airline#extensions#tabline#right_alt_sep = '|'
"let g:airline_left_sep = ' '
"let g:airline_left_alt_sep = '|'
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = '|'
"let g:airline_theme= 'gruvbox'

" depend on asyncrun.vim plugin
" display asyncrun status in airline section error
"let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
" display asyncrun status in airline section c
"let g:airline_section_c = airline#section#create_right(['%{g:asyncrun_status}'])

"===============================================================================
" Plugin: asyncrun.vim
" https://github.com/skywind3000/asyncrun.vim
"===============================================================================

autocmd BufWritePost *.js AsyncRun -post=checktime prettier --config package.json --write %
autocmd BufWritePost *.jsx AsyncRun -post=checktime prettier --config package.json --write %

"===============================================================================
" Plugin: deoplete.nvim
" https://github.com/Shougo/deoplete.nvim
"===============================================================================

" WHY 通过调用函数的方式，无法启用自动补全功能，但是如果在vim里面再次source
" init.vim的话，则会出现关键字推荐的下拉菜单。
" 如果使用全局变量的方式来启动，则没有问题，这是为什么呢？
"call deoplete#enable()
let g:deoplete#enable_at_startup = 1

" How do you actually choose from the autocomplete options effectively? https://github.com/Shougo/deoplete.nvim/issues/302
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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
  autocmd FileType jsx setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

"===============================================================================
" Plugin: tern_for_vim
" https://github.com/ternjs/tern_for_vim
" https://github.com/ternjs/tern
"===============================================================================

if exists('g:plugs["tern_for_vim"]')
  " Enable excellent keyboard shortcuts
  let g:tern_map_keys=1
  " Display argument type hints when the cursor is left over a function
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

"
" other basic config
"

" Show line number
set number

" Highlight current line
:set cursorline
":hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" space, tab and indent
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
