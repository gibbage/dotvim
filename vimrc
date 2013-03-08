""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                              "
"                        __   _(_)_ __ ___  _ __ ___                           "
"                        \ \ / / | '_ ` _ \| '__/ __|                          "
"                         \ V /| | | | | | | | | (__                           "
"                          \_/ |_|_| |_| |_|_|  \___|                          "
"                                                                              "
"                                                                              "
"          http://stevenocchipinti.com                                         "
"          https://github.com/stevenocchipinti/dotvim                          "
"                                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Use Vundle to manage plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'bogado/file-line'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'stevenocchipinti/runnermux'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/taglist.vim'
filetype plugin indent on



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           STANDARD VIM SETTINGS                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Colors are good!
syntax on
colorscheme herald
set t_Co=256
"set background=dark


" This will set filetype instead of sourcing a file
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.ino setfiletype cpp


set ts=2 sw=2
set expandtab
set wrap
set backspace=indent,eol,start
set incsearch
set ruler
set wildmenu
set ignorecase
set smartcase
set linebreak
set warn              " Show what mode your in (insert, etc.)
set scrolloff=3       " Number of lines to always show at at the top and bottom
set autoindent        " Copy the indentation from the previous line
set colorcolumn=81    " Highlight the 81st column (shorthand = :set cc=81)
set cursorline        " Highlight the line which the cursor is on
set laststatus=2      " Always show a status bar
set mouse=a           " Make the mouse work - even in terminals
"set smartindent       " Auto indent after newlines, etc.
"set textwidth=80      " This automatically puts chars > 80 on the next line



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        CUSTOMIZED VIM FUNCTIONALITY                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Quicker escaping
imap jk 


" When you dont have write access, :W will write with sudo
" Without this, you could use ':w !sudo tee %'
command! W w !sudo tee % > /dev/null


" Shortcuts to configure folding
map <leader>zs :set foldmethod?
map <leader>zm :set foldmethod=manual
map <leader>zi :set foldmethod=indent
map <leader>zd :set foldmethod=diff
map <leader>z{ :set foldmethod=marker
map <leader>z} :set foldmethod=marker
map <leader>zc :set foldcolumn=1
map <leader>zC :set foldcolumn=4
map <leader>zn :set foldcolumn=0


" Map CTRL+<ARROW> to switch windows
map <C-Down> j
imap <C-Down> j
map <C-Up> k
imap <C-Up> k
map <C-Right> l
imap <C-Right> l
map <C-Left> h
imap <C-Left> h


" Easier way to copy and paste from the global clipboard
map <leader>p "+p
map <leader>y "+y
" Y should act like C and D!
map Y y$


" Replace the last pasted text with the given register
" Poor mans yank ring - only really works for whole lines
map <expr> <leader>v '`[' . strpart(getregtype(), 0, 1) . '`]'
map <expr> <leader>0 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"0P'
map <expr> <leader>1 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"1P'
map <expr> <leader>2 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"2P'
map <expr> <leader>3 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"3P'
map <expr> <leader>4 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"4P'
map <expr> <leader>5 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"5P'
map <expr> <leader>6 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"6P'
map <expr> <leader>7 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"7P'
map <expr> <leader>8 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"8P'
map <expr> <leader>9 '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"9P'
map <expr> <leader>+ '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"+P'
map <expr> <leader>* '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"*P'
map <expr> <leader>: '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d":P'
map <expr> <leader>/ '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"/P'
map <expr> <leader>% '`[' . strpart(getregtype(), 0, 1) . '`]' . '"_d"%P'


" Shortcuts for ruby development and debugging
map <leader>d orequire 'ruby-debug'; debugger
map <leader>D Orequire 'ruby-debug'; debugger



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     CUSTOMIZED EXTERNAL FUNCTIONALITY                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Format JSON - filter the file through Python to format it
map =j :%!python -m json.tool


" Format Ruby Hash - convert to json and run the above python script
map =r :%s/=>/:/g:%!python -m json.tool


" Format XML - filter the file through xmllint to indent XML
map =x :%!xmllint -format -



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" GREP PLUGIN
map <leader>g :Rgrep
map <leader>G :Grep


" ZENCODING PLUGIN - (mnemonic: Helper)
let g:user_zen_leader_key = '<c-h>' " Something that wasn't already used
let g:user_zen_settings = {
\   "indentation": "  ",
\   "ruby": {
\     "snippets": {
\       "debug": "require 'ruby-debug'; debugger"
\     }
\   }
\ }
imap <C-@> <c-h>,


" TAG LIST PLUGIN - show tags (mnemonic: Ctags)
" Show the tags from just the focused file
let g:Tlist_Show_One_File=1
nmap <leader>c :TlistToggle
" Build ctags (requires exuberant-ctags)
nmap <leader>C :!ctags -R .


" TABULAR
vmap <leader><tab>p :Tabularize /\|
vmap <leader><tab>= :Tabularize /=
vmap <leader><tab>: :Tabularize /:


" NERDTREE PLUGIN - (mnemonic: Files)
nmap <leader>f :NERDTreeToggle
nmap <leader>F :NERDTreeFind


" GUNDO PLUGIN - show undo tree (mnemonic: Undo)
map <leader>u :GundoToggle


" POWERLINE PLUGIN
let g:Powerline_symbols='unicode'


" SYNTASTIC PLUGIN
let g:syntastic_mode_map = { 'mode': 'active' }


" CTRL-P PLUGIN
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_user_command = {
\   'types': {
\     1: ['.git/', 'cd %s && git ls-files'],
\     2: ['.hg/', 'hg --cwd %s locate -I .'],
\   },
\   'fallback': 'find %s -type f'
\ }


" FUZZY FINDER PLUGIN (mnemonic: Search-X)
map <leader>sb :FufBuffer
map <leader>sf :FufFile
map <leader>sF :FufFileWithCurrentBufferDir
map <leader>sd :FufDir
map <leader>sD :FufDirWithCurrentBuffer
map <leader>st :FufTag
map <leader>s] :FufTagWithCursorWord
map <leader>sj :FufJumpList
map <leader>sc :FufChangeList
map <leader>sq :FufQuickfix
map <leader>sl :FufLine
map <leader>sh :FufHelp
" See :help fuf-vimrc-example for a full example



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               FUNCTION KEYS                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" F2 - Toggle highlighting for searches (in normal mode)
nmap <F2> :set hls!:set hls?
"set hlsearch


" F3 - Toggle trailing whitespace and tab characters visibility
set list
set listchars=tab:=»,trail:·
nmap <F3> :set list!:set list?


" F4 - Toggle line numbers along the side
nmap <F4> :set nu!:set nu?
set nu


" F5 - Make switching windows easier
nmap <F5> w
imap <F5> wa
nmap <S-F5> W
imap <S-F5> Wa


" F6 - Toggle line wrapping
nmap <F6> :set wrap!:set wrap?


" F7 - Toggle spellcheck
nmap <F7> :set spell!:set spell?


" F8 - Toggle diff view (need to toggle on both desired buffers)
nmap <F8> :set diff! scb!:set diff?
