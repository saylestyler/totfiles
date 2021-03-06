set noautofocus
set nocncpcompletion
set smoothscroll
set hud
set noregex
set noinsertmappings
set typelinkhints
set defaultnewtabpage
set sortlinkhints

let scrollduration = 10
let searchlimit = 20
let searchalias g = "google"
let mapleader = "\\"
let barposition = "bottom"
let typelinkhintsdelay = "0"
let hintcharacters = "asdfg"

map <C-3> lastUsedTab
map \] openCommandBar
map l nextTab
map h previousTab
map <C-l> nextTab
map <C-h> previousTab
map <C-d> scrollFullPageDown
map <C-f> scrollFullPageUp

map F createActiveTabbedHint
map f createHint
map p openPasteTab
map P openPaste
map S :open google<Space>
map s :tabnew google<Space>
map i goToInput
map u lastClosedTab

map <C-z> toggleCvim
map <Leader>ex :tabopen chrome://extensions<CR>
map <Leader>gh :tabopen https://github.com/saylestyler<CR>
map <Leader>gi :tabopen https://gist.github.com/saylestyler<CR>
map <Leader>cs :tabopen https://github.com/CodesmithLLC<CR>
map <Leader>gm :tabopen https://mail.google.com/mail/#index<CR>
map <Leader>so :tabopen http://stackoverflow.com<CR>

site "https://mail.google.com/*" {
    unmapAll
}

let blacklists = ["https://repl.it/*"]

" Mappings.defaults = [
"   ['j',         'scrollDown'],
"   ['gg',        'scrollToTop'],
"   ['a',         ':tabnew google '],
"   ['o',         ':open '],
"   ['O',         ':open @%'],
"   ['b',         ':bookmarks '],
"   ['t',         ':tabnew '],
"   ['I',         ':history '],
"   ['T',         ':tabnew @%'],
"   ['B',         ':buffer '],
"   ['gd',        ':chrome downloads!<cr>'],
"   ['ge',        ':chrome extensions!<cr>'],
"   ['x',         'closeTab'],
"   ['gxT',       'closeTabLeft'],
"   ['gxt',       'closeTabRight'],
"   ['gx0',       'closeTabsToLeft'],
"   ['gx$',       'closeTabsToRight'],
"   ['s',         'scrollDown'],
"   ['j',         'scrollDown'],
"   ['w',         'scrollUp'],
"   ['k',         'scrollUp'],
"   ['e',         'scrollPageUp'],
"   ['u',         'scrollPageUp'],
"   ['d',         'scrollPageDown'],
"   ['gg',        'scrollToTop'],
"   ['G',         'scrollToBottom'],
"   ['h',         'scrollLeft'],
"   ['l',         'scrollRight'],
"   ['0',         'scrollToLeft'],
"   ['$',         'scrollToRight'],
"   ['i',         'insertMode'],
"   ['r',         'reloadTab'],
"   ['cr',        'reloadAllButCurrent'],
"   ['gR',        'reloadTabUncached'],
"   ['f',         'createHint'],
"   ['mf',        'createMultiHint'],
"   [']]',        'nextMatchPattern'],
"   ['[[',        'previousMatchPattern'],
"   ['W',         'createHintWindow'],
"   ['gp',        'pinTab'],
"   ['>',         'moveTabRight'],
"   ['<',         'moveTabLeft'],
"   ['H',         'goBack'],
"   ['S',         'goBack'],
"   ['gr',        'reverseImage'],
"   ['mr',        'multiReverseImage'],
"   ['L',         'goForward'],
"   ['D',         'goForward'],
"   ['[d',        'previousDomain'],
"   [']d',        'nextDomain'],
"   ['g0',        'firstTab'],
"   ['M*',        'addQuickMark'],
"   ['A',         'openLastHint'],
"   ['go*',       'openQuickMark'],
"   ['gn*',       'openQuickMarkTabbed'],
"   ['gw*',       'openQuickMarkWindowed'],
"   ['gq',        'cancelWebRequest'],
"   ['<C-S-h>',   'openLastLinkInTab'],
"   ['gh',        'openLastLinkInTab'],
"   ['<C-S-l>',   'openNextLinkInTab'],
"   ['gl',        'openNextLinkInTab'],
"   ['gQ',        'cancelAllWebRequests'],
"   ['q',         'createHoverHint'],
"   ['Q',         'createUnhoverHint'],
"   ['g$',        'lastTab'],
"   ['X',         'lastClosedTab'],
"   ['gj',        'hideDownloadsShelf'],
"   ['F',         'createTabbedHint'],
"   ['gi',        'goToInput'],
"   ['gI',        'goToLastInput'],
"   ['K',         'nextTab'],
"   ['R',         'nextTab'],
"   ['gt',        'nextTab'],
"   ['gf',        'nextFrame'],
"   ['gF',        'rootFrame'],
"   ['g\'',       'lastActiveTab'],
"   ['g%',        'percentScroll'],
"   ['%',         'goToTab'],
"   ['z<Enter>',  'toggleImageZoom'],
"   ['zi',        'zoomPageIn'],
"   ['zo',        'zoomPageOut'],
"   ['z0',        'zoomOrig'],
"   ['\'\'',      'lastScrollPosition'],
"   ['<C-o>',     'previousScrollPosition'],
"   ['<C-i>',     'nextScrollPosition'],
"   ['\'*',       'goToMark'],
"   [';*',        'setMark'],
"   ['zt',        'centerMatchT'],
"   ['zb',        'centerMatchB'],
"   ['zz',        'centerMatchH'],
"   ['gs',        ':viewsource!<CR>'],
"   ['gU',        'goToRootUrl'],
"   ['gu',        'goUpUrl'],
"   ['gy',        'yankUrl'],
"   ['my',        'multiYankUrl'],
"   ['yy',        'yankDocumentUrl'],
"   ['yY',        'yankFrameUrl'],
"   ['ya',        'yankWindowUrls'],
"   ['yh',        'yankHighlight'],
"   ['p',         'openPaste'],
"   ['v',         'toggleVisualMode'],
"   ['V',         'toggleVisualLineMode'],
"   ['P',         'openPasteTab'],
"   ['J',         'previousTab'],
"   ['E',         'previousTab'],
"   ['gT',        'previousTab'],
"   ['n',         'nextSearchResult'],
"   ['N',         'previousSearchResult'],
"   ['/',         'openSearchBar'],
"   ['?',         'openSearchBarReverse'],
"   [':',         'openCommandBar'],
"   ['<C-6>',     'lastUsedTab'],
"   ['.',         'repeatCommand'],
"   ['<C-b>',     'createBookmark'],
"   ['g+',        'incrementURLPath'],
"   ['g-',        'decrementURLPath'],
"   ['#',         'resetScrollFocus'],
"   ['cm',        'muteTab']
" ];
