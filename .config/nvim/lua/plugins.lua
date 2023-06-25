require('packer').startup(function(use)
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

  -- Comment
  use 'numToStr/Comment.nvim'
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
  use { 'nvim-telescope/telescope.nvim',
    --        commit = '2f32775'
  }
  -- Bufferline plugin to add buffer tab bar on top
  use 'akinsho/bufferline.nvim'
  -- Lualine is a new statusline for nvim
  use 'nvim-lualine/lualine.nvim'
  -- If you want to have icons in your statusline choose one of these
  use 'kyazdani42/nvim-web-devicons'
  -- dersonal wiki for organisation and note taking
  use 'vimwiki/vimwiki'
  -- Fun
  use 'eandrju/cellular-automaton.nvim'
  -- Session manager
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        auto_session_use_git_branch = false,

        auto_session_enable_last_session = false,

        -- ⚠️ This will only work if Telescope.nvim is installed
        -- The following are already the default values, no need to provide them if these are already the settings you want.
        session_lens = {
          -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }
    end
  }
end)

-- Setting up all the plugins
-- order is important (lspconfig should also be setup after those which it is now in init.lua)
-- Before lspconfig (Check)
require "_lspconfig"
require "_nvim-treesitter"
require "_nvim-cmp"
require "_hop"
require "_comment"
require "_lualine"
require "_telescope"
require "_dashboard"
require "_nvim-tree"
-- Buffer tab might be against vim philosophy so I'll try without it for a while
-- require "_bufferline"
