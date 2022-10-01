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
source $HOME/Projects/dots/aliases/aliases.sh

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
