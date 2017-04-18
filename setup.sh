#!/bin/bash

DOT_FILES=( .zshrc .gitconfig .gitignore .vimrc )

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done
echo $(tput setaf 2)dotfiles are linked. ✔︎$(tput sgr0)

# install neobundle
[ ! -d ~/.vim/bundle  ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "run following command to setup plugins ->  vim -c ':NeoBundleInstall'"

