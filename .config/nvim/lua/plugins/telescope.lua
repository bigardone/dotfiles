return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "fannheyward/telescope-coc.nvim",
    "polirritmico/telescope-lazy-plugins.nvim"
  },
  config = function()
    local actions = require('telescope.actions')

    require('telescope').load_extension('coc')

    require('telescope').setup({
      defaults = {
        preview = {
          treesitter = false,
        },
        prompt_prefix = "",
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<esc>"] = actions.close
          }
        },
        file_ignore_patterns = {
          "._build/",
          ".cover/",
          ".deps/",
          ".elixir_ls/",
          ".git/",
          ".node_modules/"
        }
      }
    })
  end
}
