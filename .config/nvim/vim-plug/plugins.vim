" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Surround
    " Plug 'blackcauldron7/surround.nvim'
    Plug 'tpope/vim-surround'
    " colorscheme
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' } 
    Plug 'marko-cerovac/material.nvim'   
    " Plug 'EdenEast/nightfox.nvim'

    " Mark indentation level
    Plug 'lukas-reineke/indent-blankline.nvim'

    " LSP config
    Plug 'neovim/nvim-lspconfig'    
    
    " Because autocomplete is not supported with the base lsp feature we need
    " to use a plugin
    Plug 'hrsh7th/nvim-cmp'
    " those pluggins are various sources for the autocompletion to work with
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    " snippet sources
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
        " snippet made by community
        Plug 'rafamadriz/friendly-snippets'

    " Makes go to def, diagnostic etc prettier
    " Plug 'glepnir/lspsaga.nvim'

    " Manager to install more lsp server easily
    Plug 'williamboman/nvim-lsp-installer'
    " Easy comment 
    Plug 'preservim/nerdcommenter'

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    " Plug 'scrooloose/NERDTree'

    " f,t on multiple lines
    Plug 'dahu/vim-fanfingtastic'
    " needed to make fanfingtastic work with . (repeat)
    Plug 'tpope/vim-repeat'

    " smooth page scroll
    Plug 'psliwka/vim-smoothie'
    " Plug 'karb94/neoscroll.nvim'


    " this is for auto complete, prettier and tslinting
    " Plug 'neoclide/coc.nvim', {'branch':'release'}
    " list of CoC extensions needed
    " let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

    "this will auto close ( [ {
    Plug 'jiangmiao/auto-pairs' 
    " Easymotion
    Plug 'easymotion/vim-easymotion'

    " telescope (fuzzy finding)
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Sorter for telescope
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " Bufferline plugin to add buffer tab bar on top
    Plug 'akinsho/bufferline.nvim'
    " Lualine is a new statusline for nvim
    Plug 'nvim-lualine/lualine.nvim'
    " If you want to have icons in your statusline choose one of these
    Plug 'kyazdani42/nvim-web-devicons'
    " File explorer
    Plug 'kyazdani42/nvim-tree.lua'

    " Which key, shows which command are available after a given comand
    " Plug 'liuchengxu/vim-which-key'

    " Denite for file search (fuzzy finding files)
    "    if has('nvim')
    "          Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
    "    else
    "          Plug 'Shougo/denite.nvim'
    "          Plug 'roxma/nvim-yarp'
    "          Plug 'roxma/vim-hug-neovim-rpc'
    "    endif

    " these two plugins will add highlighting and indenting to JSX and TSX files.
    "Plug 'yuezk/vim-js'
    "Plug 'HerringtonDarkholme/yats.vim'
    "Plug 'maxmellon/vim-jsx-pretty'

call plug#end()




























