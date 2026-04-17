#!/bin/bash

sudo apt install curl

##### nvim setup ######

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> "${HOME}/.bashrc"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> "${HOME}/.bashrc"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
sudo apt-get install build-essential
brew install gcc
brew install ripgrep
brew install fd
brew install neovim
[ ! -d "${HOME}/.config/nvim" ] && mkdir "${HOME}/.config/nvim"
shopt -s extglob
mv !(setup.sh) ~/.config/nvim

#### kitty setup #####
sudo apt install kitty
git clone https://github.com/force-push-main/kitty_config.git ~/.config/kitty
kitty
