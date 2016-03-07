# Only allow each path to be added one (-U = unique)
typeset -U path

# Add paths
path=($path[@])

# phpenv
path=($HOME/.phpenv/bin $path[@])
if type "phpenv" > /dev/null ; then
    eval "$(phpenv init -)"
fi

# rbenv
path=($HOME/.rbenv/bin $path[@])
if type "rbenv" > /dev/null ; then
    eval "$(rbenv init -)"
fi
