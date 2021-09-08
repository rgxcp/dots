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
# zstyle :compinstall filename '$HOME/.zshrc'
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
# Travis
[ ! -s $HOME/.travis/travis.sh ] || source $HOME/.travis/travis.sh

# |=========|
# | Aliases |
# |=========|
alias ..="cd .."
alias checkpoint="$HOME/Projects/checkpoint/checkpoint.sh"
alias dots="$HOME/Projects/dots/dots.sh"
alias free="free -h"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -s"
alias gi="git init"
alias gl="git log"
alias glo="git log --oneline"
alias gpom="git push -u origin master"
alias gr="git restore --staged"
alias gra="git restore --staged ."
alias grao="git remote add origin"
alias gs="git status"
alias ls="ls --color --group-directories-first -lahv"
alias mariadb-shell="$HOME/Projects/scripts/mariadb.sh"
alias mariadb-start="sudo systemctl start mariadb"
alias open="xdg-open"
alias v="nvim"

# |========|
# | Addons |
# |========|
# Auto Suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
