# Composer
export PATH="$PATH:~/.composer/vendor/bin"

# Digital Ocean
export DO_API_TOKEN="7cbe0e3e483aa3f003cefb7ac5eb1ffa62b38e83412a915f13399eff64e50f71"
export DO_TOKEN="0c294d1d59315607d8bd9419adf62aacec684c3fca8cd7e34b43eb7aa5faf8cb"

# Node
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# Xdebug on the command line
export XDEBUG_CONFIG='idekey=session_name remote_host=localhost'

export PATH=vendor/bin:$PATH
export PATH="$NPM_PACKAGES/bin:$PATH"

# Grunt autocompletion
eval "$(grunt --completion=bash)"

# Aliases
source ~/.bash_aliases


##
# Autocompletes
##

# sudo autocomplete
complete -cf sudo

source ~/.autocompletes/*
