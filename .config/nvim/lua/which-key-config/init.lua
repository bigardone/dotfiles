require("which-key").setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 0, 1, 0 }, -- extra window padding [top, right, bottom, left]
    winblend = 10
  },
  ignore_missing = true,
  show_help = false,
  show_keys = false,
})

require("which-key").register({
  b = {
    name = "Buffer",
    c = {
      name = "Close",
      a = { ":BDelete all<CR>", "All" },
      h = { ":BDelete hidden<CR>:<CR>", "Hidden" }
    },
    d = { ":bp<bar>sp<bar>bn<bar>bd<CR>", "Delete" },
  },
  c = {
    name = "Code",
    s = { ":Telescope coc document_symbols<CR>", "Symbols" },
    a = { "<Plug>(coc-codeaction-line)", "Line actions" },
    A = { "<Plug>(coc-codeaction)", "File actions" },
    e = {
      name = "Elixir",
      f = { ":!mix format<CR>", "Format code" }
    },
    f = { ":CocCommand eslint.executeAutofix<CR>", "Autofix" },
    r = { "<Plug>(coc-rename)", "Rename" },
  },
  f = {
    name = "Find",
    b = { ":Telescope buffers<CR>", "Buffers" },
    d = { ":Telescope coc diagnostics<CR>", "Diagnostics" },
    f = { ":Telescope find_files<CR>", "Files" },
    F = { ":Telescope find_files hidden=true<CR>", "Files (hidden)" },
    h = { ":Telescope oldfiles<CR>", "History" },
    m = { ":Telescope git_status<CR>", "Modified files" },
    r = { ":Telescope registers<CR>", "Registers" },
    t = { ":Telescope live_grep<CR>", "Files with text" },
  },
  F = { ":NvimTreeFindFileToggle<CR>", "File tree" },
  g = {
    name = "Git",
    b = { ":Git blame<CR>", "Blame" },
    d = { ":Git diff<CR>", "Diff" },
    g = {
      name = "GitHub",
      p = { ":! gh pr view --web<CR>", "Browse PR" },
      P = { ":! gh pr create --web<CR>", "Create PR" },
      w = { ":FloatermNew gh workflow view<CR>", "View workflow" }
    },
    l = { ":Git pull<CR>", "Pull" },
    o = { ":GBrowse<CR>", "Open" },
    p = { ":Git push<CR>", "Push" },
    P = { ":Git push --force-with-lease<CR>", "Force push" },
    s = { ":FloatermNew lazygit<CR>", "Status" },
  },
  q = { ":qa!<CR>", "Quit" },
  m = {
    name = "Markdown",
    p = { ":CocCommand markdown-preview-enhanced.openPreview<CR>", "Preview" },
    w = { ":Goyo<CR>:Pencil<CR>", "Write" }
  },
  s = { ":w!<CR>", "Save current buffer" },
  r = { ":lua require('spectre').open()<CR>", "Replace text" },
  t = {
    name = "Test",
    a = { ":TestSuit<CR>", "All" },
    f = { ":TestFile<CR>", "File" },
    l = { ":TestLast<CR>", "Last" },
    n = { ":TestNearest<CR>", "Nearest" },
    v = { "<cmd>AV<CR>", "Visit" }
  },
  T = {
    name = "Tabs",
    c = { ":tabnew<CR>", "Create tab" },
    d = { ":tabclose<CR>", "Delete tab" },
    n = { ":tabnext<CR>", "Next tab" },
    p = { ":tabprevious<CR>", "Previous tab" }
  },
  u = {
    name = "Update",
    c = { ":CocUpdate<CR>", "CoC" },
    p = { ":PackerSync<CR>", "Packer" }
  },
}, { prefix = "<leader>", mode = "n" })

require("which-key").register({
  g = {
    name = "Git",
    o = { ":'<,'>GBrowse<CR>", "Open" },
  },
  r = { ":'<,'>lua require('spectre').open_visual()<CR>", "Search & replace" },
  t = {
    name = "Text",
    s = { ":'<,'>sort<CR>", "Sort" },
  },
}, { prefix = "<leader>", mode = "v" })
