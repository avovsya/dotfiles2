"  "Bundles"  {{{1
" ----------------------------------------------"
set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

" Testing plugin {{{2

" Note taking
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
" }}}
Plugin 'gmarik/vundle.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'vim-scripts/IndexedSearch.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/bufkill.vim.git'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'Raimondi/delimitMate'
Plugin 'tmhedberg/matchit'
Plugin 'avovsya/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-unimpaired'
Plugin 'takac/vim-hardtime'
Plugin 'kshenoy/vim-signature'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" Text objects for indentation object vii/vai
Plugin 'git://github.com/austintaylor/vim-indentobject.git'
" Show indent guides
Plugin 'Yggdroot/indentLine'

" Javascript
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim' " Js parser
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'maksimr/vim-jsbeautify' " Javascript beautifier
Plugin 'einars/js-beautify'

" Colorschemes
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'w0ng/vim-hybrid'

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
"set autoread                   " Automatically reread changed files without asking me anything

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

" Move beyond actual end of the line. If set to 1 = one more column at the end
" of the line
set virtualedit=onemore

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

"  "FileTypes"  {{{1
" ----------------------------------------------"

augroup configgroup
    autocmd!
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md call StripTrailingWhitespaces()
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab

    autocmd FileType javascript call JavaScriptFold() | set foldlevelstart=99
augroup END

"  "GUI modifications (color, shortcuts, etc.. )"  {{{1
" ----------------------------------------------"
" Установка символов для подсветки
set fillchars=fold:·,vert:\|
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:×,eol:¬

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Show ↪ at the beginning of wrapped lines
if has("linebreak")
    let &sbr = nr2char(8618).' '
endif
set background=dark

" Set interface language to English
language mes C

set background=dark
colorscheme hybrid

set t_Co=256	" 256 colors in terminal
set ttyfast

"Airline
"Q. There is a pause when leaving insert mode.
"A. Add the following to your vimrc.  >
set ttimeoutlen=50

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
"  General {{{2
" ***************************************** "
let mapleader=","

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

"  Quick edit  {{{2
" ***************************************** "
" ,ev open _vimrc in new tab
map <leader>ev :e $MYVIMRC<CR>

" ,ew open file in same directory as current file
map <leader>ew :e %%

map <leader>ed :NERDTreeFind<CR>

" ,ei open gitignore in new tab
map <leader>ei :e .gitignore<CR>


"  Splits and buffers  {{{2
" ***************************************** "

nmap <Leader>q :BW<CR>

nmap <C-w>v :rightbelow vnew <bar> set nobuflisted<CR>
nmap <C-w>s :rightbelow new <bar> set nobuflisted<CR>

" Quick window resizing
map <C-k> 2<C-w>+
map <C-j> 2<C-w>-
map <C-h> 2<C-w><
map <C-l> 2<C-w>>

"  Utilities  {{{2
" ***************************************** "
map <leader>gd :Goyo<CR>
map <Leader>gw :set invwrap<CR>
map <leader>gg :GitGutterToggle<cr>

" Remove trailing spaces
map <Leader>f<Space> :call StripTrailingWhitespaces()<CR>

" Replace multiple empty lines with one
map <leader>fl :silent %!cat -s<Return>

"  "Functions"  {{{1
" ----------------------------------------- "
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
fu! StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endf

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

"  "Plugin configs"  {{{1
" ----------------------------------------- "
"  "Vim-notes" {{{2
" ***************************************** "
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_suffix = '.txt'
"let g:notes_smart_quotes = 0

"  "Goyo and LimeLight" {{{2
" ***************************************** "
let g:goyo_margin_top=0
let g:goyo_margin_bottom=0

fu! s:goyo_enter()
    Limelight
    set nonu
    set fullscreen
    set scrolloff=999
    set linespace=4
endfu

fu! s:goyo_leave()
    Limelight!
    set nu
    set nofullscreen
    set scrolloff=5
    set linespace=0
endfu

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd  User GoyoEnter call <SID>goyo_enter()
autocmd  User GoyoLeave call <SID>goyo_leave()

"  "Hard Time" {{{2
" ***************************************** "
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
let g:hardtime_ignore_quickfix = 1
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2

let g:list_of_normal_keys = [ "h", "j", "k", "l" ]
let g:list_of_visual_keys = [ "h", "j", "k", "l" ]

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

nmap <C-p> :CtrlPRoot<cr>
imap <C-p> <esc>:CtrlPRoot<cr>

nmap <C-b> :CtrlPBuffer<cr>
imap <C-b> <esc>:CtrlPBuffer<cr>

"  NERDTree  {{{2
" ***************************************** "
let NERDTreeWinPos = 'left'
let NERDTreeIgnore = ['\~$', '*.pyc', '*.pyo']

nnoremap <Bs> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
"let NERDTreeQuitOnOpen=1
let NERDTreeQuitOnOpen=0
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

" disable Gitgutter signs in airline
let g:airline_enable_hunks = 0

"  YouCompleteMe  {{{2
" ***************************************** "
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Disable preview window of completion
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

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
"let g:indentLine_char = '┆'
let g:indentLine_char = '|'
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'

" ----------------------------------------------"
"  }}}  {{{1
" vim: foldenable fdm=marker fdc=2 foldlevelstart=0 sts=4 sw=4 tw=64
" fileencoding=utf-8
" " }}}
