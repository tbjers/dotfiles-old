function op() {
    OP_SESSION_bjers=$(onepassword-signin) command op --cache "$@"
}

function chezmoi() {
    OP_SESSION_bjers=$(onepassword-signin) command chezmoi "$@"
}
