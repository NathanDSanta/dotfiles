# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git fzf-tab zsh-autosuggestions zsh-completions zsh-syntax-highlighting eza)

source $ZSH/oh-my-zsh.sh
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export WAYLAND_DISPLAY=wayland-1


export EDITOR="nvim"
export VISUAL="nvim"

export GPG_TTY=$(tty)

export PATH="$HOME/.local/bin:$PATH"

export MANPAGER="bat -l man -p"


# Source configs
for file in ~/.config/zsh/*.zsh; do
	source "$file"
done
