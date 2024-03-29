return {
  "tpope/vim-projectionist",
  event = "VeryLazy",
  config = function()
    vim.g.projectionist_heuristics = {
      ['mix.exs'] = {
        ['lib/*.ex'] = {
          type = 'lib',
          alternate = 'test/{}_test.exs'
        },
        ['test/*_test.exs'] = {
          type = 'test',
          alternate = 'lib/{}.ex'
        }
      }
    }
  end
}
