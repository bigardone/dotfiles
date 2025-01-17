return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")

    neocodeium.setup({
      filetypes = {
        TelescopePrompt = false,
        ["dap-repl"] = false
      }
    })

    vim.keymap.set("i", "<C-e>", neocodeium.accept)
    vim.keymap.set("i", "<C-n>", neocodeium.cycle_or_complete)
  end,
}
