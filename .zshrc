# use zplugin (sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)")
################# zplugin #####################
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
###############################################

zplugin light zsh-users/zsh-autosuggestions    # yeet
zplugin light zdharma/fast-syntax-highlighting # guess
zplugin load zdharma/history-search-multi-word # amazing ctrl-r
zplugin ice pick"async.zsh" src"pure.zsh"      # pure
zplugin light sindresorhus/pure                # &^ dep
zplugin ice from"gh-r" as"program"             # bin release
zplugin load junegunn/fzf-bin                  # fzf
zplugin ice as"program" \                      # manage vim
    atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" \
    make pick"src/vim"
zplugin light vim/vim
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX" # https://vimeo.com/45506445
zplugin light tj/git-extras

#############################
########### tyty ############
#############################

source ~/totfiles/.aliases.sh
source ~/private-dot-files/ssh.sh

##################################
######## path drama ##############
##################################

export JAVA_HOME=`echo $(which java)`
# OR (lol)
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# OR (lol?)
# export JAVA_HOME="$(echo /usr/libexec/java_home)"
# OR (lollllll)
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="$HOME/.cargo/bin:$PATH"

# z
. /usr/local/etc/profile.d/z.sh

# histrionics
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
