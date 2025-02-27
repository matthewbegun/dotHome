# step 0 - copy .bashrc and .bash_aliases

# passwordless sudo
echo "Defaults:matth      !authenticate" | sudo tee /etc/sudoers.d/matth

# system update
up

# python
sudo apt install python3 ipython3

# starship
curl -sS https://starship.rs/install.sh | sh

# node - nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# node - nodjs LTS
nvm install --lts
