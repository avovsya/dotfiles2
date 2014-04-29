" .vimrc
" ----------------------------------------------"
" Bundles
" ----------------------------------------------"
set nocompatible                "Turn off compability mode with Vi, we don't need that anymore
filetype off " required

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Test plugins ---------------------------------"
Plugin 'tpope/vim-vinegar'
" Insert closing brackets and parens
Plugin 'Raimondi/delimitMate'
" Jump with % between tags and etc
Plugin 'tmhedberg/matchit'
" Snippets for UltiSnips
Plugin 'honza/vim-snippets'
" ----------------------------------------------"

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
Plugin 'vim-scripts/YankRing.vim.git'
Plugin 'vim-scripts/diffchanges.vim.git'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/scratch.vim.git'
Plugin 'vim-scripts/bufkill.vim.git'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'

" Syntax
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script.git'
"
"Plugin 'jelera/vim-javascript-syntax.git'
" Experimental javascript syntax plugin
Plugin 'pangloss/vim-javascript'

" EJS templates
Plugin 'briancollins/vim-jst'
Plugin 'digitaltoad/vim-jade.git'

" Colorschemes
Plugin 'git://github.com/altercation/vim-colors-solarized.git'

" Misc

" ----------------------------------------------"
" General
" ----------------------------------------------"
syntax on
filetype plugin indent on

set hidden                      " Do not unload buffer, while switching to another one
set noerrorbells                " No beeps
set novisualbell
"set relativenumber
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set confirm                     " Enable confirmation dialogs
set wildmenu                    " Показывать меню в командной строке

set noswapfile                  " Don't use swapfile
set nobackup            		" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set nolist          " Не подсвечивать некоторые символы

set autoindent                          " Наследовать отступы предыдущей строки
set smartindent                         " Включить 'умные' отступы
set expandtab                           " Преобразование таба в пробелы
set shiftwidth=2                        " Размер табуляции по умолчанию
set softtabstop=2
set tabstop=2

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set undolevels=5000
set undodir=~/.vim/undodir
set undofile

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set gdefault                    " 'g' flag for all commands like :%s/a/b
set ruler       " Включение отображения позиции курсора (всё время)
set nowrap

set mouse=a     " Подключение мыши
set mousehide   " Прятать указатель во время набора текста

set shortmess+=I    " Отключение приветственного сообщения

" Move beyond actual end of the line. If set to 1 = one more column at the end of the line
"set virtualedit=all
set virtualedit=onemore

" ----------------------------------------------"
" Sessions
" ----------------------------------------------"
set sessionoptions=curdir,buffers,folds,tabpages,winpos,help,blank,resize,winpos,winsize " Опции сессий
set sessionoptions+=unix,slash                                                           " Опции помогают переносить файлы сессий с *nix`ов в ms-windows и наоборот

" ----------------------------------------------"
" Line wrap
" ----------------------------------------------"
command! -nargs=* Wrap set wrap linebreak nolist | set showbreak=↳
" execute "Wrap"

" Hard line wrap
set textwidth=80
set formatoptions=
set formatoptions=rcqln " auto-wrap comments

" ----------------------------------------------"
" Terminal modifications
" ----------------------------------------------"
set t_Co=256	" 256 colors in terminal
set ttyfast
set lazyredraw

"Airline
"Q. There is a pause when leaving insert mode.
"A. Add the following to your vimrc.  >
set ttimeoutlen=50

" ----------------------------------------------"
" GUI modifications (color, shortcuts, etc.. "
" ----------------------------------------------"
" Установка символов для подсветки
set fillchars=fold:·,vert:\|
set listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:×
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
set background=dark
"let g:solarized_termtrans=1
let g:solarized_termcolors=256

" Set interface language to English
language mes C

colorscheme solarized
highlight SignColumn guibg=#272822

if has("gui_macvim")
    " No toolbars, menu or scrollbars in the GUI
    set guifont=Anonymous\ Pro:h18
    set clipboard+=unnamed
    set vb t_vb=
    set guioptions-=m  "no menu
    set guioptions-=T  "no toolbar
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r  "no scrollbar
    set guioptions-=R
endif

" ----------------------------------------- "
" Mappings
" ----------------------------------------- "
let mapleader=","

set pastetoggle=<Leader>p

inoremap jk <Esc>
snoremap jk <Esc>

nnoremap <silent><Leader><Space> :nohlsearch<CR><ESC>

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Ctrl+S
map <C-s> <esc>:w!<CR>
imap <C-s> <C-o>:w!<CR>

