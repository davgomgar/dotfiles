export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'
#
#FZF INTEGRATION
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="--multi --height=50% --margin=5%,2%,2%,5% --layout=reverse-list --info=inline --prompt='>' --pointer='→' --marker='♡'  --color='bg+:#262626,fg+:#d0d0d0,gutter:-1'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {}'"
export FZF_ALT_C_COMMAND="fd --type d . --hidden"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
#FZF TAB configuration
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'


