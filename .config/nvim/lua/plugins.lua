return require('packer').startup(function(use)
  -- Packer can manage itself :O
  use 'wbthomason/packer.nvim'

    -- Start screen dashboard
    use 'glepnir/dashboard-nvim'
    -- colorscheme
    use 'folke/tokyonight.nvim'
    use {'catppuccin/nvim', as ='catppuccin'}
    use 'EdenEast/nightfox.nvim'
        -- use 'marko-cerovac/material.nvim'   

    -- (LSP server, Linters, Formatters, DAP) manager
    use "williamboman/mason.nvim"

    -- Configurations for Nvim LSP
    use 'neovim/nvim-lspconfig'
    -- To bridge mason.nvim with lspconfig
    use "williamboman/mason-lspconfig.nvim"



    -- Auto complete
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- Snippets
    use 'hrsh7th/vim-vsnip'
    -- Snippets integration into cmp
    use 'hrsh7th/cmp-vsnip'

    -- use {"ms-jpq/coq_nvim", branch = 'coq'}
    -- Surround
    use 'tpope/vim-surround'

    use 'nvim-treesitter/nvim-treesitter'


    -- smooth page scroll
    use 'psliwka/vim-smoothie'
        -- use 'karb94/neoscroll.nvim'

    --this will auto close ( [ {
    use 'jiangmiao/auto-pairs'

    -- hop (more modern version of easymotion like motion)
    use 'phaazon/hop.nvim'

    -- telescope (fuzzy finding)
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    -- Sorter for telescope
--    use {'nvim-telescope/telescope-fzf-native.nvim',  'do' = 'make' }

    -- Bufferline plugin to add buffer tab bar on top
    use 'akinsho/bufferline.nvim'
    -- Lualine is a new statusline for nvim
    use 'nvim-lualine/lualine.nvim'
    -- If you want to have icons in your statusline choose one of these
    use 'kyazdani42/nvim-web-devicons'
    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

--    -- Which key, shows which command are available after a given comand
--    -- use 'liuchengxu/vim-which-key'
--
--    -- Denite for file search (fuzzy finding files)
--    --    if has('nvim')
--    --          use 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
--    --    else
--    --          use 'Shougo/denite.nvim'
--    --          use 'roxma/nvim-yarp'
--    --          use 'roxma/vim-hug-neovim-rpc'
--    --    endif
--
--    -- these two plugins will add highlighting and indenting to JSX and TSX files.
--    --use 'yuezk/vim-js'
--    --use 'HerringtonDarkholme/yats.vim'
--    --use 'maxmellon/vim-jsx-pretty'
end)

