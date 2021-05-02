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
alias xampp-start="sudo xampp startapache && sudo xampp startmysql"
alias xampp-stop="sudo xampp stopapache && sudo xampp stopmysql"
