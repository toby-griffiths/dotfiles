#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No file or directory supplied"
    exit
fi

FILE="$1"
DOTFILE="~/dotfiles/toby-griffiths/$file"
HOMEFILE="~/$FILE"

if [ -f $DOTFILE ];
  then
    echo "File not available to copy back"
    exit
fi

rm "$HOMEFILE" && mv $DOTFILE ~/$FILE
