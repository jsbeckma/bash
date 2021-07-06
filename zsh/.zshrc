parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


# Change prompt setup and colors
export PS1='%F{cyan}%n%f@%F{yellow}%m%f:%F{green}%~%f%#'
export CLICOLOR=1
# Generate with https://geoff.greer.fm/lscolors/
export LSCOLORS=CxFxExDxBxegedabagacad


# User settings
alias ..='cd ..'
alias ...='cd ../..'
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

#zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

EDITOR=vim
export EDITOR


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

if command -v pyenv >/dev/null; then
   eval "$(pyenv init -)"
fi

if type brew &>/dev/null; then
   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

   autoload -Uz compinit
   compinit
fi
