-------------------------------------------------------
-- EARLY
-------------------------------------------------------

-- Disable netrw at the very start of your init.lua (strongly advised) for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.g.mapleader = " "
-- Open help page on the right side
vim.cmd([[autocmd FileType help wincmd L]])
vim.o.splitright = true

-------------------------------------------------------
-- PLUGINS
-------------------------------------------------------

require "plugins"

-------------------------------------------------------
-- KEYMAPPINGS
-------------------------------------------------------

vim.api.nvim_set_keymap("n", "<Leader>vr", ":source $MYVIMRC<CR>", { noremap = true })

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
-- Easier access to command
vim.api.nvim_set_keymap("", "?", ":", { noremap = true })
vim.api.nvim_set_keymap("", "<c-space>", ":", { noremap = true })

-- Go to previous buffer (#buffer)
vim.api.nvim_set_keymap("n", "<c-h>", "<c-^>", { noremap = true })
-- Makes control i behave as its own key (require the key combination to be sent by terminal)
vim.api.nvim_set_keymap("n", "<c-i>", "<c-i>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-i>", "<c-i>", { noremap = true })

-- Add spellcheck toggel
vim.api.nvim_set_keymap("n", "<Leader>cs", ":setlocal spell spelllang=en<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ns", ":setlocal nospell nospelllang<CR>", { noremap = true })

-- System clipboard shortcut
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>P", '"+P', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>P", '"+P', { noremap = true })
-- Fix this
vim.api.nvim_set_keymap("i", "<c-p>", '<c-r>+', { noremap = true })

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

-- This does not work because the keys are not send to nvim I need to do some modification in alacritty
-- vim.api.nvim_set_keymap("", "<c-s-i>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("", "<c-s-h>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
--------------------------------------------------

-- Not working everywhere because terminal can't catch ctrl-backspace
vim.api.nvim_set_keymap("i", "<c-bs>", "<C-W>", { noremap = true })

-- Save file
vim.api.nvim_set_keymap("", "<c-s>", ":update<CR>", { noremap = true })
-- AutoFormat on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

-- Maximize window
vim.api.nvim_set_keymap("n", "<c-w>m", "<c-w>_ <c-w>|", { noremap = true })

-----------------------------------
-- Plugins mappings
-----------------------------------

vim.api.nvim_set_keymap("n", "<leader>fml", ":CellularAutomaton make_it_rain<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fmfl", ":CellularAutomaton game_of_life<CR>", {})

-- Launch lazygit
vim.api.nvim_set_keymap("n", "<leader>l", ":LazyGit<CR>", {})

-------------------------------------------------------
-- PARAMS
-------------------------------------------------------
vim.g.smoothie_no_default_mappings = true

-- Show line number
vim.opt.number = true
-- vim.opt.statuscolumn = "%@SignCb@%s%=%T%@NumCb@%r│%T"

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

-- Setting colorscheme

vim.cmd([[colorscheme tokyonight]])
