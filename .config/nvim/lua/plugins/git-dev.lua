return {
  "moyiz/git-dev.nvim",
  -- event = "VeryLazy",
  opts = {
    opener = function(dir)
      vim.cmd("NvimTreeOpen " .. vim.fn.fnameescape(dir))
    end
  },
}
