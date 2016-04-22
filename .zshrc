###
# For information on configuring Zsh see...
# https://wiki.archlinux.org/index.php/Zsh
###

## Autocompletions
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)

## Zsh autocomplete
autoload -U compinit promptinit
compinit -u
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


## Ansible
# Don't display using cowsays
export ANSIBLE_NOCOWS=true

## Aliases
if [ -f ~/.zsh_aliases ]
then
    source ~/.zsh_aliases
fi

## Secure tokens, etc (not commited to repo)
if [ -f ~/.secure_exports ]
then
    source ~/.secure_exports
fi

## Digital Ocean defaults
if [ -f ~/.digital_ocean ]
then
    source ~/.digital_ocean
fi

###
# Stuff added by Oh-my-zsh insstall script
###

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump aws bower brew chucknorris composer common-aliases docker encode64 git gitfast git-extras git-flow github gulp osx symfony2)

source $ZSH/oh-my-zsh.sh
