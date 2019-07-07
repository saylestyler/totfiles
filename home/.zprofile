#!/bin/zsh

# Loaded before zshrc

# export dir to my dotfiles
export T_DOTFILES_DIR="${HOME}/.dotfiles"

# and rest of the dirs
export ZDOTDIR=~
export TERM="xterm-256color"
#export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
#export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/.cache}

# this settings covers macOS
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export PAGER='less'
export VISUAL="${EDITOR}"

if >/dev/null 2>&1 command -v nvim ; then
  export EDITOR=nvim
  nvim -es +'exe !has("nvim-0.3.7")."cq"' && export MANPAGER="nvim +Man!"
elif >/dev/null 2>&1 command -v vim ; then
  export EDITOR=vim
else
  export EDITOR=vi
fi

export PYTHONIOENCODING='UTF-8'             # make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONUTF8=1                         # ---/---
export PYTHONDONTWRITEBYTECODE=1            # prevent Python from making .pyc files that may become stale and cause weird bugs

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/.local/bin
  $path
)

echo $path

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# pure theme settings
export PURE_GIT_PULL=1
