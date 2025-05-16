return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")

    neocodeium.setup({
      filetypes = {
        TelescopePrompt = false,
        ["dap-repl"] = false
      },
      filter = function(bufnr)
        if vim.endswith(vim.api.nvim_buf_get_name(bufnr), ".envrc") then
          return false
        end
        return true
      end
    })

    vim.keymap.set("i", "<C-e>", neocodeium.accept)
    vim.keymap.set("i", "<C-n>", neocodeium.cycle_or_complete)
  end,
}
