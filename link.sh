#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

for d in "$DOTFILES_DIR"/*/; do
  pkg="${d%/}"
  pkg="$(basename "$pkg")"
  src="$DOTFILES_DIR/$pkg"
  dest="$CONFIG_DIR/$pkg"

  if [[ -e "$dest" || -L "$dest" ]]; then
    echo "Skipping $pkg: $dest already exists"
  else
    echo "Linking $pkg -> $dest"
    ln -s "$src" "$dest"
  fi
done
