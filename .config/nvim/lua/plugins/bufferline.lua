return {
  "akinsho/bufferline.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("bufferline").setup({
      options = {
        always_show_bufferline = false,
        diagnostics = false,
        indicator = {
          icon = '',
        },
        left_trunc_marker = '',
        modified_icon = '',
        right_trunc_marker = '',
        separator_style = 'thin',
        show_buffer_close_icons = false,
        show_buffer_icons = false,
        show_close_icon = false,
      }
    })
  end
}
