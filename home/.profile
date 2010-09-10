export EDITOR=vim
export PAGER="less -s"
export PS1="\h:\W\$(__git_ps1) \u\$ " # Format looks like: "hostname:SomeDir benny$ "

BOX=`uname`
if [ $BOX == "Darwin" ]
then
  alias ls='ls -G'
  alias top='top -o cpu'
else
  alias ls='ls --color=auto'
fi

# General Stuff
# alias cl='clear' - Use command+k
alias l='ls -al'
alias j=jobs
alias pip='curl "http://code.bwong.net/tools/ip.php?f=plain" && echo'
alias scrd='screen -rd'
alias t='touch tmp/restart.txt'

# Vim
alias v=vi
alias :e=vi
if [ -e /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vi=/Applications/MacVim.app/Contents/MacOS/Vim
fi

# Grep Soda
alias gi='grep -i'
alias gr='grep -r'
alias gri='grep -ri'
alias gv='grep -v'
alias gh='history | grep'
alias findps='ps aux | grep'

# Misc
alias whatsmyip='curl "http://code.bwong.net/tools/ip.php?f=plain" && echo'

if [ -n `which git` ]; then
  # There must be a better way to do this
  alias g='git'
  alias ga='git add'
  alias gbr='git branch'
  alias gc='git commit'
  alias gco='git checkout'
  alias gd='git diff'
  alias gdc='git diff --cached'
  alias gl='git log'
  alias gpush='git push'
  alias gpl='git pull --rebase'
  alias gpr='git pretty'
  alias gpull='git pull'
  alias grb='git rebase'
  alias gst='git status'
  alias gstash='git stash'

  alias clone='git clone'
  alias stash_and_pull='git stash && git pull && git stash pop'
fi

# Create aliases for easy dev folders, ie.
# $ devruby # will cd into ~/Development/ruby
if [ -d ~/Development ]; then
  alias dev="cd $HOME/Development"
  for type in `ls $HOME/Development`; do
    lowercased_type=`echo $type | tr A-Z a-z`
    dev_dir="$HOME/Development/$type"
    if [ -d "$dev_dir" ]; then
      alias "dev$lowercased_type"="cd $dev_dir"
    fi
  done
fi

# This allows for custom env config stuff that is not
# checked into source control
if [ -d ~/.custom ]; then
  for i in ~/.custom/*;
    do source $i;
  done
fi

if [ -d ~/.bin ]; then
  export PATH="$PATH:~/.bin"
  if [ -d ~/.bin/.custom ]; then
    export PATH="$PATH:~/.bin/.custom"
  fi
fi