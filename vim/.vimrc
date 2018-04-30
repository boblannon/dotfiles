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
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'junegunn/vim-easy-align'
"Plugin 'Chiel92/vim-autoformat'
Plugin 'reedes/vim-pencil'
Plugin 'elzr/vim-json'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-characterize'
Plugin 'wincent/command-t'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'cespare/vim-toml'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
"Plugin 'BlackBeauty'
"Plugin 'python.vim'
"Plugin 'jellybeans.vim'

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
let g:solarized_termtrans = 1
colorscheme solarized

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
hi! Search cterm=NONE gui=NONE ctermbg=3 ctermfg=0 guibg=#b58900 guifg=#002b36

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
map [l :lprevious<CR>
map ]l :lnext<CR>
map [L :lfirst<CR>
map ]L :llast<CR>

" send current selection to black hole and paste
vmap r "_dP

set backupdir=~/.vimbackup
set directory=~/.vimswap

set foldlevelstart=20

"------------------------------------------------------------
" vim-javascript
"
autocmd FileType javascript setlocal foldmethod=syntax
let g:javascript_plugin_jsdoc = 1

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
let g:syntastic_loc_list_height = 5

let g:syntastic_sh_shellcheck_quiet_messages = {
            \ "!level": "errors",
            \ "type": "style" }

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(yarn bin)/eslint'
let g:syntastic_error_symbol = "\u2717"         " ballot x ( ✗ )
let g:syntastic_warning_symbol = "\u26A0"       " warning sign (⚠ )
let g:syntastic_style_error_symbol = "\u27EB"   " mathematical right double angle bracket (⟫)
let g:syntastic_style_warning_symbol = "\u26E9" " mathematical right angle bracket (⟩)

let g:syntastic_cpp_config_file = '.syntastic_cpp_config'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

autocmd FileType rust let g:syntastic_rust_checkers = ['cargo']

map ,m :SyntasticToggleMode<CR>

"------------------------------------------------------------
" fixmyjs
let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_use_local = 1
let g:fixmyjs_rc_filename = ['.eslintrc', '.eslintrc.js', '.eslintrc.json']
autocmd FileType javascript map ,f :Fixmyjs<CR>

"------------------------------------------------------------
" EasyAlign
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ea EasyAlign
"
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap a :EasyAlign<CR>

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
augroup END

set foldenable

"------------------------------------------------------------
" vim-markdown-toc
"
"
let g:vmt_auto_update_on_save = 0

"----
" vim-json
let g:vim_json_syntax_conceal = 0
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=4
  autocmd FileType json set softtabstop=4 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"------------------------------------------------------------
" vim-better-whitespace
"
autocmd BufEnter * EnableStripWhitespaceOnSave
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']

"------------------------------------------------------------
" vim-jsdoc
"
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_param_description_separator=' - '
autocmd FileType javascript map ,d :JsDoc<CR>


"------------------------------------------------------------
" supertab
"
" make YCM compatible with UltiSnips (using supertab)
let g:SuperTabDefaultCompletionType = '<C-n>'

"------------------------------------------------------------
" ultisnips
"
let g:UltiSnipsUsePythonVersion = 3

" make YCM compatible with UltiSnips (using supertab)
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"---------
" YouCompleteMe
"
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.global_ycm_extra_conf.py'
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

nnoremap <Leader>] :YcmCompleter GoTo<CR>

"------------------------------------------------------------
" vim-racer
"
let g:racer_cmd = "$HOME/.cargo/bin/racer"
"au FileType rust nmap gd <Plug>(rust-def)
"au FileType rust nmap gs <Plug>(rust-def-split)
"au FileType rust nmap gx <Plug>(rust-def-vertical)
"au FileType rust nmap ,gd <Plug>(rust-doc)
