return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    require("which-key").add({
      {
        -- Normal mode --------------------------------------------------------------------------
        mode = { "n" },
        -- Avante -------------------------------------------------------------------------------
        { "<leader>a",   group = "Avante" },
        { "<leader>aa",  ":AvanteAsk<CR>",                        desc = "Ask" },
        { "<leader>ac",  ":AvanteClear<CR>",                      desc = "Clear" },
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
        { "<leader>cea", ":lua vim.lsp.buf.code_action()<CR>",    desc = "Code actions" },
        { "<leader>cef", ":!mix format<CR>",                      desc = "Format code" },
        { "<leader>cf",  ":CocCommand eslint.executeAutofix<CR>", desc = "Autofix" },
        { "<leader>cr",  ":Telescope coc references<CR>",         desc = "References" },
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
        {
          "<leader>gr",
          function()
            local repo = vim.fn.input "Repository name / URI: "
            if repo ~= "" then
              require("git-dev").open(repo)
            end
          end,
          desc = "Open repository"
        },
        { "<leader>gs", ":FloatermNew lazygit<CR>",                              desc = "Status" },
        -- Harpoon ------------------------------------------------------------------------------
        { "<leader>h",  group = "Harpoon" },
        { "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>",           desc = "Add mark" },
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
        -- Avante -------------------------------------------------------------------------------
        { "<leader>a",   group = "Avante" },
        { "<leader>aa",  function() require('avante.api').ask() end,       desc = "Ask" },
        { "<leader>ae",  function() require('avante.api').edit() end,      desc = "Edit" },
        -- Code ---------------------------------------------------------------------------------
        { "<leader>c",   group = "Code" },
        { "<leader>ce",  group = "Elixir" },
        { "<leader>cea", ":'<,'>lua vim.lsp.buf.code_action()<CR>",        desc = "Code actions" },
        -- Git ----------------------------------------------------------------------------------
        { "<leader>g",   group = "Git" },
        { "<leader>go",  ":'<,'>GBrowse<CR>",                              desc = "Open" },
        -- Find and replace ---------------------------------------------------------------------
        { "<leader>r",   ":'<,'>lua require('spectre').open_visual()<CR>", desc = "Replace text" },
        -- Text ---------------------------------------------------------------------------------
        { "<leader>t",   group = "Text" },
        { "<leader>ts",  ":'<,'>sort<CR>",                                 desc = "Sort" },
      }
    }
    )
  end,
  opts = {
    -- "classic" | "modern" | "helix"
    preset = "helix",
    -- Delay before showing the popup. Can be a number or a function that returns a number.
    delay = 300,
    filter = function(mapping)
      -- example to exclude mappings without a description
      return mapping.desc and mapping.desc ~= ""
    end,
    --- You can add any mappings here, or use `require('which-key').add()` later
    spec = {},
    -- show a warning when issues were detected with your mappings
    notify = true,
    -- Enable/disable WhichKey for certain mapping modes
    triggers = {
      { "<auto>", mode = "nixsotc" },
    },
    -- Start hidden and wait for a key to be pressed before showing the popup
    -- Only used by enabled xo mapping modes.
    defer = function(ctx)
      return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,
    plugins = {
      marks = true,     -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      presets = {
        operators = true,    -- adds help for operators like d, y, ...
        motions = true,      -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true,      -- default bindings on <c-w>
        nav = false,         -- misc bindings to work with windows
        z = true,            -- bindings for folds, spelling and others prefixed with z
        g = false,           -- bindings for prefixed with g
      },
    },
    win = {
      -- don't allow the popup to overlap with the cursor
      no_overlap = true,
      -- width = 1,
      -- height = { min = 4, max = 25 },
      -- col = 0,
      -- row = math.huge,
      border = "single",
      padding = { 1, 0 }, -- extra window padding [top/bottom, right/left]
      title = false,
      title_pos = "center",
      zindex = 1000,
      -- Additional vim.wo and vim.bo options
      bo = {},
      wo = {
        -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      },
    },
    layout = {
      width = { min = 20 }, -- min and max width of the columns
      spacing = 3,          -- spacing between columns
      align = "left",       -- align columns left, center or right
    },
    keys = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    --- Mappings are sorted using configured sorters and natural sort of the keys
    --- Available sorters:
    --- * local: buffer-local mappings first
    --- * order: order of the items (Used by plugins like marks / registers)
    --- * group: groups last
    --- * alphanum: alpha-numerical first
    --- * mod: special modifier keys last
    --- * manual: the order the mappings were added
    --- * case: lower-case first
    sort = { "manual", "local", "order", "group", "alphanum", "mod" },
    expand = 0, -- expand groups when <= n mappings
    -- expand = function(node)
    --   return not node.desc -- expand all nodes without a description
    -- end,
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
        -- { "<Space>", "SPC" },
      },
      desc = {
        { "<Plug>%((.*)%)", "%1" },
        { "^%+",            "" },
        { "<[cC]md>",       "" },
        { "<[cC][rR]>",     "" },
        { "<[sS]ilent>",    "" },
        { "^lua%s+",        "" },
        { "^call%s+",       "" },
        { "^:%s*",          "" },
      },
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
      ellipsis = "…",
      --- See `lua/which-key/icons.lua` for more details
      --- Set to `false` to disable keymap icons
      rules = false,
      -- use the highlights from mini.icons
      -- When `false`, it will use `WhichKeyIcon` instead
      colors = true,
      -- used by key format
      keys = {
        -- Up = " ",
        -- Down = " ",
        -- Left = " ",
        -- Right = " ",
        -- C = "󰘴 ",
        -- M = "󰘵 ",
        -- S = "󰘶 ",
        -- CR = "󰌑 ",
        -- Esc = "󱊷 ",
        -- ScrollWheelDown = "󱕐 ",
        -- ScrollWheelUp = "󱕑 ",
        -- NL = "󰌑 ",
        -- BS = "⌫",
        -- Space = "󱁐 ",
        -- Tab = "󰌒 ",
        -- F1 = "󱊫",
        -- F2 = "󱊬",
        -- F3 = "󱊭",
        -- F4 = "󱊮",
        -- F5 = "󱊯",
        -- F6 = "󱊰",
        -- F7 = "󱊱",
        -- F8 = "󱊲",
        -- F9 = "󱊳",
        -- F10 = "󱊴",
        -- F11 = "󱊵",
        -- F12 = "󱊶",
      },
    },
    show_help = false, -- show a help message in the command line for using WhichKey
    show_keys = false, -- show the currently pressed key and its label as a message in the command line
    -- Which-key automatically sets up triggers for your mappings.
    -- But you can disable this and setup the triggers yourself.
    -- Be aware, that triggers are not needed for visual and operator pending mode.
    disable = {
      -- disable WhichKey for certain buf types and file types.
      ft = {},
      bt = {},
    },
    debug = false, -- enable wk.log in the current directory
  }
}
