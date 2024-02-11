neovide -- -c "lua vim.keymap.set('n', '<leader>ss', require('telescope.builtin').find_dotfiles, {})" \
    -c "lua vim.keymap.set('n', '<leader>se', require('telescope.builtin').live_grep_dotfiles, {})" \
    -c "lua vim.keymap.set('n', '<leader>ti', require('telescope.builtin').grep_string_gitignore_dotfiles, {})" \
    -c "lua vim.keymap.set('n', '<leader>te', require('telescope.builtin').grep_string_gitignore_dotfiles, {})" \
    -c "SessionRestore" \
    -c "colorscheme catppuccin-mocha"
