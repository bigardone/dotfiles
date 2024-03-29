return {
  "asiryk/auto-hlsearch.nvim",
  event = "BufRead",
  config = function()
    require("auto-hlsearch").setup({
      remap_keys = { "/", "?", "*", "#", "n", "N" },
      create_commands = true,
    })
  end
}
