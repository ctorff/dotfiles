" clear all existing autocommands
autocmd!

" vundle setup and plug-ins
if filereadable(glob("~/.vim/vundle")) 
    source ~/.vim/vundle
endif


" --- Options -----------------------------------------------------------------

" --- 1 important
set nocompatible        " behave very Vi compatible (not advisable)

" --- 2 moving around, searching and patterns
set autochdir           " change to directory of file in buffer
set wrapscan            " search commands wrap around the end of the buffer
set magic               " change the way backslashes are used in search i
                        " patterns
set incsearch           " show match for partly typed search command
set ignorecase          " ignore case when using a search pattern
set smartcase           " override 'ignorecase' when pattern has upper case
                        " characters

" --- 3 tags

" --- 4 displaying text
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

" --- 5 syntax, highlighting and spelling
"set background=dark     " dark or light; the background color brightness
set synmaxcol=4096      " maximum column to look for syntax items
set hlsearch            " highlight all matches for the last used search
                        " pattern
set nocursorcolumn      " highlight the screen column of the cursor
set cursorline          " highlight the screen line of the cursor
set nospell             " highlight spelling mistakes
set spelllang=de,en     " list of accepted languages
"set spellfile=~/.vim/spell/local    " file that 'zg' adds good words to

" --- 6 multiple windows
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

" --- 7 multiple tab pages
set showtabline=1       " 0, 1 or 2; when to use a tab pages line
set tabpagemax=10       " maximum number of tab pages to open for -p and
                        " 'tab all'

" --- 8 terminal
set ttyfast             " terminal connection is fast

" --- 9 using the mouse
" --- 10 GUI
" --- 11 printing

" --- 12 messages and info
set showcmd             " show (partial) command keys in the status line
set showmode            " display the current mode in the status line
set ruler               " show cursor position below each window
set more                " pause listings when the screen is full
set noerrorbells        " ring the bell for error messages
set visualbell          " use a visual bell instead of beeping
set helplang=de         " list of preferred languages for finding help

" --- 13 selecting text
set clipboard+=unnamed  " 'unnamed' to use the * register like unnamed
                        " register; 'autoselect' to always put selected text on
                        " the clipboard
"set cb=autoselect,exclude:cons\\\|linux,unnamed

" --- 14 editing text
set undolevels=3000     " maximum number of changes that can be undone
"set textwidth=80        " line length above which to break a line
set backspace=2         " full backspacing capabilities
set showmatch           " show matching brackets (),{},[]
set matchtime=5         " show matching brackets for 0.5 seconds

" --- 15 tabs and indenting
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

" --- 16 folding
source ~/.vim/folding

" --- 17 diff mode
" --- 18 mapping

" --- 19 reading and writing files
set modeline            " enable using settings from modelines when reading a
                        " file
set fileformat=unix     " end-of-line format: 'dos', 'unix' or 'mac'
"set fileformats=unix,dos    " list of file formats to look for when editing a
                        " file
set nobackup            " do not keep a backup file
"set backupdir=~/.vim/backup//   " backup dir

" --- 20 the swap file
set directory=~/.vim/swp//,.,/tmp//,/var/tmp//  " list of directories for the
                        " swap file (trailing double slashes causes that the
                        " full path will be used as filename
set swapfile            " use a swap file for this buffer

" --- 21 command line editing
set history=300         " how many command lines are remembered
set wildignore=*.o,*.so,*.pyc   " list of patterns to ignore files for file
                        " name completion
set wildmenu            " command-line completion shows a list of matches


" --- 22 executing external commands
set shell=/bin/zsh      " name of the shell program used for external commands
set shellcmdflag=-c     " argument for 'shell' to execute a command

" --- 23 running make and jumping to errors
set grepprg=grep\ -nH\ $*   " program used for the ':grep' command (set to
                        " alway generate a file-name - important for some
                        " plugins)

" --- 24 language specific

" --- 25 multi-byte characters
set encoding=utf-8      " character encoding used in Vim: latin1, utf-8, etc.

" --- 26 various
set ex                  " enable reading .vimrc/.exrc/.gvimrc in the current
                        " directory
set viewoptions=folds,options,cursor	" list of words that specifies what to
                        " save for :mkview
set viewdir=~/.vim/view " directory where to store files with :mkview

" --- Main Settings -----------------------------------------------------------

filetype on
filetype plugin indent on

syntax enable
syntax on
syntax sync fromstart

" remove whitespaces at end of line
"autocmd! BufWritePre * :%s/\s\+$//e
autocmd FileType c,cpp,php,py,sh autocmd BufWritePre <buffer> :%s/\s\+$//e

color jellybeans
"color badwolf

" --- Mappings ----------------------------------------------------------------

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

" buffers
map <leader>bb :buffer<space>
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

" write with sudo permissions
cmap w!! w !sudo tee > /dev/null %

" mutt
au BufRead /tmp/mutt-* set textwidth=72

" Shell scripts
" execute current script
au BufRead *.sh nmap [15^ :! "%:p"<CR>
" execute current line of script
au BufRead *.sh nmap <F5> :execute "!".getline(".")<CR>

" --- Plug-ins ----------------------------------------------------------------

" NERDtree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
"let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'

" ctrl-p
"nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" snipmate
"let g:snippets_dir += "~/.vim/snippets" 

" --- Toggle tabs ans spaces ------------------------------------ Functions ---

function TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z


" load local config
if filereadable(glob("~/.vim/vimrc.local")) 
    source ~/.vim/vimrc.local
endif

