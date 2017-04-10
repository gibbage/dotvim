set nocompatible                  " Must come first because it changes other options.
filetype off                      " For Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'

" Easily comment out source code
Bundle 'tpope/vim-commentary'
" Fuzzy file/buffer/mru/tag finder
Bundle 'kien/ctrlp.vim'
" Show git changes in gutter
Bundle 'airblade/vim-gitgutter'
" Fancy status bar
Bundle 'bling/vim-airline'
" JSON highlighting
Bundle 'elzr/vim-json'
" Integration with Dash
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
" File explorer
Bundle 'scrooloose/nerdtree'
" Use Ag for searching in files within Vim
Bundle 'rking/ag.vim'

filetype plugin indent on         " Turn on file type detection.
syntax enable                     " Turn on syntax highlighting.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set clipboard=unnamed

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.
set cursorline                    " Highlight the current line.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set history=1000                  " Remember more commands
set undolevels=1000               " Undo all the things!

set showmatch                     " Show matching parenthesis
set list                          " Show end of line/whitespace chars.
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=4                     " Global tab width.
set shiftwidth=4                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set autoindent                    " Copy the indentation from the previous line
set colorcolumn=80                " Add the vertical line limit indicator
" highlight ColorColumn ctermbg=174 " Change the colour of the colorcolumn

set laststatus=2                  " Show the status line all the time
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set encoding=utf-8
" set guifont=Monaco-Powerlinefdsfdsfdsf

" COLOURS
let &t_Co=256
colorscheme jellybeans

" Change leader key
let mapleader=","

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>/ :nohlsearch<CR>   " Remove search higlights with / char.

" Buffers
" Jump between open buffers
nmap <silent> <leader>k :bp<CR>
nmap <silent> <leader>j :bn<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

" Involk CtrlP plugin by actual using Ctrl-P keys.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'

set pastetoggle=<F2>                " Easy toggle for paste mode.

" Controversial...swap colon and semicolon for easier commands
nnoremap ; :

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" let g:Powerline_symbols='unicode'

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " unlet g:ctrlp_user_command
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" NERDTree configs
map <leader>n :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
" let g:NERDTreeMapActivateNode="<F3>"

" VDebug config
" let g:vdebug_options['server'] = 'local.1form.com'
" let g:vdebug_options['port'] = 9000
" let g:vdebug_options['path_maps'] = {"/home/user/scripts": "/home/jon/php"}

" GitGutter config
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0

" Ag config
if executable('ag')
  let g:ag_working_path_mode="r"
  " bind K to grep word under cursor
  nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PROJECT DEBUGGING                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *1form-app/* let g:vdebug_options['path_maps'] = {"/home/vagrant/": "/Users/shane.gibb/projects/rea/1form/"}
