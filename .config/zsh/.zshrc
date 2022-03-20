##
# PROMPT SETUP
#
# See the documentation for what each characters means
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
##
PROMPT='%F{#9EB85F}%B%~%b%f %F{#FF9E64}%T%f %B%F{#9EB85F}|%f%b '

##
# IMPORT ALIASES
##
source $ZDOTDIR/aliases.sh

##
# TODOS
# 1. DYNAMIC PATH IN PROMPT
# It would be cool to have the full path in the prompt, but if this is above
# a certain number of characters, then change this to just the parent and
# current directory (perhaps preceeded by '..'). For more information check
# out this SO answer:
# https://unix.stackexchange.com/questions/369847/how-to-configure-zsh-prompt-so-that-its-length-is-proportional-to-terminal-width#369862
# 
##

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/sbin:/usr/local/bin:$HOME/bin:$PATH
# Add poetry to path

# TODO: Uncomment when install pyenv
# Change pipenv variable to respect pyenv's local version
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)";

# Allow colours for `ls` to be turned on. The specific colours can be
# changed in the ANSI colours terminal preferences
# export CLICOLOR=1

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# TODO: REMOVE OH MY ZSH
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

# TODO: REMOVE OH MY ZSH
# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# alias config='git --git-dir=$HOME/new_dotfiles/ --work-tree=$HOME'

# TODO: Need to bind `edit-command-line` to something to allow better editing of
# commands

# TODO: REMOVE OH MY ZSH
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use vim for command line editing
set -o vi

# Using nvim as the pager instead of less.
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# Create keybindings for incremental search as it allows
# for regex patterns.
# bindkey '^R' history-incremental-pattern-search-backward
# bindkey "^P" vi-up-line-or-history
# bindkey "^N" vi-down-line-or-history

# Search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward
# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
bindkey -M viins "^P" vi-up-line-or-history
bindkey -M viins "^N" vi-down-line-or-history


export PATH="$HOME/.poetry/bin:$PATH"
