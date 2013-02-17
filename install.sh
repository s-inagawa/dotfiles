#!/bin/bash

rm -r $HOME/dotfiles/.vim/bundle
mkdir -p $HOME/dotfiles/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim $HOME/dotfiles/.vim/bundle/neobundle.vim

mkdir -p $HOME/bin
cp -ip $HOME/dotfiles/bin/tmux-pbcopy $HOME/bin
cp -ip $HOME/dotfiles/bin/tmuxx $HOME/bin

DOT_FILES=( .gitconfig .gitignore .vimrc .tmux.conf )

for file in ${DOT_FILES[@]}
do
    ln -is $HOME/dotfiles/$file $HOME/$file
done


ZDOT_FILES=( .zshenv .zshrc )

for file in ${ZDOT_FILES[@]}
do
    ln -is $HOME/dotfiles/.zsh/$file $HOME/$file
done
