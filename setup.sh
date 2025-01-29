#!/usr/bin/env bash
sh decrypt_secrets.sh
stow .
cd /Users/david/
ln -s /Users/david/.config/zsh/.zshenv .zshenv
