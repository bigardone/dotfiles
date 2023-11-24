return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require('lualine').setup({
      options = {
        theme = 'catppuccin',
        disabled_filetypes = { 'NvimTree' },
        globalstatus = true
      },
    })
  end
}
