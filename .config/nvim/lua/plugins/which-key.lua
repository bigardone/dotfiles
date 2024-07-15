return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    require("which-key").add({
      {
        -- Normal mode --------------------------------------------------------------------------
        mode = { "n" },
        -- Buffers ------------------------------------------------------------------------------
        { "<leader>b",   group = "Buffer" },
        { "<leader>bc",  group = "Close" },
        { "<leader>bca", ":BufferCloseAllButPinned<CR>",          desc = "All" },
        { "<leader>bch", ":BufferCloseAllButVisible<CR>",         desc = "Hidden" },
        { "<leader>bd",  ":BufferClose<CR>",                      desc = "Delete" },
        { "<leader>bp",  ":BufferPin<CR>",                        desc = "Pin" },
        { "<leader>bs",  ":BufferPick<CR>",                       desc = "Switch" },
        -- Code ---------------------------------------------------------------------------------
        { "<leader>c",   group = "Code" },
        { "<leader>ca",  ":Telescope coc line_code_actions<CR>",  desc = "Line actions" },
        { "<leader>cA",  ":Telescope coc file_code_actions<CR>",  desc = "File actions" },
        { "<leader>ce",  group = "Elixir" },
        { "<leader>cef", ":!mix format<CR>",                      desc = "Format code" },
        { "<leader>cf",  ":CocCommand eslint.executeAutofix<CR>", desc = "Autofix" },
        { "<leader>cr",  "<Plug>(coc-rename)",                    desc = "Rename" },
        { "<leader>cs",  ":Telescope coc document_symbols<CR>",   desc = "Symbols" },
        -- Find ---------------------------------------------------------------------------------
        { "<leader>f",   group = "Find" },
        { "<leader>fb",  ":Telescope buffers<CR>",                desc = "Buffers" },
        { "<leader>fd",  ":Telescope coc diagnostics<CR>",        desc = "Diagnostics" },
        { "<leader>ff",  ":Telescope find_files<CR>",             desc = "Files" },
        { "<leader>fF",  ":Telescope find_files hidden=true<CR>", desc = "Files (hidden)" },
        { "<leader>fh",  ":Telescope oldfiles<CR>",               desc = "History" },
        { "<leader>fm",  ":Telescope git_status<CR>",             desc = "Modified files" },
        { "<leader>fp",  ":Telescope lazy_plugins<CR>",           desc = "Plugins" },
        { "<leader>fr",  ":Telescope registers<CR>",              desc = "Registers" },
        { "<leader>ft",  ":Telescope live_grep<CR>",              desc = "Files with text" },
        -- Git ----------------------------------------------------------------------------------
        { "<leader>g",   group = "Git" },
        { "<leader>gb",  ":Git blame<CR>",                        desc = "Blame" },
        { "<leader>gd",  ":Git diff<CR>",                         desc = "Diff" },
        { "<leader>gg",  group = "GitHub" },
        { "<leader>ggp", ":! gh pr view --web<CR>",               desc = "Browse PR" },
        { "<leader>ggP", ":! gh pr create --web<CR>",             desc = "Create PR" },
        { "<leader>ggw", ":FloatermNew gh workflow view<CR>",     desc = "View workflow" },
        { "<leader>gl",  ":Git pull<CR>",                         desc = "Pull" },
        { "<leader>go",  ":GBrowse<CR>",                          desc = "Open" },
        { "<leader>gp",  ":Git push<CR>",                         desc = "Push" },
        { "<leader>gP",  ":Git push --force-with-lease<CR>",      desc = "Force push" },
        { "<leader>gr", function()
          local repo = vim.fn.input "Repository name / URI: "
          if repo ~= "" then
            require("git-dev").open(repo)
          end
        end, desc = "Open repository" },
        { "<leader>gs", ":FloatermNew lazygit<CR>",                              desc = "Status" },
        -- Harpoon ------------------------------------------------------------------------------
        { "<leader>h",  group = "Harpoon" },
        { "<leader>ha", ":lua require('harpoon.mark').add<CR>",                  desc = "Add mark" },
        { "<leader>hf", ":lua require('harpoon.ui').toggle_quick_menu()<CR>",    desc = "Find marks" },
        { "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>",             desc = "Next mark" },
        { "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>",             desc = "Previous mark" },
        -- Quit ---------------------------------------------------------------------------------
        { "<leader>q",  ":qa!<CR>",                                              desc = "Quit" },
        -- Markdown -----------------------------------------------------------------------------
        { "<leader>m",  group = "Markdown" },
        { "<leader>mp", ":CocCommand markdown-preview-enhanced.openPreview<CR>", desc = "Preview" },
        { "<leader>mw", ":Goyo<CR>:Pencil<CR>",                                  desc = "Write" },
        -- Save ---------------------------------------------------------------------------------
        { "<leader>s",  ":w!<CR>",                                               desc = "Save current buffer" },
        -- Replace ------------------------------------------------------------------------------
        { "<leader>r",  ":lua require('spectre').open()<CR>",                    desc = "Replace text" },
        -- Test ---------------------------------------------------------------------------------
        { "<leader>t",  group = "Test" },
        { "<leader>ta", ":TestSuit<CR>",                                         desc = "All" },
        { "<leader>tf", ":TestFile<CR>",                                         desc = "File" },
        { "<leader>tl", ":TestLast<CR>",                                         desc = "Last" },
        { "<leader>tn", ":TestNearest<CR>",                                      desc = "Nearest" },
        { "<leader>tv", "<cmd>AV<CR>",                                           desc = "Visit" },
        -- Tabs ---------------------------------------------------------------------------------
        { "<leader>T",  group = "Tabs" },
        { "<leader>Tc", ":tabnew<CR>",                                           desc = "Create tab" },
        { "<leader>Td", ":tabclose<CR>",                                         desc = "Delete tab" },
        { "<leader>Tn", ":tabnext<CR>",                                          desc = "Next tab" },
        { "<leader>Tp", ":tabprevious<CR>",                                      desc = "Previous tab" },
        -- Update -------------------------------------------------------------------------------
        { "<leader>u",  group = "Update" },
        { "<leader>uc", ":CocUpdate<CR>",                                        desc = "CoC" },
        { "<leader>up", ":Lazy sync<CR>",                                        desc = "Plugins" },
      },
      {
        -- Visual mode --------------------------------------------------------------------------
        mode = { "v" },
        -- Git ----------------------------------------------------------------------------------
        { "<leader>g",  group = "Git" },
        { "<leader>go", ":'<,'>GBrowse<CR>",                              desc = "Open" },
        -- Find and replace ---------------------------------------------------------------------
        { "<leader>r",  ":'<,'>lua require('spectre').open_visual()<CR>", desc = "Replace text" },
        -- Text ---------------------------------------------------------------------------------
        { "<leader>t",  group = "Text" },
        { "<leader>ts", ":'<,'>sort<CR>",                                 desc = "Sort" },
      }
    }
    )
  end,
  opts = {
    expand = 0,
    icons = {
      rules = false,
    },
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
    sort = { "manual", "local", "order", "group", "alphanum", "mod", "lower", "icase" },
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
  }
}
