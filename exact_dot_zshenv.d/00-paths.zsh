# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
    ${HOME}/.local/bin
    ${HOME}/bin
    ${HOME}/bin/**
    ${HOME}/go/bin
    ${HOME}/gn
    ${HOME}/.platformio/penv/bin
    ${HOME}/.emacs/bin
    ${HOME}/.pyenv/bin
    ${HOME}/.yarn/bin
    ${HOME}/.yarn/global/node_modules/global/bin
    ${path}
    /usr/local/{bin,sbin}
)
# ... then remove those that are either dead links (-/) or do not
# exist at all (N) and apply that to all in array (^) source:
# http://stackoverflow.com/a/9352979/1469693
path=($^path(-/N))

# inject path into systemctl user session so things like emacs have it available
systemctl --user import-environment PATH
