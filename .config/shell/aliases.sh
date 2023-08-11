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
# When using the dim alias, change the 'search file in dir' function to search for
# dotfiles only
dim_nvim(){
    nvim -c "lua vim.keymap.set('n', '<leader>ss', require('telescope.builtin').find_dotfiles, {})" 
}
# launch nvim with my dotgit config (cd into the bare git repo so it keeps
# the session link to this directory)
alias dim='cd ~; GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME dim_nvim;cd ~'
alias wiki='nvim +":cd /home/anon/Documents/myWiki/"'
alias key='xbindkeys -k'
alias keys='xbindkeys -mk'
