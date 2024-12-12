# Install zplugin if not already installed
if [ ! -d "${HOME}/.zplugin" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
fi

# History configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt EXTENDED_HISTORY INC_APPEND_HISTORY SHARE_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS HIST_VERIFY HIST_BEEP

# Alias configuration
alias top='/usr/local/Cellar/glances/3.4.0.3/bin/glances'

# zplugin configuration
source "$HOME/.zplugin/bin/zplugin.zsh"
zplugin ice wait blockf atpull'zplugin creinstall -q .'
zplugin light zsh-users/zsh-completions
zplugin ice wait atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting
zplugin ice wait atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions
zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh"
zplugin light direnv/direnv
zplugin load zdharma/history-search-multi-word
zplugin ice wait"0" lucid atload"geometry::prompt"
zplugin light geometry-zsh/geometry
zplugin ice from"gh-r" as"program"
zplugin load junegunn/fzf-bin
zplugin ice as"program" atclone"rm -f src/auto/config.cache; ./configure" atpull"%atclone" make pick"src/vim"
zplugin light vim/vim
zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zplugin light tj/git-extras
zplugin ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"
zplugin light b4b4r07/httpstat
zplugin ice silent wait:1; zplugin light supercrabtree/k
zplugin ice silent wait:1; zplugin light b4b4r07/zsh-vimode-visual
zplugin light paulirish/git-open

# Additional configurations
source ~/totfiles/.aliases.zsh
source ~/private-dot-files/ssh.sh

# load z
. /usr/local/etc/profile.d/z.sh

# Environment variables and PATH configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export GOPATH="$HOME/go-workspace"
export GOROOT="/usr/local/opt/go/libexec"
export JAVA_HOME=$(which java)
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:/usr/local/opt/postgresql@9.6/bin:/usr/local/opt/go/libexec/bin:$GOPATH/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/bin:/usr/bin:$HOME/.cargo/bin:$PATH"

# Ensure iTerm2 integration if available
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load rbenv
eval "$(rbenv init -)"

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Handle automatic 'nvm use'
enter_directory() {
    if [[ $PWD == $PREV_PWD ]]; then
        return
    fi
    PREV_PWD=$PWD
    if [[ -f ".nvmrc" ]]; then
        nvm use
        NVM_DIRTY=true
    elif [[ $NVM_DIRTY = true ]]; then
        nvm use default
        NVM_DIRTY=false
    fi
}
export PROMPT_COMMAND="$PROMPT_COMMAND; enter_directory"

make_video_file_way_smaller() {
  ffmpeg -i "$1" -vcodec libx265 -crf 28 -preset fast -vf "format=yuv420p,fps=30" -tag:v hvc1 "$2"
}

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

# make ./cloudinary_upload globally available
# source ~/.ssh/MY_SUPER_SECRET_ENV_VARS
# source ~/.ssh/ENV_VARS_AND_COGNITO_POOLS_AND_LAASIE_URLS.zsh
# export PATH="$PATH:/Users/tyler/cloudinary_uploader"

# auto use .nvmrc version
# export NVM_AUTO_USE=true
# source ~/.zsh-nvm/zsh-nvm.plugin.zsh
