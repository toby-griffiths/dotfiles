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

## Aliases
if [ -f ~/.zsh_aliases ]
then
    source ~/.zsh_aliases
fi


# Secure tokens, etc (not commited to repo)
if [ -f ~/.secure_exports ]
then
    echo "Loading secure exports from ~/.secure_exports"
    source ~/.secure_exports
fi


# Include all files in .aliases directory
for FILE in $( find ~/.env.d/* -type f -print | sort )
do
    source $FILE
done


###
# Stuff added by Oh-my-zsh insstall script
###

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump aws bower brew chucknorris composer common-aliases docker encode64 git gitfast git-extras git-flow git-flow-avh git-flow-completion github gulp osx symfony2)

source $ZSH/oh-my-zsh.sh

## Chuck Norris quotes FTW!
chuck_cow

## iTerm2 Shell integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
