# Zsh autocomplete
autoload -U compinit promptinit
compinit
promptinit
# This will set the default prompt to the walters theme
prompt walters

# Autocompletions
fpath=(/usr/local/share/zsh-completions $fpath)

# dotfiles
alias cddot="cd $HOME/Dropbox/Development/GitHub/dotfiles"

# Ansible mac setup
alias cdmacsetup="cd $HOME/src/github.com/toby-griffiths/mac-dev-playbook"
alias ansible-latest="source ~/src/github.com/ansible/ansible/hacking/env-setup > /dev/null"
