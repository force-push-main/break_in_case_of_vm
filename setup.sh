#!/bin/bash

declare -A packages

packages=(
        ["nvim"]=""
        ["kitty"]="" 
    )

for key in "${!packages[@]}"; do
    shouldInstall=""
    while [[ -z "$shouldInstall" ]]; do
        read -p "Install ${packages[$key]}? (y/n) " shouldInstall 
        if [[ "$shouldInstall" == "y" || "$shouldInstall" == "n" ]]; then
            packages["$key"]="$shouldInstall" 
        else
            echo "$shouldInstall is not a valid command. Please try again"
            shouldInstall=""
        fi
    done
done


echo "Curl is required. Checking for curl"
if command -v curl &> /dev/null; then
    echo "Curl is installed. Moving to next stage."
else
    userInput=""

    while [[ "$userInput" != "y" && "$userInput" != "n" ]]; do
    read -p "Curl is not installed. Install now? (y/n): " userInput
    if [[ "$userInput" == "y" ]]; then
        echo "Installing curl ... "
        sudo apt install curl
    elif [[ "$userInput" == "n" ]]; then
        echo "Curl is required for setup. Ending program with exit code 1"
        exit 1
    else 
        echo "$userInput is not a valid command. Please try again"
    fi
    done
fi


##### nvim setup ######

if [[ "${packages["nvim"]}" == "y" ]]; then
    echo "Installing nvim dependencies" 
    echo "Installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo >> "${HOME}/.bashrc"
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)' >> "${HOME}/.bashrc"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"

    echo "Installing build essentials" 
    sudo apt-get install build-essential

    echo "Installing gcc" 
    brew install gcc

    echo "Installing ripgrep" 
    brew install ripgrep

    echo "Installing fd" 
    brew install fd

    echo "Installing Neovim"
    brew install neovim
    mkdir -p "${HOME}/.config/nvim"
    shopt -s extglob

    echo "Moving config files to ~/.config/nvim"
    mv !(setup.sh) ~/.config/nvim
fi

#### kitty setup #####

if [["${packages["kitty"]}" == "y"]]; then
    echo "Installing kitty"
    sudo apt install kitty
    git clone https://github.com/force-push-main/kitty_config.git ~/.config/kitty
fi

#### move config files to .config #####


echo "Setup finished. Run 'source ~/.bashrc' to rebuild from source"
