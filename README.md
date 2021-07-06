Shell related scripts that I have found useful

Intended to be installed on a fresh system. This will overwrite any existing files:
cp .gitconfig ~
cp .gitignore_global ~
cp -r .ssh ~
cp .vimrc ~

# If setting up a zsh environment, copy all files in zsh/ to $HOME:
cp -r zsh/.* ~
brew install zsh-completion
brew install bash-completion

# If setting up a bash environment, copy all files in bash/ to $HOME:
cp -r bash/.* ~
brew install bash-completion
