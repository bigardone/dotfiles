return {
  "kyazdani42/nvim-tree.lua",
  lazy = false,
  config = function()
    vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=None]])
    require("nvim-tree").setup({
      actions = {
        open_file = {
          quit_on_open = true
        }
      },
      disable_netrw = false,
      hijack_netrw = true,
      view = {
        side = 'right',
      },
      renderer = {
        icons = {
          show = {
            folder_arrow = false,
            folder = true,
            file = true,
            git = true
          }
        }
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
}
