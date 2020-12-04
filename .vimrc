""""""""""""""""""""""""""
" Polyglot configuration
""""""""""""""""""""""""""
let g:polyglot_disabled = ['elixir', 'elm']

set nocompatible

""""""""""""""""""""""""""
" Plugin section
""""""""""""""""""""""""""
call plug#begin('~/.nvim/plugged')

" Utility
Plug 'AndrewRadev/splitjoin.vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'thaerkh/vim-workspace'
Plug 'tpope/vim-surround'
Plug 'moll/vim-bbye/'
Plug 'dyng/ctrlsf.vim'
Plug 'voldikss/vim-floaterm'

" Theme / Interface
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Generic programming support
Plug 'liuchengxu/vista.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'Townk/vim-autoclose'
Plug 'bronson/vim-trailing-whitespace'
Plug 'janko-m/vim-test'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'kana/vim-textobj-user'
Plug 'sbdchd/neoformat'

" Git support
Plug 'airblade/vim-gitgutter'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Elixir support
Plug 'elixir-editors/vim-elixir'
Plug 'andyl/vim-textobj-elixir'

" Elm support
Plug 'andys8/vim-elm-syntax'

" Go support
Plug 'fatih/vim-hclfmt'

"Gleam support
Plug 'gleam-lang/gleam.vim'

" Markdown and writing
Plug 'junegunn/goyo.vim'
Plug 'kannokanno/previm'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'tyru/open-browser.vim'
Plug 'vimwiki/vimwiki'

call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
syntax on
set nowrap
set encoding=UTF-8
set backspace=indent,eol,start
filetype plugin indent on
set inccommand=nosplit

" Set swap and undo directories
set directory=$HOME/.vim/swp
set backupdir=$HOME/.vim/.backup
set undofile
set undodir=$HOME/.vim/undodir
set clipboard=unnamed
let mapleader = "\<Space>"
set hidden
set mouse=""

" Show linenumbers
set relativenumber
set number
set ruler
set nostartofline

" Set Proper Tabs
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

" Shift to the next round tab stop.
set shiftround

" Set auto indent spacing.
set shiftwidth=2

" Always display the status line
set laststatus=2

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" Highlight search results
set hlsearch

" Incremental search, search as you type
set incsearch

" Ignore case when searching
set ignorecase

" Ignore case when searching lowercase
set smartcase

" Automatically :write before running commands
set autowrite

" Autoread
set autoread
au FocusGained,BufEnter * :checktime

" Save on focus lost
autocmd BufLeave,FocusLost * silent! wall

" Display incomplete commands
set showcmd

" Theme and Styling
set t_Co=256
set background=dark
colorscheme nord
set guifont=Fira\ Code:h14
highlight CursorLine ctermfg=black
let g:indentLine_char = '·'
if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set fillchars+=vert:\|
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1


" Timeout
set timeoutlen=300 ttimeoutlen=0

" Folds
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Errors
set noerrorbells
set visualbell
set title
set confirm

" Preview height
set previewheight=30

" Increment chars
:set nrformats+=alpha

" Save and restore view on leave and enter
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif

" Opacity
set pumblend=5
set winblend=5

