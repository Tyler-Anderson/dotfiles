#!/bin/sh

DIR = `pwd`
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mv ~/.vimrc ~/.vimrc_OLD
mv ~/.screenrc ~/.screenrc_OLD
mv ~/.zshrc ~/.zshrc_OLD
ln -s $DIR/dotfiles/vimrc ~/.vimrc
ln -s $DIR/dotfiles/screenrc ~/.screenrc
ln -s $DIR/dotfiles/zshrc ~/.zshrc
echo "aheuhaeuaheuhe yay"
