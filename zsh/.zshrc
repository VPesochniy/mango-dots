# История
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE      # команда с пробелом в начале не попадает в историю (удобно для паролей)
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# Отключить XON/XOFF: Ctrl-S/Ctrl-Q больше не замораживают терминал
[[ -t 0 ]] && stty -ixon
unsetopt FLOW_CONTROL

alias grep='grep --color=auto'
alias diff='diff --color=auto'   # красные/зелёные строки удалений и добавлений
alias ip='ip -color=auto'        # ip a / ip r: интерфейсы, адреса и состояния UP/DOWN раскрашены

# eza вместо ls
if (( $+commands[eza] )); then
  _eza='eza --group-directories-first --icons=auto --time-style=long-iso'

  alias ls="$_eza"
  alias ll="$_eza -l --git"
  alias la="$_eza -la --git"
  alias lo="$_eza -lago"
  alias lt="$_eza -T -L 2"
  alias lta="$_eza -Ta -L 3 --git-ignore"
  alias lS="$_eza -l -s size"
  alias lm="$_eza -l -s modified"
  alias ld="$_eza -lD"
  alias lf="$_eza -lf"
fi

# bat вместо cat
if (( $+commands[bat] )); then
  alias cat='bat -pp'
#  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#  export MANROFFOPT='-c'
fi

# Git
if (( $+commands[git] )); then
  alias g='git'

  # состояние и различия
  alias gst='git status -sb'
  alias gd='git diff'
  alias gds='git diff --staged'
  alias glo='git log --oneline --graph -20'
  alias gloa='git log --oneline --graph --all'

  # индекс и коммиты
  alias ga='git add'
  alias gaa='git add -A'
  alias gap='git add -p'
  alias gc='git commit -v'
  alias gcm='git commit -m'
  alias gca='git commit --amend --no-edit'

  # ветки
  alias gb='git branch -vv'
  alias gsw='git switch'
  alias gswc='git switch -c'
  alias grs='git restore'
  alias grss='git restore --staged'

  # обмен с remote
  alias gf='git fetch --all --prune'
  alias gl='git pull'
  alias gp='git push'
  alias gpu='git push -u origin HEAD'
  alias gpf='git push --force-with-lease'

  # stash, rebase, прочее
  alias gsta='git stash push'
  alias gstp='git stash pop'
  alias gstl='git stash list'
  alias grb='git rebase'
  alias grbi='git rebase -i'
  alias gcp='git cherry-pick'
  alias gcl='git clone'
  alias groot='cd "$(git rev-parse --show-toplevel)"'
fi

# Автодополнение
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Плагины: autosuggestions → syntax-highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Промпт
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"    # в .zshrc, рядом со starship

