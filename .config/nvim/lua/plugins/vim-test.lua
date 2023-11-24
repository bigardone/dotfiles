return {
  "vim-test/vim-test",
  event = "VeryLazy",
  config = function()
    vim.g['test#strategy'] = 'floaterm'
    vim.g['test#preserve_screen'] = true
  end
}
