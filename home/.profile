export EDITOR=vim
export PAGER="less -s"
export HISTFILESIZE=5000

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1="\h:\W\$(__git_ps1) \u\$ " # Format looks like: "hostname:SomeDir benny$ "

BOX=`uname`
if [ $BOX == "Darwin" ]
then
  alias flush_dns='dscacheutil -flushcache'
  alias ls='ls -G'
  alias top='top -o cpu'
  alias turn_spotlight_off='sudo mdutil -a -i off'
  alias turn_spotlight_on='sudo mdutil -a -i on'
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

which git>/dev/null 2>&1
if [ $? -eq 0 ]; then
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
  alias gpom='git push origin master'
  alias gphm='git push heroku master'
  alias gpr='git pretty'
  alias gpull='git pull'
  alias grb='git rebase'
  alias gst='git status'
  alias gstash='git stash'

  alias clone='git clone'
  alias stash_and_pull='git stash && git pull && git stash pop'
fi

which git-achievements>/dev/null 2>&1
if [ $? -eq 0 ]; then
  alias git='git-achievements'
fi

which aquamacs>/dev/null 2>&1
if [ $? -eq 0 ]; then
  alias emacs='aquamacs'
fi

which cowsay>/dev/null 2>&1
if [ $? -eq 0 ]; then
  alias cheesesay='cowsay -f cheese'
  alias calfsay='cowsay -f small'
  alias stegosaurussay='cowsay -f stegosaurus'
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

[[ -s "/Users/benny/.rvm/scripts/rvm" ]] && source "/Users/benny/.rvm/scripts/rvm"

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

function up() { # cd to root of repository
  old_pwd="$PWD";
  while [ 1 ]; do
    cd ..
    if [ "$PWD" == "/" ]; then
      cd "$old_pwd"
      return 1
    fi
    for repo in ".git" ".hg"; do
      if [ -d "$repo" ]; then
        return 0;
      fi
    done
  done
}

# set -o vi
