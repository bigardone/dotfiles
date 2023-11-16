return {
  "asiryk/auto-hlsearch.nvim",
  lazy = false,
  confg = function()
    require("auto-hlsearch").setup({
      remap_keys = { "/", "?", "*", "#", "n", "N" },
      create_commands = true,
    })
  end
}
