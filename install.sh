#!/usr/bin/env bash

DOTFILES=$HOME/.homesick/repos/totfiles

echo -e "\\nCreating symlinks"

linkables=$(find -H $PWD -maxdepth 1 -name ".*rc")

for file in $linkables; do
  target="$HOME/$(basename "$file" '.symlink')"

  if [ -e "$target" ]; then
    echo "~${target#$HOME} already exists... Skipping."
  else
    echo "$file" "is now symlinked to" "$target"
    ln -sn "$file" "$target"
  fi
done
