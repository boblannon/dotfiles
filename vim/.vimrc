set encoding=utf-8
set delcombine

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
"
" original repos on github

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
"Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mzlogin/vim-markdown-toc'
"Plugin 'alfredodeza/pytest.vim'
Plugin 'corntrace/bufexplorer'
"Plugin 'Lokaltog/vim-distinguished'
Plugin 'vim-scripts/VimClojure'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'pangloss/vim-javascript'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'Chiel92/vim-autoformat'
Plugin 'reedes/vim-pencil'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
"Plugin 'BlackBeauty'
"Plugin 'python.vim'
"Plugin 'jellybeans.vim'
" non github repos
Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on


" Enable syntax highlighting
syntax enable
set background=light
"colorscheme solarized

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmode=longest,list,full
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
hi Search cterm=NONE ctermfg=white ctermbg=gray

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" add filename to statusline
"set statusline+=%m%f

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" 'press <Enter> to continue'
"set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F9>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
"set listchars=tab:▸\ ,eol:¬
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"autocmd FileType python map ,8 :call Flake8()<CR>

map <C-Up> :tabn<CR>
map <C-Down> :tabp<CR>
map ,b :BufExplorer<CR>
map ,s :BufExplorerHorizontalSplit<CR>
map ,v :BufExplorerVerticalSplit<CR>
" map ,v :e ~/.vimrc<CR>
nmap ,V :source ~/.vimrc<CR>
map ,o o<Esc>
map ,O O<Esc>
map ,p <Esc>:set paste!<CR>

" send current selection to black hole and paste
vmap r "_dP

set backupdir=~/.vimbackup
set directory=~/.vimswap

set foldlevelstart=20

"------------------------------------------------------------
" vim-javascript
"
autocmd FileType javascript setlocal foldmethod=syntax


"------------------------------------------------------------
" vim-markdown
"
autocmd FileType markdown map ,t :TableFormat<CR>

"------------------------------------------------------------
" NERDtree
"
" open if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" toggle with \
map <C-\> :NERDTreeToggle<CR>

"------------------------------------------------------------
" CommandT
"
" wildcard ignore
let g:CommandTWildIgnore="*/node_modules,*/env,*/.git"

let g:CommandTAlwaysShowDotFiles=1

"------------------------------------------------------------
" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_sh_shellcheck_quiet_messages = {
            \ "!level": "errors",
            \ "type": "style" }

map ,m :SyntasticToggleMode<CR>

"------------------------------------------------------------
" EasyAlign
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga EasyAlign

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga :EasyAlign<CR>

" Align GitHub-flavored Markdown tables
au FileType markdown vmap ,<Bslash> :EasyAlign*<Bar><Enter>

"------------------------------------------------------------
" vimdiff
"
" Better highlighting
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=157 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=217 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=229 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=45  gui=none guifg=bg guibg=Red

"------------------------------------------------------------
" vim-pencil
"
"
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

let g:pencil#conceallevel = 0

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

set foldenable

"------------------------------------------------------------
" vim-markdown-toc
"
"
let g:vmt_auto_update_on_save = 0
