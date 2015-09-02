#!/bin/bash

pushd ~

ln -s dotfiles/toby-griffiths/.autocompletes .
ln -s dotfiles/toby-griffiths/.bash_aliases .
ln -s dotfiles/toby-griffiths/.bash_profile .
ln -s dotfiles/toby-griffiths/.bashrc .
ln -s dotfiles/toby-griffiths/.gitignore .
ln -s dotfiles/toby-griffiths/.screenrc .
ln -s dotfiles/toby-griffiths/.vimrc .

popd
