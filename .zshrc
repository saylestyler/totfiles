# export dir to my dotfiles

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# and rest of the dirs
export ZDOTDIR=~
export TERM="xterm-256color"
#export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
#export XDG_CACHE_HOME=${XDG_CACHE_HOME:-~/.cache}

unset CHECK_MAIL

# this settings covers macOS
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# no you've got mail
MAILCHECK=0

export PAGER='less'
export VISUAL="${EDITOR}"

export EDITOR=/usr/local/Cellar/macvim/HEAD-af41f91/bin/vim
export VISUAL=/usr/local/Cellar/macvim/HEAD-af41f91/bin/vim

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

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Add homebrew to the completion path
fpath=("/usr/local/bin/" $fpath)

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

# Case insensitive globbing
setopt NO_CASE_GLOB

# incremental search
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.aliasesrc
source ~/.functionsrc
source ~/.ssh.sh

# set options for less
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
# or the short version
# export LESS='-F -i -J -M -R -W -x4 -X -z-4'
# # Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# pure theme settings
export PURE_GIT_PULL=1

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "lukechilds/zsh-nvm"

# z (don't forget v)
. /usr/local/etc/profile.d/z.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use rbenv vs rvm
eval "$(rbenv init -)"

