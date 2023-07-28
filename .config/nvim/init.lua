-------------------------------------------------------
-- Functions
-------------------------------------------------------

-- Create new tab with the current buffer inside
-- If multiple window in the current tab move the window to the new tab
local function move_window_tab()
  -- Call the vim function to get the number of window
  local win_count = vim.api.nvim_call_function('winnr', { '$' })
  if win_count > 1 then
    vim.cmd(':wincmd T')
  else
    vim.cmd(':sbp|wincmd p|wincmd T')
  end
end

-------------------------------------------------------
-------------------------------------------------------
-- EARLY call
-------------------------------------------------------
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
vim.g.vimwiki_list = {
  {
    path = '/home/anon/Documents/myWiki/obs_vault/',
    syntax = 'markdown',
    ext = '.md',
  }
}
-------------------------------------------------------
-------------------------------------------------------
-- PLUGINS
-------------------------------------------------------
-------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("plugins")

-------------------------------------------------------
-------------------------------------------------------
-- KEYMAPPINGS
-------------------------------------------------------
-------------------------------------------------------

-------------------------------------------------------
-- Motion
-------------------------------------------------------
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
-- Go to begining = _ so I make - go to end (same key)
vim.api.nvim_set_keymap("n", "-", "$", { noremap = true })
vim.api.nvim_set_keymap("v", "-", "$", { noremap = true })
vim.api.nvim_set_keymap("o", "-", "$", { noremap = true })

-- Easier access to command
vim.api.nvim_set_keymap("", "?", ":", { noremap = true })

-- Move up and down half a page
vim.api.nvim_set_keymap("", "<c-n>", "<Plug>(SmoothieDownwards)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<c-e>", "<Plug>(SmoothieUpwards)", { noremap = true, silent = true })

-- Move line up and down
vim.api.nvim_set_keymap("n", "N", " :m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "E", " :m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "N", " :m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "E", " :m '<-2<CR>gv=gv", { noremap = true })
-- Quick fix mapping
-- Normally <c-[> is the same as <esc> but with the correct escape sequence in alacritty config it works
vim.api.nvim_set_keymap("n", "<ESC>", "<ESC>", { noremap = true })
-- Navigate quickfix list
vim.api.nvim_set_keymap("n", "<c-]>", ":cn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-[>", ":cp<CR>", { noremap = true })
-- Close quickfix menu after selecting choice
vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = { "qf" },
    command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]]
  })
vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = { "qf" },
    command = [[nnoremap <buffer> <Tab> <CR>]]
  })

-------------------------------------------------------
-- Git
-------------------------------------------------------
-- TODO: only map those when buffer has a git using onattached
-- Show git tree view
vim.api.nvim_set_keymap("n", "<Leader>gt", ":Flog<CR>", { noremap = true })
-- Gitsigns
local gitsigns = require("gitsigns")
vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, {})
vim.keymap.set('n', '<leader>gr', gitsigns.undo_stage_hunk, {})
vim.keymap.set('n', '<leader>gh', gitsigns.toggle_signs, {})
vim.keymap.set('n', '<leader>gd', gitsigns.toggle_word_diff, {})
vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, {})
vim.keymap.set('n', '<leader>gu', gitsigns.reset_hunk, {})
vim.keymap.set('n', '<leader>gg', gitsigns.preview_hunk, {})
vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk, {})
vim.keymap.set('n', '<leader>ge', gitsigns.prev_hunk, {})

-------------------------------------------------------
-- Tab/Window/Buffer
-------------------------------------------------------
--- Tab ---
vim.keymap.set('n', '<a-o>', move_window_tab, {})
vim.api.nvim_set_keymap("n", "<c-a-h>", ':tabm -<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<c-a-i>", ':tabm +<CR>', { noremap = true })

-- Window motion Colemak
-- TODO: add resize
vim.api.nvim_set_keymap("n", "<a-n>", "<c-w>w", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c-n>", "<c-w>r", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-e>", "<c-w>p", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c-e>", "<c-w>R", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c>", ":bd<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-w>", ":hide<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-a>", ":sp<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-v>", ":vs<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>n", "<c-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>e", "<c-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>i", "<c-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-n>", "<c-w><c-j>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-e>", "<c-w><c-k>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-i>", "<c-w><c-l>", { noremap = true })
-- Go to previous buffer (#buffer)
vim.api.nvim_set_keymap("n", "<c-h>", "<c-^>", { noremap = true })

-- Makes control i behave as its own key (require the key combination to be sent by terminal)
vim.api.nvim_set_keymap("i", "<c-i>", "<del>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-i>", "<c-i>", { noremap = true })

-- Tab motion Colemak
vim.api.nvim_set_keymap("n", "<a-h>", 'gT', { noremap = true })
vim.api.nvim_set_keymap("n", "<a-i>", 'gt', { noremap = true })

-- Harpoon motion
vim.keymap.set('n', '<a-m>', require("harpoon.mark").add_file, {})
vim.keymap.set('n', '<leader>h', require("harpoon.ui").toggle_quick_menu, {})
vim.api.nvim_set_keymap("n", "<a-l>", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-u>", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-y>", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-;>", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-5>", ":lua require('harpoon.ui').nav_file(5)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-6>", ":lua require('harpoon.ui').nav_file(6)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-7>", ":lua require('harpoon.ui').nav_file(7)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-8>", ":lua require('harpoon.ui').nav_file(8)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-9>", ":lua require('harpoon.ui').nav_file(9)<CR>", { noremap = true, silent = true })
require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  }
})

