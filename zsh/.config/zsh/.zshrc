# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting eza)

source $ZSH/oh-my-zsh.sh

# Source configs
for file in ~/.config/zsh/*.sh; do
	source "$file"
done
