# -*- mode:sh; -*-
function fn_exists() {
        type $1 | grep -q 'shell function'
}
