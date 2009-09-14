BOX=`uname`

export EDITOR=vim
export PAGER="less -s"

if [ $BOX == "Darwin" ]
then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias l='ls -al'
alias t='touch tmp/restart.txt'

alias gh='history | grep'
alias findps='ps aux | grep'

alias :e='vi'

if [ -d ~/.custom ]; then
  for i in ~/.custom/*;
    do source $i;
  done
fi