-----------------------------------
-- Plugins mappings
-----------------------------------


-- Anki
vim.api.nvim_set_keymap("n", "<leader>cc", ":Anki One Q one A Code<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ca", ":AnkiSend<CR>", {})

-- Easy align
vim.api.nvim_set_keymap("n", "<leader>a", "<Plug>(EasyAlign)", {})
vim.api.nvim_set_keymap("x", "<leader>a", "<Plug>(EasyAlign)", {})

-- Fun
vim.api.nvim_set_keymap("n", "<leader>fl", ":CellularAutomaton make_it_rain<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fll", ":CellularAutomaton game_of_life<CR>", {})

-- Launch lazygit
vim.api.nvim_set_keymap("n", "<leader>l", ":LazyGit<CR>", {})

-- Untotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-------------------------------------------------------
-- Others
-------------------------------------------------------

-- Command mode mappings
vim.api.nvim_set_keymap("c", "<c-h>", "<c-f>", { noremap = true })

-- Save file
vim.api.nvim_set_keymap("n", "<c-s>", ":update<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<c-s>", ":update<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-s>", "<ESC>:update<CR>", { noremap = true })

-- Add spellcheck toggel
-- TODO: spellcheck
vim.api.nvim_set_keymap("n", "<Leader>cs", ":setlocal spell spelllang=en<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ns", ":setlocal nospell nospelllang<CR>", { noremap = true })

-- System clipboard shortcut
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>P", '"+P', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>pp", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>po", 'o<esc>"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>pO", 'O<esc>"+p', { noremap = true })
-- Fix this
vim.api.nvim_set_keymap("i", "<c-p>", '<c-r>+', { noremap = true })
vim.api.nvim_set_keymap("i", "<c-bs>", "<C-W>", { noremap = true })

-- Close vim
vim.api.nvim_set_keymap("n", "<c-q>", ':qa<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<c-a-q>", ':wqa<CR>', { noremap = true })

-- <leader>t action on word under cursor ('take' and search next)
vim.api.nvim_set_keymap("n", "<leader>tt", "*", { noremap = true })
-------------------------------------------------------
-------------------------------------------------------
-- PARAMS
-------------------------------------------------------
-------------------------------------------------------
vim.g.smoothie_no_default_mappings = true

-- Show line number
vim.opt.number                     = true
--vim.opt.statuscolumn = "%@SignCb@%s%=%T%@NumCb@%r│%T"
-- Wrap line after 80 characters
vim.opt.wrap                       = true
vim.opt.textwidth                  = 80

-- ignorecase when searching
vim.opt.ignorecase                 = true
-- except when using capital letters
vim.opt.smartcase                  = true

-- Enables mouse to scroll through page and drag-clic -> visual mode
vim.opt.mouse                      = "a"

-- Insert spaces when TAB is pressed instead of tabs.
vim.opt.expandtab                  = true

-- Change number of spaces that a <Tab> counts for during editing ops
vim.opt.softtabstop                = 2
vim.opt.encoding                   = "utf-8"
vim.opt.fileencodings              = "utf-8"

-- Indentation amount for < and > commands.
vim.opt.shiftwidth                 = 2

-- Vim.opt.the commands to save in history default number is 20.
vim.opt.history                    = 1000

-- Set more natural default split
vim.opt.splitbelow                 = true
vim.opt.splitright                 = true

-- Remove one line at the bottom
vim.opt.cmdheight                  = 1

-- cursor stay more centered
-- vim.opt.scrolloff = 18

-- Persistent undo history
vim.opt.undofile                   = true

-- Only show tab if 2 or more
vim.opt.stal                       = 1
-- Setting colorscheme
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.cmd([[colorscheme tokyonight]])
