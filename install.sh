#!/bin/bash
# Symlink dotfiles into $HOME.
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES=(.zshrc .vimrc .gitconfig .tmux.conf .gitignore_global)

for f in "${FILES[@]}"; do
    src="$DOTFILES/$f"
    dst="$HOME/$f"
    if [[ ! -e "$src" ]]; then
        echo "skip: $src not found"
        continue
    fi
    ln -sfv "$src" "$dst"
done

echo "Done."
