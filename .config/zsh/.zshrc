##
# PROMPT SETUP
#
# See the documentation for what each characters means
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
##
PROMPT='%F{#9EB85F}%B%3~%b%f %F{#FF9E64}%T%f %B%F{#9EB85F}|%f%b '

##
# IMPORT ALIASES
##
source $ZDOTDIR/aliases.sh
if [ -f $ZDOTDIR/work_aliases.sh ]; then
  source $ZDOTDIR/work_aliases.sh
fi

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
export PATH=$HOME/go/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin:$PATH
# Add poetry to path

# TODO: Uncomment when you install pyenv
# Change pipenv variable to respect pyenv's local version
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# TODO: Need to bind `edit-command-line` to something to allow better editing of
# commands

# Use vim for command line editing
set -o vi

# Using nvim as the pager instead of less.
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    nvim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# Create keybindings for incremental search as it allows
# for regex patterns.
bindkey '^R' history-incremental-pattern-search-backward
bindkey "^P" vi-up-line-or-history
bindkey "^N" vi-down-line-or-history

# Search backwards and forwards with a pattern
# TODO: Temporarily commenting these out to see if I need them.
# bindkey -M vicmd '/' history-incremental-pattern-search-backward
# bindkey -M vicmd '?' history-incremental-pattern-search-forward
# set up for insert mode too
# bindkey -M viins '^R' history-incremental-pattern-search-backward
# bindkey -M viins '^F' history-incremental-pattern-search-forward
# bindkey -M viins "^P" vi-up-line-or-history
# bindkey -M viins "^N" vi-down-line-or-history

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000


# All the fun JVM configuration
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export MAVEN_REPOSITORY="$HOME/.m2/repository"
# TODO: store language servers in a less hardcoded location?
export PATH="$HOME/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin:$PATH"
export PATH="$HOME/language_servers/kotlin-language-server/server/build/install/server/bin:$PATH"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Random stuff for GCP CLI
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/calluml/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/calluml/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/calluml/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/calluml/google-cloud-sdk/completion.zsh.inc'; fi
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# TODO: Create a cdpath if needed later.
# export CDPATH=".:$HOME/Desktop/tms"

# Required as described by https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
