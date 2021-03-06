set shell=/bin/sh
let mapleader = ','
set nocompatible               " Be iMproved
"set noimdisable
"autocmd! InsertLeave * set imdisable|set iminsert=1
"autocmd! InsertEnter * set noimdisable|set iminsert=1

let NERDTreeHijackNetrw = 0
filetype off

call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-scripts/molokai'
Plug 'kien/ctrlp.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'mmalecki/vim-node.js'
Plug 'vim-ruby/vim-ruby'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmhedberg/matchit'
Plug 'scrooloose/nerdtree'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
" Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'thoughtbot/vim-rspec'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rking/ag.vim'
Plug 'Yggdroot/indentLine'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
" vuejs vue file
Plug 'darthmall/vim-vue'
call plug#end()

filetype plugin indent on

set t_Co=256
set mouse=a
set laststatus=2
color molokai
nmap zz ZZ
nmap <Space> :
"Vim indentLine
let g:indentLine_color_term = 239
" splitjoin
nmap gs gS
nmap gj gJ
" tcomment_vim
map <leader>c<space> gcc<esc>

au BufRead,BufNewFile {*.json.jbuilder,Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>f :normal! gg=G``<CR>

" cd to the directory containing the file in the buffer
"nmap <silent> <leader>cd :lcd %:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
"nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
"nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
"nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
"nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>
nmap <leader>bi :Dispatch bundle install<CR>
nmap <leader>q :wq<CR>

""
""Plugin Mapping
""

" rails.vim rspec jump
nmap <Leader>a :A<CR>
nmap Y y$

" Easy window navigation
map <C-b>h <C-w>h
map <C-b>j <C-w>j
map <C-b>k <C-w>k
map <C-b>l <C-w>l

"let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
      \ }

nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gl :Dispatch git pull<CR>

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
map <silent> <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>

" let g:syntastic_enable_signs = 1
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = [ 'mri']
" scss and sass slow open and save
" let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss'] }


let g:ale_sign_column_always = 1
let g:ale_sign_warning = '--'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" RSpec.vim mappings
map <Leader>tt :call RunCurrentSpecFile()<CR>
map <Leader>ts :call RunNearestSpec()<CR>
map <Leader>tl :call RunLastSpec()<CR>
map <Leader>ta :call RunAllSpecs()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

""
"" Basic Setup
""

set number            " Show line numbers
set numberwidth=5
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0
set visualbell                  "No sounds
set noerrorbells         " don't beep
set autoread                    "Reload files changed outside vim
"set hidden        " Allow un-saved buffers in background
set clipboard=unnamed " Share system clipboard.
"set fileencodings=utf8,cp936,gb18030,big5

"set splitright                  " Puts new vsplit windows to the right of the current
"set splitbelow                  " Puts new split windows to the bottom of the current

""
"" Whitespace
""

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb
set nowrap                        " don't wrap lines
set backspace=indent,eol,start    " backspace through everything in insert mode
" ================ Indentation ======================

set autoindent
set copyindent    " copy the previous indentation on autoindenting
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


" Display tabs and trailing spaces visually
set list listchars=tab:»\ ,trail:·

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter


""
"" Wild settings
""

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

if has("gui_running")
  set guioptions-=m
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
  set guioptions-=b
  set showtabline=0
  set guifont=Monaco\ for\ Powerline:h16,Inconsolata\ for\ Powerline:h14,Consolas:h14
  set shell=/bin/zsh
end

"""
"""windows setting
"""
if has("win32")
  "language messages zh_CN.utf-8
  " set the menu & the message to English
  set langmenu=en
  let $LANG= 'en'
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  set guifont=Monaco\ for\ Powerline:h16,Inconsolata\ for\ Powerline:h12,Consolas:h12
  "set guifont=Monaco\ for\ Powerline:h14,Ubuntu\ Mono\ derivative\ Powerline:h13,Consolas:h12
  set gfw=YouYuan:h14,Microsoft_Yahei:h14
  set fileformat=unix
end

let g:airline_powerline_fonts=1
let g:airline_theme = 'powerlineish'
"
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ }
set diffopt+=vertical

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-b> <C-\><C-n>
  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l
else
  set encoding=utf8
end

" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1
let g:javascript_ignore_javaScriptdoc = 1
