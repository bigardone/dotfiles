require('nvim-tree').setup({
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
  }
})

