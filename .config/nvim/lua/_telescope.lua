require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = require('telescope.actions').file_split,
        ["<C-v>"] = require('telescope.actions').file_vsplit,
        ["<C-t>"] = require('telescope.actions').file_tab,
        ["<C-a-n>"] = require('telescope.actions').preview_scrolling_down,
        ["<C-a-e>"] = require('telescope.actions').preview_scrolling_up,
        ["<C-space>"] = require('telescope.actions').toggle_selection,
        ["<C-d>"] = require('telescope.actions').delete_buffer,
        ["<C-n>"] = require('telescope.actions').move_selection_next,
        ["<C-e>"] = require('telescope.actions').move_selection_previous,
      },
      n = {
        --
        ["n"] = require('telescope.actions').move_selection_next,
        ["e"] = require('telescope.actions').move_selection_previous,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
-- Harpoon suport
require("telescope").load_extension('harpoon')

-- Get all the files tracked by my dotgit repo and feed it to telescope
local cmdRes = assert(io.popen(
  '/usr/bin/git --git-dir=/home/anon/.dotfiles --work-tree=/home/anon ls-tree --full-tree -r main --name-only'))
local dotfiles = {}
for line in cmdRes:lines() do
  table.insert(dotfiles, line)
end

local builtin = require('telescope.builtin')
-- TODO check a better way than addind the custom function to builtin
function builtin.find_dotfiles()
  builtin.find_files({ cwd = "/home/anon/", hidden = true, search_dirs = dotfiles })
end

function builtin.find_allfiles()
  builtin.find_files({ hidden = true })
end

function builtin.find_sessions()
  require("auto-session.session-lens").search_session()
end

-- TODO try using the wiki path given by the vimwiki plugin
function builtin.find_wiki()
  builtin.find_files({ cwd = "/home/anon/vimwiki/", search_dirs = { '/home/anon/vimwiki/' } })
end

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
--require('telescope').load_extension('fzf')

-- Mappings Leader Search ...
vim.keymap.set('n', '<leader>sw', builtin.find_wiki, {})
vim.keymap.set('n', '<leader>sd', builtin.find_dotfiles, {})
vim.keymap.set('n', '<leader>sf', builtin.find_sessions, {})
vim.keymap.set('n', '<leader>ss', builtin.find_files, {})
vim.keymap.set('n', '<leader>sa', builtin.find_allfiles, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>st', builtin.help_tags, {})
vim.keymap.set('n', '<leader>scs', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>sh', builtin.oldfiles, {})
-- Shows todo fix etc
vim.api.nvim_set_keymap('n', '<leader>st', ':TodoTelescope keywords=TODO,FIX<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sn', ':TodoTelescope keywords=PERF,HACK,WARN,NOTE<CR>', { noremap = true })
-- Set mapping for searching a session.
vim.keymap.set('n', '<leader>fs', builtin.find_sessions, {
  noremap = true,
})
