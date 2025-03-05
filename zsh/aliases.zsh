# omz
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="lf ~/.oh-my-zsh"

#nvim
alias vi='nvim'
alias vim='nvim'

# cd
alias cd='z'
alias uni='z ~/Documents/uni'
alias config='z ~/.config'

# ls
alias ls='eza -lh --group-directories-first'
alias lh='eza -lah --group-directories-first'
alias ll='eza --group-directories-first'
alias la='eza -A --group-directories-first'

# git
alias gcl='git clone'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'

# Updates
alias pacman='sudo pacman'
alias paru='paru --skipreview'
alias pacupd='sudo pacman -Syu'
alias aurupd='paru -Syu --skipreview'

#fzf and bat
alias fzf='fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
alias cat='bat'

#custom stuff
alias ytmp3='yt-dlp --audio-format mp3 --audio-quality 256K'
alias clear='clear && fastfetch'
alias cmatrix='cmatrix -C magenta'
# alias fastfetch='kitten icat --align=left --place 40x40@0x0 ~/.config/fastfetch/assets/arch.png | fastfetch --raw - --logo-width 40 --logo-height 40'
