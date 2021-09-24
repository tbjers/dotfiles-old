# Fedora (and others) stomp over some variables in /etc/zprofile and /etc/zshrc we set
# earlier. fix those

unset SSH_AGENT_PID
export SSH_ASKPASS=$(systemctl --user show-environment | grep SSH_ASKPASS | cut -f 2 -d '=')
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

