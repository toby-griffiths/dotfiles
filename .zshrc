alias ansible-latest="source ~/src/github.com/ansible/ansible/hacking/env-setup > /dev/null"

# dotfiles
alias cddot="cd $HOME/Dropbox/Development/GitHub/dotfiles"

# Homebrew path
export PATH="/usr/local/sbin:$PATH"

# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
