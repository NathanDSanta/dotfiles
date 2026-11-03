
alias cd="z"
alias cat='bat'
alias fd='fdfind'

alias vim='nvim'

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# Override curl to always format JSON if jq is available
curl() {
    if [ -t 1 ]; then
        # If outputting to a terminal, automatically pretty-print
        command curl -s "$@" | jq . 2>/dev/null || command curl "$@"
    else
        # If piping to another file or command, run standard curl
        command curl "$@"
    fi
}

