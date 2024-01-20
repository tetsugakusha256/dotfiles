# Caches the completions
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_CONFIG/.zcompcache"
zstyle ':completion:*' menu select

setopt LIST_PACKED # More compact list
setopt GLOB_COMPLETE # Tab after * doesn't expand
# setopt MENU_COMPLETE # Directly jump into menu mode after one Tab

# Autocomplete options for cd instead of directory stack
# zstyle ':completion:*' complete-options true

# Sort file suggetion by modification time
# zstyle ':completion:*' file-sort modification

zmodload zsh/complist
