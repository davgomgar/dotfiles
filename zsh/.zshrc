function source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

source_if_exists  "$HOME/.cargo/env"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# History
source $ZDOTDIR/config/history.zsh

# Completions
fpath=($ZDOTDIR/site-functions $fpath)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit

### ---- Completion options and styling -----------------------------------
zstyle ':completion:*' menu select # selectable menu
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'  # case insensitive completion
zstyle ':completion:*' special-dirs true # Complete . and .. special directories
zstyle ':completion:*' list-colors '' # colorize completion lists
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01' # colorize kill list
export WORDCHARS=${WORDCHARS//[\/]} # remove / from wordchars so that / is a seperator when deleting complete words


#Load plugins
source $ZDOTDIR/plugins.zsh
# Aliases
source $ZDOTDIR/config/aliases.zsh
source $ZDOTDIR/config/avitech.zsh

# Private configuration
source $ZDOTDIR/private.zsh

# SSH AUTH SOCK
export SSH_AUTH_SOCK=~/.1password

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/david/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#For RANCHER DESKTOP AND QUARKUS DEV SERVICES
export DOCKER_HOST=unix://$HOME/.rd/docker.sock
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=/var/run/docker.sock
export TESTCONTAINERS_HOST_OVERRIDE=$(rdctl shell ip a show vznat | awk '/inet / {sub("/.*",""); print $2}')

#XDG CONFIG HOME
export XDG_CONFIG_HOME="/Users/david/.config/"

#Load SdkMan
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# Starship prompt
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
eval "$(starship init zsh)"
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
