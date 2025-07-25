
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

plugins=(
  git 
  zsh-completions 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  sudo 
  copybuffer 
  fzf-tab
)

# local theme='rose-pine'
export ZSH_DIR=~/.config/zsh/

# SOURCES
source $ZSH_DIR/exports.zsh
source $ZSH_DIR/rose-pine.zsh
source $ZSH_DIR/rose-pine-man.zsh
source $ZSH_DIR/completions.zsh
source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)
source $ZSH_DIR/options.zsh
source $ZSH_DIR/aliases.zsh

colorize_man "rose-pine-moon" true


# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time


# Stuff i have no idea what it does
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
if [[ -a /var/cache/zsh/pacman ]]; then
  local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
  if (( zshcache_time < paccache_time )); then
    rehash
    zshcache_time="$paccache_time"
  fi
fi
}

add-zsh-hook -Uz precmd rehash_precmd

eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(ssh-agent -s)"

fastfetch
