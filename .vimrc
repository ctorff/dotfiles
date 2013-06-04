" clear all existing autocommands
autocmd!

" get hostname for host-dependent configuration
let hostname = substitute(system('hostname'), '\n', '', '')


" --- Vundle setup ------------------------------------------------ Plugins ---
" copied from here: https://github.com/fisadev/fisa-vim-config

set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles (run :BundleInstall or :BundleUpdate after changes)

" let Vundle manage Vundle. required!
Bundle 'gmarik/vundle'

" Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
"Bundle 'MarcWeber/UltiSnips'

Bundle "project.tar.gz"
"Bundle "jceb/vim-orgmode"
"Bundle "hsitz/VimOrganizer"

" Git diff icons on the side of the file lines
"Bundle 'airblade/vim-gitgutter'
" Relative numbering of lines in normal mode
Bundle 'myusuf3/numbers.vim'

" Autocompletion
"Bundle 'AutoComplPop'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" Python code checker
Bundle 'pyflakes.vim'
" Class/module browser
Bundle 'majutsushi/tagbar'

" Search results counter
Bundle 'IndexedSearch'

" Gvim colorscheme
Bundle 'Wombat'
" 256 color terminal colorscheme
Bundle 'Zenburn'
Bundle 'Solarized'

" Python and PHP Debugger
"Bundle 'fisadev/vim-debug.vim'
" Better file browser
"Bundle 'scrooloose/nerdtree'
" Code commenter
"Bundle 'scrooloose/nerdcommenter'
" Code and files fuzzy finder
"Bundle 'kien/ctrlp.vim'
" Zen coding
"Bundle 'mattn/zencoding-vim'
" Git integration
"Bundle 'motemen/git-vim'
" Tab list panel
"Bundle 'kien/tabman.vim'

if hostname == "moss"
    Bundle "vim-scripts/Csound-compiler-plugin"
    Bundle "vim-scripts/LaTeX-Suite-aka-Vim-LaTeX"
    " support for reStructured Text
    Bundle "vim-scripts/VST"
endif

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


" --- snipMate ---------------------------------------------------- Plugins ---

set nopaste         " important!!


" --- Project ----------------------------------------------------- Plugins ---

"if filereadable("vimproject")
    :let g:proj_flags="imstvcg"
"endif


" --- taglist ----------------------------------------------------- Plugins ---

let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
"let Tlist_Compact_Format = 1
let Tlist_Exit_OnlaWindow = 1
let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
" default ist 4, zu niedrig soll probleme geben...
let updatetime = 1
"au VimEnter * Tlist
nnoremap <silent> <F8> :TlistToggle<CR>


" --- LaTeX suite ------------------------------------------------- Plugins ---

set shellslash      " required on win32
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*   " program used for the ":grep" command
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"  " automatic indentation as you type.


" --- 1 important ------------------------------------------------- Options ---

set nocompatible        " behave very Vi compatible (not advisable)


" --- 2 moving around, searching and patterns --------------------- Options ---

set autochdir           " change to directory of file in buffer
set wrapscan            " search commands wrap around the end of the buffer
set magic               " change the way backslashes are used in search i
                        " patterns
set incsearch           " show match for partly typed search command
set ignorecase          " ignore case when using a search pattern
set smartcase           " override 'ignorecase' when pattern has upper case
                        " characters


" --- 3 tags ------------------------------------------------------ Options ---


" --- 4 displaying text ------------------------------------------- Options ---

set scroll=20           " number of lines to scroll for CTRL-U and CTRL-D
set scrolloff=3         " number of screen lines to show around the cursor
set nowrap              " long lines wrap
set linebreak           " wrap long lines at a character in 'breakat'
set breakat=\ \         " which characters might cause a line break
set showbreak=+         " string to put before wrapped screen lines
set sidescroll=5        " minimal number of columns to scroll horizontally
set lazyredraw          " don't redraw while executing macros
set number              " show the line number for each line
set numberwidth=4       " number of columns to use for the line number


" --- 5 syntax, highlighting and spelling ------------------------- Options ---

set background=dark     " dark or light; the background color brightness
set synmaxcol=1000      " maximum column to look for syntax items
set hlsearch            " highlight all matches for the last used search
                        " pattern
