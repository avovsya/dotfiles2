"  "Bundles"  {{{1
" ----------------------------------------------"
set nocompatible
filetype off

"  "General"  {{{1
" ----------------------------------------------"
syntax on
filetype plugin indent on

set hidden                     " Do not unload buffer, while switching to another one
set noerrorbells               " No beeps
set novisualbell

set number                     " Show line numbers
set backspace=indent,eol,start " Makes backspace key more powerful.
set showcmd                    " Show me what I'm typing
set showmode                   " Show current mode.
set confirm                    " Enable confirmation dialogs
set wildmenu                   " Показывать меню в командной строке

set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set encoding=utf-8             " Set default encoding to UTF-8

set laststatus=2
set list                       " подсвечивать некоторые символы

set autoindent                 " Наследовать отступы предыдущей строки
set smartindent                " Включить 'умные' отступы
set expandtab                  " Преобразование таба в пробелы
set shiftwidth=2               " Размер табуляции по умолчанию
set softtabstop=2
set tabstop=2

set fileformats=unix,dos,mac   " Prefer Unix over Windows over OS 9 formats

set undolevels=5000
set undodir=~/.vim/undodir
set undofile

set showmatch                  " Do not show matching brackets by flickering

set incsearch                  " Shows the match while typing
set hlsearch                   " Highlight found searches

set ignorecase                 " Search case insensitive...
set smartcase                  " ... but not when search pattern contains upper
                               " case characters
set gdefault                   " 'g' flag for all commands like :%s/a/b
set ruler                      " Включение отображения позиции курсора (всё время)
set nowrap

set sidescroll=4

set mouse=a                    " Подключение мыши
set mousehide                  " Прятать указатель во время набора текста

set shortmess+=I               " Отключение приветственного сообщения

" To work this with TMUX requires 'reattach-to-user-namespace'
" plugin. See https://www.evernote.com/shard/s142/nl/15443303/c66a1bf1-1c5f-4433-8312-aa9076607552/
set clipboard+=unnamed " Use system clipboard
if has("unnamedplus")
    set clipboard=unnamed,unnamedplus
endif

" Hard line wrap
set textwidth=80
set formatoptions=
set formatoptions=rcqln " auto-wrap comments

set scrolloff=5

"  "Folding"  {{{1
" ----------------------------------------------"
set foldlevelstart=99 " Open all folds on start
set foldnestmax=3
set foldtext=CustomFoldText()

"  "Sessions"  {{{1
" ----------------------------------------------"
" Set cursor to the previous position while opening file
autocmd BufReadPost * call SetCursorPosition()

set sessionoptions=curdir,buffers,folds,tabpages,winpos,help,blank,resize,winpos,winsize " Опции сессий
set sessionoptions+=unix,slash                                                           " Опции помогают переносить файлы сессий с *nix`ов в ms-windows и наоборот
"  "FileTypes"  {{{1
" ----------------------------------------------"

" augroup configgroup
"     autocmd!
"     autocmd BufEnter *.zsh-theme setlocal filetype=zsh
"     autocmd BufEnter Makefile setlocal noexpandtab

"     autocmd FileType javascript call JavaScriptFold() | set foldlevelstart=99
" augroup END

"  "GUI modifications (color, shortcuts, etc.. )"  {{{1
" ----------------------------------------------"
" Установка символов для подсветки
set fillchars=fold:·,vert:\|
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:×,eol:¬

set background=dark

" Set interface language to English
language mes C

set background=dark
colorscheme wombat

set t_Co=256	" 256 colors in terminal
set ttyfast

"  "Mappings"  {{{1
" ----------------------------------------- "
"  General {{{2
" ***************************************** "
let mapleader="<SPC>"

" Expand %% in command line to current file path
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

nmap n nzz
nmap N Nzz
nmap g* g*zz
nmap g# g#zz
nmap * *zz
nmap # #zz

inoremap jk <Esc>
snoremap jk <Esc>
inoremap fd <Esc>
snoremap fd <Esc>

nnoremap <Leader><Leader> :nohlsearch<CR><ESC>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Yank to the end of the line
nnoremap Y y$

noremap j gj
noremap k gk
noremap gj j
noremap gk k

"  Splits and buffers  {{{2
" ***************************************** "
nmap <C-w>v :rightbelow vnew <bar> set nobuflisted<CR>
nmap <C-w>s :rightbelow new <bar> set nobuflisted<CR>

" Quick window resizing
map <C-k> 2<C-w>+
map <C-j> 2<C-w>-
map <C-h> 2<C-w><
map <C-l> 2<C-w>>

"  "Functions"  {{{1
" ----------------------------------------- "
" Return to prev position in file, after reopen
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

fu! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
     let line = getline(v:foldstart)
    else
     let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    "let foldLevelStr = repeat("+--", v:foldlevel)
    let foldLevelStr = repeat("+-", v:foldlevel - 1)
    let lineCount = line("$")
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr))
    "return line . expansionString . foldSizeStr . foldLevelStr
    return foldLevelStr . line . expansionString . foldSizeStr
endf
" " }}}
