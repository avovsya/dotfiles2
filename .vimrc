"  "Bundles"  {{{1
" ----------------------------------------------"
set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Testing plugin {{{2
Plugin 'jgdavey/tslime.vim'
"

Plugin 'gmarik/vundle.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-scripts/sessionman.vim.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'vim-scripts/IndexedSearch.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/scratch.vim.git'
Plugin 'vim-scripts/bufkill.vim.git'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'Raimondi/delimitMate'
Plugin 'tmhedberg/matchit'
Plugin 'honza/vim-snippets'
Plugin 'bilalq/lite-dfm'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-unimpaired'
" Text objects for indentation object vii/vai
Plugin 'git://github.com/austintaylor/vim-indentobject.git'
" Show indent guides
Plugin 'Yggdroot/indentLine'

" Javascript
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'jamescarr/snipmate-nodejs' " Snippets for Node.js
Plugin 'marijnh/tern_for_vim' " Js parser
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'maksimr/vim-jsbeautify' " Javascript beautifier
Plugin 'einars/js-beautify'

" Syntax
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'briancollins/vim-jst'
Plugin 'digitaltoad/vim-jade.git'

" Colorschemes
Plugin 'w0ng/vim-hybrid'

"  "General"  {{{1
" ----------------------------------------------"
syntax on
filetype plugin indent on

set hidden                     " Do not unload buffer, while switching to another one
set noerrorbells               " No beeps
set novisualbell
"set relativenumber
set number                     " Show line numbers
set backspace=indent,eol,start " Makes backspace key more powerful.
set showcmd                    " Show me what I'm typing
set showmode                   " Show current mode.
set confirm                    " Enable confirmation dialogs
set wildmenu                   " Показывать меню в командной строке

set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set encoding=utf-8             " Set default encoding to UTF-8
set autoread                   " Automatically reread changed files without asking me anything
set laststatus=2
set list                       " подсвечивать некоторые символы <leader>ii to toggle

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

" Move beyond actual end of the line. If set to 1 = one more column at the end
" of the line
set virtualedit=onemore

" To work this with TMUX requires 'reattach-to-user-namespace'
" plugin. See https://www.evernote.com/shard/s142/nl/15443303/c66a1bf1-1c5f-4433-8312-aa9076607552/
set clipboard+=unnamed " Use system clipboard
if has("unnamedplus")
    set clipboard=unnamed,unnamedplus
endif

set scrolloff=5

"  "FileTypes"  {{{1
" ----------------------------------------------"
au FileType javascript call JavaScriptFold()

"  "Sessions"  {{{1
" ----------------------------------------------"
" Set cursor to the previous position while opening file
autocmd BufReadPost * call SetCursorPosition()

set sessionoptions=curdir,buffers,folds,tabpages,winpos,help,blank,resize,winpos,winsize " Опции сессий
set sessionoptions+=unix,slash                                                           " Опции помогают переносить файлы сессий с *nix`ов в ms-windows и наоборот

"  "Line" wrap  {{{1
" ----------------------------------------------"
" Hard line wrap
set textwidth=80
set formatoptions=
set formatoptions=rcqln " auto-wrap comments

"  "Terminal modifications"  {{{1
" ----------------------------------------------"
set t_Co=256	" 256 colors in terminal
set ttyfast
set lazyredraw

"Airline
"Q. There is a pause when leaving insert mode.
"A. Add the following to your vimrc.  >
set ttimeoutlen=50

"  "GUI modifications (color, shortcuts, etc.. "  {{{1
" ----------------------------------------------"
" Установка символов для подсветки
set fillchars=fold:·,vert:\|
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:×

" Show ↪ at the beginning of wrapped lines
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif
set background=dark

" Set interface language to English
language mes C

set background=dark
colorscheme hybrid

if has("gui_macvim")
    " No toolbars, menu or scrollbars in the GUI
    set guifont=Anonymous\ Pro:h18
    set vb t_vb=
    set guioptions-=m  "no menu
    set guioptions-=T  "no toolbar
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r  "no scrollbar
    set guioptions-=R
    set guioptions+=c " use console dialogs

    set cursorline
    set colorcolumn=80
endif

"  "Mappings"  {{{1
" ----------------------------------------- "
let mapleader=","

" Fix Vim’s horribly broken default regex “handling” by automatically inserting a \v before any string you search for.
" This turns off Vim’s crazy default regex characters and makes searches use normal regexes.
nnoremap / /\v
vnoremap / /\v

cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>

nmap n nzz
nmap N Nzz
nmap g* g*zz
nmap g# g#zz
nmap * *zz
nmap # #zz

inoremap jk <Esc>
snoremap jk <Esc>

nnoremap <silent><Esc> :nohlsearch<CR><ESC>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Ctrl+S
map <C-s> <esc>:w<CR>
imap <C-s> <C-o>:w<CR>
"
" Yank to the end of the line
nnoremap Y y$

noremap j gj
noremap k gk
noremap gj j
noremap gk k

"  Quick edit  {{{2
" ***************************************** "

" ,ev open _vimrc in new tab
nmap <leader>ev :e $MYVIMRC<CR>
"
" ,ei open gitignore in new tab
nmap <leader>ei :e .gitignore<CR>

" ,es Scratch buffer
nmap <leader>es :Sscratch<cr>

"  Splits and buffers  {{{2
" ***************************************** "

" Создаем пустой сплит относительно текущего
"nmap <Leader><Bar> :vnew <bar> set nobuflisted<CR>
"nmap <Leader>- :rightbelow new <bar> set nobuflisted<CR>
nmap <Leader>\ :rightbelow vnew <bar> set nobuflisted<CR>
nmap <Leader>_ :new <bar> set nobuflisted<CR>

" Quick window resizing
map <C-k> 2<C-w>>
map <C-j> 2<C-w><
map <C-m> 2<C-w>+
map <C-n> 2<C-w>-

" Wipeout buffer but save split
nmap <leader>q :call SmartExit()<CR>
" Wipeout buffer and close split
nmap<leader>w :bw<CR>

"  Utilities  {{{2
" ***************************************** "
noremap K f<Space>s<CR><Esc>

" Show hidden chars
nmap <Leader>ii :call ToggleListChars()<cr>
map <leader>ig :IndentLinesToggle<cr>

map <Leader>gw :set invwrap<CR>
map <leader>gg :GitGutterToggle<cr>

" Reformat whole file
map <leader>f= gg=G``

" Remove trailing spaces
map <Leader>f<Space> :%s/\s\+$//<cr>''

" Replace multiple empty lines with one
map <leader>fl :silent %!cat -s<Return>

" Tabularize lines
map <Leader>ft :Tabularize /

"  "Functions"  {{{1
" ----------------------------------------- "
function! ToggleListChars()
    if &list==1
        :set nolist
    else
        :set list
    endif
endfunction

function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" http://stackoverflow.com/questions/6552295/deleting-all-empty-buffers-in-vim
function! DeleteEmptyBuffers()
    let empty = []
    let [i, n] = [1, bufnr('$')]
    while i <= n
        if bufexists(i) && bufname(i) == ''
            call add(empty, i)
        endif
        let i += 1
    endwhile
    if len(empty) > 0
        exe 'bdelete' join(empty, ' ')
    endif
endfunction

function! CountListedBuffers()
    let cnt = 0
    for nr in range(1,bufnr("$"))
        if buflisted(nr)
            let cnt += 1
        endif
    endfor
    return cnt
endfunction

function! SmartExit()
    let s:BufferToKill = bufnr('%')
    let s:EmptyBuffer = 0

    if bufname('%') == '' && ! &modified && &modifiable
        if &buftype == 'nofile' && &swapfile == 0
            " Is scratch buffer, not empty
        else
            let s:EmptyBuffer = 1
        endif
    endif

    " Get a list of all windows which have this buffer loaded
    let s:WindowListWithBufferLoaded = []
    let i = 1
    let buf = winbufnr(i)
    while buf != -1
        if buf == s:BufferToKill
            let s:WindowListWithBufferLoaded += [i]
        endif
        let i = i + 1
        let buf = winbufnr(i)
    endwhile

    " Check that the buffer is last
    if(CountListedBuffers() < 2)
        let s:LastBuffer = 1
    else
        let s:LastBuffer = 0
    endif

    if s:LastBuffer
        if len(s:WindowListWithBufferLoaded) > 1
            execute "close"
        else
            if ! s:EmptyBuffer
                execute "bw | bw"
            else
                execute "q"
            endif
        endif
    else
        let g:BufKillActionWhenBufferDisplayedInAnotherWindow="kill"
        execute "BW"
        let g:BufKillActionWhenBufferDisplayedInAnotherWindow="confirm"
    endif
endfunction

"  "Plugin configs"  {{{1
" ----------------------------------------- "
"  Lite FDM(distraction free mode)  {{{2
" ***************************************** "
nnoremap <Leader>d :LiteDFMToggle<CR>:silent !tmux set status<CR>
"  delimitMate  {{{2
" ***************************************** "
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

"  CtrlP  {{{2
" ***************************************** "
let g:ctrlp_cmd = 'CtrlPMixed'			" search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 0		" show the match window at the top of the screen
let g:ctrlp_by_filename = 0     " Search only by file name, Can be toggled by Ctrl-d
let g:ctrlp_max_height = 10				" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
let g:ctrlp_use_caching = 1				" enable caching
let g:ctrlp_clear_cache_on_exit=0  		" speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 				" number of recently opened files
let g:ctrlp_custom_ignore = {
            \ 'dir':  'node_modules\|DS_Store\|git\|hg\|svn',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }

nmap <C-f> :CtrlPMRU<cr>
imap <C-f> <esc>:CtrlPMRU<cr>

nmap <C-p> :CtrlPMRU<cr>
imap <C-p> <esc>:CtrlPMRU<cr>

nmap <C-b> :CtrlPBuffer<cr>
imap <C-b> <esc>:CtrlPBuffer<cr>

"  NERDTree  {{{2
" ***************************************** "
let NERDTreeWinPos = 'right'
let NERDTreeIgnore = ['\~$', '*.pyc', '*.pyo']

nnoremap <Bs> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=0
let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.

"  Syntastic  {{{2
" ***************************************** "
let g:syntastic_enable_signs = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_check_on_open = 1

"  Airline  {{{2
" ***************************************** "
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''

"  YouCompleteMe  {{{2
" ***************************************** "
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Disable preview window of completion
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"  SessionMan  {{{2
" ***************************************** "
nmap <Leader>sl : SessionList<cr>
nmap <Leader>ss : SessionSave<cr>
nmap <Leader>sS : SessionSaveAs<cr>

"  Ultisnips  {{{2
" ***************************************** "
let g:UltiSnipsExpandTrigger="<c-j>"

"  JS Beautifier  {{{2
" ***************************************** "
autocmd FileType javascript nnoremap <buffer>  <leader>ff :call JsBeautify()<cr>
autocmd FileType html nnoremap <buffer> <leader>ff :call HtmlBeautify()<cr>
autocmd FileType css nnoremap <buffer> <leader>ff :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <leader>ff :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>ff :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>ff :call RangeCSSBeautify()<cr>
"  Indent guides {{{2
" ***************************************** "
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
"  TSlime {{{2
" ***************************************** "
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
" ----------------------------------------------"
"  }}}  {{{1
" vim: foldenable fdm=marker fdc=2 foldlevelstart=0 sts=4 sw=4 tw=64
" fileencoding=utf-8
" " }}}
