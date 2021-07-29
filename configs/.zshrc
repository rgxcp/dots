# |============|
# | DOTS - ZSH |
# |============|

# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/home/northern/.zshrc'
zstyle :compinstall filename "$HOME/.zshrc"

# |=========|
# | Options |
# |=========|
# Save history directly
setopt INC_APPEND_HISTORY
# Don't record existing history
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS

# |==========|
# | Programs |
# |==========|
# rbenv
eval "$(rbenv init - zsh)"
# Starship
eval "$(starship init zsh)"

# |=========|
# | Aliases |
# |=========|
alias ..="cd .."
alias checkpoint="$HOME/Projects/checkpoint/checkpoint.sh"
alias dots="$HOME/Projects/dots/dots.sh"
alias free="free -h"
alias ls="ls --color --group-directories-first -lahv"
alias mariadb="$HOME/Projects/scripts/mariadb.sh"
alias mariadb-start="sudo systemctl start mariadb"
alias open="xdg-open"

# |========|
# | Addons |
# |========|
# Auto Suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
