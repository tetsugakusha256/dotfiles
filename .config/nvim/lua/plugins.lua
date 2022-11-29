return require('packer').startup(function(use)
  -- Plugin manager for nvim, Packer can manage itself :O
  use 'wbthomason/packer.nvim'

  -- Start screen dashboard
  use 'glepnir/dashboard-nvim'
  -- Different colorschemes
  use 'folke/tokyonight.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'EdenEast/nightfox.nvim'

  -- (LSP server, Linters, Formatters, DAP) manager
  use "williamboman/mason.nvim"
  -- To bridge mason.nvim with lspconfig
  use "williamboman/mason-lspconfig.nvim"
  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'

  -- Static highligting 
  use 'nvim-treesitter/nvim-treesitter'

  -- File explorer for nvim
  use "nvim-tree/nvim-tree.lua"

  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- Snippets TODO check snippets 
  use 'hrsh7th/vim-vsnip'
  -- Snippets integration into cmp
  use 'hrsh7th/cmp-vsnip'

  -- Surround easy surrounding 
  use 'tpope/vim-surround'

  -- Smooth page scroll
  use 'psliwka/vim-smoothie'

  -- This will auto close ( [ {
  use 'jiangmiao/auto-pairs'

  -- Hop (more modern version of easymotion like motion)
  use 'phaazon/hop.nvim'

  -- Telescope (fuzzy finding)
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- Bufferline plugin to add buffer tab bar on top
  use 'akinsho/bufferline.nvim'
  -- Lualine is a new statusline for nvim
  use 'nvim-lualine/lualine.nvim'
  -- If you want to have icons in your statusline choose one of these
  use 'kyazdani42/nvim-web-devicons'
  -- Personal wiki for organisation and note taking
  use 'vimwiki/vimwiki'
  -- Fun 
  use 'eandrju/cellular-automaton.nvim'
end)
