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

-- Move to right window is possible, otherwise move to next tab
function MoveToRightWindowOrNextTab()
  local current_win = vim.fn.winnr()
  vim.cmd(':wincmd l') -- Try to move to the right window
  if current_win == vim.fn.winnr() then
    vim.cmd(':tabnext')
  end
end

function MoveToLeftWindowOrNextTab()
  local current_win = vim.fn.winnr()
  vim.cmd(':wincmd h') -- Try to move to the right window
  if current_win == vim.fn.winnr() then
    vim.cmd(':tabprevious')
  end
end

-- Set textwidth if the current buffer's file type is the target
-- NOTE: Check why it's not working (current fix: set textwidht on wiki alias)
function SetTextwidthMarkdown()
  if vim.bo.filetype == "markdown" then
    vim.bo.textwidth = 80
  end
end

-- Define a function that takes user input and calls another function
function AttachDebugToProcess()
  -- Prompt the user for input
  local user_input = vim.fn.input('Name of the process :')
  -- Check if the user_input is not empty
  if user_input ~= '' then
    -- Call another function and pass the user input as an argument
    local thread = require('dap.utils').pick_process({ filter = user_input })
    require('dap').run({
      name = "Attach to Rust Process",
      type = "codelldb",
      request = "attach",
      pid = thread,
    })
  else
    print("No input provided.")
  end
end

-- Define a function to search for "- [ ]" and paste results under the cursor
function PrintTodo()
  -- Search for "- [ ]" in all Markdown files and store the results in the register 'a'
  local wiki_path = vim.fn.expand('~/Documents/myWiki')
  vim.cmd([[%!grep "\- \[ \]" ]] .. wiki_path .. '/**/*.md | sed "s|' .. wiki_path .. '/| |"')
  -- Open a new scratch buffer and paste the search results
  -- vim.cmd([[botright vnew]])
  -- Restore the cursor position
end

-- Create a command to call the function
vim.cmd("command! PrintTodo lua PrintTodo()")
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
-- Wiki config
vim.g.vimwiki_list = {
  {
    path = '/home/anon/Documents/myWiki/',
    syntax = 'markdown',
    ext = '.md',
  }
}
-- vim.g.vimwiki_folding              = 'custom'
-- vim.g.markdown_folding             = 1
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
vim.api.nvim_set_keymap("n", "J", "E", { noremap = true })
vim.api.nvim_set_keymap("n", "k", "n", { noremap = true })
vim.api.nvim_set_keymap("n", "l", "i", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "I", { noremap = true })
vim.api.nvim_set_keymap("n", "K", "N", { noremap = true })
vim.api.nvim_set_keymap("v", "n", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "e", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, expr = true })
vim.api.nvim_set_keymap("v", "i", "l", { noremap = true })
vim.api.nvim_set_keymap("v", "j", "e", { noremap = true })
vim.api.nvim_set_keymap("v", "J", "E", { noremap = true })
vim.api.nvim_set_keymap("v", "k", "n", { noremap = true })
vim.api.nvim_set_keymap("v", "l", "i", { noremap = true })
vim.api.nvim_set_keymap("v", "L", "I", { noremap = true })
vim.api.nvim_set_keymap("v", "K", "N", { noremap = true })
-- Can't use i for "entire/inside and right at the same time"
-- vim.api.nvim_set_keymap("o", "i", "l", { noremap = true })
vim.api.nvim_set_keymap("o", "j", "e", { noremap = true })
vim.api.nvim_set_keymap("o", "n", "(v:count == 0 ? 'gj' : 'j')", { noremap = true, expr = true })
vim.api.nvim_set_keymap("o", "e", "(v:count == 0 ? 'gk' : 'k')", { noremap = true, expr = true })

-- Move edit history
vim.api.nvim_set_keymap("n", "(", "g;", { noremap = true })
vim.api.nvim_set_keymap("n", ")", "g,", { noremap = true })


-- Scroll smooth motion
local t    = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-e>'] = { 'scroll', { '-vim.wo.scroll', 'true', '250' } }
t['<C-n>'] = { 'scroll', { 'vim.wo.scroll', 'true', '250' } }
t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '450' } }
t['<C-y>'] = { 'scroll', { '-1', 'false', '1' } }
t['<C-u>'] = { 'scroll', { '1', 'false', '1' } }
t['zt']    = { 'zt', { '250' } }
t['zz']    = { 'zz', { '250' } }
t['zb']    = { 'zb', { '250' } }

require('neoscroll.config').set_mappings(t)

