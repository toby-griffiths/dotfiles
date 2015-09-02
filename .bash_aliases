alias mkcd='_(){ mkdir -p "$*"; cd "$*"; }; _'

alias rm='rm -i'

alias g:='grunt'
alias scon='app/console'

# GIT aliases
alias git-rebase-reset-dates="git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'"
alias git-rebase-reset-dates-force="git filter-branch -f --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'"

# Directory shortcuts
alias cdmagma="cd ~/src/clients/magma-digital"
alias cdboxen="cd /opt/boxen/repo"

# Vagrant shortcuts
alias vup="vagrant up"
alias vssh="vagrant ssh"
alias vhalt="vagrant halt"