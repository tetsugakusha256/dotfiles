require("lazy").setup({
    -- Start screen dashboard
    'glepnir/dashboard-nvim',
    ---------------------------------------------
    --- Colorschemes
    ---------------------------------------------

    -- Different colorschemes
    'folke/tokyonight.nvim',
    {
      'catppuccin/nvim',
      name = 'catppuccin'
    },
    {
      'EdenEast/nightfox.nvim',
    },

    {
      'onsails/lspkind.nvim',
    },
    {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require("colorizer").setup()
      end,
    },
    -- (LSP server, Linters, Formatters, DAP) manager
    "williamboman/mason.nvim",
    -- To bridge mason.nvim with lspconfig
    "williamboman/mason-lspconfig.nvim",
    -- Configurations for Nvim LSP
    'neovim/nvim-lspconfig',
    -- Rust analyzer config
    'simrat39/rust-tools.nvim',

    -- Static highligting
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },

    -- File explorer for nvim
    "nvim-tree/nvim-tree.lua",

    ---------------------------------------------
    --- Completion
    ---------------------------------------------
    -- Copilot
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      enabled = false
    },
    -- Auto completion
    {
      "zbirenbaum/copilot-cmp",
      enabled = false,
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    -- Snippets TODO check snippets
    'hrsh7th/vim-vsnip',
    -- Snippets integration into cmp
    'hrsh7th/cmp-vsnip',
    -- Path completion
    'FelipeLema/cmp-async-path',
    -- Lua nvim function completion
    'hrsh7th/cmp-nvim-lua',
    -- Nerd font completion
    'chrisgrieser/cmp-nerdfont',

    -- Comment
    'numToStr/Comment.nvim',
    -- Surround easy surrounding
    -- 'tpope/vim-surround',
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
      end
    },
    -- Undo tree explorer
    'mbbill/undotree',
    -- Fromatting plugin none lsp source to lsp client (formatter)
    'jose-elias-alvarez/null-ls.nvim',
    {
      "jay-babu/mason-null-ls.nvim",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim",
      },

      -- config = function()
      --   require("your.null-ls.config") -- require your null-ls config here (example below)
      -- end,
    },

    -- Autoalign
    'junegunn/vim-easy-align',
    -- Smooth page scroll
    'karb94/neoscroll.nvim',
    -- This will auto close ( [ {
    {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {
        enable_check_bracket_line = true
      } -- this is equalent to setup({}) function
    },
    -- Hop (more modern version of easymotion like motion)
    -- 'phaazon/hop.nvim',
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {
        modes = {
          -- options used when flash is activated through
          -- a regular search with `/` or `?`
          search = {
            -- when `true`, flash will be activated during regular search by default.
            -- You can always toggle when searching with `require("flash").toggle()`
            enabled = false,
          }
        }
      },
      keys = {
        {
          "s",
          mode = { "n", "x", "o" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
        -- {
        --   "ys",
        --   mode = { "n", "o", "x" },
        --   function()
        --     require("flash").treesitter()
        --   end,
        --   desc = "Flash Treesitter",
        -- },
        {
          "r",
          mode = "o",
          function()
            require("flash").remote()
          end,
          desc = "Remote Flash",
        },
        {
          "R",
          mode = { "o", "x" },
          function()
            require("flash").treesitter_search()
          end,
          desc = "Flash Treesitter Search",
        },
        {
          "<c-s>",
          mode = { "c" },
          function()
            require("flash").toggle()
          end,
          desc = "Toggle Flash Search",
        },
      },
    },
    -- Telescope (fuzzy finding)
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope.nvim',
      --        commit = '2f32775'
    },
    ---------------------------------------------
    --- Git
    ---------------------------------------------
    -- Git lazygit
    ({
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    }),
    -- Git fugitive
    'tpope/vim-fugitive',
    -- Git flog (git timeline)
    'rbong/vim-flog',
    -- Git show sign
    'lewis6991/gitsigns.nvim',
    -- Scrollbar with support for gitsigns
    'petertriho/nvim-scrollbar',


    -- Bufferline plugin to add buffer tab bar on top
    'akinsho/bufferline.nvim',
    -- Lualine is a new statusline for nvim
    'nvim-lualine/lualine.nvim',
    -- If you want to have icons in your statusline choose one of these
    'kyazdani42/nvim-web-devicons',
    -- Todo
    ({
      "folke/todo-comments.nvim",
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
    }),
    -- Harpoon
    'ThePrimeagen/harpoon',
    -- Fun
    {
      'eandrju/cellular-automaton.nvim',
      cmd = "CellularAutomaton",
    },
    ---------------------------------------------
    -- Organisation
    ---------------------------------------------
    -- dersonal wiki for organisation and note taking
    {
      'vimwiki/vimwiki',
      ft = "markdown"
    },
    -- Anki
    {
      "rareitems/anki.nvim",
      config = function()
        require("anki").setup({
          -- this function will add support for associating '.anki' extension with both 'anki' and 'tex' filetype.
          tex_support = false,
          models = {
            -- Here you specify which notetype should be associated with which deck
            ["One Q one A Code"] = "Code",
          },
        })
      end,
    },
    -- Session manager
    {
      'rmagatti/auto-session',
    },
    {
      'kevinhwang91/nvim-ufo',
      dependencies = 'kevinhwang91/promise-async'
    },
    {
      'dccsillag/magma-nvim',
      build = ':UpdateRemotePlugins'
    },

    -- Leetcode plugin
    {
      "Dhanus3133/LeetBuddy.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
      },
      config = function()
        require("leetbuddy").setup({
          language = "js",
        })
      end,
      keys = {
        { "<leader>kq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
        { "<leader>kk", "<cmd>LBQuestion<cr>",  desc = "View Question" },
        { "<leader>kr", "<cmd>LBReset<cr>",     desc = "Reset Code" },
        { "<leader>kt", "<cmd>LBTest<cr>",      desc = "Run Code" },
        { "<leader>ks", "<cmd>LBSubmit<cr>",    desc = "Submit Code" },
      },
    }
  },
  {
    root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
    defaults = {
      lazy = false,                           -- should plugins be lazy-loaded?
      version = nil,
      -- default `cond` you can use to globally disable a lot of plugins
      -- when running inside vscode for example
      cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
      -- version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    -- leave nil when passing the spec as the first argument to setup()
    spec = nil, ---@type LazySpec
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
    concurrency = nil, ---@type number limit the maximum amount of concurrent tasks
    git = {
      -- defaults for the `Lazy log` command
      -- log = { "-10" }, -- show the last 10 commits
      log = { "-8" }, -- show commits from the last 3 days
      timeout = 120,  -- kill processes that take more than 2 minutes
      url_format = "https://github.com/%s.git",
      -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
      -- then set the below to false. This should work, but is NOT supported and will
      -- increase downloads a lot.
      filter = true,
    },
    dev = {
      -- directory where you store your local plugin projects
      path = "~/projects",
      ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
      patterns = {},    -- For example {"folke"}
      fallback = false, -- Fallback to git when local plugin doesn't exist
    },
    install = {
      -- install missing plugins on startup. This doesn't increase startup time.
      missing = true,
      -- try to load one of these colorschemes when starting an installation during startup
      colorscheme = { "habamax" },
    },
    ui = {
      -- a number <1 is a percentage., >1 is a fixed size
      size = { width = 0.8, height = 0.8 },
      wrap = true, -- wrap the lines in the ui
      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
      border = "none",
      title = nil, ---@type string only works when border is not "none"
      title_pos = "center", ---@type "center" | "left" | "right"
      icons = {
        cmd = " ",
        config = "",
        event = "",
        ft = " ",
        init = " ",
        import = " ",
        keys = " ",
        lazy = "󰒲 ",
        loaded = "●",
        not_loaded = "○",
        plugin = " ",
        runtime = " ",
        source = " ",
        start = "",
        task = "✔ ",
        list = {
          "●",
          "➜",
          "★",
          "‒",
        },
      },
      -- leave nil, to automatically select a browser depending on your OS.
      -- If you want to use a specific browser, you can define it here
      browser = nil, ---@type string?
      throttle = 20, -- how frequently should the ui process render events
      custom_keys = {
        -- you can define custom key maps here.
        -- To disable one of the defaults, set it to false

        -- open lazygit log
        ["<localleader>l"] = function(plugin)
          require("lazy.util").float_term({ "lazygit", "log" }, {
            cwd = plugin.dir,
          })
        end,


        -- open a terminal for the plugin dir
        ["<localleader>t"] = function(plugin)
          require("lazy.util").float_term(nil, {
            cwd = plugin.dir,
          })
        end,
      },
    },
    diff = {
      -- diff command <d> can be one of:
      -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
      --   so you can have a different command for diff <d>
      -- * git: will run git diff and open a buffer with filetype git
      -- * terminal_git: will open a pseudo terminal with git diff
      -- * diffview.nvim: will open Diffview to show the diff
      cmd = "git",
    },
    checker = {
      -- automatically check for plugin updates
      enabled = false,
      concurrency = nil, ---@type number? set to 1 to check for updates very slowly
      notify = true,    -- get a notification when new updates are found
      frequency = 3600, -- check for updates every hour
    },
    change_detection = {
      -- automatically check for config file changes and reload the ui
      enabled = true,
      notify = true, -- get a notification when changes are found
    },
    performance = {
      cache = {
        enabled = true,
      },
      reset_packpath = true, -- reset the package path to improve startup time
      rtp = {
        reset = true,        -- reset the runtime path to $VIMRUNTIME and your config directory
        ---@type string[]
        paths = {},          -- add any custom paths here that you want to includes in the rtp
        ---@type string[] list any plugins you want to disable here
        disabled_plugins = {
          -- "zipPlugin",
        },
      },
    },
    -- lazy can generate helptags from the headings in markdown readme files,
    -- so :help works even for plugins that don't have vim docs.
    -- when the readme opens with :help it will be correctly displayed as markdown
    readme = {
      enabled = true,
      root = vim.fn.stdpath("state") .. "/lazy/readme",
      files = { "README.md", "lua/**/README.md" },
      -- only generate markdown helptags for plugins that dont have docs
      skip_if_doc_exists = true,
    },
    state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
  }
)

-- Might be unnecessary with lazy
require "_lspconfig"
require "_null-ls"
require "_nvim-treesitter"
require "_nvim-cmp"
-- require "_hop"
require "_flash"
require "_comment"
require "_lualine"
require "_telescope"
require "_dashboard"
require "_nvim-tree"
require "_todo-comments"
require "_autosession"
require "_lspkind"
-- require "_copilot"
require "_nvim-scrollbar"
require "_gitsigns"
require "_surround"
require "_neoscroll"
-- require "_obsidian"
require "_ufo"
