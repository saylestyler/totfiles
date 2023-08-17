# Start configuration added by Zim install {{{

# add timestamps in YY:MM:DD to all commands ran
export HISTTIMEFORMAT="%F %T "

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
# OMGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
# this rocks, press esc to enter normal mode etc
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
	else
	  mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
	    https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
  for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
    for key ('k') bindkey -M vicmd ${key} history-substring-search-up
      for key ('j') bindkey -M vicmd ${key} history-substring-search-down
	unset key
	# }}} End configuration added by Zim install

# new zshrc since zplugin no longer works as of 2023 and just for funsies

source ~/totfiles/history-search-multi-word/history-search-multi-word.plugin.zsh
source ~/totfiles/.aliases.zsh

# this is required to have brew command be recognized, didn't work when appended to .zprofile as instructions claim
eval $(/opt/homebrew/bin/brew shellenv)

. ~/z/z.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# npm ERR! gyp verb check python checking for Python executable "/Users/tyler/.pyenv/shims/python2" in the PATH
# npm ERR! gyp verb `which` succeeded /Users/tyler/.pyenv/shims/python2 /Users/tyler/.pyenv/shims/python2
# npm ERR! gyp ERR! configure error
# npm ERR! gyp ERR! stack Error: Command failed: /Users/tyler/.pyenv/shims/python2 -c import sys; print "%s.%s.%s" % sys.version_info[:3];
# npm ERR! gyp ERR! stack pyenv: python2: command not found

# use pyenv to manage python versions https://opensource.com/article/19/5/python-3-default-mac
# https://github.com/nodejs/node-gyp/issues/2681
# lp: node-gyp causes issues and was fixed by following these two, and using 
# % nvm use 14.9
# Now using node v14.9.0 (npm v6.14.8)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# chromium related stuff
# Add depot_tools to the end of your PATH (you will probably want to put this in your ~/.bash_profile or ~/.zshrc). Assuming you cloned depot_tools to /path/to/depot_tools (note: you must use the absolute path or Python will not be able to find infra tools):

export PATH="$PATH:/path/to/depot_tools"

source ~/.ssh/NOTION_INTEGRATION_API_SECRET.zsh

# pnpm
export PNPM_HOME="/Users/tyler/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# rust install output (downloaded as part of installing `npm i -g pake-cli`
# In the Rust development environment, all tools are installed to the ~/.cargo/bin directory, and
# this is where you will find the Rust toolchain, including rustc, cargo, and rustup.
# 
# Accordingly, it is customary for Rust developers to include this directory in their PATH
# environment variable. During installation rustup will attempt to configure the PATH. Because of
# differences between platforms, command shells, and bugs in rustup, the modifications to PATH may
# not take effect until the console is restarted, or the user is logged out, or it may not succeed
# at all.
# 
# If, after installation, running rustc --version in the console fails, this is the most likely
#   reason.
#
# 130 % pake 'https://app.circleci.com/pipelines/github/staywanderful?filter=all' --icon ~/circle.icns --show-menu
# ✔ Enter your application name … Circleci
# ✔ Rust not detected. Install now? … yes
# info: profile set to 'default'
# info: default host triple is aarch64-apple-darwin
# info: latest update on 2023-07-13, rust version 1.71.0 (8ede3aae2 2023-07-12)
# info: default toolchain set to 'stable-aarch64-apple-darwin'
# ✹ Downloading Rust...
#   stable-aarch64-apple-darwin installed - rustc 1.71.0 (8ede3aae2 2023-07-12)
# 
# Rust is installed now. Great!
# 
# To get started you may need to restart your current shell.
# This would reload your PATH environment variable to include
# Cargo's bin directory ($HOME/.cargo/bin).
#

# make ./cloudinary_upload globally available
source ~/.ssh/MY_SUPER_SECRET_ENV_VARS
source ~/.ssh/ENV_VARS_AND_COGNITO_POOLS_AND_LAASIE_URLS.zsh
export PATH="$PATH:/Users/tyler/cloudinary_uploader"

# auto use .nvmrc version
export NVM_AUTO_USE=true
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

