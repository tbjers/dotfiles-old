#!/bin/bash

set -e # -e: exit on error

op_latest=1.11.4
op_email=torgny.bjers@gmail.com

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/.local/bin"
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

if [[ ! -e $HOME/.local/bin/op ]]; then
  tmpdir=$(mktemp -d)
  curl -L -o ${tmpdir}/op.zip https://cache.agilebits.com/dist/1P/op/pkg/v${op_latest}/op_linux_amd64_v${op_latest}.zip
  [[ ! -d $HOME/.local/bin ]] && mkdir -p $HOME/.local/bin
  unzip ${tmpdir}/op.zip -d ${tmpdir} && mv ${tmpdir}/op $HOME/.local/bin
  if [ ! -e $HOME/.config/op/config ]; then
    eval $($HOME/bin/op signin bjers.1password.com ${op_email})
  else
    eval $($HOME/bin/op signin)
  fi
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# exec: replace current process with chezmoi init
PATH=${PATH}:$HOME/bin exec "$chezmoi" init --apply "--source=$script_dir"

# vim: set ft=sh:
