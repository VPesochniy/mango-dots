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

# Автодополнение
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Плагины: autosuggestions → syntax-highlighting
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Промпт
eval "$(starship init zsh)"

