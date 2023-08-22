return require('packer').startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'EdenEast/nightfox.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Coding
  use { 'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  }
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use({ 'theHamsta/nvim-treesitter-pairs' })
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use 'fannheyward/telescope-coc.nvim'
  use 'LukasPietzschmann/telescope-tabs'
  use 'ntpeters/vim-better-whitespace'
  use 'tpope/vim-surround'
  use 'vim-test/vim-test'
  use 'terrortylor/nvim-comment'
  use 'tpope/vim-projectionist'
  use 'mattn/emmet-vim'
  use 'honza/vim-snippets'

  -- Status line
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- Buffers
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
  use 'kazhala/close-buffers.nvim'

  -- Floaterm
  use 'voldikss/vim-floaterm'

  -- Files
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }

  -- Git support
  use 'lewis6991/gitsigns.nvim'
  use 'shumphrey/fugitive-gitlab.vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'

  -- Utils
  use 'folke/which-key.nvim'
  use { 'smoka7/hop.nvim', tag = '*' }
  use { 'windwp/nvim-spectre', requires = 'nvim-lua/plenary.nvim' }
  use 'diegoulloao/nvim-file-location'
  use { "asiryk/auto-hlsearch.nvim", tag = "1.0.0" }
  use "lukas-reineke/indent-blankline.nvim"
  use "m4xshen/hardtime.nvim"

  -- Markdown
  use 'junegunn/goyo.vim'
  use 'reedes/vim-pencil'
end)
