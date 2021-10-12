# -*- mode:sh; -*-
function fn_exists() {
    type $1 | grep -q 'shell function'
}

function op() {
    OP_SESSION_bjers=$(onepassword-signin) command op --cache "$@"
}

function chezmoi() {
    OP_SESSION_bjers=$(onepassword-signin) command chezmoi "$@"
}

function weechat() {
    OP_SESSION_bjers=$(onepassword-signin) command weechat "$@"
}

function alot() {
    OP_SESSION_bjers=$(onepassword-signin) command alot "$@"
}
