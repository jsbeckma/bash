parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# Change prompt setup and colors
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch)\[\033[00m\] $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad


# Python related
if [ "$OSTYPE" == "darwin*" ]; then
    # Setting PATH for Python 2.7
    # The original version is saved in .bash_profile.pysave
    PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    export PATH

    # Setting PATH for Python 3.5
    # The original version is saved in .bash_profile.pysave
    PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
    export PATH

    alias pip='python2 -m pip'
    alias pip3='python3 -m pip'
fi

# Python - virtualenvwrapper setup
if [ -f "/Library/Frameworks/Python.framework/Versions/3.5/bin/virtualenvwrapper.sh" ]; then
    export WORKON_HOME=~/Envs
    source /Library/Frameworks/Python.framework/Versions/3.5/bin/virtualenvwrapper.sh
    # make virtualenvwrapper available to subshells
    export VIRTUALENVWRAPPER_SCRIPT
fi

# User settings
alias cl='clear'
alias vi='vim -p'
alias grep='grep --color=auto'
alias ll='ls -FlaGh'
alias l='ll'
alias dir='ll'

# Git command related
alias st='git status'
alias br='git branch'
alias gco='git checkout'
alias tags='git for-each-ref --format="%(refname:short) %(taggerdate) %(subject) %(body)" refs/tags'
source ~/git/git-completion.bash

# Docker command related
#  JSB: not sure how this will blend with git-completion above
#[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

EDITOR=vim
export EDITOR

# Load any project specific settings
for i in $(ls $HOME/.bash_profile_*[^swp]); do
    echo "Sourcing $i"
    source $i
done

average() {
    awk '{sum+=$1} END {print sum/NR}'
}

variance() {
    awk '{sum+=$1; sumsq+=$1*$1} END {print (sumsq/NR - (sum/NR)**2)}'
}

standarddeviation() {
    awk '{sum+=$1; sumsq+=$1*$1} END {print sqrt(sumsq/NR - (sum/NR)**2)}'
}

alias standarddev='standarddeviation'
alias avg='average'

# Docker settings
alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Command}}\t{{.Status}}"'

