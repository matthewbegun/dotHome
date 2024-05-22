#!/usr/bin/bash
# link_dotHome.bash

# find all the dotfiles and ln them
# find . -type f -name ".*" -exec ln -s {} ~ \;

ln -s -f ~/_src/dotHome/.bashrc ~/.bashrc
ln -s -f ~/_src/dotHome/.bash_aliases ~/.bash_aliases
ln -s -f ~/_src/dotHome/.profile ~/.profile
ln -s -f ~/_src/dotHome/.gitconfig ~/.gitconfig

# really really manual!
rm -rf ~/.local/bin
mkcd ~/.local/bin
ln -s ~/_src/dotHome/bin/* .
