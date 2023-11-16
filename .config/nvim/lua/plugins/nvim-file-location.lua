return {
  "diegoulloao/nvim-file-location",
  lazy = false,
  config = function()
    require('nvim-file-location').setup({
      keymap = "cp",
      mode = "workdir", -- options: workdir | absolute
      add_line = true,
      add_column = false,
    })
  end
}
