alias mkcd='_(){ mkdir -p "$*"; cd "$*"; }; _'

alias touch-p='_() {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")"
        touch -- "$f"
    done
}; _'

alias rm='rm -i'

alias g='gulp'
alias s='app/console'

# GIT aliases
alias git-rebase-reset-dates="git filter-branch --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'"
alias git-rebase-reset-dates-force="git filter-branch -f --env-filter 'GIT_COMMITTER_DATE=$GIT_AUTHOR_DATE; export GIT_COMMITTER_DATE'"

# Directory shortcuts
alias cdmagma="cd ~/src/clients/magma-digital"
alias cdboxen="cd /opt/boxen/repo"

# Vagrant shortcuts
alias vup="vagrant up"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vhalt="vagrant halt"
alias vdestroy="vagrant destroy"

# KeyFIT backup
alias kfb="ssh root@kf-prod-1 shutdown -P now && sleep 120 && backup_kf.sh && exit"

# Speed test alias
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
