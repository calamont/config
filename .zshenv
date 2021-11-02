# Update default configuration directories
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# For any program that requires a text editor use Neovim
export EDITOR="nvim"
export VISUAL="nvim"

# Set up zsh history configuration
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
# setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
