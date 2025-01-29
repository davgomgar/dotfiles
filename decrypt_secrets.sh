#!/bin/bash

echo "Signin to 1password if needed..."
op vault list >/dev/null 2>&1 || eval $(op signin)

FILES_TO_DECRYPT=("./zsh/private.zsh" "./git/config" "./git/config-work" "./git/config-work2" "./git/config-personal" "./avitech/config.json" "./avitech/settings.xml" "./avitech/toolchains.xml")

AGE_PRIVATE_KEY="$(op item get "dotfiles-private-key" --field notesPlain)"

for file in "${FILES_TO_DECRYPT[@]}"; do
  if [[ -f "$file.age" ]]; then
    echo "Decrypting $file.age ..."
    echo "$AGE_PRIVATE_KEY" | age -d -i - "$file.age" >"$file"

  else
    echo "File $file not found, skipping."
  fi
done

unset AGE_PRIVATE_KEY

echo "Decryption complete."
