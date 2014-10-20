# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source stuff
for file in ~/.bash_{path,prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Prompt
#PS1='[\u@\h \W]\$ '

# Paths
export PATH=$HOME/.rbenv/bin:$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$HOME/bin:$PATH:/usr/local/texlive/2014/bin/x86_64-linux
export GEM_HOME=$HOME/$(ruby -rubygems -e 'puts Gem.user_dir')
#export MANPATH=/usr/local/texlive/2014/texmf-dist/doc/info:/usr/local/texlive/2014/texmf-dist/doc/man

# vi keybindings
set -o vi

# case insensitive globbing
shopt -s nocaseglob

# append to hist file
shopt -s histappend

# autocorrect typos in cd
shopt -s cdspell

# auto cd when entering path
shopt -s autocd

# editor
export EDITOR=vim
export VISUAL=$EDITOR

# less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R'

# keychain
#eval `keychain --eval id_rsa`

# autojump
[[ -s /etc/profile.d/autojump.bash ]] && . /etc/profile.d/autojump.bash

# dir colors
eval $(dircolors -b $HOME/.colors/LS_COLORS/LS_COLORS)

# rbenv
eval "$(rbenv init -)"

# tmuxinator
source $HOME/bin/tmuxinator.bash

# mpd, given no other instance exists
[[ ! -s ~/.mpd/pid ]] && mpd
