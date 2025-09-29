#!/usr/bin/env bash
# Automating future wsl installs (Ubuntu >= 24.04.2LTS)

# passwordless sudo <-- not sure how interactive this will need to be on clean install
echo 'Defaults:matth      !authenticate' | sudo tee /etc/sudoers.d/matth

# system update
sudo add-apt-repository -y universe
sudo apt-get update && sudo apt-get upgrade -y

# build tools
apt install -y build-essential gdb

# python
apt install -y python3 ipython3 python3-pip

# node - nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# node - nodjs LTS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

# R using CRAN as Ubuntu Binaries https://eddelbuettel.github.io/r2u/ 
curl -o- https://raw.githubusercontent.com/eddelbuettel/r2u/refs/heads/master/inst/scripts/add_cranapt_noble.sh | sudo bash
# R packages for code
apt install -y r-cran-tidyverse
sudo Rscript -e 'install.packages(c("languageserver"))'
# radian
pip install --break-system-packages -U radian

# julia
curl -fsSL https://install.julialang.org | sh -s -- --yes

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
mkdir -p ~/.local/share/bash-completion/completions
rustup completions bash >> ~/.local/share/bash-completion/completions/rustup


# latex (this step is slow)
apt install -y texlive-full
# tex-fmt on debian but NOT ubuntu wtf
wget -qO- https://github.com/WGUNDERWOOD/tex-fmt/releases/latest/download/tex-fmt-$(uname -p)-linux.tar.gz | tar -xz -C ~/.local/bin

# git stuff here
git config --global core.autocrlf input # linux line endings in wsl
git config --global user.name "Matthew Begun"
git config --global user.email "matthew.begun@gmail.com"


# starship has to go last
curl -sS https://starship.rs/install.sh | sh -s -- -y
# apt install -y starship # Ubuntu 25+

# podman - need to restart shell before this works properly with systemd
sudo apt-get -y install podman

# or just manually ensure working dotfiles
curl -o ~/.bashrc https://raw.githubusercontent.com/matthewbegun/dotHome/refs/heads/main/.bashrc
curl -o ~/.bash_aliases https://raw.githubusercontent.com/matthewbegun/dotHome/refs/heads/main/.bash_aliases
curl -o ~/.bash_aliases https://raw.githubusercontent.com/matthewbegun/dotHome/refs/heads/main/.profile

# include new dotfiles
source ~/.profile


# get some useful scripts
curl -o ~/.local/bin/remove_zone_identifiers.py https://raw.githubusercontent.com/matthewbegun/dotHome/refs/heads/main/bin/remove_zone_identifiers.py
# make them executable
find ~/.local/bin -type f -exec chmod +x {} \;

