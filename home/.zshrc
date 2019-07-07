# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/tyler/.oh-my-zsh"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

ZSH_THEME="simple"

# type dir name to cd into
setopt autocd

# ~/.oh-my-zsh/plugins/*
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

plugins=(gitfast)

# you've got no mail
MAILCHECK=0

# aliases and functions
source /Users/tyler/.homesick/repos/totfiles/.functionsrc
source /Users/tyler/.homesick/repos/totfiles/.aliasesrc

# manually set your language environment
export LANG=en_US.UTF-8

# editors
EDITOR=nvim
VISUAL=$EDITOR
export EDITOR VISUAL
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Display directory contents after cd.
function cd {
    builtin cd "$@" && ls -F
    }

# z
. /usr/local/etc/profile.d/z.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="/Users/tyler/.deno/bin:$PATH"
export PATH="/Users/tyler/Library/Python/3.7/bin:$PATH"
export PATH="/Users/tyler/Library/Python/2.7/bin:$PATH"
export PATH="$PATH:`yarn global bin`"

# show most used commands
# alias hist='history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'

# du | sort -r -n | awk '{split("K M G",v); s=1; while($1>1024){$1/=1024; s++} print int($1)" "v[s]"\t"$2}' | head -n 20"

# ls alias ld='ls -ld'   # Show info about the directory
alias lla='ls -lAF' # Show hidden all files
alias ll='ls -lF'   # Show long file information
alias la='ls -AF'   # Show hidden files
alias lx='ls -lXB'  # Sort by extension
alias lk='ls -lSr'  # Sort by size, biggest last
alias lc='ls -ltcr' # Sort by and show change time, most recent last
alias lu='ls -ltur' # Sort by and show access time, most recent last
alias lt='ls -ltr'  # Sort by date, most recent last
alias lr='ls -lR'   # Recursive ls
alias lsd='ls -l | grep "^d"'

# OS
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
alias whois="whois -h whois-servers.net"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias myip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
alias c="tr -d '\n' | pbcopy"
alias fs="stat -f \"%z bytes\""
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
alias flush="dscacheutil -flushcache"
alias emptytrash="rm -rfv ~/.Trash"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true and killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false and killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false and killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true and killall Finder"
alias spf="splash -f"
alias kewl="ps -e -orss=,args= | sort -b -k1,1n| head -10"

# npm
alias npmg="npm i -g "
alias npmS="npm i -S "
alias npmD="npm i -D "
# Execute command from node_modules folder based on current directory
# i.e npmE gulp
alias npmE='PATH="$(npm bin)":"$PATH"'
alias npmO="npm outdated"
alias npmV="npm -v"
alias npmL="npm list"
alias npmL0="npm ls --depth=0"
alias npmst="npm start"
alias npmt="npm test"
alias npmR="npm run"
alias npmP="npm publish"
alias npmI="npm init"
alias pnpm="node /usr/local/lib/node_modules/pnpm/lib/bin/pnpm.js"

alias kp="/usr/local/lib/node_modules/kill-port/cli.js"

alias sodb="source ~/db.sh"
# alias debb='echo 'docker exec --user www-data =i =t vfiles_shop_cli_<TAB FOR ID> /bin/bash"'
alias rcl="redis-cli"
alias code="open . -a Visual\ Studio\ Code"
alias purity="purifycss ./**/*.css ./**/*.html --rejected --info --min >> lol.css"
alias phps="php -S localhost:8000 && open localhost:8000 -a Google\ Chrome"
alias phelp='http-server /usr/local/Cellar/python@2/2.7.15_1/share/doc/python@2/library/'
alias css="stylelint \"src/layouts/*.css\" --config /usr/local/lib/node_modules/stylelint-config-standard/ --fix"
alias tags="ctags -R --exclude=node_modules --exclude=bower_components --exclude=public --exclude=.git --exclude=dist --exclude=.tmp ."
alias agn="fc -e : -1"
alias ccc="pbcopy <"
alias ppp="pbpaste"

