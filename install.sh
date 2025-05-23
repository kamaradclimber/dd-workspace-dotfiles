#!/usr/bin/env bash

set -euo pipefail

echo "Preparing my workspace"

cd $HOME

sudo apt update
sudo apt install stow

git clone git@github.com:kamaradclimber/Dotfiles.git

for prog in git bash; do
  echo "Will use stow on $prog"
  stow --dotfiles $prog --verbose 2 --ignore=setup
  if test -f $prog/setup; then
    echo "Running setup script"
    pushd $prog
    ./setup
    popd
  fi
done

