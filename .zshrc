source ./.config/shell/aliases.sh
source ./.config/shell/zsh/keybind.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# Remove duplicate commands from history
setopt hist_ignore_dups
setopt hist_ignore_space
# Auto cd if folder name entered
setopt autocd

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/anon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q' ;; # block
        viins|main) echo -ne '\e[5 q' ;; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.




# starship prompt
eval "$(starship init zsh)"
