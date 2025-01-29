#Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias cd..="cd .."
alias lt="ls -ltr"
#
# Java
alias jj="java -jar"

# Maven
alias -g m="mvn"
alias -g mc="m clean"
alias mcp="mc package"
alias mcpnotest="mcp -Dskip.unit.tests=true"
alias -g mci="mc install"
alias mcinotest="mci -Dskip.unit.tests=true"

# Docker
alias -g dck="docker"
# alias dckdangling='dck rmi $(dcki -q -f "dangling=true")'
alias -g dc="docker compose"
alias dcup="dc up"
alias dcdown="dc down"
#Docker logs
function dl() {
  local cid
  cid=$(docker ps | sed 1d | sk -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker logs "$cid" -f
}
# Docker attach
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | sk -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | sk -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}

# Select containers to remove
function drm() {
  docker ps -a | sed 1d | sk -q "$1" --no-sort -m --tac | awk '{ print $1 }' | xargs -r docker rm
}

# Select a docker image or images to remove
function drmi() {
  docker images | sed 1d | sk -q "$1" --no-sort -m --tac | awk '{ print $3 }' | xargs -r docker rmi
}

#Edit Config files
alias zshconfig="vim $ZSH/.zshrc"
alias vimrc="vim ~/.config/nvim/init.vim"
alias aliasrc="vim $ZSH/config/aliases.zsh"
alias avitech="vim $ZSH/config/avitech.zsh"

# GIT
delete-branches() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | sk --multi ) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

#Kubernetes
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
#Skaffold
alias s='skaffold'
alias sd='skaffold delete'
alias sr= 'skaffold run'
alias supdate='skaffold delete && mvn package -Dskip.unit.tests=true && skaffold run'
#JSON
alias jsontidy="pbpaste | jq '.' | pbcopy"
#BAT
alias cat="bat"
# Eza
alias ls='eza --icons'                                                         # ls
alias l='eza -lbF --git --icons'                                               # list, size, type, git
alias ll='eza -lbGF --git --icons'                                             # long list
alias llm='eza -lbGF --git --sort=modified --icons'                            # long list, modified date sort
alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale --icons'  # all list
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --icons' # all + extended list

# EZA speciality views
alias lS='eza -1 --icons'			                                                  # one column, just names
alias lt='eza --tree --level=2 --icons'     

#FZF
alias fzp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}' --border --height='80%'"
#VIM
alias vim="nvim"
# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

# Copy Line and Open in vim
copy-line () {
  rg --line-number "${1:-.}" | sk --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print $3}' | sed 's/^\s+//' | pbcopy
}

open-at-line () {
  vim $(rg --line-number "${1:-.}" | sk --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print "+"$2" "$1}')
}

# XR as HTTP
alias http="xh"
