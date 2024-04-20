  " An Example of a Minimal vimrc File with Important Options and Settings
  " Maintainer:  https://vimandgit.com
  """
  " disable Vi compatibility
  set  nocompatible

  """
  " turns on filetype detection, which invokes the plugins for specific
  " filetypes - this enables the installed plugins - Note that the filetype
  " plugin handles setup of the 'suffixesadd' and 'path' options for us
  filetype  plugin on
  " enable language-dependent indenting
  filetype  plugin indent on

  """
  " PATH SETTINGS
  " the filetype plugin removes the . and ,, directories from the path and
  " this makes the gf (goto file) command fail - we can inspect the value of
  " the path by running :set path?
  """
  " search relative to the directory of the current file
  set  path+=.
  " search in the working directory
  set  path+=,,
      " NOTE: we could have done this with a single statement: set path+=.,,,

      """
  " increase the list of items in command history from 50 (default) to 300
  " :history lists your Command Line history (see :h :history)
  set  history=300

  """
  " show line numbers - this setting makes it possible for us to distinguish
  " between real lines and soft wrapped display lines when 'wrap' is enabled
  set  number

  """
  " this tells Vim to wrap long lines to fit the window-this is on by default
  " - to turn off the 'wrap' setting inside Vim, use :set nowrap or
  " :set invwrap - to toggle the 'wrap' setting inside Vim, use :set wrap!
  set  wrap


  """
  " display the mode that is currently active on the last line in the lower
  " far-left corner of the window-this setting is on by default - works with
  " Insert, Replace, and Visual mode - you can set the highlight for this
  " mode message using the 'M' flag in 'highlight' or like this, for the GUI
  " hi ModeMsg gui=bold guifg=#000000 guibg=#f3f2ae
  set  showmode
  """
  " always show the status line
  set  laststatus=2

  """
  " show the incomplete command on the last line in the right corner of the
  " window, left of the ruler - in Visual mode, the size of the selected area
  " is shown - you can also use g<C-g> in Visual mode (see :h v_g_CTRL-G) to
  " show the number of lines, words, chars, and bytes that are selected
  set  showcmd

  """
  " always show the number of lines changed
  set  report=0

  """
  " treat all numbers as decimal, even if they are padded with leading zeros
  set  nrformats-=octal

  """
  " the 'wildmenu' option provides a list of suggestions that we can navigate
  " with <Tab> and <S-Tab> (like the autocomplete menu in zsh)
  set  wildmenu
  set  wildmode=full

  """
  " without the 'hidden' setting enabled, we have to use a ! to navigate away
  " from a modified buffer - the ! symbol tells Vim to discard any changes we
  " made to the buffer - enabling this 'hidden' setting makes Vim hide the
  " modified buffer so that we can navigate away from it without the ! symbol
  set  hidden

  """
  " to get Vim to auto wrap at 80 characters, use :set textwidth=80 then
  " return to Normal mode with <Esc> and press gggqG - in summary, gg
  " jumps to the start of the buffer, gq invokes the format operator, and G
  " is a motion from the current cursor position to the end of the buffer
  " - Note: texwidth is automatically set by the filetype plugin
  """

  """
  " show the line number, column number of the cursor on the last line in the
  " far-right corner of the window, and, if there's room, the relative
  " position of the displayed text in the file - the ruler is only shown if
  " the "statusline" is empty or there's no "statusline"
  set  ruler

  """
  " highlight the line the cursor is on with the CursorLine color
  set  cursorline

  """
  " highlight the column the cursor is on with the CursorColumn color
  set  cursorcolumn

  """
  " highlight column 80 with the color specified in ColorColumn
  set  colorcolumn=80

  """
  " set unix line terminators (\n) - to change line terminators inside Vim
  " to Windows (\r\n), use :set fileformat=dos
  set  fileformat=unix

  """
  " chars to show for non-breakable space, tabs, trailing space, precedes
  " and, extends (see :h 'listchars') - you can hide these chars by running
  " :set nolist or :set invlist, and you can toggle between them with
  " :set list!
  set  list
  set  listchars=nbsp:%,tab:▸\ ,trail:_,eol:¬,precedes:←,extends:→

  """
  " use :set spell! or :set invspell inside Vim to toggle spell checking
  set  spelllang=en_us

  """
  " this makes searches CASE-INSENSITIVE - to enable CASE SENSITIVE
  " search, use :set noignorecase or :set invignorecase
  set  ignorecase

  """
  " when doing keyword completion in Insert mode, the 'infercase' option
  " adjusts the case of the match depending on the case of the typed text
  " (see :h 'infercase')
  set  infercase

  """
  " don't insert two spaces after a period when joining lines
  set  nojoinspaces

  """
  " highlight search matches in the active window as well as in split windows
  set  hlsearch

  """
  " highlights search matches in real time as they are typed out
  set  incsearch

  """
  " when a bracket is inserted, briefly jump to the matching one if it can
  " be seen on the same screen
  set  showmatch
  " 1/10 of a sec to show the matching paren, when 'showmatch' is set
  " default is 5 (1/2 of a sec); set this to 8 (8/10 or 4/5 of a sec)
  set  matchtime=8

  """
  " tab settings:
  " tabstop (default 8) - tabstop dictates the width of a <Tab> char
  """
  " expandtab (default 'noexpandtab') when enabled, Vim inserts spaces in
  " place of tabs - disable this (:set noet) if you prefer to use tabs
  """
  " softtabstop (default 0)
  """
  " shiftwidth (default 8) - shiftwidth determines the amount of whitespace
  " to insert or remove when using the indentation commands in Normal mode
  set  tabstop=4 softtabstop=4 shiftwidth=4 expandtab

  """
  " colorscheme
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " colorscheme, options for GUI
  if has("gui_running")
      " this font setting works in macOS
      " use :set guifont=* to select a font and :set guifont? to reveal the
      """
      """
      " change this to whatever colorscheme you like.
      " use :colorscheme to show the active colorscheme
      colorscheme desert
  else
      " use a 256 color colorscheme
  endif
  """
