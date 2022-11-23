-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
    ["<C-j>"] = require('telescope.actions').move_selection_next,
    ["<C-k>"] = require('telescope.actions').move_selection_previous,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
--require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ft', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fcs', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {})

-- Get all the files tracked by my dotgit repo and feed it to telescope
local cmdRes = assert (io.popen('/usr/bin/git --git-dir=/home/anon/.dotfiles --work-tree=/home/anon ls-tree --full-tree -r main --name-only'))
local dotfiles = {}
for line in cmdRes:lines() do
  table.insert(dotfiles, line)
end
-- TODO check a better way than addind the custom function to builtin
function builtin.find_dotfiles()
builtin.find_files({cwd="/home/anon/",hidden=true, search_dirs=dotfiles})end

vim.keymap.set('n', '<leader>fd', builtin.find_dotfiles , {})
