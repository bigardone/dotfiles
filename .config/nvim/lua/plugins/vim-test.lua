return {
  "vim-test/vim-test",
  lazy = false,
  config = function()
    vim.g['test#strategy'] = 'floaterm'
    vim.g['test#preserve_screen'] = true
  end
}
