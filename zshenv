export EDITOR=vim
export VISUAL=$EDITOR

export PATH=$HOME/bin:$PATH

[ -d /usr/local/texlive/2014/bin/x86_64-linux ] && export PATH=$PATH:/usr/local/texlive/2014/bin/x86_64-linux
[ -d $HOME/.rbenv/bin ] && export PATH=$HOME/.rbenv/bin:$PATH

if which rbenv &>/dev/null ; then
  eval "$(rbenv init -)"
fi
