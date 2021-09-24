# Fedora (and others) stomp over some variables in /etc/zprofile and /etc/zshrc we set
# earlier. fix those

unset SSH_AGENT_PID
export SSH_ASKPASS=$(systemctl --user show-environment | grep SSH_ASKPASS | cut -f 2 -d '=')
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
