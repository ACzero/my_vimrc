"local dependency need: the_silver_searcher

filetype plugin indent on
syntax on
colorscheme solarized

set nocompatible
set noswapfile

" number line show
set number

"in order to switch between buffers with unsaved change
set hidden

" hightlight column and line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" support css word with -
autocmd FileType css,scss,slim,html,eruby,coffee,javascript setlocal iskeyword+=-
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" vim 7.4 backspace fix
set backspace=indent,eol,start
set t_Co=256

" grep using ag
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

autocmd BufWritePre * :%s/\s\+$//e

set rtp+=~/.vim/bundle/Vundle.vim

let mapleader= ","

filetype off

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" basic dependence
Plugin 'L9'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
map <leader>s= i<space><esc>ysW=7lx2h
map <leader>s- i<space><esc>ysW-7lx2h
Plugin 'tpope/vim-commentary'

Plugin 'scrooloose/nerdtree'
map <leader>r :NERDTreeFind<cr>
map <leader>e :NERDTreeToggle<cr>
map <leader>p "+p<cr>

Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_clear_cache_on_exit = 0
map <c-o> :CtrlPBuffer<CR>
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Store|git|hg|svn)|(optimized|compiled|node_modules|bower_compenents)$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
endif

" vim-airline plugins, make vim look pretty
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
set noshowmode
let g:airline_theme = 'luna'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

Plugin 'vim-ruby/vim-ruby'
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby compiler ruby

Plugin 'tpope/vim-rails.git'
" vim rails syntax complete, try ctrl+x ctrl+u
set completefunc=syntaxcomplete#Complete

Plugin 'elixir-lang/vim-elixir'

call vundle#end()

filetype on
