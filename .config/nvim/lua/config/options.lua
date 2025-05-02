vim.cmd('filetype plugin indent on')

-- Encoding
vim.o.encoding = 'utf-8'

-- Avoid all the hit-enter prompts
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Hide buffers
vim.o.hidden = true

-- Pop-up confinguration
vim.o.pumheight = 10
vim.opt.pumblend = 5
vim.opt.winblend = 5

-- Splits below and right
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.splitkeep = "screen"

-- Theme and styling
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.guifont = "Hack Nerd Font:h15"
-- vim.cmd [[
-- colorscheme catpuccin
-- highlight CursorLine ctermfg=black
-- let $NVIM_TUI_ENABLE_TRUE_COLOR=1
-- ]]
vim.cmd [[
highlight CursorLine ctermfg=black
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
]]
vim.opt.cursorline = true
vim.o.ch = 3
vim.o.ls = 0
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- Display text normally
vim.o.conceallevel = 0

-- Always display tab line
vim.o.showtabline = 2

-- Line numbers
vim.o.relativenumber = true
vim.o.number = true
vim.o.ruler = true
vim.o.startofline = false
vim.wo.signcolumn = "yes"

-- Set swap and undo directories
vim.o.directory = vim.fn.stdpath('config') .. '/swp'
vim.o.backupdir = vim.fn.stdpath('config') .. '/.backup'
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = ''

-- Change leader
vim.g.mapleader = " "

-- No spell checking
vim.o.spell = false

-- No backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300

-- Timeout
vim.o.timeoutlen = 500

-- Search confinguration
vim.o.hlsearch = true
vim.o.ignorecase = false

-- Scroll
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5

-- Wrapping
vim.wo.wrap = false

-- Tabs
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.smarttab = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true

-- Auto write and read
vim.o.autowrite = true
vim.o.autoread = true
vim.cmd [[
au FocusGained,BufEnter * :checktime
autocmd BufLeave,FocusLost * silent! wall
]]

-- Errors
vim.o.errorbells = false
vim.o.visualbell = true
vim.o.title = true
vim.o.confirm = true

-- Folds
vim.o.foldmethod = "manual"

-- LSP
vim.diagnostic.config({
  virtual_text = false
})
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- CoC node
vim.g.coc_node_path = "/opt/homebrew/bin/node"
