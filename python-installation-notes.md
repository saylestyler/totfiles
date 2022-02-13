install python using this guide 

https://docs.python-guide.org/starting/install3/osx/#working-with-python-3

# overview 

- `pip` points to python3 
- 3 versions accessible via cli, 
  - `python` = opens brew installed python3 interp
  - `python2` = opens brew installed python2 interp
  - `python3` = same as `python`, brew version
- use `pip3|pip2 install` for pkgs
  - pkgs are put here `/usr/local/lib/python3.9/site-packages`
- use `virtualenv`, installed by `pip3 install virtualenv`
  - stored `virtualenv 20.13.1 from /usr/local/lib/python3.9/site-packages/virtualenv/__init__.py`
  - note there's `virtualenv` and `virtualenv_3` avail on cmdline
  - `virtualenv venv` creates a `venv` folder in cd w/ deps & copy of pip used

# output notes for `brew install python`

```
Python has been installed as
  /usr/local/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /usr/local/opt/python@3.9/libexec/bin

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /usr/local/lib/python3.9/site-packages
```


