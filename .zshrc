###
# For information on configuring Zsh see...
# https://wiki.archlinux.org/index.php/Zsh
###

## Autocompletions
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)

## Zsh autocomplete
autoload -U compinit promptinit
compinit
promptinit
# This will set the default prompt to the walters theme
prompt walters


## History
SAVEHIST=100
HISTFILE=~/.zsh_history
# To ignore duplicate lines in the history, use the following:
setopt HIST_IGNORE_DUPS


## Key bindings

# File manager key binds (as https://wiki.archlinux.org/index.php/Zsh#File_manager_key_binds)
# Read up more on this, as not working


## dotfiles
alias cddot="cd $HOME/Dropbox/Development/GitHub/dotfiles"


## Mac setup (absible)
# Useful aliases
alias cdmacsetup="cd $HOME/src/github.com/toby-griffiths/mac-dev-playbook"
alias ansible-latest="source ~/src/github.com/ansible/ansible/hacking/env-setup > /dev/null"


## Ansible
# Don't display using cowsays
export ANSIBLE_NOCOWS=true

## Aliases
if [ -f ~/.zsh_aliases ]
then
    source ~/.zsh_aliases
fi
