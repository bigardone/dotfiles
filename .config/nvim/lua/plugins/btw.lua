return {
  "letieu/btw.nvim",
  lazy = false,
  config = function()
    require('btw').setup(
      {
        text = "I use Neovim & Zellij (BTW)",
      }
    )
  end,
}
