#!/bin/bash

# Source - http://stackoverflow.com/a/16693385

_composer()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local cmd=${COMP_WORDS[0]}
    if ($cmd > /dev/null 2>&1)
    then
        COMPREPLY=( $(compgen -W "$($cmd list --raw | cut -f 1 -d " " | tr "\n" " ")" -- $cur) )
    fi
}
complete -F _composer composer
complete -F _composer composer.phar
