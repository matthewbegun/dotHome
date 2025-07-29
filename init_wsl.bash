#!/usr/bin/env bash
# Automating future wsl installs (Ubuntu >= 24.04.2LTS)

# step 0 - download .bashrc and .bash_aliases from github
curl -o ~/.bashrc https://raw.githubusercontent.com/matthewbegun/dotHome/refs/heads/main/.bashrc
curl -o ~/.bash_aliases https://raw.githubusercontent.com/matthewbegun/dotHome/refs/heads/main/.bash_aliases

# passwordless sudo <-- not sure how interactive this will need to be on clean install
echo 'Defaults:matth      !authenticate' | sudo tee /etc/sudoers.d/matth

# system update
update

# build tools
apt install -y build-essential gdb

# python
apt install -y python3 ipython3 python3-pip

# starship
curl -sS https://starship.rs/install.sh | sh

# node - nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# node - nodjs LTS
nvm install --lts

# R using CRAN as Ubuntu Binaries https://eddelbuettel.github.io/r2u/ 
curl -o- https://raw.githubusercontent.com/eddelbuettel/r2u/refs/heads/master/inst/scripts/add_cranapt_noble.sh | sudo bash
# R packages for code
Rscript -e 'install.packages(c("languageserver", "tidyverse"))'
# radian
pip install --break-system-packages -U radian

# latex (this step is slow)
apt install -y texlive-full
# tex-fmt on debian but NOT ubuntu wtf
wget -qO- https://github.com/WGUNDERWOOD/tex-fmt/releases/latest/download/tex-fmt-$(uname -p)-linux.tar.gz | tar -xz -C ~/.local/bin
