# totfiles 

tyler's dotfiles

## SETUP

running `./install.sh` will symlink all files in $CWD with "rc" in the name to to `$HOME/$FILENAME`, `homeshick refresh` will check on each login to shell if the files have changed in the remote, and if so, `homeshick pull will update them`

## coc-nvim

**to see a function's type**: 

hover over and type `gd`

**to see a description of an attribute, property**: 

hover & `shift+k`

![def]('./def.png')

extensions are node modules installed to `~/.config/coc/node_modules/*`

to [see which ones are active](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#manage-extensions-using-coclist), do `:CocList`, or `cat ~/.config/coc/extensions/package.json`

```json
{
  "dependencies": {
    "coc-css": "^1.0.7",
    "coc-diagnostic": "^0.0.7",
    "coc-emmet": "^1.0.9",
    "coc-eslint": "^1.1.3",
    "coc-json": "^1.0.17",
    "coc-neosnippet": "^1.2.2",
    "coc-prettier": "^1.1.1",
    "coc-snippets": "^2.0.16",
    "coc-tslint-plugin": "^1.0.4",
    "coc-tsserver": "^1.3.2",
    "coc-ultisnips": "^1.2.3",
    "jest-snippets": "https://github.com/andys8/vscode-jest-snippets.git#master"
  }
}
```

### git thangs

*to make a branch replace master*

```sh
git checkout seotweaks
git merge -s ours master
git checkout master
git merge seotweaks
```

*to revert master back to a commit* (:danger: rewrites history / nicht-nicht in collabos)

```
git log (2 find commit id thither 2 revert)
git reset --hard <old-commit-id>
git push -f <remote-name> <branch-name>
```

### kp <PORT>, <PORT2>

kill a comma separated list of ports

### .inputrc

[see here](https://www.topbug.net/blog/2017/07/31/inputrc-for-humans/)

```
# $include /etc/inputrc: This line carries over site-wide readline configuration to the user configuration. Usually /etc/inputrc includes some goodies.
$include /etc/inputrc

# ctrl-n = forward, ctrl-p = backward
"\C-p":history-search-backward
"\C-n":history-search-forward

# tell readline to display { if possible } diff colors
set colored-stats On

# ignore cases
set completion-ignore-case On

# completions ellipses after 10 chars
set completion-prefix-display-length 10

# sets every completion which is a symbolic link to a directory to have a slash appended.
set mark-symlinked-directories On

#  This line sets the completions to be listed immediately instead of ringing the bell, when the completing word has more than one possible completion.
set show-all-if-ambiguous On

# when the completing word has more than one possible completion but no partial completion can be made.
set show-all-if-unmodified On

# sets completions to be appended by characters that indicate their file types reported by the stat system call.
set visible-stats On
```

### python installation (output)

Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python/libexec/bin

If you need Homebrew's Python 2.7 run
  brew install python@2

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.7/site-packages

See: https://docs.brew.sh/Homebrew-and-Python

### vim 

current config = 

- neovim
- coc-nvim
- denite

[good starter](https://github.com/technicalpickles/pickled-vim.git)

### brew (casks) installation

`xargs brew (cask) install < Brew(casks)file`

### postgres nonsense

> _"is the database running on port 5432 & accepting connections blah blah"_

```
rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres -E utf8
```

*output*:

```
The files belonging to this database system will be owned by user "tyler".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.UTF-8".
The default text search configuration will be set to "english".

Data page checksums are disabled.

creating directory /usr/local/var/postgres ... ok
creating subdirectories ... ok
selecting default max_connections ... 100
selecting default shared_buffers ... 128MB
selecting dynamic shared memory implementation ... posix
creating configuration files ... ok
running bootstrap script ... ok
performing post-bootstrap initialization ... ok
syncing data to disk ... ok

WARNING: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the option -A, or
--auth-local and --auth-host, the next time you run initdb.
```

*then, vitally:*

```
Success. You can now start the database server using:

pg_ctl -D /usr/local/var/postgres -l logfile start
```

