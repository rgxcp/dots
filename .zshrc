# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# PATH
# Composer
PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Flutter
PATH="$HOME/Projects/flutter/bin:$PATH"

# Ruby
PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# Alias
alias checkpoint="bash $HOME/Projects/checkpoint/checkpoint.sh"
alias dots="bash $HOME/Projects/dots/dots.sh"
alias kelasan-start="bash $HOME/Projects/kelasan-api/server.sh --start"
alias kelasan-stop="bash $HOME/Projects/kelasan-api/server.sh --stop"
alias lelangin-start="bash $HOME/Projects/lelangin-api/server.sh --start"
alias lelangin-stop="bash $HOME/Projects/lelangin-api/server.sh --stop"
