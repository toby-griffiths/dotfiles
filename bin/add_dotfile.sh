#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No file or directory supplied"
    exit
fi

pushd ~

mv $1 ~/dotfiles/toby-griffiths/$1
ln -s ~/dotfiles/toby-griffiths/$1 $1
echo "ln -s dotfiles/toby-griffiths/$1 ." >> ~/dotfiles/toby-griffiths/bin/setup.sh

popd
