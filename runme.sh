#!/bin/bash
set -e
pushd ~
ln -fs ~/dotfiles/.gitconfig ~/.gitconfig
ln -fs ~/dotfiles/.vim ~/.vim
ln -fs ~/dotfiles/.vimrc ~/.vimrc
pushd ~/dotfiles
git submodule init
git submodule update
pushd .vim/bundle/khuno
git submodule init
git submodule update
popd
popd
