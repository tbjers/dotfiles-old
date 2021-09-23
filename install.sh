#!/bin/bash

set -e # -e: exit on error

op_latest=1.11.4
op_email=torgny.bjers@gmail.com

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

# exec: replace current process with chezmoi init
PATH=${PATH}:$HOME/bin exec "$chezmoi" init --apply tbjers/dotfiles

# vim: set ft=sh:
