# notes
#
# http://zsh.sourceforge.net/Doc/Release/Shell-Grammar.html#Aliasing
#
# Using the && operator is better then using a semicolon ; operator in between the two commands, as with { cd "$@" ; ls; }.
# This second command will run ls regardless if the cd worked or not.
# If the cd failed, ls will print the contents of your current directory, which will be confusing for the user. As a best practice, use && and not ;

alias serve="browser-sync start -s -f . --no-notify --host $LOCAL_IP --port 9000"

alias nvm10='. ~/.nvm/nvm.sh; nvm use 10'

alias spaceleft='df -hT /dev/xvda1' # for linux ami machines

alias vim='nvim'

# use exa to sort by newest files in long listing
alias lt='exa --sort newest -l'

# empties all volumes' trashes & clears sys logs for better sh startup
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
alias whois="whois -h whois-servers.net"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias myip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"

alias pbp="pbpaste"
alias pb="pbcopy"
function pb() {
  if [ -t 0 ]; then
    cat $1 | pbcopy
  else
    pbcopy < /dev/stdin
  fi
}

alias ctrd="tr -d '\n' | pbcopy"

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
alias kewl="ps -e | sort -b -k1 | head -10"

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
alias gcm="git commit -m"
alias gs="git status"
alias co="git checkout"
alias gpsh="git push"
alias gphm="git push heroku master"
alias gpuom="git push -u origin master"
alias dev="git checkout dev"
alias master="git checkout master"
alias undopush="git push -f origin HEAD^:master"
alias grs="git reset --soft"
alias gb="git branch -a" # g(i)t all branches local and remote
alias gcob="git checkout -b"
alias gpll="git pull"

alias tt="cd ~/tylsyl && git pull"

# task warrior
alias twmail="mail -s '$' e07c124d-9982-4921-b7b9-7a640e3c14bb@inthe.am"
alias tl="task all"
alias ta="task add"

# use the vim binary packaged with macvim instead of v 8.0 std
# alias vim='/usr/local/Cellar/macvim/HEAD-af41f91/bin/vim'

# nvm
alias nv10="nvm use --delete-prefix v10"

# alias nn="/usr/local/bin/nvim"
alias ezrc="nvim ~/totfiles/zsh/.zshrc"
alias evmrc="nvim ~/.config/nvim/init.vim"

alias ..='cd ..'
alias c="clear"
alias cs="cd ~/cs"
alias tree="tree -C"
alias rf="rm -rf"

# misc / utils
alias hqq="youtube-dl -x --audio-format m4a --audio-quality 0"
alias musicyt="open 'https://www.youtube.com/watch?v=faHomJimjLc' -a Safari"
alias music="open francesco\ tristano\ \&\ carl\ craig\ -\ the\ melody-ZFHD9QpQDFA.m4a"
alias transf="trans -shell fr:fr+en"
alias transes="trans -shell es:es+en"
alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bubu='bubo && bubc'
alias jj="gatsby develop --verbose --open"
alias scc="screencapture -S ~/Desktop/fs.jpg"
alias fps="screencapture -iC ~/Desktop/fs.jpg"
alias google='web_search google' # arguments to websearch fn
alias github='web_search github'
alias sos='web_search stackoverflow'
alias ppaas='pbcopy < https://ppaas.herokuapp.com/partyparrot/mega?overlay=http://vignette3.wikia.nocookie.net/runescape2/images/0/0a/Wizard_hat_(t)_detail.png&overlayWidth=100&overlayHeight=100&overlayOffsetY=-150'
alias yrd='yarn run dev'
alias gab='gatsby build'
alias gad='gatsby develop'
alias mailme='echo "mail -a myscript.sh -s \"subj: myscript EOM\" tyler@g.com < /dev/null"'

# postgrestuff
alias pg_start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg_stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# Shortcuts
alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get week number
alias week='date +%V'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Google Chrome
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias LOCAL_IP="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "${method}"="lwp-request -m '${method}'"
done

# Make Grunt print stack traces by default
command -v grunt > /dev/null && alias grunt="grunt --stack"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume output volume 100'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# howdoi
alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'

# show most used commands
# history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10

alias bi='brew install'
alias bu='brew uninstall'
alias bf='brew info'

alias lpp='open . -a LastPass'

alias ipp='ipython'


it2prof() {
  echo -e "\033]50;SetProfile=$1\a"
};

# Display directory contents after cd.
function c() {
  builtin cd "$@" && ls -F
}

function fu_command_line() {
  https://www.commandlinefu.com/commands/matching/space/c3BhY2U=/sort-by-votes
}

function git_create_new_repo() {
  curl -u $1 https://api.github.com/user/repos -d '{"name": '$2', "private": "true"}'
}

function octalf() {
  stat -f '%A %a %n' $1
}

alias hg='history | grep'

