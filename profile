BOX=`uname`
export EDITOR=vim
export PAGER="less -s"
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
  alias gc='git commit'
  alias gco='git checkout'
  alias gd='git diff'
  alias gst='git status'
fi
if [ -d ~/.custom ]; then
  for i in ~/.custom/*;
    do source $i;
  done
fi
