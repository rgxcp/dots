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
alias deploy="git pull origin main && git push origin main"
alias dots="$HOME/Projects/dots/dots.sh"
alias e="exit"
alias free="free -h"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -s -m"
alias gd="git diff"
alias gi="git init && touch README.md && touch LICENSE"
alias gp="git push -u origin main"
alias gpull="git pull origin main"
alias gr="git restore"
alias grao="git remote add origin"
alias gri="git rebase -i"
alias grs="git restore -S"
alias grsh="git reset --hard"
alias grss="git reset --soft"
alias gs="git status"
alias gst="git stash"
alias gstp="git stash pop"
alias ls="ls --color --group-directories-first -lahv"
alias open="xdg-open"
alias pinstall="sudo pacman -S"
alias psearch="sudo pacman -Ss"
alias pupdate="sudo pacman -Syy"
alias start="sudo systemctl start"
alias status="sudo systemctl status"
alias stop="sudo systemctl stop"
alias t="$(pwd)/bin/run_modified_files_spec.sh"
alias v="nvim"
alias vc="nvim ~/.config/nvim/init.vim"
alias vim="nvim"

# |========|
# | Addons |
# |========|
# FZF
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# ZSH
# Auto Suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
