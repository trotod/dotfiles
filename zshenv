export EDITOR=vim
export VISUAL=$EDITOR

typeset -U path
path=($(ruby -rubygems -e 'puts Gem.user_dir')/bin $HOME/.bin $path)
export GEM_HOME=$(ruby -rubygems -e 'puts Gem.user_dir')

[ -d /usr/local/texlive/2014/bin/x86_64-linux ] && path=($path /usr/local/texlive/2014/bin/x86_64-linux)
[ -d $HOME/.rbenv/bin ] && path=($HOME/.rbenv/bin $path)

if which rbenv &>/dev/null ; then
  eval "$(rbenv init -)"
fi
