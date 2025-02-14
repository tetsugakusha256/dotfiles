export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"

# Custom keybinds for fzf fuzzy finding programs
export FZF_DEFAULT_OPTS="--bind ctrl-n:down,ctrl-e:up,ctrl-u:half-page-down,ctrl-y:half-page-up,alt-a:select-all,alt-d:deselect-all"

# Problem with weird char
# export MANPAGER="nvim -R"

# env var for android dev
# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
