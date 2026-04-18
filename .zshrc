# ==================== 基本設定 ====================
# カラー有効化
autoload -U colors && colors

# ==================== プロンプト ====================
# 例: ubuntu@oci 10:30:42 ~/projects % 
PROMPT='%F{green}%n@%m%f %F{yellow}%*%f %F{cyan}%~%f %# '

# ==================== ヒストリー ====================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY            # 複数セッションでヒストリー共有
setopt HIST_IGNORE_DUPS         # 重複除外
setopt HIST_IGNORE_SPACE        # 先頭スペースで履歴除外
setopt EXTENDED_HISTORY         # 実行日時も記録

# ==================== 補完 ====================
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # 大小文字無視

# ==================== エイリアス ====================
# lsカラー化
alias ls='ls --color=auto'
alias ll='ls -alhF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# grep系カラー化
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# 定番ショートカット
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# 確認プロンプト（事故防止）
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Gitショートカット
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -20'

# fd-findはUbuntuだと fdfind で入る
alias fd='fdfind'

# ==================== キーバインド ====================
bindkey -e  # Emacsキーバインド
bindkey '^[[A' history-beginning-search-backward  # ↑で前方一致検索
bindkey '^[[B' history-beginning-search-forward   # ↓で前方一致検索

# ==================== Claude Code用 PATH ====================
export PATH="$HOME/.local/bin:$PATH"

# ==================== 環境 ====================
export EDITOR=vim
export LANG=en_US.UTF-8

# ~/.zshrc 末尾に追加（SSH時に自動でtmux起動）
# ※SSH接続時のみ自動でtmux attach（なければnew session）
if [[ -z "$TMUX" && -n "$SSH_TTY" ]]; then
    tmux attach -t main 2>/dev/null || tmux new -s main
fi
