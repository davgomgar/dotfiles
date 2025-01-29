# Thanks to Sebastian Daschner https://blog.sebastian-daschner.com/entries/zsh-aliases
# starts one or multiple args as programs in background
background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &> /dev/null &
  done
}
