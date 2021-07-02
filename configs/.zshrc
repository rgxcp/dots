# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/northern/.zshrc'

# Starship
eval "$(starship init zsh)"

# Aliases
alias ..="cd .."
alias dots="$HOME/Projects/dots/dots.sh"
