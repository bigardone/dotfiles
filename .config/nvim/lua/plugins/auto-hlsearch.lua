return {
  "bigardone/auto-hlsearch.nvim",
  branch = "nvim-lua-warning-fix",
  event = "BufRead",
  config = function()
    require("auto-hlsearch").setup({
      remap_keys = { "/", "?", "*", "#", "n", "N" },
      create_commands = true,
    })
  end
}
