# Sourcing config
source "$HOME/.config/shell/aliases.sh"

# Plugin to allow for autosuggestions while typing (pacman package)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$ZSH_CONFIG/zsh_autosuggestions_config.zsh"
# Plugin for highlighting (pacman package)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Remove duplicate commands from history
setopt hist_ignore_dups
setopt hist_ignore_space
# Auto cd if folder name entered
setopt autocd

bindkey -v

# Fix pasting with vi mode active
unset zle_bracketed_paste

# The following lines were added by compinstall
zstyle :compinstall filename '/home/anon/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
source $HOME/.config/shell/zsh/completion.zsh

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

# Makes quote and bracket text object in viins mode
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Surround plugins for viins 
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround


# Disable Ctrl+S and Ctrl+Q
stty -ixon

# starship prompt
eval "$(starship init zsh)"


# Keybinding sourcing
source $HOME/.config/shell/zsh/keybind.zsh
