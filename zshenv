export EDITOR=vim
export VISUAL=$EDITOR
export GPG_TTY=$(tty)
export N_PREFIX=$HOME/.local

typeset -U path
path=($(ruby -rubygems -e 'puts Gem.user_dir')/bin $HOME/.local/bin $HOME/.bin $path)
export GEM_HOME=$(ruby -rubygems -e 'puts Gem.user_dir')

[ -d /usr/local/texlive/2014/bin/x86_64-linux ] && path=($path /usr/local/texlive/2014/bin/x86_64-linux)
[ -d $HOME/.rbenv/bin ] && path=($HOME/.rbenv/bin $path)

if which rbenv &>/dev/null ; then
  eval "$(rbenv init -)"
fi