""""""""""""""""""""""""""
" Lightline configuration
""""""""""""""""""""""""""
set showtabline=2
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ 'tabline': {
      \   'left': [['buffers']], 'right': [['']],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

""""""""""""""""""""""""""
" Vim-Supertab configuration
""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

""""""""""""""""""""""""""
" Fugitive configuration
""""""""""""""""""""""""""
let g:fugitive_gitlab_domains = ['https://gitlab.otters.xyz/']
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
noremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gb :Gbrowse<CR>
vnoremap <Leader>gb :Gbrowse<CR>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Git push<CR>
nnoremap <Leader>gpl :Git pull<CR>

""""""""""""""""""""""""""
" Easymotion configuration
""""""""""""""""""""""""""
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

""""""""""""""""""""""""""
" Workspaces configuration
""""""""""""""""""""""""""
let g:workspace_autosave = 0
let g:workspace_autosave_always = 0
let g:workspace_autosave_ignore = ['gitcommit', 'qf', 'floaterm']
let g:workspace_autosave_untrailspaces = 0
let g:workspace_session_name = '.session.vim'

""""""""""""""""""""""""""
" Markdown configuration
""""""""""""""""""""""""""
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
au BufNewFile,BufRead,BufWrite *.html.markdown syntax match Comment /\%^---\_.\{-}---$/
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.html.markdown set filetype=markdown
let g:markdown_fenced_languages = ['html', 'ruby', 'elixir', 'elm', 'javascript', 'bash=sh']

""""""""""""""""""""""""""
" Spell check configuration
""""""""""""""""""""""""""
setlocal nospell
autocmd BufRead COMMIT_EDITMSG setlocal spell spelllang=en_us
autocmd BufRead *.md,*.mkd,*.markdown set spell spelllang=en_us

""""""""""""""""""""""""""
" Autoclose configuration
""""""""""""""""""""""""""
let g:closetag_filenames = '*.html,*.xhtml,*.eex'

""""""""""""""""""""""""""
" Vista configuration
""""""""""""""""""""""""""
let g:vista#renderer#enable_icon = 0
let g:vista_blink  = [0, 0]
let g:vista_close_on_jump = 1
let g:vista_default_executive = 'coc'
let g:vista_echo_cursor = 0
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_finder_alternative_executives = ['coc']
let g:vista_sidebar_width = 60
let g:vista_cursor_delay = 0
let g:vista_executive_for = {
  \ 'markdown': 'toc',
  \ }

""""""""""""""""""""""""""
" Coc configuration
""""""""""""""""""""""""""
let g:coc_snippet_next = '<C-n>'
let g:coc_snippet_prev = '<S-TAB>'
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> ga <Plug>(coc-codeaction-line)
nmap <silent> gA <Plug>(coc-codeaction)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

""""""""""""""""""""""""""
" hclfmt confinguration
""""""""""""""""""""""""""
let g:hcl_fmt_autosave = 1

""""""""""""""""""""""""""
" vim-test configuration
""""""""""""""""""""""""""
let test#filename_modifier = ":p"
let test#neovim#term_position = "vert"
let g:test#preserve_screen = 1
let test#strategy = "floaterm"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

""""""""""""""""""""""""""
" Clap configuration
""""""""""""""""""""""""""
let g:clap_layout = { 'relative': 'editor', 'width': '72%' }
let g:clap_insert_mode_only = 1
let g:clap_provider_grep_executable = 'rg'
let g:clap_provider_grep_opts = '--glob !.git/ --hidden --no-heading --smart-case --vimgrep'
let g:clap_search_box_border_symbols = {'nil': ['', ''], 'curve': ['', ''], 'arrow': ['', '']}
let g:clap_enable_background_shadow = 0
nmap <Leader>b :Clap buffers<CR>
nmap <Leader>F :Clap files<CR>
nmap <Leader>f :Clap git_files<CR>
nmap <Leader>' :Clap marks<CR>
nmap <Leader>y :Clap yanks<CR>
nmap <Leader>h :Clap history<CR>
nmap <Leader>m :Clap git_diff_files<CR>
nmap <Leader>a :Clap grep2<CR>
nmap <Leader>l :Clap loclist<CR>
nmap <C-t> :Clap tags<CR>


""""""""""""""""""""""""""
" Splitjoin
""""""""""""""""""""""""""
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <Leader>J :SplitjoinJoin<cr>
nmap <Leader>S :SplitjoinSplit<cr>


""""""""""""""""""""""""""
" Elm configuration
""""""""""""""""""""""""""
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 1
let g:elm_setup_keybindings = 0
let g:elm_detailed_complete = 1
let g:elm_make_show_warnings = 1
let g:elm_jump_to_error = 0

""""""""""""""""""""""""""
" Buffergator configuration
""""""""""""""""""""""""""
let g:buffergator_sort_regime="basename"
let g:buffergator_suppress_keymaps=1
let g:buffergator_mru_cycle_local_to_window=1
nmap <silent> <leader><LEFT> :BuffergatorMruCyclePrev leftabove vert sbuffer<CR>
nmap <silent> <leader><UP> :BuffergatorMruCyclePrev leftabove sbuffer<CR>
nmap <silent> <leader><RIGHT> :BuffergatorMruCyclePrev rightbelow vert sbuffer<CR>
nmap <silent> <leader><DOWN> :BuffergatorMruCyclePrev rightbelow sbuffer<CR>

""""""""""""""""""""""""""
" CtrlFS configuration
""""""""""""""""""""""""""
let g:ctrlsf_ignore_dir = ['elm-stuff', 'node_modules', 'deps', '_build']
nmap <Leader>fs <Plug>CtrlSFPrompt
vmap <Leader>fs <Plug>CtrlSFVwordExec

""""""""""""""""""""""""""
" Floaterm configuration
""""""""""""""""""""""""""
let g:floaterm_winblend = 9
let g:floaterm_keymap_toggle = '<Leader>fn'
let g:floaterm_position = 'center'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_borderchars = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
hi FloatermBorderNF guibg='#4c556a' guifg='#ABB9CF'
map <C-n> :FloatermNew ranger<CR>
nnoremap <Leader>n :FloatermNew ranger<Enter>

""""""""""""""""""""""""""
" Fzf configuration
""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }

