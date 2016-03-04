# Only allow each path to be added one (-U = unique)
typeset -U path

# Add paths
path=($path[@])

# phpenv
path=($HOME/.phpenv/bin $path[@])
eval "$(phpenv init -)"

# rbenv
path=($HOME/.rbenv/bin $path[@])
eval "$(rbenv init -)"
