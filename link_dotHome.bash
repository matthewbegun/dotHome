#!/usr/bin/bash
# link_dotHome.bash

# find all the dotfiles and ln them
# find . -type f -name ".*" -exec ln -s {} ~ \;

ln -s ~/_src/dotHome/.bashrc ~/.bashrc
ln -s ~/_src/dotHome/.bash_aliases ~/.bash_aliases
ln -s ~/_src/dotHome/.profile ~/.profile
ln -s ~/_src/dotHome/.gitconfig ~/.gitconfig
ln -s ~/_src/dotHome/bin/ ~/.local/bin/ 

