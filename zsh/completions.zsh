zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'      # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' regular true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' group-order alias builtins functions commands
zstyle ':completion:*' complete-options true
#zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
zstyle 'completion:*' menu no
zstyle ':fzf-tab:complete:z:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always $realpath'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' cache-path ~/.oh-my-zsh/cache/
zstyle ':completion:*' use-cache on
