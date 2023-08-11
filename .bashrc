# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# "enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# Make ranger cd after exiting it
# alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# alias ranger='command ranger; if [ $? -eq 0 ] || [ $? -ge 128 ]; then cd "$(cat ~/.config/ranger/.lastdir)"; fi'

# Adding user/.local/bin to the PATH intended to be the place for my personal scripts
export PATH="$HOME/.local/bin:$PATH"

# Add an alias to manage my dotfiles using a bare git repo in .dotfiles folder using $HOME as the working directory
alias dotgit='/usr/bin/git --git-dir=/home/anon/.dotfiles --work-tree=/home/anon'
alias dotlgit='lazygit --git-dir=/home/anon/.dotfiles --work-tree=/home/anon'
alias dim='cd ~; GIT_DIR=$HOME/.dotfiles GIT_WORK_TREE=$HOME nvim /home/anon/.config/nvim/init.lua'
# alias for Foliate the ebook reader app
# alias er='com.github.johnfactotum.Foliate &'
# alias foliate='com.github.johnfactotum.Foliate &'
# aliar for android sutdio
# alias andstud='/home/anon/.androidstudio/android-studio-2022.2.1.20-linux/android-studio/bin/studio.sh'
man_nvim(){
  # if no argument are passed to the function, show the help
if [ -z "$@"];
then
  echo "Usage: mann <man page>"
else
  man "$@" | nvim - -R
fi
}
# alias to see man page with nvim
alias mann='man_nvim'
alias wiki='nvim +":cd /home/anon/Documents/myWiki/"'
alias key='xbindkeys -k'
alias keys='xbindkeys -mk'

# tab completion with qmk (keyboard firmware utility)
# source ~/qmk_firmware/util/qmk_tab_complete.sh

# autojump script 
. /usr/share/autojump/autojump.bash

# remove c-s c-q to freeze and unfreeze terminal (XON/XOFF)
stty -ixon

# env var for android dev
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(starship init bash)"
