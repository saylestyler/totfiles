# of interest: this file won't work if the ext is .sh
# because of lines 20-23 and how zsh handles globbing

function web_search() {
  emulate -L zsh

  typeset -A urls
  urls=(
    google      "https://www.google.com/search?q="
    github      "https://github.com/search?q="
    sos         "https://stackoverflow.com/search?q="
  )
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported."
    return 1
  fi

  if [[ $# -gt 1 ]]; then
    # build search url: join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url: split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi
  open_command "$url"
}

