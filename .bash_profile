if [ -e ~/.bashrc ]; then
    source ~/.bashrc
fi

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
#export PATH
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
