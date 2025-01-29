#Fast syntax highlighting
source $ZDOTDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# ZSH Autosuggestions
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
#FZF
source $ZDOTDIR/fzf-tab/fzf-tab.plugin.zsh
#Configuring FZF options
source $ZDOTDIR/config/fzf_config.zsh

#ZSH-Z
source $ZDOTDIR/zsh-z/zsh-z.plugin.zsh