# get the 20 most used commands
# https://github.com/trimstray/the-book-of-secret-knowledge#tool-terminal
function hist() {
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

function shce() {
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
function who_boot() {
  who -b
}

# show 20 biggest directories with K M G
function biggest_loosers() {
  du |
    sort -r -n |
    awk '{split("K M G",v); s=1; while($1>1024){$1/=1024; s++} print int($1)" "v[s]"\t"$2}' |
    head -n 20
}

# add note
function n() {
  echo "${*}" >>~/notes.md
  echo "noted"
}

# add todo
function td() {
  echo "${*}" >>~/todo.md
  cat ~/todo.md
}

# howdoi
function hdi() {
  howdoi "$*" -a -c -n 3
}

# man in preview
function pman() {
  man -t "${@}" | open -f -a /Applications/Preview.app/
}

function hman() {
  groff -Thtml -man $(man -w ${@}) >/tmp/hman$$.html
  open /tmp/hman$$.html
}

function dud() {
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

# adds all staged changes followed by commit prompt
function gall() {
  git add . ; git commit -m "${@}"
}

# `o` with no args opens the current dir, otherwise the loc
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# # Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_";
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')";
}

# https://github.com/necolas/dotfiles/blob/master/shell/functions/datauri
function datauri() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    printf "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')" | pbcopy | printf "=> data URI copied to pasteboard.\n"
}

# # Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
# function targz() {
# 	local tmpFile="${@%/}.tar";
# 	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;
#
# 	size=$(
# 		stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
# 		stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
# 	);
#
# 	local cmd="";
# 	if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
# 		# the .tar file is smaller than 50 MB and Zopfli is available; use it
# 		cmd="zopfli";
# 	else
# 		if hash pigz 2> /dev/null; then
# 			cmd="pigz";
# 		else
# 			cmd="gzip";
# 		fi;
# 	fi;
#
# 	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
# 	"${cmd}" -v "${tmpFile}" || return 1;
# 	[ -f "${tmpFile}" ] && rm "${tmpFile}";
#
# 	zippedSize=$(
# 		stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
# 		stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
# 	);
#
# 	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
# }
#
# # Determine size of a file or total size of a directory
# function fs() {
# 	if du -b /dev/null > /dev/null 2>&1; then
# 		local arg=-sbh;
# 	else
# 		local arg=-sh;
# 	fi
# 	if [[ -n "$@" ]]; then
# 		du $arg -- "$@";
# 	else
# 		du $arg .[^.]* ./*;
# 	fi;
# }
#
# # Use Git’s colored diff when available
# hash git &>/dev/null;
# if [ $? -eq 0 ]; then
# 	function diff() {
# 		git diff --no-index --color-words "$@";
# 	}
# fi;
#
# # Create a data URL from a file
# function dataurl() {
# 	local mimeType=$(file -b --mime-type "$1");
# 	if [[ $mimeType == text/* ]]; then
# 		mimeType="${mimeType};charset=utf-8";
# 	fi
# 	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
# }
#
# # Start an HTTP server from a directory, optionally specifying the port
# function server() {
# 	local port="${1:-8000}";
# 	sleep 1 && open "http://localhost:${port}/" &
# 	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
# 	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
# 	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
# }
#
# # Start a PHP server from a directory, optionally specifying the port
# # (Requires PHP 5.4.0+.)
# function phpserver() {
# 	local port="${1:-4000}";
# 	local ip=$(ipconfig getifaddr en1);
# 	sleep 1 && open "http://${ip}:${port}/" &
# 	php -S "${ip}:${port}";
# }
#
# # Compare original and gzipped file size
# function gz() {
# 	local origsize=$(wc -c < "$1");
# 	local gzipsize=$(gzip -c "$1" | wc -c);
# 	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
# 	printf "orig: %d bytes\n" "$origsize";
# 	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
# }
#
# # Run `dig` and display the most useful info
# function digga() {
# 	dig +nocmd "$1" any +multiline +noall +answer;
# }
#
# # Show all the names (CNs and SANs) listed in the SSL certificate
# # for a given domain
# function getcertnames() {
# 	if [ -z "${1}" ]; then
# 		echo "ERROR: No domain specified.";
# 		return 1;
# 	fi;
#
# 	local domain="${1}";
# 	echo "Testing ${domain}…";
# 	echo ""; # newline
#
# 	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
# 		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);
#
# 	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
# 		local certText=$(echo "${tmp}" \
# 			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
# 			no_serial, no_sigdump, no_signame, no_validity, no_version");
# 		echo "Common Name:";
# 		echo ""; # newline
# 		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
# 		echo ""; # newline
# 		echo "Subject Alternative Name(s):";
# 		echo ""; # newline
# 		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
# 			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
# 		return 0;
# 	else
# 		echo "ERROR: Certificate not found.";
# 		return 1;
# 	fi;
# }
#
# # Normalize `open` across Linux, macOS, and Windows.
# # This is needed to make the `o` function (see below) cross-platform.
# if [ ! $(uname -s) = 'Darwin' ]; then
# 	if grep -q Microsoft /proc/version; then
# 		# Ubuntu on Windows using the Linux subsystem
# 		alias open='explorer.exe';
# 	else
# 		alias open='xdg-open';
# 	fi
# fi
#

# alias ld='ls -ld'              # Show info about the directory
# alias lla='ls -lAF'            # Show hidden all files
# alias ll='ls -lF'              # Show long file information
# alias la='ls -AF'              # Show hidden files
# alias lx='ls -lXB'             # Sort by extension
# alias lk='ls -lSr'             # Sort by size, biggest last
# alias lc='ls -ltcr'            # Sort by and show change time, most recent last
# alias lu='ls -ltur'            # Sort by and show access time, most recent last
# alias lt='ls -ltr'             # Sort by date, most recent last
# alias lr='ls -lR'              # Recursive ls
# alias lsd='ls -l | grep "^d"'
alias cradle_development='export $(cat .env-development | xargs)'
alias cradle_staging='export $(cat .env-staging | xargs) && export CRADLE_DB_USER=cradle'
alias cradle_production='export $(cat .env-production | xargs) && export CRADLE_DB_USER=cradle'
alias mesa_development='export $(cat .env-development | xargs)'
alias mesa_staging='export $(cat .env-staging | xargs) && export MESA_DB_USER=mesa'
alias mesa_production='export $(cat .env-production | xargs) && export MESA_DB_USER=mesa'
alias valley_development='export $(cat .env-development | xargs)'
alias valley_staging='export $(cat .env-staging | xargs) && export VALLEY_DB_USER=valley'
alias valley_production='export $(cat .env-production | xargs) && export VALLEY_DB_USER=valley'