#!/bin/sh

DIR = `pwd`
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
mv ~/.vimrc ~/.vimrc_OLD_
mv ~/.screenrc ~/.screenrc_OLD_
mv ~/.zshrc ~/.zshrc_OLD_
mv ~/.emacs.d ~/.emacs.d_OLD_
git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/screenrc ~/.screenrc
ln -s ~/dotfiles/zshrc ~/.zshrc
echo "aheuhaeuaheuhe yay"
