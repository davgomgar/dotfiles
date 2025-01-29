#!/bin/bash

echo "Signin to 1password if needed..."
op vault list >/dev/null 2>&1 || eval $(op signin)

FILES_TO_ENCRYPT=("./zsh/private.zsh" "./git/config" "./git/config-work" "./git/config-work2" "./git/config-personal" "./avitech/config.json" "./avitech/settings.xml" "./avitech/toolchains.xml")

AGE_PUBLIC_KEY="$(op item get "dotfiles-public-key" --field notesPlain)"

for file in "${FILES_TO_ENCRYPT[@]}"; do
  if [[ -f "$file" ]]; then
    echo "Encrypting $file..."
    age -r "$AGE_PUBLIC_KEY" -o "$file.age" "$file"
  else
    echo "File $file not found, skipping."
  fi
done

unset AGE_PUBLIC_KEY

echo "Encryption complete."
