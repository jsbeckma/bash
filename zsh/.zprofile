#if [ -e ~/.zshrc ]; then
#   source ~/.zshrc
#fi

# Setup for pyenv to work correctly
if command -v pyenv >/dev/null; then
   eval "$(pyenv init --path)"
fi
