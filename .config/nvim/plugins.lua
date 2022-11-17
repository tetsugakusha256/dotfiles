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

    -- Surround
    use 'tpope/vim-surround'
        -- use 'blackcauldron7/surround.nvim'
    
    -- Easy comment 
        -- use 'preservim/nerdcommenter'

--    -- Mark indentation level
--    use 'lukas-reineke/indent-blankline.nvim'
--
--    -- LSP config
--    use 'neovim/nvim-lspconfig'    
--    
--    -- Because autocomplete is not supported with the base lsp feature we need
--    -- to use a plugin
--    use 'hrsh7th/nvim-cmp'
--    -- those pluggins are various sources for the autocompletion to work with
--    use 'hrsh7th/cmp-nvim-lsp'
--    use 'hrsh7th/cmp-buffer'
--    use 'hrsh7th/cmp-path'
--    use 'hrsh7th/cmp-cmdline'
--    -- snippet sources
--    use 'hrsh7th/cmp-vsnip'
--    use 'hrsh7th/vim-vsnip'
--    -- snippet made by community
--    use 'rafamadriz/friendly-snippets'
--
--    -- Makes go to def, diagnostic etc prettier
--        -- use 'glepnir/lspsaga.nvim'
--
--    -- Manager to install more lsp server easily
--    use 'williamboman/nvim-lsp-installer'
--
--    -- Better Syntax Support
--    use 'sheerun/vim-polyglot'
--    -- File Explorer
--    -- use 'scrooloose/NERDTree'
--
--    -- f,t on multiple lines
--    use 'dahu/vim-fanfingtastic'
--    -- needed to make fanfingtastic work with . (repeat)
--    use 'tpope/vim-repeat'
--
    -- smooth page scroll
    use 'psliwka/vim-smoothie'
        -- use 'karb94/neoscroll.nvim'
--
--
--    -- this is for auto complete, prettier and tslinting
--        -- use 'neoclide/coc.nvim', {'branch':'release'}
--    -- list of CoC extensions needed
--    -- let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
--
--    --this will auto close ( [ {
--    use 'jiangmiao/auto-pairs' 
--    -- Easymotion
--        -- use 'easymotion/vim-easymotion'
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
