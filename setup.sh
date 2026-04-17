#!/bin/bash

USER=whoami

##### nvim setup ######

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /home/${USER}/.bashrc
echo 'eval :$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/${USER}/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
sudo apt-get install build-essential
exec $SHELL 
brew install gcc
brew install ripgrep
brew install fd
brew install neovim
shopt -s extglob
mv !(setup.sh) ~/.config/nvim

#### kitty setup #####
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
git clone https://github.com/force-push-main/kitty_config.git ~/.config/kitty
exec $SHELL
