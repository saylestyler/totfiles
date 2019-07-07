export EDITOR=nvim

export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/lib/python2.7/site-packages:$PATH"
export PATH="/usr/local/lib/python3.7/site-packages:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"


#Homebrew Python
export PATH=/usr/local/share/python:$PATH


#Homebrew (Main homebrew path should be after any other homebrew paths)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH


# phantom suggestions that occur for previously typed in commands
# color
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# ctrl+space = accept
# bindkey '^ ' autosuggest-accept

fpath+=${ZDOTDIR:-~}/.zsh_functions

source /Users/ty/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
