# break_in_case_of_vm
Dependencies 
```
### install dependencies with brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /home/<username>/.bashrc
echo 'eval :$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"' >> /home/<username>/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
sudo apt-get install build-essential
exec $SHELL 
brew install gcc
brew install ripgrep
brew install fd

### install dependencies with apt
sudo apt update && sudo apt install ripgrep
sudo apt install fd-find
```
