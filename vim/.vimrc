set encoding=utf-8
set delcombine

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" My Plugins here:
"
" original repos on github

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" UI
Plug 'scrooloose/nerdtree'

" Search
Plug 'vim-scripts/L9'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'

" general
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-characterize'

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'

" clojure
Plug 'vim-scripts/VimClojure'

" python
Plug 'hynek/vim-python-pep8-indent'
" Plug 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-python/python-syntax'
Plug 'tmhedberg/SimpylFold'

" RST
" Plug 'mitsuhiko/vim-rst'
Plug 'nvie/vim-rst-tables'

" javascript/node
Plug 'pangloss/vim-javascript'
Plug 'ruanyl/vim-fixmyjs'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'posva/vim-vue'

" text
Plug 'ntpeters/vim-better-whitespace'
Plug 'reedes/vim-pencil'

" json
Plug 'elzr/vim-json'

" rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" toml
Plug 'cespare/vim-toml'

" terraform
Plug 'hashivim/vim-terraform'
" Plug 'juliosueiras/vim-terraform-completion'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" remember to :CocInstall coc-metals
"   coc-metals
"   coc-sqlfluff
"   coc-html
"   coc-eslint
"   coc-snippets
"   coc-groovy
"   coc-json
"   coc-sh
"   coc-tsserver
"   coc-diagnostic
"   coc-jedi

" sql
Plug 'lifepillar/pgsql.vim'


" CSV
Plug 'mechatroner/rainbow_csv'


" Misc
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'


" jinja
Plug 'glench/vim-jinja2-syntax'


" YAML
Plug 'pedrohdz/vim-yaml-folds'

" Pico-8
Plug 'bakudankun/pico-8.vim'

call plug#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on


" Enable syntax highlighting
syntax enable

" Background
set background=dark
" set background=light

"------------------------------------------------------------
" Colorschemes
"
  if (has("termguicolors"))
    set termguicolors
  endif

" Solarized
" let g:solarized_termtrans = 1
" colorscheme solarized
" if &diff
"     colorscheme solarized
" endif

" Gruvbox
colorscheme gruvbox
if &diff
    colorscheme gruvbox
endif

" This maybe corrects the hover box color in coc.nvim?
hi Quote ctermbg=109 guifg=#83a598

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
" set number

" diff views should split vertical by default
set diffopt+=vertical

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F9>

"
" Line numbers
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

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
" Split to the right and below, which feels more natural than defaults
set splitbelow
set splitright

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings
let mapleader = '\'

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

map <C-Right> :tabn<CR>
map <C-Left> :tabp<CR>
map <Leader>s :split<CR>
map <Leader>v :vsplit<CR>
" map ,v :e ~/.vimrc<CR>
nmap ,V :source ~/.vimrc<CR>
nmap ,p <Esc>:set paste!<CR>
nmap ,c :w !pbcopy<CR><CR>
map [l :lprevious<CR>
map ]l :lnext<CR>
map [L :lfirst<CR>
map ]L :llast<CR>
nmap u :echo 'You hit u by mistake again'<CR>

" format json using jq
autocmd FileType json map ,f :%!jq '.'<CR>

" send current selection to black hole and paste
vmap r "_dP

set backupdir=~/.vimbackup
set directory=~/.vimswap

set foldlevelstart=20


"------------------------------------------------------------
" BufExplorer
"
map ,b :BufExplorer<CR>
map ,s :BufExplorerHorizontalSplit<CR>
map ,v :BufExplorerVerticalSplit<CR>
let g:bufExplorerShowRelativePath=1
let g:bufExplorerShowTabBuffer=1
let g:bufExplorerFindActive=0

"------------------------------------------------------------
" vim-javascript
"
autocmd FileType javascript setlocal foldmethod=syntax
let g:javascript_plugin_jsdoc = 1

"------------------------------------------------------------
" vim-markdown
"
autocmd FileType markdown map ,t :TableFormat<CR>
" autocmd FileType markdown setlocal foldmethod=syntax
let g:vim_markdown_folding_style_pythonic = 1

"------------------------------------------------------------
" NERDtree
"
" open if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable=""
let NERDTreeDirArrowCollapsible=""

" toggle with ctrl-t
nnoremap <C-t> :NERDTreeToggle<CR>

"------------------------------------------------------------
" CommandT
"
" wildcard ignore
" let g:CommandTWildIgnore="*/node_modules,*/env,*/.git"

" let g:CommandTAlwaysShowDotFiles=1

"------------------------------------------------------------
" FuzzyFinder
map <Leader>f :FufFile

