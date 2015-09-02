#!/bin/bash

# Codeception autocomplete for bash_completion
# (The MIT License)
#
# Copyright (c) 2015 Anton Kucherov (idexter.ru)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

_codecept()
{ 
    local cur prev commands opts prefix base_opts base_cmds generate_cmds refactor_cmds suitedir

    COMPREPLY=()

	# Current and previous words in input
    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}

	# Base codecept command options
    base_opts="--help --raw --format --quiet --verbose --version --ansi --no-ansi --no-interaction -h -q -v -vv -vvv -V -n"
	# Base codecept commands
    base_cmds="bootstrap build clean console help list run self-update"
    # Base codecept generate:* commands
    generate_cmds="generate:cept generate:cest generate:group generate:helper\
 					generate:pageobject generate:phpunit generate:scenarios\
 				   	generate:stepobject generate:suite generate:test"

	# Firs check base codeception command
    case "$prev" in
	    codeception)
	    	commands="${base_cmds} ${generate_cmds}"
			opts="--xml  ${base_opts}"
	    	;;
        codecept)
            commands="${base_cmds} ${generate_cmds}"
			opts="--xml  ${base_opts}"
            ;;        
        bootstrap)
            opts="-ns --namespace -a --actor --compat --customize ${base_opts}"
            ;;
	    build)
	        opts="-c --config ${base_opts}"
	        ;;
		clean)
			opts="-c --config ${base_opts}"
			;;
		console)
			opts="-c --config --colors ${base_opts}"
			;;
        help)
            opts="--xml --format --raw ${base_opts}"
            commands="${base_cmds} ${generate_cmds} ${refactor_cmds}"
            ;;
        list)            
            opts="--xml --raw --format"
            ;;
        run)
            opts="-c --config --report --html --xml --tap --json\
 			   		--colors --no-colors --silent --steps -d --debug\
 					--coverage --coverage-html --coverage-xml --coverage-text\
 					--no-exit -g --group -s --skip -sg --skip-group --env -f --fail-fast ${base_opts}"
            ;;
        -c|--config)
            _filedir '@(yml)'
            return 0
            ;;
        *)
            opts="-c --config ${base_opts}"
            commands="${opts}"
            ;;        
    esac

	# Next check generate suffix
    # ":" is treated as separate option so we need this workaround 
    # to get generate:* and refactor:* actions properly completed
    if [[ "$prev" == ":" || "$cur" == ":" ]]; then
        if [[ "$cur" == ":" ]]; then    
            prefix="$prev"
        else
            prefix="${COMP_WORDS[COMP_CWORD-2]}"
        fi
        case "$prefix" in
            generate)
                commands=$(echo "${generate_cmds}" | sed 's/generate://g')
                ;;
            refactor)
                commands=$(echo "${refactor_cmds}" | sed 's/refactor://g')
                ;;
        esac 
        if [[ "$cur" == ":" ]]; then
            COMPREPLY=( $( compgen -W "${commands}" ) )            
            return 0
        fi        
    fi

    if [[ ${cur} == -* ]]; then
        COMPREPLY=($( compgen -W "${opts}" -- "${cur}" ))
		return 0;
    else
        COMPREPLY=($( compgen -W "${commands}" -- "${cur}" ))
    fi    

	# Actions if run command selected
	if [[ ${COMP_WORDS[1]} == "run" ]]; then
	
	    suitedir="$prev"
		if [[ $prev == "run" ]]; then
		
			if [[ -d "./codeception" ]]; then
				COMPREPLY=($(cd ./codeception/; compgen -d -- "${cur}"))
				return 0;
			fi;
			
			if [[ -d "./tests" ]]; then
				COMPREPLY=($(cd ./tests/; compgen -d -- "${cur}"))
				return 0;
			fi;
		
			COMPREPLY=($(compgen -d -- "${cur}"))
			return 0;
		fi
		
    	if [[ -d "./codeception" ]]; then
		  suitedir="./codeception/$prev"
		fi
		
    	if [[ -d "./tests" ]]; then
		  suitedir="./tests/$prev"
		fi
		
		if [[ -d ${suitedir} ]]; then
        	COMPREPLY=($(cd ${suitedir} ; compgen -f -- "${cur}"))
		fi
		return 0;
	fi
	
    return 0;
}

complete -F _codecept $filenames codeception
complete -F _codecept $filenames codecept