#!/bin/bash

# exit on error
set -e

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

# import and trust our GPG Key
GPGKEY=F189ABC3C4117523
GPGKEY_FINGERPRINT=E8A5374D7945C91F1AE5E98CF189ABC3C4117523
gpg --keyserver keyserver.ubuntu.com --receive-keys ${GPGKEY}
echo -e "5\ny\n" | gpg --command-fd 0 --expert --edit-key ${GPGKEY_FINGERPRINT} trust
# power up yubikey
gpg --card-status

# exec: replace current process with chezmoi init
PATH=${PATH}:$HOME/bin exec "$chezmoi" init --apply tbjers/dotfiles

# vim: set ft=sh:
