return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  lazy = false,
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    animation = false,
    clickable = false,
    tabpages = false,
    icons = {
      buffer_index = true,
      button = false,
      filetype = {
        enabled = false
      },
      pinned = {
        button = '',
        filename = true
      },
      separator = {
        left = '',
        right = ''
      },
      separator_at_end = false,
      preset = 'default'
    },
    semantic_letters = false
  },
}
