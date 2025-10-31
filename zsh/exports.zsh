export ZSH=~/.oh-my-zsh/
export ARTISTIC_STYLE_OPTIONS=~/.config/astyle/.astylerc
export BAT_THEME="Catppuccin Mocha"

# Set Bat as man colorizing pager
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

export FZF_DEFAULT_OPTS="
--color=fg:#908caa,bg:#232136,hl:#ea9a97
--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
--color=border:#44415a,header:#3e8fb0,gutter:#232136
--color=spinner:#f6c177,info:#9ccfd8
--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export STARSHIP_LOG="error"

export ANDROID_HOME=/opt/android-sdk/
export ANDROID_SDK_ROOT=$ANDROID_HOME
export JAVA_HOME=/usr/lib/jvm/default/
export RUST_BACKTRACE=1
export GEM_HOME=$HOME/.gem

export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=~/.pyenv/bin:"$PATH"
export PATH=~/.pyenv/shims:"$PATH"
export PATH=~/.scripts:"$PATH"
export PATH=~/.console-ninja/.bin:"$PATH"
export PATH=/home/NathanDSanta/.gem/ruby/3.4.0/bin:"$PATH"

export KITTY_ENABLE_WAYLAND=1
export XCURSOR_SIZE=24
export XCURSOR_THEME="catppuccin-mocha-dark"