set nocursorcolumn      " highlight the screen column of the cursor
set cursorline          " highlight the screen line of the cursor
set nospell             " highlight spelling mistakes
set spelllang=de,en     " list of accepted languages
"set spellfile=~/.vim/spell/local    " file that 'zg' adds good words to


" --- 6 multiple windows ------------------------------------------ Options ---

set laststatus=2        " 0 (never), 1 (min 2 windows) or 2 (always); when to
                        " use a status line for the last window
"set statusline=%F%m%r%h%w\ [%l/%L\ (%p%%)]   " alternate format to be used for
                        " a status line
set statusline=         " reset status line
set statusline+=%<\     " cut at start
"set statusline+=%2*[%n%H%M%R%W]%*\  " buffer number, and flags
set statusline+=[%n]\   " buffer number
set statusline+=%f\     " relative path
set statusline+=%m%r%h%w\           " flags
set statusline+=%=      " seperate between right- and left-aligned
set statusline+=[%Y\ %{&ff}]\       " file type and format (unix, windows, ...)
set statusline+=[0x\%02.2B\ \%b]\   " hex and ascii value
set statusline+=[%l:%v]\            " line and column
set statusline+=%p%%    " percentage of file
set hidden              " don't unload a buffer when no longer shown in a
                        " window (unload with :bd)


" --- 7 multiple tab pages ---------------------------------------- Options ---

set showtabline=1       " 0, 1 or 2; when to use a tab pages line
set tabpagemax=10       " maximum number of tab pages to open for -p and
                        " 'tab all'


" --- 8 terminal -------------------------------------------------- Options ---

set ttyfast             " terminal connection is fast


" --- 9 using the mouse ------------------------------------------- Options ---

" bei auto (a) funktioniert Paste auf remote Kisten nicht mehr
if hostname == "moss"
    set mouse=a
endif


" --- 10 GUI ------------------------------------------------------ Options ---
" --- 11 printing ------------------------------------------------- Options ---


" --- 12 messages and info ---------------------------------------- Options ---

set showcmd             " show (partial) command keys in the status line
set showmode            " display the current mode in the status line
set ruler               " show cursor position below each window
set more                " pause listings when the screen is full
set noerrorbells        " ring the bell for error messages
"set visualbell          " use a visual bell instead of beeping
set helplang=de         " list of preferred languages for finding help


" --- 13 selecting text ------------------------------------------- Options ---

set clipboard+=unnamed  " 'unnamed' to use the * register like unnamed
                        " register; 'autoselect' to always put selected text on
                        " the clipboard
"set cb=autoselect,exclude:cons\\\|linux,unnamed


" --- 14 editing text --------------------------------------------- Options ---

set undolevels=3000     " maximum number of changes that can be undone
"set textwidth=80        " line length above which to break a line
set backspace=2         " full backspacing capabilities
set showmatch           " show matching brackets (),{},[]
set matchtime=5         " show matching brackets for 0.5 seconds


" --- 15 tabs and indenting --------------------------------------- Options ---

set tabstop=4           " number of spaces a <Tab> in the text stands for
set shiftwidth=4        " number of spaces used for each step of (auto)indent
set smarttab            " a <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=4       " if non-zero, number of spaces to insert for a <Tab>
set shiftround          " round to 'shiftwidth' for '<<' and '>>'
set expandtab           " expand <Tab> to spaces in Insert mode
set autoindent          " automatically set the indent of a new line
set smartindent         " do clever autoindenting
set cindent             " enable specific indenting for C code
set preserveindent      " Preserve kind of whitespace when changing indent


" --- 16 folding -------------------------------------------------- Options ---

set foldenable          " set to display all folds open
set foldlevel=5         " folds with a level higher than this number will be
                        " closed
set foldlevelstart=-1   " value for 'foldlevel' when starting to edit a file
set foldcolumn=0        " width of the column used to indicate folds
set foldtext=foldtext() " expression used to display the text of a closed fold
set foldclose=all       " set to 'all' to close a fold when the cursor leaves
                        " it
set foldopen=all        " specifies for which commands a fold will be opened
set foldmethod=syntax   " folding type: manual, indent, expr, marker or syntax
set foldmarker={{{,}}}  " markers used when 'foldmethod' is marker
set foldexpr=0          " expression used when 'foldmethod' is expr
set foldnestmax=20      " maximum fold depth for when 'foldmethod is indent or
                        " syntax


" --- 17 diff mode ------------------------------------------------ Options ---
" --- 18 mapping -------------------------------------------------- Options ---


