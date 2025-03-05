local base=#232136
local surface=#2a273f
local overlay=#393552
local muted=#6e6a86
local subtle=#908caa
local text=#e0def4
local love=#eb6f92
local gold=#f6c177
local rose=#ea9a97
local pine=#3e8fb0
local foam=#9ccfd8
local iris=#c4a7e7
local hlightlow=#2a283e
local hlightmid=#44415a
local hlighthigh=#56526e

ZSH_HIGHLIGHT_STYLES[comment]='fg='$overlay
ZSH_HIGHLIGHT_STYLES[alias]='fg='$foam
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg='$foam
ZSH_HIGHLIGHT_STYLES[global-alias]='fg='$foam
ZSH_HIGHLIGHT_STYLES[function]='fg='$pine
ZSH_HIGHLIGHT_STYLES[command]='fg='$pine
ZSH_HIGHLIGHT_STYLES[precommand]='fg='$pine',italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg='$gold',italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg='$gold
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg='$gold
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg='$rose
ZSH_HIGHLIGHT_STYLES[builtin]='fg='$pine
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg='$pine
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg='$pine
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg='$iris
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg='$text
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg='$text
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg='$text
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg='$iris
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg='$iris
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg='$iris
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg='$gold
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg='$gold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg='$gold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg='$love
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg='$gold
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg='$love
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg='$gold
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg='$text
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg='$love
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg='$text
ZSH_HIGHLIGHT_STYLES[assign]='fg='$text
ZSH_HIGHLIGHT_STYLES[named-fd]='fg='$text
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg='$text
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg='$love
ZSH_HIGHLIGHT_STYLES[path]='fg='$text
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg='$iris
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg='$text
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg='$iris
ZSH_HIGHLIGHT_STYLES[globbing]='fg='$text
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg='$rose
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg='$love
ZSH_HIGHLIGHT_STYLES[redirection]='fg='$text
ZSH_HIGHLIGHT_STYLES[arg0]='fg='$text
ZSH_HIGHLIGHT_STYLES[default]='fg='$text
ZSH_HIGHLIGHT_STYLES[cursor]='fg='$hlighthigh
