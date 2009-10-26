export EDITOR=vim
export PAGER="less -s"

BOX=`uname`

if [ $BOX == "Darwin" ]
then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias cl='clear'
alias l='ls -al'
alias t='touch tmp/restart.txt'
alias gh='history | grep'
alias findps='ps aux | grep'
alias top='top -o cpu'
alias :e='vi'

if [ -n `which git` ]; then
  # There must be a better way to do this
  alias g='git'
  alias ga='git add'
  alias gb='git branch'
  alias gc='git commit'
  alias gco='git checkout'
  alias gd='git diff'
  alias gp='git push'
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
