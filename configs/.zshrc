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

# |=========|
# | Aliases |
# |=========|
alias ..="cd .."
alias c="clear"
alias checkpoint="$HOME/Projects/checkpoint/checkpoint.sh"
alias db="mysql -u northern -p"
alias dots="$HOME/Projects/dots/dots.sh"
alias e="exit"
alias free="free -h"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -s -m"
alias gi="git init"
alias gl="tig"
alias gpom="git push -u origin main"
alias gr="git restore --S"
alias grao="git remote add origin"
alias gs="git status"
alias ls="ls --color --group-directories-first -lahv"
alias open="xdg-open"
alias start="sudo systemctl start"
alias status="sudo systemctl status"
alias stop="sudo systemctl stop"
alias test="bundle exec rspec"
alias v="nvim"

# |========|
# | Addons |
# |========|
# Auto Suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
