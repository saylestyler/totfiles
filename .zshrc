source ~/totfiles/.aliases.sh
source ~/private-dot-files/ssh.sh

source ~/.zplug/init.zsh

# Async for zsh, used by pure
zplug "mafredri/zsh-async", from:github, defer:0

# Load completion library for those sweet [tab] squares
zplug "lib/completion", from:oh-my-zsh

# Syntax highlighting for commands, load last
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

# theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# show alias mapped to command if not used
zplug "djui/alias-tips"

# Actually install plugins, prompt user input
if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

export GOPATH=$HOME/go # don't forget to change your path correctly!
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export JAVA_HOME=`echo $(which java)`
# OR
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export PATH="$HOME/.cargo/bin:$PATH"


# z
. /usr/local/etc/profile.d/z.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# setopt appendhistory
#  rather than append, use SAVE to 
#  have intrashell history saved
setopt SHARE_HISTORY

