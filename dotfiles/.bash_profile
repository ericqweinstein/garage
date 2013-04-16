# Add NPM binaries
PATH=$PATH:/usr/local/Cellar/node/HEAD/bin

# Include current Git branch in prompt
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source ~/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1

export PS1="\e[1;31m\u\e[1;30m[\w]\e[m\e[1;32m\$(__git_ps1) \e[1;37m\$ \e[m"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Aliases
alias ls="ls -p"
alias l="ls -p"
alias c="clear"
alias u="cd .. ;"

