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
