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

source $HOME/.zshenv # arch linux has problems
source $HOME/.zsh_aliases
source $HOME/.zsh_prompt
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