""""""""""""""""""""""""""
" Workspaces configuration
""""""""""""""""""""""""""
let g:workspace_autosave = 0

"""""""""""""""""""""""""""""""""""""
" General mappings
"""""""""""""""""""""""""""""""""""""

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Copy current file path to system clipboard
nmap <silent> cp :let @*=expand("%")<CR>
autocmd BufWritePre * :%s/\s\+$//e

" Saving and closing buffers
nnoremap <Leader>s :w<CR>
nnoremap <Leader>bc :CloseHiddenBuffers<CR>
nnoremap <Leader>bca :CloseHiddenBuffers<CR>:bdelete<CR>
nnoremap <Leader>bd  :Bwipeout<CR>

" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
	nnoremap <Up>    :resize +2<CR>
	nnoremap <Down>  :resize -2<CR>
	nnoremap <Left>  :vertical resize +2<CR>
	nnoremap <Right> :vertical resize -2<CR>
endif

" Make j and k move to the next row, not file line
nnoremap j gj
nnoremap k gk

" Select all text
nnoremap vA ggVG

" Yank to end of line
nnoremap Y y$

" Press <leader> Enter to remove search highlights
noremap <silent> <leader><cr> :noh<cr>

" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt

" Easily create a new tab.
noremap <Leader>tt :tabnew<CR>

" Easily close a tab.
noremap <Leader>tc :tabclose<CR>

" Quickly source .vimrc
nnoremap <leader>r :source $MYVIMRC<CR>

" Quickly open .vimrc in new tab
nnoremap <leader>v :tabedit ~/.vimrc<CR>

" Quickly quit editting without save
nnoremap <leader>qq :qa!<CR>

" Quit current window
nnoremap <leader>q :close!<CR>

" Close all splits except current
nnoremap <leader>qa :only<CR>

" Buffer navigation
nnoremap gn :bnext<CR>
nnoremap gb :bprevious<CR>
nnoremap <TAB><TAB> <c-^>

" Sort lines, selected or over motion.
xnoremap <silent> gs :sort i<CR>
nnoremap <silent> gs :set opfunc=SortLines<CR>g@
fun! SortLines(type) abort
    '[,']sort i
endfun

" Fix coc phantom floating windows
inoremap <C-c> <Esc><Esc>