# git guide for the gods https://github.com/k88hudson/git-flight-rules
alias g="git"
alias gd="git diff"
alias gdc="git diff --cached"
alias gd="git diff -- ':!package-lock.json' ':!yarn.lock'" # ignore package-lock on git diff
alias gco="git checkout"
alias glp="git log --pretty=oneline"
alias ga="git add"
alias ggg="git add . && git commit -m 'standard' && git push"
alias kewl="ps -e -orss=, args= | sort -b -k1,1n| head -10"
alias gitdiscard="git checkout -- . "
alias gpl="git pull"
alias gcm="git commit -m"
alias gs="git status"
alias co="git checkout"
alias gpsh="git push"
alias dev="git checkout dev"
alias master="git checkout master"
alias gc="git clone"
alias gphm="git push heroku master"
alias gpuom="git push -u origin master"
alias gcp="git cherry-pick"
alias undopush="git push -f origin HEAD^:master"
alias grs="git reset --soft"
alias gcp="git cherry-pick"
alias gb="git branch -a" # g(i)t all branches local and remote
alias gcob="git checkout -b"

# task warrior
alias twmail="mail -s '$' e07c124d-9982-4921-b7b9-7a640e3c14bb@inthe.am"
alias tl="task all"
alias ta="task add"

# config files
alias vim="/usr/local/bin/nvim"
alias nn="/usr/local/bin/nvim"
alias zrc="nvim ~/.zshrc"
alias vrc="nvim ~/.config/nvim/init.vim"

alias ..='cd ..'
alias c="clear"
alias cs="cd ~/cs"
alias tree="tree -C"
alias rf="rm -rf"

# misc / utils
alias hqq="youtube-dl -x --audio-format m4a --audio-quality 0"
alias music="open 'https://www.youtube.com/watch?v=faHomJimjLc' -a Safari"
alias transf="trans -shell fr:fr+en"
alias transes="trans -shell es:es+en"
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'
alias jj="gatsby develop --verbose --open"
alias fs="screencapture -S ~/Desktop/fs.jpg"
alias fps="screencapture -iC ~/Desktop/fs.jpg"
alias google='web_search google' # arguments to websearch fn
alias github='web_search github'
alias sos='web_search stackoverflow'
alias ppaas='pbcopy < https://ppaas.herokuapp.com/partyparrot/mega?overlay=http://vignette3.wikia.nocookie.net/runescape2/images/0/0a/Wizard_hat_(t)_detail.png&overlayWidth=100&overlayHeight=100&overlayOffsetY=-150'

# postgrestuff
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias yrd='yarn run dev'

# hs
alias hi='hs -i'
function hs
{
    history | grep $*
}



git_create_new_repo() {
  curl -u $1 https://api.github.com/user/repos -d '{"name": '$2', "private": "true"}'
}

octalf() {
  stat -f '%A %a %n' $1
}

# get the 20 most used commands
# https://github.com/trimstray/the-book-of-secret-knowledge#tool-terminal
hist() {
  history |
    awk '''
    {
      CMD[$2]++;
      count++;
    }
    END
    {
      for (a in CMD)
        print CMD[a] " " CMD[a]/count * 100 "% " a;
    }
  ''' | grep -v "./" | column -c -s ' ' -t | sort -nr | nl | head -n 20
  # note that line 16 will ruin everything if u break it up over multiple lines
}

shce() {
  # Read  commands  but  do  not execute them.  This may be
  # used to check a shell script for syntax  errors.   This
  # is ignored by interactive shells.
  bash -n
}

# kill process running on port <port>
# use node_module :) kp
# kill_port() {
#   # kill -9 $(lsof -i :<port> | awk `{l=$2} END {print l}`)
# }

# find last reboot time
who_boot() {
  who -b
}
# show 20 biggest directories with K M G
biggest_loosers() {
  du |
    sort -r -n |
    awk '{split("K M G",v); s=1; while($1>1024){$1/=1024; s++} print int($1)" "v[s]"\t"$2}' |
    head -n 20
}

# add note
n() {
  echo "${*}" >>~/notes.md
  echo "noted"
}

# add todo
td() {
  echo "${*}" >>~/todo.md
  cat ~/todo.md
}

# howdoi
hdi() {
  howdoi "$*" -a -c -n 3
}

rmd() {
  pandoc "$1" | lynx -stdin
}

pman() {
  man -t "${@}" | open -f -a /Applications/Preview.app/
}

hman() {
  groff -Thtml -man $(man -w ${@}) >/tmp/hman$$.html
  open /tmp/hman$$.html
}

dud() {
  du |
    sort -r -n |
    awk '{ split("K M G",v);
        s=1;
        while ($1>1024) {
          $1/=1024; s++
        }
        print int($1) " " v[s] "\t" $2
      }' |
    head -n 20
}

# Display directory contents after cd.
function cd() {
  builtin cd "$@" && ls -F
}

# performance timing
performance() {
  for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
}

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

homeshick check

#if [[ $ZSH_PROFILE_RC -gt 0 ]] ; then
    #zmodload zsh/zprof
#fi
