#####################################################################
# init | sourcing
#####################################################################

# export DOTFILEDIR=/Users/t/totfiles

#####################################################################
# zplug
#####################################################################

# Essential
source ~/.zplug/init.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zplug "zplug/zplug"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "lukechilds/zsh-nvm"
zplug "knu/z", use:z.sh, defer:3 # zplug "rupa/z", use:z.sh

# zsh bookmarks  (oh my zsh)
zplug "jocelynmallon/zshmarks"

#####################################################################
# profiling
#####################################################################

if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
zcompile ~/.zshrc
fi
zmodload zsh/zprof && zprof
zmodload zsh/zprof

#####################################################################
# environment
#####################################################################

# Better umask
# umask 022
export LANG=en_US.UTF-8
export EDITOR=nvim
export FCEDIT=nvim
export PAGER=less
export LESS='-RQM'
export GZIP='-v9N'
export SHELL=zsh
# export GOPATH="$HOME/.go"
# export PATH="$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH"

# Prezto framework
zplug "sorin-ionescu/prezto", \
use:"init.zsh", \
hook-build:"ln -s $~.zplug/repos/sorin-ionescu/prezto ~/.zprezto"

zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:load' pmodule \
'environment' \
'terminal' \
'editor' \
'history' \
'directory' \
'utility' \
'completion' \
'prompt' \
'python' \
'fasd'
#  'tmux'

zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:prompt' theme 'pure'

# zplug "~/.zsh", \
#   use:"*.zsh", \
#   from:local

# Add a bunch more of your favorite packages!

# Install packages that have not been installed yet
if ! zplug check --verbose; then
printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e

export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

source ~/.aliasesrc
source ~/.functionsrc

# dunno
# WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# Print core files?
#unlimit
#limit core 0
#limit -s
#limit coredumpsize  0
# Enable math functions
# zmodload zsh/mathfunc

# if ( which zprof > /dev/null ); then
#     zprof | less
# fi


#####################################################################
# others
######################################################################

# Improve terminal title
# case "${TERM}" in
#     kterm*|xterm*|vt100|st*|rxvt*)
#         precmd() {
#             echo -ne "\033]0;${PWD}\007"
#             vcs_info
#         }
#     ;;
# esac

# emacs keybinds
bindkey -e

# History completion
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# Like bash
bindkey "^u" backward-kill-line

# # improved less option
# export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case --quit-if-one-screen --RAW-CONTROL-CHARS'
#
# #####################################################################
# # completions
# #####################################################################
#
# Enable completions
if [ -d ~/.zsh/comp ]; then
  fpath=(~/.zsh/comp $fpath)
  autoload -U ~/.zsh/comp/*(:t)
fi

zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes

# Use cache completion
# homebrew, dpkg (Debian), rpm (Redhat), urpmi (Mandrake), perl -M,
# bogofilter (zsh 4.2.1 >=), fink, mac_apps...
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list \
'' \
'm:{a-z}={A-Z}' \
'l:|=* r:|[.,_-]=* r:|=* m:{a-z}={A-Z}'
# sudo completions
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
/usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' menu select
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
_approximate _list _history


# this must be done before compinit is called
# generate brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

autoload -U compinit
  if [ ! -f ~/.zcompdump -o ~/.zshrc -nt ~/.zcompdump ]; then
  compinit -d ~/.zcompdump
fi

# cd search path
cdpath=($HOME)

zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"

# #####################################################################
# # options
# ######################################################################
#
# setopt auto_resume
# # Ignore <C-d> logout
# setopt ignore_eof
# # Disable beeps
# setopt no_beep
# # {a-c} -> a b c
# setopt brace_ccl
# # Enable spellcheck
# setopt correct
# # Enable "=command" feature
# setopt equals
# # Disable flow control
# setopt no_flow_control
# # Ignore dups
# setopt hist_ignore_dups
# # Reduce spaces
# setopt hist_reduce_blanks
# # Ignore add history if space
# setopt hist_ignore_space
# # Save time stamp
# setopt extended_history
# # Expand history
# setopt hist_expand
# # Better jobs
# setopt long_list_jobs
# # Enable completion in "--option=arg"
# setopt magic_equal_subst
# # Add "/" if completes directory
# setopt mark_dirs
# # Disable menu complete for vimshell
# setopt no_menu_complete
# setopt list_rows_first
# # Expand globs when completion
# setopt glob_complete
# # Enable multi io redirection
# setopt multios
# # Can search subdirectory in $PATH
# setopt path_dirs
# # For multi byte
# setopt print_eightbit
# # Print exit value if return code is non-zero
# # setopt print_exit_value
# setopt pushd_ignore_dups
# setopt pushd_silent
# # Short statements in for, repeat, select, if, function
# setopt short_loops
# # Ignore history (fc -l) command in history
# setopt hist_no_store
# setopt hash_cmds
# setopt numeric_glob_sort
# # Enable comment string
# setopt interactive_comments
# # Improve rm *
# setopt rm_star_wait
# # Enable extended glob
# setopt extended_glob
# # Note: It is a lot of errors in script
# # setopt no_unset
# setopt transient_rprompt
# unsetopt promptcr
# # Prompt substitution
# setopt prompt_subst
# setopt always_last_prompt
# # List completion
# setopt auto_list
# setopt auto_param_slash
# setopt auto_param_keys
# # List like "ls -F"
# setopt list_types
# # Compact completion
# setopt list_packed
# setopt auto_cd
# setopt auto_pushd
# setopt pushd_minus
# setopt pushd_ignore_dups
# # Check original command in alias completion
# setopt complete_aliases
# unsetopt hist_verify


# #####################################################################
# # alias
# ######################################################################
# source "$DOTFILEDIR/.aliasesrc"

# # Better mv, cp, mkdir
# alias mv='nocorrect mv'
# alias cp='nocorrect cp'
# alias mkdir='nocorrect mkdir'

# # Improve du, df
# alias du="du -h"
# alias df="df -h"

# # Improve od for hexdump
# alias od='od -Ax -tx1z'
# alias hexdump='hexdump -C'

alias vim='TERM=xterm-256color vim'
alias nvim-qt='nvim-qt --geometry 1800x1200'
alias gonvim='~/Downloads/gonvim/gonvim &>/dev/null &'
# # alias lock='i3exit lock'

# HSTR configuration - add this to ~/.bashrc
# history | hstr
alias hh=hstr                    # hh to be alias for hstr
# export HSTR_CONFIG=hicolor       # get more colors
HISTFILE=$HOME/.zsh-history
HISTSIZE=20000
SAVEHIST=20000
SAVEHIST=50000
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export HISTCONTROL=ignorespace   # leading space hides commands from history
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
setopt inc_append_history
setopt share_history
# shopt -s histappend              # append new history items to .bash_history

# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
# if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
# if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

