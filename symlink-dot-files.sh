#!/bin/bash
dotfiles=(".vimrc" ".zshrc" "" ".zshrc" ".gitconfig" ".ackrc" ".ctags" ".cvimrc" ".functionsrc" ".inputrc" ".zprofile" ".zpreztorc" ".zlogin" ".wszshrc" ".vimrc.local" ".hyper.js" ".gitignore" ".bash_profile" ".bashrc")
dir="${HOME}/Dropbox/totfiles/home"

for dotfile in "${dotfiles[@]}"; do
  ln -sf "${HOME}/${dotfile}" "${dir}"
done
