# Include current Git branch in prompt
function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\e[1;31m\u\e[1;30m[\w]\e[m \e[1;32m$(parse_git_branch) \e[1;37m\$ \e[m"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add NPM binaries
PATH=$PATH:/usr/local/Cellar/node/HEAD/bin

# Aliases
alias ls="ls -p"
alias l="ls -p"
alias c="clear"
alias u="cd .. ;"