" ***************************************** "
" Quick edit
" ***************************************** "

" ,ev open _vimrc in new tab
nmap <leader>ev :e $MYVIMRC<CR>
"
" ,ei open gitignore in new tab
nmap <leader>ei :e .gitignore<CR>

" ,es Scratch buffer
nmap <leader>es :Sscratch<cr>

" ***************************************** "
" Reset default mappings
" ***************************************** "

" Yank to the end of the line
nnoremap Y y$

noremap j gj
noremap k gk
noremap gj j
noremap gk k

noremap K f<Space>s<CR><Esc>

" ***************************************** "
" Splits and buffers
" ***************************************** "

" Создаем пустой сплит относительно текущего
nmap <Leader><Bar> :vnew <bar> set nobuflisted<CR>
nmap <Leader>\ :rightbelow vnew <bar> set nobuflisted<CR>
nmap <Leader>- :rightbelow new <bar> set nobuflisted<CR>
nmap <Leader>_ :new <bar> set nobuflisted<CR>

nmap <Leader>h :bp<CR>
nmap <Leader>l :bn<CR>

" Resize window
noremap <Up> 5<C-W>+
noremap <Down> 5<C-W>-
noremap <Left> 5<C-W><
noremap <Right> 5<C-W>>
noremap <Leader>= <C-W>=

" Wipeout buffer but save split
nmap <Leader>qq :call SmartExit()<CR>
" Wipeout buffer and close split
nnoremap <Leader>bw :bw<CR>
" Close all
nmap <Leader>qa :qa<CR>

" ***************************************** "
" Utilities
" ***************************************** "

" Show hidden chars
nmap <Leader>i :call ToggleListChars()<cr>

map <Leader>gw :set invwrap<CR>

" Reformat whole file
nmap <Leader>ff gg=G''

" Remove trailing spaces
nmap <Leader>f<Space> :%s/\s\+$//<cr>''

" Replace multiple empty lines with one
nmap <Leader>fl :g/^$/,/./-j<Return>,<Space>''

" Tabularize lines
vmap <Leader>ft :Tabularize /

" ----------------------------------------- "
" Functions 		    			        "
" ----------------------------------------- "

function! ToggleListChars()
    if &list==1
        :set nolist
    else
        :set list
    endif
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


" ----------------------------------------- "
" Plugin configs    		    			"
" ----------------------------------------- "

" ***************************************** "
" dilimitMate
" ***************************************** "
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1


" ***************************************** "
" CtrlP
" ***************************************** "
let g:ctrlp_cmd = 'CtrlPMixed'			" search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 0		" show the match window at the top of the screen
let g:ctrlp_by_filename = 0
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

"nmap <C-x><C-f> <esc>:CtrlPMixed<cr>
"imap <C-x><C-f> <esc>:CtrlPMixed<cr>

" ***************************************** "
" NERDTree
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

" ***************************************** "
" Syntastic
" ***************************************** "
let g:syntastic_enable_signs = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'

" ***************************************** "
" Airline
" ***************************************** "
" Disable tabline, it's distracting
" Try to use buff switching instead with Ctrl-P
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='¦'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

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
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

" ***************************************** "
" YouCompleteMe
" ***************************************** "
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" ***************************************** "
" SessionMan
" ***************************************** "
nmap <Leader>sl : SessionList<cr>
nmap <Leader>ss : SessionSave<cr>
nmap <Leader>sS : SessionSaveAs<cr>

" ***************************************** "
" UltiSnips
" ***************************************** "
"function! g:UltiSnips_Complete()
    "call UltiSnips_ExpandSnippet()
    "if g:ulti_expand_res == 0
        "if pumvisible()
            "return "\<C-j>"
        "else
            "call UltiSnips_JumpForwards()
            "if g:ulti_jump_forwards_res == 0
                "return "\<TAB>"
            "endif
        "endif
    "endif
    "return ""
"endfunction

"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips-snippets"]

let g:UltiSnipsExpandTrigger="<c-j>"
" ***************************************** "
" YankRing
" ***************************************** "
let g:yankring_replace_n_pkey = '<Leader>j'
let g:yankring_replace_n_nkey = '<Leader>k'
" ***************************************** "
" Javascript-syntax
" ***************************************** "
let g:javascript_conceal = 1
" ----------------------------------------------"
" THE END }}}
" ----------------------------------------------"
