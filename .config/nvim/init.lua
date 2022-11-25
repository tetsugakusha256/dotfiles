vim.g.mapleader = " "

-------------------------------------------------------
-- PLUGINS
-------------------------------------------------------

require "plugins"
-- order is important (lspconfig should also be setup after those which it is now in init.lua)
require("mason").setup()
require("mason-lspconfig").setup()
--------------------------------------------------
-- Before lspconfig
require "_nvim-treesitter"
require "_nvim-cmp"
require "_lspconfig"
require "_hop"
require "_lualine"
require "_telescope"
require "_bufferline"
require "_dashboard"


vim.api.nvim_set_keymap("n", "<Leader>vr", ":source $MYVIMRC<CR>", { noremap = true })
-- Move the cursor based on physical lines
vim.api.nvim_set_keymap("n", "j", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, expr = true })
vim.api.nvim_set_keymap("n", "k", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, expr = true })

-- Move up and down half a page
vim.api.nvim_set_keymap("", "<c-j>", "<Plug>(SmoothieDownwards)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<c-k>", "<Plug>(SmoothieUpwards)", { noremap = true, silent = true })

vim.api.nvim_set_keymap("", "é", "/", { noremap = true })

-- Bufferline switch buffer
vim.api.nvim_set_keymap("", "<c-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<c-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<c-c>", ":bd<CR>", { noremap = true, silent = true })

-- Move line up or down
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- not working everywhere because terminal can't catch ctrl-backspace
vim.api.nvim_set_keymap("i", "<c-bs>", "<C-W>", { noremap = true })

vim.g.smoothie_no_default_mappings = true

-- Show line number
vim.opt.number = true
-- Yank and paste with the system clipboard
-- Vim.opt.clipboard=unnamed

vim.opt.mouse = ""
-- === TAB/Space settings === "
-- Insert spaces when TAB is pressed instead of tabs.
vim.opt.expandtab = true

-- Change number of spaces that a <Tab> counts for during editing ops
vim.opt.softtabstop = 2
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"

-- Indentation amount for < and > commands.
vim.opt.shiftwidth = 2

-- Don't wrap line
-- Vim.opt.nowrap


-- Vim.opt.the commands to save in history default number is 20.
vim.opt.history = 1000

-- Set more natural default split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Remove one line at the bottom
vim.opt.cmdheight = 1
-- COLOR SCHEME
vim.cmd([[colorscheme tokyonight]])