" --- 19 reading and writing files -------------------------------- Options ---

set modeline            " enable using settings from modelines when reading a
                        " file
"set fileformat=unix     " end-of-line format: 'dos', 'unix' or 'mac'
set fileformats=unix,dos    " list of file formats to look for when editing a
                        " file
set nobackup            " do not keep a backup file
"set backupdir=~/.vim/backup//   " backup dir


" --- 20 the swap file -------------------------------------------- Options ---

set directory=~/.vim/swp//,.,/tmp//,/var/tmp//  " list of directories for the
                        " swap file (trailing double slashes causes that the
                        " full path will be used as filename
set swapfile            " use a swap file for this buffer


" --- 21 command line editing ------------------------------------- Options ---

set history=300         " how many command lines are remembered
set wildignore=*.o,*.so,*.pyc   " list of patterns to ignore files for file
                        " name completion
set wildmenu            " command-line completion shows a list of matches


" --- 22 executing external commands ------------------------------ Options ---

set shell=/bin/zsh      " name of the shell program used for external commands
set shellcmdflag=-c     " argument for 'shell' to execute a command


" --- 23 running make and jumping to errors ----------------------- Options ---

set grepprg=grep\ -nH\ $*   " program used for the ':grep' command (set to
                        " alway generate a file-name - important for some
                        " plugins)


" --- 24 language specific ---------------------------------------- Options ---


" --- 25 multi-byte characters ------------------------------------ Options ---

set encoding=utf-8      " character encoding used in Vim: latin1, utf-8, etc.


" --- 26 various -------------------------------------------------- Options ---

set ex                  " enable reading .vimrc/.exrc/.gvimrc in the current
                        " directory
set viewoptions=folds,options,cursor	" list of words that specifies what to
                        " save for :mkview
set viewdir=~/.vim/view " directory where to store files with :mkview


" --- Main Settings -----------------------------------------------------------

"filetype on
filetype plugin indent on

" Set color scheme
set t_Co=256
"colorscheme desert256

colorscheme zenburn
let g:zenburn_high_Contrast = 1 " a darker background for bright environments
let g:zenburn_alternate_Visual = 1  " get more contrast to the Visual selection

syntax enable

syntax on
syntax sync fromstart

" remove whitespaces at end of line
"autocmd! BufWritePre * :%s/\s\+$//e
autocmd FileType c,cpp,php,py,sh autocmd BufWritePre <buffer> :%s/\s\+$//e


" --- Mappings ----------------------------------------------------------------

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" buffers
map <leader>bn :bnext<cr>
map <leader>bp :bprev<cr>
map <leader>bd :bdelete<cr>

" tabs
map <leader>tn :tabnew<cr>
map <leader>tt :tabnext<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" easy jumping to other windows
map <C-j> <C-W>j<C-w>_
map <C-k> <C-W>k<C-w>_
map <C-h> <C-w>h<C-w>_
map <C-l> <C-w>l<C-w>_


" --- Folding -----------------------------------------------------------------

" save and reload folds
" noch nötig, wenn viewoptions und viewdir gesetzt?
"autocmd BufWinLeave * if expand("%") != "" | mkview | endif
"autocmd BufWinEnter * if expand("%") != "" | loadview | endif


" --- mutt ------------------------------------------------------- Filetype ---

au BufRead /tmp/mutt-* set textwidth=72


" --- chuck ------------------------------------------------------ Filetype ---

au BufNewFile,BufRead *.ck          setf ck

cnoreabbrev C+ ! chuck + %
cnoreabbrev C- ! chuck - %
cnoreabbrev C= ! chuck = %
cnoreabbrev CR ! chuck --remove.all


" --- csound support --------------------------------------------- Filetype ---

au BufNewFile,BufRead *.orc,*.sco,*.csd   so $HOME/.vim/syntax/csound.vim
au BufNewFile,BufRead *.csd               so $HOME/.vim/macros/csound_macros.vim
au BufNewFile *.csd                       0r $HOME/.vim/templates/template.csd
au BufNewFile *.orc                       0r $HOME/.vim/templates/template.orc


" --- Shell scripts ---------------------------------------------- Filetype ---

" execute current script
au BufRead *.sh nmap [15^ :! "%:p"<CR>
" execute current line of script
au BufRead *.sh nmap <F5> :execute "!".getline(".")<CR>