"------------------------------------------------------------
" fixmyjs
let g:fixmyjs_engine = 'eslint'
let g:fixmyjs_use_local = 1
let g:fixmyjs_rc_filename = ['.eslintrc', '.eslintrc.js', '.eslintrc.json']
" autocmd FileType javascript map ,f :Fixmyjs<CR>



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
" highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=157 gui=none guifg=bg guibg=Red
" highlight DiffDelete cterm=bold ctermfg=10 ctermbg=217 gui=none guifg=bg guibg=Red
" highlight DiffChange cterm=bold ctermfg=10 ctermbg=229 gui=none guifg=bg guibg=Red
" highlight DiffText   cterm=bold ctermfg=10 ctermbg=45  gui=none guifg=bg guibg=Red

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

" set foldenable

"------------------------------------------------------------
" vim-rst-tables
"
" these are configured by default, but if you want to change them, uncomment
" and edit:
" noremap <silent> <leader><leader>c :call ReformatTable()<CR>
" noremap <silent> <leader><leader>f :call ReflowTable()<CR>

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
  autocmd FileType json setlocal autoindent
  autocmd FileType json setlocal formatoptions=tcq2l
  autocmd FileType json setlocal textwidth=78 shiftwidth=2
  autocmd FileType json setlocal softtabstop=2 tabstop=2
  autocmd FileType json setlocal expandtab
  autocmd FileType json setlocal foldmethod=syntax
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END


"------------------------------------------------------------
" vim-better-whitespace
"
autocmd BufEnter * EnableStripWhitespaceOnSave
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"------------------------------------------------------------
" vim-jsdoc
"
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_param_description_separator=' - '
autocmd FileType javascript map ,d :JsDoc<CR>


"------------------------------------------------------------
" vim-racer
"
let g:racer_cmd = "$HOME/.cargo/bin/racer"
"au FileType rust nmap gd <Plug>(rust-def)
"au FileType rust nmap gs <Plug>(rust-def-split)
"au FileType rust nmap gx <Plug>(rust-def-vertical)
"au FileType rust nmap ,gd <Plug>(rust-doc)


"------------------------------------------------------------
" yaml
"
autocmd FileType yaml setlocal softtabstop=2
autocmd FileType yaml setlocal tabstop=2
autocmd FileType yaml setlocal shiftwidth=2


"------------------------------------------------------------
" groovy (and Jenkinsfile)
"
autocmd FileType groovy setlocal softtabstop=2
autocmd FileType groovy setlocal tabstop=2
autocmd FileType groovy setlocal shiftwidth=2
autocmd FileType groovy setlocal nofixeol


"------------------------------------------------------------
" rst
"
au BufRead,BufNewFile *.rst setlocal textwidth=80


"------------------------------------------------------------
" vim-terraform
"
let g:terraform_align=1
"let g:terraform_fold_sections=1
"let g:terraform_fmt_on_save=1

"------------------------------------------------------------
" vim-commentary
autocmd FileType sql setlocal commentstring=--\ %s

"------------------------------------------------------------
" Configuration for vim-scala
au BufNewFile,BufRead *.sc	setf scala



" rainbow-csv
"
au BufNewFile,BufRead *.csv.txt setf csv


"------------------------------------------------------------
" pgsql.vim
let g:sql_type_default = 'pgsql'
let g:pgsql_pl = ['python']

"------------------------------------------------------------
" pico-8.vim
" let g:pico8_config.pico8_path =



"------------------------------------------------------------
" vim-python/python-syntax
let g:python_highlight_all = 1
let g:python_highlight_func_calls = 0

"------------------------------------------------------------
" tmhedberg/SimpylFold

"------------------------------------------------------------
" ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = '\v([\/]\.(git|hg|svn)|*/target/*|venv)$'

"------------------------------------------------------------
" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1


"------------------------------------------------------------
" Suggested configuration for coc.nvim
"
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>w <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
" nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
nmap <leader>f :Format<CR>

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

"------------------------------------------------------------
" coc-sqlfluff
autocmd FileType sql setlocal nofixeol



set signcolumn=auto:2

set statusline=%f\                                  " tail of the filename with space after
set statusline+=%m                                  " modified flag
set statusline+=%r                                  " read only flag
set statusline+=%h\                                 " help flag
set statusline+=%=                                  " left/right separator
set statusline+=%{coc#status()}
set statusline+=[c:%c]                         " current column
set statusline+=[l:%l]                           " current line
set statusline+=[%p%%]                              " percentage through file

set secure
