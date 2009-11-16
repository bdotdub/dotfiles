export EDITOR=vim
export PAGER="less -s"
export PS1="\h:\W \u\$ "

BOX=`uname`

if [ $BOX == "Darwin" ]
then
  alias ls='ls -G'
  alias top='top -o cpu'
else
  alias ls='ls --color=auto'
fi

# General Stuff
alias cl='clear'
alias l='ls -al'
alias t='touch tmp/restart.txt'
alias j=jobs

# Vim
alias v=vi
alias :e=vi

# Grep Soda
alias gi='grep -i'
alias gr='grep -r'
alias gri='grep -ri'
alias gv='grep -v'
alias gh='history | grep'
alias findps='ps aux | grep'

if [ -n `which git` ]; then
  # There must be a better way to do this
  alias g='git'
  alias ga='git add'
  alias gb='git branch'
  alias gc='git commit'
  alias gco='git checkout'
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gl='git log'
  alias gp='git push'
  alias gpl='git pull'
  alias grb='git rebase'
  alias gst='git status'
  alias gstash='git stash'
fi

if [ -d ~/Development ]; then
  for type in `ls $HOME/Development`; do
    lowercased_type=`echo $type | tr A-Z a-z`
    dev_dir="$HOME/Development/$type"
    if [ -d "$dev_dir" ]; then
      alias "dev$lowercased_type"="cd $dev_dir"
    fi
  done
fi

if [ -d ~/.custom ]; then
  for i in ~/.custom/*;
    do source $i;
  done
fi
