# WARN: WHEN CHANGING ALIASES DON'T FORGET TO SOURE IT AGAIN OR RESTART
# TERMINAL!!!!!!!!!!!!!!!!
#
# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an alias to manage my dotfiles using a bare git repo in .dotfiles folder using $HOME as the working directory
alias dotgit='/usr/bin/git --git-dir=/home/anon/.dotfiles --work-tree=/home/anon'
alias dotlgit='lazygit --git-dir=/home/anon/.dotfiles --work-tree=/home/anon'
rangercd () {
    tmp="$(mktemp)"
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
alias r="rangercd"
alias ranger="rangercd"

man_nvim(){
    # if no argument are passed to the function, show the help
    if [ -z "$@"];
    then
        echo "Usage: mann <man page>"
    else
        man "$@" | nvim - -R
    fi
}
# See man page with nvim
alias mann='man_nvim'
# Open a new terminal in the same working dir
alias clone='alacritty &;disown'
# When using the dim alias, change the 'search file in dir' function to search for
# dotfiles only same with the grep function
dim_nvim(){
    nvim -c "lua vim.keymap.set('n', '<leader>ss', require('telescope.builtin').find_dotfiles, {})" \
        -c "lua vim.keymap.set('n', '<leader>se', require('telescope.builtin').live_grep_dotfiles, {})" \
        -c "lua vim.keymap.set('n', '<leader>ti', require('telescope.builtin').grep_string_gitignore_dotfiles, {})" \
        -c "lua vim.keymap.set('n', '<leader>te', require('telescope.builtin').grep_string_gitignore_dotfiles, {})" \
        -c "SessionRestore" \
    }
# launch nvim with my dotgit config (cd into the bare git repo so it keeps
# the session link to this directory (causes nvim to have error when closing it))
alias dim='cd ~; GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME dim_nvim ; exit'
alias wiki='nvim -c "set textwidth=80" +":cd /home/anon/Documents/myWiki/" ; exit'
alias key='xbindkeys -k'
alias keys='xbindkeys -mk'
alias fzf='fzf --bind=ctrl-e:prev-history,ctrl-e:up'

# Music player 
alias mp='ncmpcpp'

# Show color quickly
alias color='$HOME/.local/bin/print_colors.sh'

alias vpn='$HOME/.local/bin/vpn_connection.sh'
# Custom backup script
alias backup='$HOME/.local/bin/backup_to_disk.sh'

alias spotifyd='$HOME/.config/spotifyd/spotifyd_with_pass.sh'
# python home (activate python virtual env)
alias ph='source $HOME/.python_venv/bin/activate'
# Check if the user's shell is Bash
if [ -n "$BASH_VERSION" ]; then
    # autojump script
    . /usr/share/autojump/autojump.bash
fi
# Check if the user's shell is Zsh
if [ -n "$ZSH_VERSION" ]; then
    # autojump script
    . /usr/share/autojump/autojump.zsh
fi
