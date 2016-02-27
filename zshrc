HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
setopt appendhistory autocd extendedglob
unsetopt nomatch

# vi
bindkey -v
bindkey jj vi-cmd-mode
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# completion
typeset -U fpath
fpath=($HOME/.zsh/completion $fpath)
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# colors
autoload -U colors
colors

# other goodies
setopt autopushd pushdminus pushdsilent pushdtohome cdablevars

# use color
export CLICOLOR=1

# source functions
for function in ~/.zsh/functions/*; do
  source $function
done

source $HOME/.aliases
source $HOME/.zsh_prompt
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

[ -f $HOME/.bin/z.sh ] && . $HOME/.bin/z.sh

# $PATH
typeset -U path
path=($(ruby -rubygems -e 'puts Gem.user_dir')/bin $HOME/.local/bin $HOME/.bin $path)
export GEM_HOME=$(ruby -rubygems -e 'puts Gem.user_dir')

[ -d /usr/local/texlive/2014/bin/x86_64-linux ] && path=($path /usr/local/texlive/2014/bin/x86_64-linux)
[ -d $HOME/.rbenv/bin ] && path=($HOME/.rbenv/bin $path)

if which rbenv &>/dev/null ; then
  eval "$(rbenv init -)"
fi

# keychain
if which keychain &>/dev/null ; then
  eval $(keychain --eval --quick --quiet --nogui --agents ssh id_rsa)
fi
