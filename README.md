# dotfiles

Personal dotfiles for quick environment restore on new instances.
Goal: `clone` → `install.sh` → usual environment is back.

## Setup

```bash
git clone git@github.com:SSugar310/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
bash install.sh
```

## Files

- `.zshrc` — zsh config (prompt, history, aliases, tmux auto-attach on SSH)
- `.vimrc` — vim config (encoding, syntax, 4-space indent)
- `.gitconfig` — git identity and defaults
- `.tmux.conf` — tmux mouse, colors, pane splits
- `.gitignore_global` — global git ignores (swap files, OS junk, etc.)
- `install.sh` — symlinks all of the above into `$HOME`

## Not included (by design)

- `.zsh_history` / `.bash_history` — environment-specific
- `.viminfo` — session state
- `.ssh/` — keys must never be committed
