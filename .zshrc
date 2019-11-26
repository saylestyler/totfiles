# use zplugin
if [ ! -d "${HOME}/.zplugin" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

###############################################
#                  zplugin                    &
###############################################
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

###############################################
#             zplugin... plugins              &
###############################################

# http://zdharma.org/zplugin/wiki/Example-Minimal-Setup/

# completions: let zplugin handle (w/ smylinks vs. fpath variables)
# http://zdharma.org/zplugin/wiki/INTRODUCTION/#completion_management
# zplugin ice blockf
# zplugin light zsh-users/zsh-completions
zplugin ice wait blockf atpull'zplugin creinstall -q .'
zplugin light zsh-users/zsh-completions

# guess
zplugin ice wait atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting

# zsh-autosuggestions runs a function a in a precmd hook, so it's last
# zplugin ice silent wait:1 atload:_zsh_autosuggest_start
# zplugin light zsh-users/zsh-autosuggestions
zplugin ice wait atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions

# direnv
# this setup manages updates / sourcing (fast)
zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv

# amazing ctrl-r
zplugin load zdharma/history-search-multi-word

# theme
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# turbo mode theme (ice wait !0)
# PS1="READY > "
# zplugin ice wait'!0'
# zplugin load halfo/lambda-mod-zsh-theme


# fzf
zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin

# manage vim
zplugin ice as"program" \
    atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" \
    make pick"src/vim"
zplugin light vim/vim

# git-extras https://vimeo.com/45506445
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zplugin light tj/git-extras

# adds plugin directory to $PATH,
# copy file httpstat.sh into httpstat
# adds execution rights (+x) to the file selected with pick
zplugin ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"
zplugin light b4b4r07/httpstat

# better dir listings / `k`
zplugin ice silent wait:1; zplugin light supercrabtree/k

##############################################
#              tyty's opts                   &
##############################################

source ~/totfiles/.aliases.zsh
source ~/private-dot-files/ssh.sh

# z
. /usr/local/etc/profile.d/z.sh

# histrionics
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY

# httpstat
export HTTPSTAT_SHOW_IP=false
export HTTPSTAT_SHOW_SPEED=true
export HTTPSTAT_SAVE_BODY=false

##############################################
#                path drama                  &
##############################################

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="$HOME/.cargo/bin:$PATH"
# this is for coc-vim
export JAVA_HOME=`echo $(which java)`
# OR (lol)
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# OR (lol?)
# export JAVA_HOME="$(echo /usr/libexec/java_home)"
# OR (lollllll)
# export PATH="/usr/local/opt/openjdk/bin:$PATH"

##############################################
#               zsh-saneopt                  &
##############################################

# directories have trailing slashes
setopt mark_dirs

# no c-s/c-q output freezing
# c-s = flow control
# And this usage survives in Unix because modern terminal emulators
# are emulating physical terminals (like the vt100)
# which themselves were (in some ways) emulating teletypes.
setopt noflowcontrol

# allow expansion i prompts
setopt prompt_subst

# this is default, but set for share_history
setopt append_history

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

# display PID when suspending processes as well
setopt longlistjobs

# try to avoid the 'zsh: no matches found...'
setopt nonomatch

# report the status of backgrounds jobs immediately
setopt notify

# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

# not just at the end
setopt completeinword

# use zsh style word splitting
setopt noshwordsplit

# allow use of comments in interactive code
setopt interactivecomments

# dunno how this wasn't set!
setopt auto_cd

# if [[ "$ZSH_SANEOPT_INSANITY" -gt 0 ]]; then
#     # in order to use #, ~ and ^ for filename generation grep word
#     # *~(*.gz|*.bz|*.bz2|*.zip|*.Z) -> searches for word not in compressed files
#     # don't forget to quote '^', '~' and '#'!
#     setopt extended_glob

#     # don't error out when unset parameters are used
#     setopt unset
# fi

# automatically remove duplicates from these arrays
#typeset -U path cdpath fpath manpath

# import new commands from the history file also in other zsh-session
#setopt share_history
# If a new command line being added to the history list duplicates an older
# one, the older command is removed from the list
#setopt histignorealldups
# remove command lines from the history list when the first character on the
# line is a space
#setopt histignorespace
# if a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
#setopt auto_cd

# Don't send SIGHUP to background processes when the shell exits.
#setopt nohup
# make cd push the old directory onto the directory stack.
#setopt auto_pushd
# avoid "beep"ing
#setopt nobeep
# don't push the same dir twice.
#setopt pushd_ignore_dups
# * shouldn't match dotfiles. ever.
#setopt noglobdots