-- Move line up and down
vim.api.nvim_set_keymap("n", "N", " :m .+1<CR>==", { noremap = true })
vim.api.nvim_set_keymap("n", "E", " :m .-2<CR>==", { noremap = true })
vim.api.nvim_set_keymap("v", "N", " :m '>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap("v", "E", " :m '<-2<CR>gv=gv", { noremap = true })
-- Quick fix mapping
-- Normally <c-[> is the same as <esc> but with the correct escape sequence in alacritty config it works
vim.api.nvim_set_keymap("n", "<ESC>", "<ESC>", { noremap = true })
-- Navigate quickfix list
vim.api.nvim_set_keymap("n", "<c-)>", ":cn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-(>", ":cp<CR>", { noremap = true })
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

-- Git diffview
vim.api.nvim_set_keymap("n", "<leader>gf", ':DiffviewFileHistory %<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<a-d>", ':DiffviewFileHistory %<CR>', { noremap = true })

-------------------------------------------------------
-- Tab/Window/Buffer
-------------------------------------------------------
--- Tab ---
vim.keymap.set('n', '<a-o>', move_window_tab, {})
vim.api.nvim_set_keymap("n", "<c-a-h>", ':tabm -<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<c-a-i>", ':tabm +<CR>', { noremap = true })

-- Window motion Colemak
-- TODO: add resize
-- Tab motion Colemak
vim.keymap.set('n', '<a-i>', MoveToRightWindowOrNextTab, { noremap = true, silent = true })
vim.keymap.set('n', '<a-h>', MoveToLeftWindowOrNextTab, { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-n>", "<c-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-e>", "<c-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-BS>", "<c-w>w", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c-h>", "<c-w><", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c-i>", "<c-w>>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c-n>", "<c-w>-", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c-e>", "<c-w>+", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c-r>", "<c-w>r", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-c>", ":bd<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-w>", ":hide<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-s-w>", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-a>", ":vs<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-v>", ":sp<CR>", { noremap = true })
-- Colemak mappings
vim.api.nvim_set_keymap("n", "<c-w>n", "<c-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>e", "<c-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w>i", "<c-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-n>", "<c-w><c-j>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-e>", "<c-w><c-k>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-w><c-i>", "<c-w><c-l>", { noremap = true })
-- Go to previous buffer (#buffer)
vim.api.nvim_set_keymap("n", "<c-h>", "<c-^>", { noremap = true })
vim.api.nvim_set_keymap("n", "<a-BS>", "<c-^>", { noremap = true })

-- Makes control i behave as its own key (require the key combination to be sent by terminal)
vim.api.nvim_set_keymap("i", "<c-i>", "<del>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-i>", "<c-i>", { noremap = true })

-- vim.api.nvim_set_keymap("n", "<a-h>", 'gT', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<a-i>", 'gt', { noremap = true })

-- Harpoon motion
vim.keymap.set('n', '<a-m>', require("harpoon.mark").add_file, {})
vim.keymap.set('n', '<leader>h', require("harpoon.ui").toggle_quick_menu, {})
vim.api.nvim_set_keymap("n", "<a-l>", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-u>", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-y>", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-=>", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-j>", ":lua require('harpoon.ui').nav_file(5)<CR>", { noremap = true, silent = true })
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
-- Terminal mode
-----------------------------------

vim.keymap.set('t', '<a-i>', MoveToRightWindowOrNextTab, { noremap = true, silent = true })
vim.keymap.set('t', '<a-h>', MoveToLeftWindowOrNextTab, { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<a-n>", "<C-\\><C-N><c-w>j", { noremap = true })
vim.api.nvim_set_keymap("t", "<a-e>", "<C-\\><C-N><c-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<a-BS>", "<C-\\><C-N><c-w>w", { noremap = true })
vim.api.nvim_set_keymap("t", "<a-c-h>", "<C-\\><C-N><c-w><", { noremap = true })
vim.api.nvim_set_keymap("t", "<a-c-i>", "<C-\\><C-N><c-w>>", { noremap = true })
vim.api.nvim_set_keymap("t", "<a-c-n>", "<C-\\><C-N><c-w>-", { noremap = true })
vim.api.nvim_set_keymap("t", "<a-c-e>", "<C-\\><C-N><c-w>+", { noremap = true })
vim.api.nvim_set_keymap("t", "<a-c-r>", "<C-\\><C-N><c-w>r", { noremap = true })
vim.api.nvim_set_keymap('t', '<C-SPACE>', '<C-\\><C-n>', { noremap = true })

-----------------------------------
-- Wiki feature
-----------------------------------

vim.api.nvim_set_keymap("n", "<CR>", "gd", { noremap = false, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>ww", ":e ~/Documents/myWiki/index.md <CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>w<leader>w", ":e ~/Documents/myWiki/diary/diary.md <CR>", { noremap = true })

-----------------------------------
-- Plugins mappings
-----------------------------------

-- Magma mappings and opitons
vim.g.magma_automatically_open_output = false

-- Example: Running Vimscript code from Lua

vim.api.nvim_set_keymap("n", "<leader>ma", ":MagmaInterrupt<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>mr", ":MagmaEvaluateLine<CR>", { silent = true })
vim.api.nvim_set_keymap("x", "<leader>m", ":<C-u>MagmaEvaluateVisual<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>mc", ":MagmaReevaluateCell<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>md", ":MagmaDelete<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>mo", ":MagmaShowOutput<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>ms", ":MagmaInit<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>msj", ":MagmaInit javascript<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>msp", ":MagmaInit python3<CR>", { silent = true })

-- Anki
vim.api.nvim_set_keymap("n", "<leader>cc", ":Anki One Q one A Code<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>cs", ":AnkiSend<CR>", {})

-- Easy align (* + delimiter = align on all delimiter) (indent)
vim.api.nvim_set_keymap("n", "<leader>a", "<Plug>(EasyAlign)*", {})
vim.api.nvim_set_keymap("x", "<leader>a", "<Plug>(EasyAlign)*", {})

-- Fun
vim.api.nvim_set_keymap("n", "<leader>fl", ":CellularAutomaton make_it_rain<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fll", ":CellularAutomaton game_of_life<CR>", {})

-- Launch lazygit
vim.api.nvim_set_keymap("n", "<leader>l", ":LazyGit<CR>", {})

-- Untotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-------------------------------------------------------
-- Lsp
-------------------------------------------------------

local lsp_formatting = function()
  vim.lsp.buf.format({
    filter = function(client)
      -- Don't format with tsserver
      -- Instead, because I have prettier in null-ls, it will try to use that
      if client.name == "tsserver" then
        return false
      end
      return true
    end,
    timeout_ms = 2000
  })
end
-- The idea is leader+t for function that 'take' the word under cursor
-- leader+s for function that search
-- Codelens
-- vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.display)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>tD", vim.lsp.buf.definition)
-- List implementation implementation
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
-- Seach for Incoming/Outgoint calls
vim.keymap.set("n", "<leader>tc", vim.lsp.buf.incoming_calls)
vim.keymap.set("n", "<leader>to", vim.lsp.buf.outgoing_calls)
vim.keymap.set("n", "<leader>ta", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
-- Go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>td", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>tf", vim.lsp.buf.declaration)
-- Show info
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>th", vim.lsp.buf.hover)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>tr", vim.lsp.buf.references)

vim.keymap.set("n", "<leader>ts", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
vim.keymap.set("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)

-- Define a function to check if a window with a specific buffer is open
local function create_or_focus_symbols_window()
  for _, win_id in ipairs(vim.fn.getwininfo()) do
    if vim.fn.bufname(win_id.bufnr) == "OUTLINE" then
      vim.cmd('wincmd w') -- Focus the window
      return true
    end
  end
  vim.cmd(':SymbolsOutlineOpen')
  return false
end
-- Symbol tree view
-- vim.api.nvim_set_keymap("n", "<a-s>", ":SymbolsOutline<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<a-s>", create_or_focus_symbols_window, { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<a-S>", ":SymbolsOutlineClose<CR>", {})

vim.keymap.set("n", "<leader>fr", lsp_formatting, { noremap = true })
-- Diagnostic (errors)
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>ew", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<leader>eh", vim.diagnostic.hide, opts)
vim.keymap.set("n", "<leader>es", vim.diagnostic.show, opts)
vim.keymap.set("n", "<a-[>", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<a-]>", vim.diagnostic.goto_next, opts)

-------------------------------------------------------
-- Telescope
-------------------------------------------------------

local builtin_telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>sd', builtin_telescope.diagnostics, {})
vim.keymap.set('n', '<leader>te', builtin_telescope.grep_string, {})
vim.keymap.set('n', '<leader>ti', builtin_telescope.grep_string_gitignore, {})
vim.keymap.set('n', '<leader>sw', builtin_telescope.find_wiki, {})
vim.keymap.set('n', '<leader>sc', builtin_telescope.find_dotfiles, {})
vim.keymap.set('n', '<leader>sf', builtin_telescope.find_sessions, {})
vim.keymap.set('n', '<leader>ss', builtin_telescope.find_files, {})
vim.keymap.set('n', '<leader>sa', builtin_telescope.find_allfiles, {})
vim.keymap.set('n', '<leader>sg', builtin_telescope.live_grep, {})
vim.keymap.set('n', '<leader>se', builtin_telescope.live_grep, {})
vim.keymap.set('n', '<leader>si', builtin_telescope.grep_gitignore, {})
vim.keymap.set('n', '<leader>sb', builtin_telescope.buffers, {})
vim.keymap.set('n', '<leader>s/', builtin_telescope.help_tags, {})
-- Search 'object' lsp symbols
vim.keymap.set('n', '<leader>so', builtin_telescope.lsp_dynamic_workspace_symbols, {})
-- vim.keymap.set('n', '<leader>st', builtin.help_tags, {})
vim.keymap.set('n', '<leader>scs', builtin_telescope.colorscheme, {})
vim.keymap.set('n', '<leader>sh', builtin_telescope.oldfiles, {})
-- Shows todo fix etc
vim.api.nvim_set_keymap('n', '<leader>st', ':TodoTelescope keywords=TODO,FIX<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sn', ':TodoTelescope keywords=PERF,HACK,WARN,NOTE<CR>', { noremap = true })
-- Set mapping for searching a session.
vim.keymap.set('n', '<leader>fs', builtin_telescope.find_sessions, {
  noremap = true,
})
-------------------------------------------------------
-- Debug
-------------------------------------------------------

local dui = require("dapui")
vim.keymap.set("n", "<leader>du", dui.toggle, opts)
vim.keymap.set("n", "<leader>da", AttachDebugToProcess, opts)
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)
-- easier to type
vim.api.nvim_set_keymap("n", "<leader>ds", ":DapToggleBreakpoint<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapTerminate<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dr", ":DapRestartFrame<CR>", opts)
-- next line
vim.api.nvim_set_keymap("n", "<leader>dn", ":DapStepOver<CR>", opts)
-- exit scope
vim.api.nvim_set_keymap("n", "<leader>de", ":DapStepOut<CR>", opts)
-- into
vim.api.nvim_set_keymap("n", "<leader>di", ":DapStepInto<CR>", opts)

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
vim.api.nvim_set_keymap("n", "<Leader>oe", ":setlocal spell spelllang=en<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>on", ":setlocal nospell <CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>od", ":setlocal nospell <CR>", { noremap = true })
-- correct, set wrong, set correct
vim.api.nvim_set_keymap("n", "<Leader>oo", 'z=', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>ow", 'zw', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>oc", 'zg', { noremap = true })


-- System clipboard shortcut
vim.api.nvim_set_keymap("v", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>Y", '"+Y', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>p", '"+p', { noremap = true })
vim.api.nvim_set_keymap("v", "<Leader>P", '"+P', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>y", '"+y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>Y", '"+Y', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>pp", '"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>po", 'o<esc>"+p', { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>pO", 'O<esc>"+p', { noremap = true })
-- Fix this
vim.api.nvim_set_keymap("i", "<c-p>", '<c-r>+', { noremap = true })
vim.api.nvim_set_keymap("i", "<c-bs>", "<C-W>", { noremap = true })

-- Close vim
vim.api.nvim_set_keymap("n", "<c-q>", ':qa<CR>', { noremap = true })
-- vim.api.nvim_set_keymap("n", "<c-w>", ':qa<CR>', { noremap = true })
vim.api.nvim_set_keymap("n", "<c-a-q>", ':wqa<CR>', { noremap = true })

-- <leader>t action on word under cursor ('take' and search next)
vim.api.nvim_set_keymap("n", "<leader>tt", "*", { noremap = true })

-------------------------------------------------------
-------------------------------------------------------
-- Autocmd
-------------------------------------------------------
-------------------------------------------------------


-------------------------------------------------------
-------------------------------------------------------
-- PARAMS
-------------------------------------------------------
-------------------------------------------------------

-- vim.wo.conceallevel = 2

vim.g.smoothie_no_default_mappings = true

-- Show line number
vim.opt.number                     = true
--vim.opt.statuscolumn             = "%@SignCb@%s %= %T%@NumCb@%r│%T"
-- Wrap line after 80 characters
vim.opt.wrap                       = true
vim.opt.textwidth                  = 200
-- Set textwidth to 80 if in a markdown file
-- vim.api.nvim_exec([[
--   autocmd BufEnter * lua SetTextwidthMarkdown()
-- ]], false)

-- Define custom fold markers for Markdown headers
-- vim.cmd('set foldmethod=marker')
-- vim.cmd('autocmd FileType markdown setlocal foldmarker=#,#')
-- vim.cmd('autocmd FileType markdown setlocal foldmarker=##,##')

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
-- vim.opt.scrolloff               = 18

-- Persistent undo history
vim.opt.undofile                   = true

-- Only show tab if 2 or more
vim.opt.stal                       = 1
-- Setting colorscheme
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
