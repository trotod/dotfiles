# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
setopt appendhistory autocd extendedglob
unsetopt nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename $HOME/.zshrc

autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt autopushd pushdminus pushdsilent pushdtohome cdablevars

autoload -U colors
colors

export CLICOLOR=1

autoload promptinit
promptinit

prompt walters

zstyle ':completion:*' menu select

source $HOME/.zsh_aliases
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

