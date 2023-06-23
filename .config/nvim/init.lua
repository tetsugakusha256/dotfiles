-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.g.mapleader = " "

-------------------------------------------------------
-- PLUGINS
-------------------------------------------------------

require "plugins"
-- order is important (lspconfig should also be setup after those which it is now in init.lua)
require("mason").setup()
require("mason-lspconfig").setup()
-- Before lspconfig (Check)
require "_nvim-treesitter"
require "_nvim-cmp"
require "_lspconfig"
require "_hop"
require "_lualine"
require "_telescope"
require "_bufferline"
require "_dashboard"
require "_nvim-tree"


-------------------------------------------------------
-- KEYMAPPINGS
-------------------------------------------------------

vim.api.nvim_set_keymap("n", "<Leader>vr", ":source $MYVIMRC<CR>", { noremap = true })

-- TODO remap jlk to nei when using colemak

-- This is for qwertz configuration
-----    -- Move the cursor based on physical lines
-----    vim.api.nvim_set_keymap("n", "j", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, expr = true })
-----    vim.api.nvim_set_keymap("n", "k", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, expr = true })
-----
-----    -- Move up and down half a page
-----    vim.api.nvim_set_keymap("", "<c-j>", "<Plug>(SmoothieDownwards)", { noremap = true, silent = true })
-----    vim.api.nvim_set_keymap("", "<c-k>", "<Plug>(SmoothieUpwards)", { noremap = true, silent = true })
-----
-----    -- Move line up or down
-----    vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
-----    vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
-----    vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
-----    vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
-----    vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
-----    vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })
-----
-----    -- Bufferline switch buffer
-----    vim.api.nvim_set_keymap("", "<c-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
-----    vim.api.nvim_set_keymap("", "<c-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })


-- This is for colemak configuration
-- Move the cursor based on physical lines
vim.api.nvim_set_keymap("n", "n", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "e", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "i", "l", { noremap = true })
vim.api.nvim_set_keymap("n", "j", "e", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "n", { noremap = true })
vim.api.nvim_set_keymap("n", "l", "i", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "I", { noremap = true })
vim.api.nvim_set_keymap("n", "K", "N", { noremap = true })
vim.api.nvim_set_keymap("v", "n", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "e", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "i", "l", { noremap = true })
vim.api.nvim_set_keymap("v", "j", "e", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "n", { noremap = true })
vim.api.nvim_set_keymap("v", "l", "i", { noremap = true })
vim.api.nvim_set_keymap("v", "L", "I", { noremap = true })
vim.api.nvim_set_keymap("v", "K", "N", { noremap = true })

-- Window motion Colemak
vim.api.nvim_set_keymap("n", "<c-w>n", "<c-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>e", "<c-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>i", "<c-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-n>", "<c-w><c-j>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-e>", "<c-w><c-k>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-i>", "<c-w><c-l>", { noremap = true })

-- Move up and down half a page
vim.api.nvim_set_keymap("", "<c-n>", "<Plug>(SmoothieDownwards)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<c-e>", "<Plug>(SmoothieUpwards)", { noremap = true, silent = true })

-- Bufferline switch buffer
vim.api.nvim_set_keymap("", "<c-i>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<c-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
--------------------------------------------------

-- not working everywhere because terminal can't catch ctrl-backspace
vim.api.nvim_set_keymap("i", "<c-bs>", "<C-W>", { noremap = true })

-- Save file
vim.api.nvim_set_keymap("", "<c-s>", ":update<CR>", { noremap = true })

-----------------------------------
-- Plugins mappings
-----------------------------------

-- Open nvim-tree
vim.api.nvim_set_keymap("", "<a-e>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>fml", ":CellularAutomaton make_it_rain<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fmfl", ":CellularAutomaton game_of_life<CR>", {})

-------------------------------------------------------
-- PARAMS
-------------------------------------------------------
vim.g.smoothie_no_default_mappings = true

-- Show line number
vim.opt.number = true
-- vim.opt.statuscolumn = "%@SignCb@%s%=%T%@NumCb@%r│%T"
-- Yank and paste with the system clipboard
-- TODO fix clipboard provider
vim.opt.clipboard = ""
-- Enables mouse to scroll through page and drag-clic -> visual mode
vim.opt.mouse = "a"

-- Insert spaces when TAB is pressed instead of tabs.
vim.opt.expandtab = true

-- Change number of spaces that a <Tab> counts for during editing ops
vim.opt.softtabstop = 2
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"

-- Indentation amount for < and > commands.
vim.opt.shiftwidth = 2

-- Vim.opt.the commands to save in history default number is 20.
vim.opt.history = 1000

-- Set more natural default split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Remove one line at the bottom
vim.opt.cmdheight = 1

-- Persistent undo history
vim.opt.undofile = true

-------------------------------------------------------
-- COLOR SCHEME
-------------------------------------------------------

vim.cmd([[colorscheme tokyonight]])
